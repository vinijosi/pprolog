:- include('TestesTipos.pl').
%%%%%%%%%%%%%%%%%% Trata Constantes, Soma e Subtracao %%%%%%%%%%%%%%%%%%%%%%%%

avalie(iConst(X), R, T):-
	R is X,
	T = 'inteiro'.
	
avalie(soma(Esq, Dir), R, T):-
	avalie(Esq, E, Te),
	avalie(Dir, D, Td),
	checaTipo(Te, Td, T),
	(T == 'inteiro' ->
	R is E + D;
	write('Erro na Checagem de tipos '),
	T = 'Quebra', fail).	
	

avalie(subtrai(Esq, Dir), R, T):-
	avalie(Esq, E, Te),
	avalie(Dir, D, Td),
	checaTipo(Te, Td, T),
	(T == 'inteiro' ->
	R is E - D;
	write('Erro na Checagem de tipos '),
	T = 'Quebra', fail).
