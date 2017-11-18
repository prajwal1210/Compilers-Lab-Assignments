#include <stdio.h>
#include "lex.yy.c"
int main()
{
	int a;
	while(a=yylex())
	{
		if(a==IDENTIFIER)
			printf("<IDENTIFIER,\'%s\'>\n",yytext);
		else if(a==CONSTANT)
			printf("<CONSTANT,\'%s\'>\n",yytext);
		else if(a==STRING_LITERAL)
			printf("<STRING_LITERAL,\'%s\'>\n",yytext);
		else if(a==UNSIGNED|| a==BREAK|| a==VOID|| a==RETURN|| a==CASE|| a==FLOAT|| a==SHORT|| a==CHAR|| a==FOR|| a==SIGNED|| a==WHILE|| a==GOTO|| a==BOOL|| a==CONTINUE|| a==IF|| a==DEFAULT|| a==DO|| a==INT|| a==SWITCH|| a==DOUBLE|| a==LONG|| a==ELSE|| a==MATRIX)
			printf("<KEYWORD,\'%s\'>\n",yytext);
		else if(a=='+'||a=='-'||a=='['||a==']'||a=='('||a==')'||a=='{'||a=='}'||a=='.'||a=='&'||a=='*'||a=='~'||a=='!'||a=='/'||a=='%'||a=='<'||a=='>'||a=='^'||a=='|'||a=='?'||a==':'||a==';'||a==','||a=='#'||a=='='||a== DASHARROW || a== PLUSPLUS || a== MINMIN || a== DOTQUOTE || a== LSHIFT || a== RSHIFT|| a== LTE|| a== GTE|| a== EQUALS|| a== NEQUALS|| a== LAND|| a== LOR || a== STAREQ || a== DIVEQ || a== MODEQ|| a== PLUSEQ|| a== MINEQ || a== LSHIFTEQ|| a== RSHIFTEQ|| a== ANDEQ || a== POWEQ || a== OREQ)
			printf("<PUNCTUATOR,\'%s\'>\n",yytext);
		else if(a==ERR)
			{
			printf("Lexing failed due to unknown symbol\n");
			break;
			}
		}
}

