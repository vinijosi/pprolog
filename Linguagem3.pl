:- include('Linguagem2.pl').


%%%%%%%%%%%%%%%%%%%%%%%%% Chamada exemplo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% avalie(declaraFunc('Nome da Funcao', Corpo da Funcao, [argumentos] ), R, T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

avalie(declaraFunc(Id, Body, Argumentos), R, T):-
	asserta(funcao(Id, Body, Argumentos)),
	R = 'Funcao Armazenada'.


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
