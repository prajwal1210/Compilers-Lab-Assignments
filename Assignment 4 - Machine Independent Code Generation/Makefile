a.out : lex.yy.c y.tab.c ass4_15CS30043_translator.h ass4_15CS30043_translator.cxx
	g++ lex.yy.c -lfl

lex.yy.c : ass4_15CS30043.l
	flex ass4_15CS30043.l

y.tab.c : ass4_15CS30043.y
	bison ass4_15CS30043.y -o 'y.tab.c'

clean:
	rm -rf lex.yy.c y.tab.c a.out
