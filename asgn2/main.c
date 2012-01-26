//main.c
int l_strlen(const char *);
int l_strcmp(const char *str1, const char *str2);
int l_gets(int fd, char *buf, int len);
int l_write(int fd, const char *buf, int len);
int l_exit(int rc);

int main(int argc, char **argv) {
   int i;
   char newline = '\n';
   char prompt[] = "Enter a string: ";
   int len1, len2;
   char str1[80];
   char str2[80];
   char equal[] = "The strings are the same\n";
   char diff[] = "The strings are different\n";

for (i = 0; i < argc; i++) {
      l_write(1, argv[i], l_strlen(argv[i]));
      l_write(1, &newline, 1);
   }
   while (1) {
      l_write(1, prompt, l_strlen(prompt));
      len1 = l_gets(0, str1, 79);
      str1[len1] = 0;
      if (l_strcmp(str1, "quit\n") == 0) {
         break;
      }
      l_write(1, prompt, l_strlen(prompt));
      len2 = l_gets(0, str2, 79);
      str2[len2] = 0;
      if (l_strcmp(str1, str2) == 0) {
         l_write(1, equal, l_strlen(equal));
      }
      else {
         l_write(1, diff, l_strlen(diff));
      }
   }
   l_exit(0);
   return 0;
}
