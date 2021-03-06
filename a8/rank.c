void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i, j;
	int number_passed = 0;
	float sum1 = 0.0;
	float sum2 = 0.0;
    float average = 0.0;
    float passing_average = 0.0;

	for (i = 0; i < N-2; i+=2) {
		// init ranks
		R[i] = 1;
        R[i+1] = 1;
		// compute averages
        sum1 += F[i];
        sum2 += F[i+1];
        if (F[i] >= 50.0) {
			passing_average += F[i];
            number_passed ++;
        }
		if (F[i+1] >= 50.0) {
			passing_average += F[i+1];
            number_passed ++;
        }
    }
	for (; i < N; i++) {
		// init ranks
		R[i] = 1;
		// compute averages
        sum1 += F[i];
        if (F[i] >= 50.0) {
			passing_average += F[i];
            number_passed ++;
        }
    }
	average = sum1 + sum2;
	
    // compute ranks
	for (i = 0; i < N-2; i+=2) {
        for (j = 0; j < N-2; j+=2) {
            if (F[i] < F[j]) {
                R[i] ++;
            }
			if (F[i] < F[j+1]) {
                R[i] ++;
            }
			if (F[i+1] < F[j]) {
                R[i+1] ++;
            }
			if (F[i+1] < F[j+1]) {
                R[i+1] ++;
            }
        }
		for (; j < N; j++) {
            if (F[i] < F[j]) {
                R[i] ++;
            }
			if (F[i+1] < F[j]) {
                R[i+1] ++;
            }
		}
    }
	for(; i < N; i ++){
		for (j = 0; j < N-2; j+=2) {
            if (F[i] < F[j]) {
                R[i] ++;
            }
			if (F[i] < F[j+1]) {
                R[i] ++;
            }
        }
	}
    // check for div by 0
    if (N) average /= N;
    if (number_passed) passing_average /= number_passed;
	
	*num_passed = number_passed;
	*avg = average;
	*passing_avg = passing_average;
	
} // compute_ranks