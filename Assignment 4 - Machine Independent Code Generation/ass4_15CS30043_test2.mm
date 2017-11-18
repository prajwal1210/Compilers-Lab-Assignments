//Test for type conversions

double mult(int a,int b)
{
	double prod;
	prod = a*b;
	return prod;
}

int sum(double a, double b)
{
	int c;
	c = a+b;
	return c;
}

char sumchar(int a, int b)
{
	char c;
	c = a+b;
	return c;
}

void main(){
	int a,b=10,c;
	a = 20;
	double x,y=2.3,z=1.0;
	x = mult(a,b);
	c = sum(y,z);
	char schar,schar2,schar3;
	schar = sumchar(a,b);
	schar2 = sumchar(a,c);
	schar3 = sumchar(schar,schar2);
	int d = 4<5;
	return;
}