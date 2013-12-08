:- include('Linguagem2.pl').

%%%%%%%%%%%%%%%%%% Trata Declaração de Funções %%%%%%%%%%%%%%%%%%%%%%%%	

avalie(declaraFunc(N, C, Args), _, T, Ai, Af) :-
	insereInicio((N,(C,Args)), Ai, Af),
	T = 'declaraFunc'.

avalie(aplicaFunc(N, Args), R, T, Ai, _) :-
	buscaCorpo(N, Ai, C),
	avalie(C, R, T, Args, _).

/*
%%%%%%%%%%%%%%%%%%%%%%%%% Chamada exemplo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% avalie(aplicaFunc('Nome da Funcao', ListadeValores), R, T). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


avalie(aplicaFunc(IdFunc, IdVar), R, T):-
	funcao(IdFunc, Body, IdArg),
	geraVarLocal(IdArg, IdVar),
	avalie(Body, R, T),
	destroiVarLocal(IdArg, IdVar).


geraVarLocal([],[]).
geraVarLocal(ListaA,ListaV):-
		[A|As]=ListaA,
		[V|Vs]=ListaV,
		asserta(varLocal(A,V)),
		geraVarLocal(As,Vs).
	
destroiVarLocal([],[]).
destroiVarLocal(ListaA,ListaV):-
		[A|As]=ListaA,
		[V|Vs]=ListaV,
		retract(varLocal(A,V)),
		destroiVarLocal(As,Vs).
	
avalie(variavelLocal(Id), R, T):-
	varLocal(Id, Bind),
	avalie(Bind, R, T).

*/