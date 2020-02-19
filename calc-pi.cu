#include <stdlib.h>
#include <stdio.h>
#include <cuda.h>
#include <math.h>
#include <time.h>
#include <curand_kernel.h>


float cpuPICalculate(long trials) {
	float x, y;
	long pointsInCircle = 0;
	for (long i = 0; i < trials; i++) {
		x = rand() / (float)RAND_MAX;
		y = rand() / (float)RAND_MAX;
		pointsInCircle += (x*x + y * y <= 1.0f);
	}
	return 4.0f * pointsInCircle / trials;
}

int main(int argc, char *argv[]) {
	clock_t start, stop;

	start = clock();
	float cpuPI = cpuPICalculate(100000000);
	stop = clock();
	printf("CPU PI= %f\n", cpuPI);
	printf("CPU PI calculate time %f s.\n", (stop - start) / (float)CLOCKS_PER_SEC);

	return 0;
}