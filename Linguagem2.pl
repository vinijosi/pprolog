:- include('Linguagem1.pl').
:- dynamic declaraFunc/2, ambiente/2, funcao/3,varLocal/2.


avalie(variavel(Id), R, T):-
	ambiente(Id, Bind),
	avalie(Bind, R, T).

avalie(let(Id, Bind, Body), R, T):-
	asserta(ambiente(Id, Bind)),
	avalie(Body, R, T).
