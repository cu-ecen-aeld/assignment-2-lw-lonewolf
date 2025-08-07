#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/syslog.h>
#include <sys/types.h>
#include <syslog.h>
#include <unistd.h>

int main(const int argc, const char *argv[]) {
  openlog("Writer Program", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_USER); // Initialize Logging

  // Check Quantity of Arguments
  if (argc != 3) {
    syslog(LOG_ERR, "INSUFFICIENT OR MORE THAN REQUIRED ARGUMENTS\n");
    return 1;
  }

  // Extract Arguments and Open file
  const char *writefile = argv[1];
  const char *writestr = argv[2];
  int fd;
  fd = open(writefile, O_WRONLY | O_CREAT, 0644);
  if (fd == -1) {
    syslog(LOG_ERR, "UNABLE TO ACCESS FILE FOR WRITE ACCESS");
    return 1;
  }

  // Attempt to write to file
  size_t count;
  ssize_t nr;
  count = strlen(writestr);
  nr = write(fd, writestr, count);
  if (nr == -1) {
    syslog(LOG_ERR, "FAILED TO WRITE TO FILE");
    return 1;
  } else if (nr != count) {
    syslog(LOG_ERR, "FAILED TO WRITE ALL BYTES");
    return 1;
  }

  // Log for Debugging purposes
  char message[100];
  strcpy(message, "Writing");
  strcat(message, writestr);
  strcpy(message, "to");
  strcat(message, writefile);
  syslog(LOG_DEBUG, "%s", message);
}
