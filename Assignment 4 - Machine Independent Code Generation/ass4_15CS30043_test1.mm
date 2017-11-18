//Tests all decision making and loop constructs , passing matrices to functions, matrix initializations , ternary operator 
int sum(Matrix mat[3][3]){
	int s = 0;
	Matrix m[3][3] = {1.1,2.2,3.3;4.5,5.6,6.7;4.8,6.9,5.7};
	int i,j;
	for(i=0;i<2;i++)
	{
		for(j=0;j<2;j++)
		{
			s = s + m[i][j] + mat[i][j];
		}
	}
	return s;
}

int main(){
	Matrix mat[3][3] = {0,0,0;0,0,0;0,0,0};
	int a;
	int b;
	a = 10;
	b = 9;
	int c;
	c = a>b ? sum(mat) : 0;
	int t = 9;
	if(c==0 && 5>6)
	{
		while(t--)
		{
			c=c+1;
		}
	}
	else
	{
		do{
			c = c+'a';
			t--;
		}
		while(t<=0 || 4>3);
	}
	return 0;
}