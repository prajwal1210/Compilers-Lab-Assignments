#include "myl.h"

int main()
{

	
	//printInt test
	int a = 123;
	int s= printInt(a);
	printStr((char*)"  return value:");
	printInt(s);
	printStr((char*)"\n");
	a = -23;
	s = printInt(a);
	printStr((char*)"  return value:");
	printInt(s);
	printStr((char*)"\n");

	printStr((char*)"\n");

	//printStr test 
	char* str = (char*)"Hello\n";
	s = printStr(str);
	printStr((char*)"return value:");
	printInt(s);
	printStr((char*)"\n");
	str = (char*)"This program uses no standard C libraries\n";
	s = printStr(str);
	printStr((char*)"return value:");
	printInt(s);
	printStr((char*)"\n");

	printStr((char*)"\n");
	
	//printFlt test
	float b = 123.215;
	s= printFlt(b);
	printStr((char*)"  return value:");
	printInt(s);
	printStr((char*)"\n");
	b = -23.2564;
	s = printFlt(b);
	printStr((char*)"  return value:");
	printInt(s);
	printStr((char*)"\n");

	printStr((char*)"\n");
	
	//readInt test
	printStr((char*)"Enter an integer :");
	int n;
	s = readInt(&n);
	printStr((char*)"return value:");
	printInt(s);
	printStr((char*)"\n");
	printInt(n);
	printStr((char*)"\n");

	printStr((char*)"\n");

	//readFlt test 
	printStr((char*)"Enter a floating point number :");
	float f;
	s = readFlt(&f);
	printStr((char*)"return value:");
	printInt(s);
	printStr((char*)"\n");
	printFlt(f);
	printStr((char*)"\n");

	
}
