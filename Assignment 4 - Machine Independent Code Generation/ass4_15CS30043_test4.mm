//Test for pointers and pointer functions
void swapint(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
	return;
}

void swapdouble(double* a,double* b)
{
	double temp = *a;
	*a = *b;
	*b = temp;
	return;
}

void swapchar(char* a, char* b)
{
	char temp = *a;
	*a = *b;
	*b =temp;
	return;
}

int* assign(int a)
{
	int* p = &a;
	return p;
}

int main(){
	int a,**b;
	*b = assign(a);
	a = **b+a;
	a = **b-a;
	a = **b<<a;
	a = **b>>a;
	a = (**b) & a;
	a = **b ^ a;
	a = **b | a;
	a = (**b) * a;
	a = **b/a;
	a = **b%a;
	a++;
	++a;
	a--;
	--a;
	swapint(&a,*b);
	return 1;
}