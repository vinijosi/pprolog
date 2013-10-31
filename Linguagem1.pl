:- include('Linguagem0.pl').
%%%%%%%%%%%%%%%%%% Trata Multiplicacao Divisao %%%%%%%%%%%%%%%%%%%%%%%%

	
avalie(multiplica(Esq, Dir), R, T):-
	avalie(Esq, E, Te),
	avalie(Dir, D, Td),
	checaTipo(Te, Td, T),
	(T == 'inteiro' ->
	R is E * D;
	write('Erro na Checagem de tipos '),
	T = 'Quebra', fail).

avalie(divide(Esq, Dir), R, T):-
	avalie(Esq, E, Te),
	avalie(Dir, D, Td),
	checaTipo(Te, Td, T),
	(T == 'inteiro' ->
	R is E / D;
	write('Erro na Checagem de tipos '),
	T = 'Quebra', fail).

%%%%%%%%%%%%%%%%%% Trata Valores Logicos %%%%%%%%%%%%%%%%%%%%%%%%	



avalie(booleano(X), R, T):-
	R = X,
	(X == 'verdadeiro' -> T = 'booleano'; 
	(X == 'falso' -> T = 'booleano';
	 T = 'NotBooleano')).

avalie(conjuncao(Esq, Dir),R, T):-
	avalie(Esq, E, Te),
	avalie(Dir, D, Td),
	checaTipo(Te, Td, T),
	
	((E == 'verdadeiro',
	D == 'verdadeiro')->
	R = 'verdadeiro';
	R = 'falso').
	
avalie(disjuncao(Esq, Dir),R, T):-
	avalie(Esq, E, Te),
	avalie(Dir, D, Td),
	checaTipo(Te, Td, T),
	
	((E == 'falso',
	D == 'falso')->
	R = 'falso';
	R = 'verdadeiro').
	
avalie(negacao(Proposicao), R, T):-
	
	avalie(proposicao, Rp, Tp),
		(Tp == 'booleano' -> T = 'booleano'; T = 'NotBooleano',
	write('Erro na Checagem de tipos '),fail),

	(Rp == 'verdadeiro' -> R = 'falso';(Rp == 'falso' -> T = 'verdadeiro'; 
	write('Erro na Checagem de tipos '),fail)).

