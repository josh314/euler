#include <cstdio>
#include <cinttypes>

int main() {

  uint64_t max = 1000*1000;
  int max_step = 0;
  int max_seed = 0;
  uint64_t TOO_BIG = -1;

  for (uint64_t i=2; i<max ; ++i) {
    uint64_t n = i;
    int step = 1;
    while(n!=1) {
      if (n > TOO_BIG / 3)
	printf("OVERFLOW\n");

      if(n & 1)
	n = 3*n+1;
      else
	n >>= 1;
      ++step;
    }
    //    printf("Iteration %d: %d steps\n", i, step);
    if(step > max_step) {
      max_step = step;
      max_seed = i;
    }
  }

  printf("Sequence starting with %d has %d steps\n", max_seed, max_step);

}
