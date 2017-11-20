#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

/* gcc -fopenmp hello-openmp.c -o hello  */

int main (int argc, char *argv[]) 
{
  int nthreads, tid, i;
  
  printf("\nProgram Start\n\n");
  
  for ( i=1; i<=300; i++ ){  
    
    printf("\nIteration [ %d ]\n\n", i );
    sleep( 1 );
    
  /* Fork a team of threads giving them their own copies of variables */
  
    
#pragma omp parallel private(nthreads, tid)
    {
      
      /* Obtain thread number */
      tid = omp_get_thread_num();
      printf("Hello World from thread = %d\n", tid);
  
      /* Only master thread does this */
      if (tid == 0) 
	{
	  nthreads = omp_get_num_threads();
	  printf("Number of threads = %d\n", nthreads);
	}
      
    }  /* All threads join master thread and disband */
  }
  printf("\nProgram End\n\n");
  exit(0);
}

