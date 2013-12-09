insereInicio(H, L, [H|L]).

buscaCorpo(N, [(N,V,_)|_], V).
buscaCorpo(N, [_|C], V) :- 
	buscaCorpo(N, C, V).

extraiDeclaracao(N, [(N,C,Lv)|_], (N,C,Lv)).
extraiDeclaracao(N, [_:T], Df) :-
	extraiDeclaracao(N, T, Df).

checaTipo(Esq,Dir, T) :-		
	((Esq == 'inteiro',
	Dir == 'inteiro') ->
		T = 'inteiro';
	
	((Esq == 'booleano',
	Dir == 'booleano') ->
		T = 'booleano';
		(write('Erro na Checagem de tipos '),
		T = 'quebra', fail))).
