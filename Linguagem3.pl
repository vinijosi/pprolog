:- include('Linguagem2.pl').

%%%%%%%%%%%%%%%%%% Trata Declaração de Funções %%%%%%%%%%%%%%%%%%%%%%%%	

avalie(declaraFunc(N, C, Args), _, T, Ai, Af) :-
	insereInicio((N,(C,Args)), Ai, Af),
	T = 'declaraFunc'.

avalie(aplicaFunc(N, Args), R, T, Ai, _) :-
	buscaCorpo(N, Ai, C),
	extraiDeclaracao(N, Ai, Df),
	avalie(C, R, T, [Df|Args], _).