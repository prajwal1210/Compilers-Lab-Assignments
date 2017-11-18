//Test for matrix operations and matrix functions 
Matrix transpose(Matrix mat[3][2])
{
	Matrix trans[2][3];
	trans = mat.';
	return trans;
}

Matrix sum(Matrix a[3][2],Matrix b[3][2])
{
	Matrix res[3][2] = a+b;
	return res;
}

Matrix mult(Matrix a[2][3], Matrix b[3][2])
{
	Matrix res[2][2];
	res = a * b;
	return res;
}

int main(){

	Matrix m1[3][2];
	Matrix m2[2][3];
	Matrix mul[2][2];
	Matrix m[2][2];
	double *p;
	p=&m[1][1];
	m2 = transpose(m1);
	mul = mult(m2,m1);
	m1 = sum(m1,m1);
	return 0;

}

