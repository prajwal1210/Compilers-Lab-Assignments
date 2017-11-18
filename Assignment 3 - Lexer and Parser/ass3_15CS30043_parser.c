#include <stdio.h>
#include "lex.yy.c"
int main()
{
	int a = yyparse();
	if(a==0)
		printf("Parsing successfull\n");
	else
		printf("Parsing failed\n");
}
