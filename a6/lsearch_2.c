

int lsearch_2(int *A, int n, int target) {

    //.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
    // Question 3(a):  Replace this code with the new algorithm 
    //.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
	int tmp;
	int i;
    if(n <= 0){
		return -1;
	}
	
	tmp = A[n-1];
	A[n-1] = target;
	
	i = 0;
	while(A[i] != target){
		i++;
	}
	
	A[n-1] = tmp;
	
	if(i < n-1){
		return i;
	}
	else if(A[n-1] == target){
		return n-1;
	}
	else{
		return -1;
	}
    //.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
    
}  // lsearch_2


