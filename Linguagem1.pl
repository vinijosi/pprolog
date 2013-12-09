:- include('Linguagem0.pl').
%%%%%%%%%%%%%%%%%% Trata Multiplicacao Divisao %%%%%%%%%%%%%%%%%%%%%%%%

avalie(multiplicar(Esq, Dir), R, T, Ai, Af):-
	avalie(Esq, E, Te, Ai, Af),
	avalie(Dir, D, Td, Ai, Af),
	checaTipo(Te, Td, T),
	(T == 'inteiro' ->
		R is E * D;
		write('Erro na Checagem de tipos MULTIPLICAR'), T = 'Quebra', fail).

avalie(dividir(Esq, Dir), R, T, Ai, Af):-
	avalie(Esq, E, Te, Ai, Af),
	avalie(Dir, D, Td, Ai, Af),
	checaTipo(Te, Td, T),
	(T == 'inteiro' ->
		R is E / D;
		write('Erro na Checagem de tipos DIVIDIR'), T = 'Quebra', fail).

%%%%%%%%%%%%%%%%%% Trata Valores Logicos %%%%%%%%%%%%%%%%%%%%%%%%	

avalie('falso', R, T, _, _):-
	R = 'falso',
	T = 'booleano'.

avalie('verdadeiro', R, T, _, _):-
	R = 'verdadeiro',
	T = 'booleano'.

avalie(booleano(X), R, T, _, _):-
	R = X,
	(X == 'verdadeiro' -> 
		T = 'booleano'; 
		(X == 'falso' -> 
			T = 'booleano';
		 	write('Erro na Checagem de tipos BOOLEANO'), T = 'Quebra', fail)).

avalie(conjuncao(Esq, Dir), R, T, Ai, Af):-
	avalie(Esq, E, Te, Ai, Af),
	avalie(Dir, D, Td, Ai, Af),
	checaTipo(Te, Td, T),
	
	(T == 'booleano' ->
		((E == 'verdadeiro', D == 'verdadeiro') ->
			R = 'verdadeiro';
			R = 'falso');
		write('Erro na Checagem de tipos CONJUNCAO'), T = 'Quebra', fail).
	
avalie(disjuncao(Esq, Dir), R, T, Ai, Af):-
	avalie(Esq, E, Te, Ai, Af),
	avalie(Dir, D, Td, Ai, Af),
	checaTipo(Te, Td, T),
	
	(T == 'booleano' ->
		((E == 'falso', D == 'falso') ->
			R = 'falso';
			R = 'verdadeiro');
		write('Erro na Checagem de tipos DISJUNCAO'), T = 'Quebra', fail).
	
avalie(negacao(Proposicao), R, T, Ai, Af):-	
	avalie(Proposicao, Rp, Tp, Ai, Af),

	Tp == 'booleano' ->
		T = 'booleano',
		(Rp == 'verdadeiro' -> 
			R = 'falso';
			R = 'verdadeiro'); 
		write('Erro na Checagem de tipos NEGACAO'), T = 'Quebra', fail.

%%%%%%%%%%%%%%%%%% Trata Concidional %%%%%%%%%%%%%%%%%%%%%%%%	

avalie(se(Condicao, Entao, Senao), R, T, Ai, Af):-
	avalie(Condicao, Rp, Tp, Ai, Af),

	(Tp == 'booleano' -> 
		(Rp == 'verdadeiro' -> 
			avalie(Entao, Re, Te, Ai, Af), R = Re, T = Te;
			avalie(Senao, Rs, Ts, Ai, Af), R = Rs, T = Ts);
		write('Erro na Checagem de tipos SE'), T = 'Quebra', fail).

%%%%%%%%%%%%%%%%%% Comparadores %%%%%%%%%%%%%%%%%%%%%%%%	

avalie(maiorque(Esq, Dir), R, T, Af, Af):-
	avalie(Esq, E, Te, Ai, Af),
	avalie(Dir, D, Td, Ai, Af),
	checaTipo(Te, Td, Tp),
		
	(Tp == 'inteiro' ->		
		T = 'booleano',
		(E > D ->
			R = 'verdadeiro';
			R = 'falso'));
	write('Erro na Checagem de tipos MAIOR QUE'),nl,write(Ai),nl,write(Tp),nl, T = 'Quebra', fail.
