#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

void (*function)(int);

void func1(int fd) {
	char buf[64];
	int count;

	while(1) {
		count = read(fd, buf, 256);
		if(count > 0) {
			write(fd, buf, 256);
		} else {
			break;
		}
	}
}

int func2(short hostshort, const char * cp) {
	int sockfd;
	struct sockaddr_in addr;
	memset(&addr, 0, 16);
	addr.sin_family = 2;
	addr.sin_port = htons(hostshort);
	inet_aton(cp, &addr.sin_addr);
	sockfd = socket(2, 1, 0);
	bind(sockfd, (const struct sockaddr*) &addr, 16);
	listen(sockfd, 10);
	return sockfd;
}

void func3(int sockfd, void (*fuction)(int)){
	int addrlen;
	socklen_t new_fd;
	pid_t pid;
	struct sockaddr addr;
	while(1) {
		new_fd = accept(sockfd, &addr, &addrlen);
		pid = fork();
		if (pid == 0) {
			close(sockfd);
			fuction(new_fd);
			close(new_fd);
			return;
		}
		close(new_fd);
	}
}


int func4(char **src) {
	int len;
	char *dest;
	
	while(src != NULL) {
		len =  strlen(*src);
		dest = malloc((size_t) len + 1);
		strcpy(dest, *src);
		printf("_%s\n", dest);
		free(dest);
		src++;
	}
	return 0;
}



int main(int argc, char **argv) {
}
