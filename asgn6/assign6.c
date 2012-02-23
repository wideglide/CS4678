#include <stdlib.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <pwd.h>
#include <string.h>
#include <signal.h>

#define MAX_LINES 500       
#define SERVER_PORT 4444

int done = 0;
int serv = 0;

void sig_int_handler(int sig) {
   //fprintf(stderr, "signal %d\n", sig);
   if (sig == SIGINT) {
      done = 1;
      close(serv);
   }
}

char WELCOME[] = "Welcome to the simple line editor!\n";

void execute_this(int sock) {
   char *msg = "we really should never see this\n";
   send(sock, msg, strlen(msg), 0);
}

void handleClient(int csock) {
   static char command[256];
   char *lines[MAX_LINES];
   char *lf;
   char *temp;
   FILE *f = fdopen(csock, "r+");
   int max = 0, lineno, i;

   dup2(csock, 0);

   memset(lines, 0, sizeof(lines));

   fprintf(f, WELCOME);
   
   while (1) {
      fflush(f);
      fgets(command, sizeof(command), f);
      lf = strchr(command, '\n');
      if (lf) {
         *lf = 0;
      }
      if (strcmp(command, "quit") == 0) {
         break;
      }
      else if (strcmp(command, "add") == 0) {
         if (max < MAX_LINES) {
            temp = (char*)malloc(256);
            fprintf(f, "Allocated %p\n", temp);
            gets(temp);
            lines[max++] = temp;
         }
         else {
            fprintf(f, "Sorry, too many lines\n");
         }
      }
      else if (strncmp(command, "replace ", 8) == 0) {
         sscanf(command + 8, "%d", &lineno);
         if (lineno >= 0 && lineno < max) {
            gets(lines[lineno]);
            fprintf(f, "Line %d replaced\n", lineno);
         }
      }
      else if (strncmp(command, "delete ", 7) == 0) {
         sscanf(command + 7, "%d", &lineno);
         if (lineno >= 0 && lineno < max) {
            free(lines[lineno]);
            fprintf(f, "Freed %p\n", lines[lineno]);
            max--;
            for (i = lineno; i < max; i++) {
               lines[i] = lines[i + 1];
            }
            lines[max] = NULL;
            fprintf(f, "Line %d deleted\n", lineno);
         }
      }
      else if (strcmp(command, "print") == 0) {
         for (i = 0; i < max; i++) {
            fprintf(f, "%d: %s\n", i, lines[i]);
         }
      }
   }
   
   //lets free everything up
   for (i = 0; i < max; i++) {
      free(lines[i]);
   }
}

int main(int argc, char **argv) {
   struct sockaddr_in sa;
   struct sockaddr_in ca;
   int clen = 16;
   int one = 1;
   struct timeval timeout = {3, 0};
   struct passwd *pw;
   int u = 0;
   int g = 0;
   
   signal(SIGINT, sig_int_handler);
   signal(SIGCHLD, SIG_IGN);
   
   memset(&sa, 0, sizeof(sa));
   sa.sin_family = AF_INET;
   sa.sin_port = htons(SERVER_PORT);

   serv = socket(AF_INET, SOCK_STREAM, 0);
   if (serv == -1) {perror("socket"); exit(1);}

   setsockopt(serv, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
   
   if (bind(serv, (struct sockaddr*)&sa, sizeof(sa))) {
      perror("bind"); 
      exit(1);
   }

   if (listen(serv, 10)) {
      perror("listen"); 
      exit(1);
   }

   //drop privs
   pw = getpwnam("cs4678");
   if (pw) {
      u = pw->pw_uid;
      g = pw->pw_gid;
      chdir(pw->pw_dir);
   }
   else {
      fprintf(stderr, "Unable to drop privs to cs4678\n");
      exit(1);
   }
   setresgid(g, g, g);
   setresuid(u, u, u);

   daemon(1, 0);
   
   memset(&ca, 0, sizeof(ca));
   ca.sin_family = AF_INET;
   while (!done) {
      int csock;
      csock = accept(serv, NULL, NULL);
      if (fork() == 0) {
         close(serv);
         handleClient(csock);
         exit(0);
      }
      else {
         close(csock);
      }
   }
   close(serv);
}
