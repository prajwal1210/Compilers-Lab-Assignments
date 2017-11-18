all : parser_15CS30043.out lexer_15CS30043.out 
parser_15CS30043.out :	ass3_15CS30043_parser.c lex.yy.c y.tab.c
	gcc ass3_15CS30043_parser.c -lfl -I.  -o ./parser_15CS30043.out


lexer_15CS30043.out : ass3_15CS30043_lexer.c lex.yy.c y.tab.c
	gcc ass3_15CS30043_lexer.c -lfl -I.  -o ./lexer_15CS30043.out


y.tab.c : ass3_15CS30043.y
	bison ass3_15CS30043.y -o 'y.tab.c'

lex.yy.c : ass3_15CS30043.l
	flex ass3_15CS30043.l

clean: 
	rm -f ./*~ ./lex.yy.c ./y.tab.c ./lexer_15CS30043.out ./parser_15CS30043.out
