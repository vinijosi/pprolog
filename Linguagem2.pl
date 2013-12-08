:- include('Linguagem1.pl').

%%%%%%%%%%%%%%%%%% Trata Let %%%%%%%%%%%%%%%%%%%%%%%%	

% É construído um ambiente que serve tanto para variáveis quanto para funções, tecnicamente
% um ambiente é uma lista de triplas que possuem o nome da atribuição (seja variável ou função), o
% segundo elemento da tripla é o corpo da função ou valor constante da variável, e o terceiro elemento
% da tripla é uma lista de tuplas de argumentos formais se for uma função, contento o nome da variável e
% seu tipo

% Uma variável é uma função constante sem argumentos. Exemplos:
% Variável: Amb = [('X',inteiro(4),[]),('F',booleano('falso'),[])]

% Já uma função é declarada da seguinte forma no ambiente:
% Função: Amb = [('Incremento',soma(variavel('X'),inteiro(1)),[('X','inteiro')])]

avalie(let(N, V), _, T, Ai, Af) :- 
	insereInicio((N,V,[]), Ai, Af),
	T = 'let'.

avalie(variavel(N), R, T, Ai, Af) :- 
	buscaCorpo(N, Ai, V),
	avalie(V, R, T, Ai, Af).