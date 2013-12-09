:- include('Linguagem3.pl').
%%%%%%%%%%%%%%%%%% Testes Unitários %%%%%%%%%%%%%%%%%%%%%%%%

output(Texto, R, E, T) :-
	write('Teste: '),
	write(Texto),
	write(' Resultado: '),
	write(R),
	write(' Tipo: '),
	write(T),
	write(' Esperado: '),
	write(E),
	(R  == E -> 
		write(' OK'), nl;
		write(' FAIL\n'), nl).

%%%%%%%%%%%%%%%%%% Testes algebricos %%%%%%%%%%%%%%%%%%

t1 :- avalie(somar(inteiro(4), inteiro(5)), R, T, [], []), output('4+5', R, 9, T).
t2 :- avalie(subtrair(inteiro(4), inteiro(5)), R, T, [], []), output('4-5', R, -1, T).
t3 :- avalie(subtrair(somar(inteiro(4), inteiro(5)), inteiro(5)), R, T, [], []), output('(4+5)-5', R, 4, T).
t4 :- avalie(multiplicar(inteiro(4), inteiro(5)), R, T, [], []), output('4*5', R, 20, T).
t5 :- avalie(dividir(inteiro(4), inteiro(2)), R, T, [], []), output('4/2', R, 2, T).
t6 :- avalie(dividir(multiplicar(inteiro(4), inteiro(5)), inteiro(5)), R, T, [], []), output('(4*5)/5', R, 4, T).

%%%%%%%%%%%%%%%%%% Testes logicos %%%%%%%%%%%%%%%%%%

t7 :- avalie(conjuncao(booleano('verdadeiro'), booleano('falso')), R, T, [], []), output('verdadeiro e falso', R, 'falso', T).
t8 :- avalie(disjuncao(booleano('verdadeiro'), booleano('falso')), R, T, [], []), output('verdadeiro ou falso', R, 'verdadeiro', T).
t9 :- avalie(se(disjuncao(booleano('verdadeiro'), booleano('falso')),inteiro(1),inteiro(2)), R, T, [], []), output('se(verdadeiro ou falso) então 1, senão 2', R, 1, T).
t10 :- avalie(se(booleano('verdadeiro'),inteiro(1),inteiro(2)), R, T, [], []), output('se(verdadeiro) então 1, senão 2', R, 1, T).
t11 :- avalie(se(booleano('falso'),inteiro(1),inteiro(2)), R, T, [], []), output('se(falso) então 1, senão 2', R, 2, T).
t12 :- avalie(negacao(booleano('falso')), R, T, [], []), output('nao falso', R, 'verdadeiro', T).

%%%%%%%%%%%%%%%%%% Testes comparadores %%%%%%%%%%%%%%%%%%

t17 :- avalie(maiorque(inteiro(1), inteiro(2)), R, T, [], []), output('1>2', R, 'falso', T).
t18 :- avalie(maiorque(inteiro(2), inteiro(1)), R, T, [], []), output('2>1', R, 'verdadeiro', T).

%%%%%%%%%%%%%%%%%% Teste de Let %%%%%%%%%%%%%%%%%%

t13 :- avalie(let('X', inteiro(4)), _, T, [], Af), output('let(X=5)', Af, [('X',inteiro(4),[])], T).
t14 :- avalie(somar(variavel('X'), inteiro(3)), R, T, [('X',inteiro(4),[])], _), output('X+3 (onde X=4)', R, 7, T).

%%%%%%%%%%%%%%%%%% Teste de Declaracao/Aplicacao de Funcao %%%%%%%%%%%%%%%%%%

% Função: Amb = [('Incremento',soma(variavel('X'),inteiro(1)),[('X','inteiro')])]

t15 :- 
	avalie(declaraFunc('Incremento', soma(variavel('X'),inteiro(1)),[('X','inteiro')]), _, T, [], Af), 
	output('Af', Af, [('Incremento',soma(variavel('X'),inteiro(1)),[ ('X',inteiro)])], T).

t16 :- 
	avalie(aplicaFunc('Incremento', [('X',inteiro(4),[])]), R, T, [('Incremento',somar(variavel('X'),inteiro(1)),[('X',inteiro)])],_), 
	output('Incremento(4)', R, 5, T).

%%%%%%%%%%%%%%%%%% Teste de Funcao Recursiva %%%%%%%%%%%%%%%%%%

t19 :- 
	avalie(aplicaFunc('Fatorial', [('X',inteiro(4),[])]), R, T, [('Fatorial',
			se(maiorque(variavel('X'),inteiro(1)),
				multiplicar(variavel('X'),aplicaFunc('Fatorial', [('X',subtrair(variavel('X'),inteiro(1)),[])])),
				inteiro(1)))],[]),
	output('Incremento(4)', R, 5, T).

%%%%%%%%%%%%%%%%%% Main %%%%%%%%%%%%%%%%%%

main :-
	nl, write('%%%%%%%%%%%%%%%%%% Testes algebricos %%%%%%%%%%%%%%%%%%'),nl,
	t1, t2, t3, t4, t5, t6, 

	nl,write('%%%%%%%%%%%%%%%%%% Testes logicos %%%%%%%%%%%%%%%%%%'),nl,
	t7, t8, t9, t10, t11, t12,

	nl,write('%%%%%%%%%%%%%%%%%% Testes comparadores %%%%%%%%%%%%%%%%%%'),nl,
	t17, t18,

	nl,write('%%%%%%%%%%%%%%%%%% Testes de Let %%%%%%%%%%%%%%%%%%'),nl,
	t13, t14,

	nl,write('%%%%%%%%%%%%%%%%%% Testes de Declaração de Funções %%%%%%%%%%%%%%%%%%'),nl,
	t15, t16,

	nl,write('%%%%%%%%%%%%%%%%%% Testes de Recursão %%%%%%%%%%%%%%%%%%'),nl,
	t19.



