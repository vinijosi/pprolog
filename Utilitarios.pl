insereInicio(H, L, [H|L]).

buscaCorpo(N, [(N,V,_)|_], V).
buscaCorpo(N, [_|C], V) :- 
	buscaCorpo(N, C, V).

/*
buscaArgumentos(N, [(N,_,A)|_], A).
buscaArgumentos(N, [_|C], A) :- 
	buscaArgumentos(N, C, A).

validaArgumentos([], []).
validaArgumentos([(Nd,Td)|Cd], [(Ni,Ti)|Ci]) :-
	(Nd == Ni, Td == Ti) ->
		validaArgumentos(Cd, Ci);
		(write('Erro na validação dos argumentos da função'),fail).

criarAmbiente([], A).
criarAmbiente([(N,C)|X], A) :- 
	criarAmbiente(X, [(N,C,[])|A]).
*/

checaTipo(Esq,Dir, T):-		
	((Esq == 'inteiro',
	Dir == 'inteiro') ->
		T = 'inteiro';
	
	((Esq == 'booleano',
	Dir == 'booleano') ->
		T = 'booleano';
		(write('Erro na Checagem de tipos '),
		T = 'quebra', fail))).