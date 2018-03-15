#include <syscall.h>


void writeint(int num) {
  char buf[20];
  char result[20] = "0\n";
  char *pos = buf;
  char *writeptr = result;
  int numWritten;
 
  // Handle negative numbers
  if (num < 0) {
    *writeptr++ = '-';
    num = -num;
  }
  
  if (num > 0) {
      
    // Build the number in reverse order
    while (num > 0) {
      *pos++ = (num % 10) + '0';
      num /= 10;
    }
    pos--;
    
    // Now we need to copy the results into the output buffer, reversed
    while (pos > buf) {
      *writeptr++ = *pos--;
    }
    *writeptr++ = *pos;
    *writeptr++ = 10;
    *writeptr++ = 0;
  } else {
    // number is 0; use default result
    writeptr = result + 3;
  }
  
  write(1, result, (writeptr - result) - 1);
  
}

// https://stackoverflow.com/questions/7380591/what-happened-to-syscalls-h
// https://stackoverflow.com/questions/19769542/reading-from-file-using-read-function
int readint() {

	char buf[25];
	
	char c = ' ';
	int pos = 0;
	while ( ++pos, c != '\n' && c != '\0' && c != -1 ) {
		read(0,&c,1);
		buf[pos-1] = c;
	}
	
	int neg = 0;
	int sum = 0;
	int i = 0;
	for ( ; i < pos; ++i ) {
		if ( buf[i] == '-' ) neg = 1;
		if ( buf[i] >= '0' && buf[i] <= '9' ) {
			sum *= 10;
			sum += buf[i] - '0';
		}
	}	
	
	if ( neg ) sum *= -1;
	return sum;
	

}

