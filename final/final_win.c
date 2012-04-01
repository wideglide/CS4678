
#include <stdio.h>
#include <string.h>
#include <winsock2.h>

#include <stdlib.h>
#include <time.h>
#include <string.h>

#define CANARY 0xFACEF00D

#define USER_MAGIC 0xA6
unsigned int userId;

char *getUser  = "What is your user id? ";
char *prompt  = "Ok, then bring it on!\n";
char *fail  = "Sorry, invalid user id.\n";
char *wimpy = "Nice try, but I am still standing!\n";

int validateUser(unsigned int id) {
   unsigned char *p = (unsigned char*)&id;
   return (p[0] ^ p[1] ^ p[2] ^ p[3]) == USER_MAGIC;
}

void realHandler(int sock) {
   int canary = CANARY;
   int i = 0;
   char buf[512];
   char ch;
   send(sock, getUser, strlen(getUser), 0);
   int len = recv(sock, buf, sizeof(buf) - 1, 0);
   buf[len] = 0;
   userId = strtoul(buf, NULL, 16);
   if (validateUser(userId)) {   
      send(sock, prompt, strlen(prompt), 0);
      do {
         if (recv(sock, &ch, 1, 0) != 1) {
            break;
         }
         buf[i] = (char) (ch ^ userId);
      } while (buf[i++] != '\n');
      if (canary != CANARY) {
         send(sock, wimpy, strlen(wimpy), 0);
         exit(1);
      }
   }
   else {
      send(sock, fail, strlen(fail), 0);
   }   
}

void bumpStack(int sock, unsigned int size) {
   unsigned char pad[size];
   realHandler(sock);
}

void handler(int sock) {
   unsigned int size = rand() & 0x7fff;
   bumpStack(sock, size);
}

int main(int argc, char **argv) {
   struct sockaddr_in sa;
   WSADATA wsadata;
   WSAStartup(MAKEWORD(2, 2), &wsadata);
   memset(&sa, 0, sizeof(sa));
   sa.sin_family = AF_INET;
   sa.sin_port = htons(5555);
   int sock = socket(AF_INET, SOCK_STREAM, 0);
   bind(sock, (struct sockaddr *)&sa, sizeof(sa));
   listen(sock, 10);
   srand(time(NULL));
   while (1) {
      int client = accept(sock, NULL, 0);
      close(sock);
      handler(client);
      close(client);
   }
}
