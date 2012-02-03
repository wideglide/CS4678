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
       
#define SERVER_PORT 3333

int done = 0;
int serv = 0;

void sig_int_handler(int sig) {
   //fprintf(stderr, "signal %d\n", sig);
   if (sig == SIGINT) {
      done = 1;
      close(serv);
   }
}

char WELCOME[] = "Welcome to the simple time server";
char ASK[] = "What is your name?";

void dropPrivs(const char *user) {
   //drop privs
   int u;
   int g;
   struct passwd *pw = getpwnam(user);
   if (pw) {
      u = pw->pw_uid;
      g = pw->pw_gid;
      chdir(pw->pw_dir);
   }
   else {
      fprintf(stderr, "Unable to drop privs to %s\n", user);
      exit(1);
   }
   initgroups(user, g);
   setresgid(g, g, g);
   setresuid(u, u, u);
}

void doGreeting(const char *name) {
   printf("Welcome to the simple time server\n");
   printf("What is your name?\n");
   fflush(stdout);
   gets(name);
   printf("Pleased to meet you %s!\n", name);
}

void handleClient() {
   char buf[256];
   unsigned int hash;
   int len, size = 0, bsize = 0;
   unsigned char *dbuf = NULL;
   char *tbuf;

   doGreeting(buf);
   
   time_t t = time(NULL);
   time(&t);
   tbuf = ctime(&t);
   printf("The time is %s", tbuf);
   printf("Have a nice day!\n");
   fflush(stdout);
}

int main(int argc, char **argv) {
   struct sockaddr_in sa;
   int one = 1;
   
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
   
   dropPrivs("cs4678");

   daemon(1, 0);
   
   while (!done) {
      int csock;
      csock = accept(serv, NULL, NULL);
      if (fork() == 0) {
         close(serv);
         dup2(csock, 0);
         dup2(csock, 1);
         dup2(csock, 2);
         close(csock);
         handleClient();
         exit(0);
      }
      else {
         close(csock);
      }
   }
   close(serv);
}
