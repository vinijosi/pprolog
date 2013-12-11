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

t001 :- avalie(somar(inteiro(4), inteiro(5)), R, T, [], []), output('4+5', R, 9, T).
t002 :- avalie(subtrair(inteiro(4), inteiro(5)), R, T, [], []), output('4-5', R, -1, T).
t003 :- avalie(subtrair(somar(inteiro(4), inteiro(5)), inteiro(5)), R, T, [], []), output('(4+5)-5', R, 4, T).
t004 :- avalie(multiplicar(inteiro(4), inteiro(5)), R, T, [], []), output('4*5', R, 20, T).
t005 :- avalie(dividir(inteiro(4), inteiro(2)), R, T, [], []), output('4/2', R, 2, T).
t006 :- avalie(dividir(multiplicar(inteiro(4), inteiro(5)), inteiro(5)), R, T, [], []), output('(4*5)/5', R, 4, T).
% t007 :- avalie([inteiro(4), inteiro(5)], R, T, [], []), output('4+5', R, 9, T).

%%%%%%%%%%%%%%%%%% Testes logicos %%%%%%%%%%%%%%%%%%

t101 :- avalie(conjuncao(booleano('verdadeiro'), booleano('falso')), R, T, [], []), output('verdadeiro e falso', R, 'falso', T).
t102 :- avalie(disjuncao(booleano('verdadeiro'), booleano('falso')), R, T, [], []), output('verdadeiro ou falso', R, 'verdadeiro', T).
t103 :- avalie(se(disjuncao(booleano('verdadeiro'), booleano('falso')),inteiro(1),inteiro(2)), R, T, [], []), output('se(verdadeiro ou falso) então 1, senão 2', R, 1, T).
t104 :- avalie(se(booleano('verdadeiro'),inteiro(1),inteiro(2)), R, T, [], []), output('se(verdadeiro) então 1, senão 2', R, 1, T).
t105 :- avalie(se(booleano('falso'),inteiro(1),inteiro(2)), R, T, [], []), output('se(falso) então 1, senão 2', R, 2, T).
t106 :- avalie(negacao(booleano('falso')), R, T, [], []), output('nao falso', R, 'verdadeiro', T).

%%%%%%%%%%%%%%%%%% Testes comparadores %%%%%%%%%%%%%%%%%%

t201 :- avalie(maiorque(inteiro(1), inteiro(2)), R, T, [], []), output('1>2', R, 'falso', T).
t202 :- avalie(maiorque(inteiro(2), inteiro(1)), R, T, [], []), output('2>1', R, 'verdadeiro', T).

%%%%%%%%%%%%%%%%%% Teste de Let %%%%%%%%%%%%%%%%%%

t301 :- avalie(let('X', inteiro(4)), _, T, [], Af), output('let(X=5)', Af, [('X',inteiro(4),[])], T).
t302:- avalie([
				let('X', inteiro(4)),
				somar(variavel('X'), inteiro(3))
			  ], R, T, [], _), output('X=4; X+3', R, 7, T).

%%%%%%%%%%%%%%%%%% Teste de Declaracao/Aplicacao de Funcao %%%%%%%%%%%%%%%%%%

t401 :- 
	avalie(declaraFunc('Incremento', somar(variavel('X'),inteiro(1)),[('X','inteiro')]), _, T, [], Af), 
	output('Af', Af, [('Incremento',somar(variavel('X'),inteiro(1)),[ ('X',inteiro)])], T).

t402 :- 
	avalie([
			declaraFunc('Incremento', somar(variavel('X'),inteiro(1)),[('X','inteiro')]),
			aplicaFunc('Incremento', [('X',inteiro(4),[])])
			], R, T, [],_), 
	output('Incremento(4)', R, 5, T).

%%%%%%%%%%%%%%%%%% Teste de Funcao Recursiva %%%%%%%%%%%%%%%%%%

t501 :- 
	avalie([
			declaraFunc('Fatorial', 
				se(maiorque(variavel('X'),inteiro(1)),
					multiplicar(variavel('X'),aplicaFunc('Fatorial', [('X',subtrair(variavel('X'),inteiro(1)),[])])),
					inteiro(1)),
				[('X','inteiro')]),
			aplicaFunc('Fatorial', [('X',inteiro(4),[])])
			], R, T, [],_), 
	output('Fatorial(4)', R, 24, T).

%%%%%%%%%%%%%%%%%% Main %%%%%%%%%%%%%%%%%%

main :-
	nl, write('%%%%%%%%%%%%%%%%%% Testes algebricos %%%%%%%%%%%%%%%%%%'),nl,
	t001, t002, t003, t004, t005, t006, 

	nl,write('%%%%%%%%%%%%%%%%%% Testes logicos %%%%%%%%%%%%%%%%%%'),nl,
	t101, t102, t103, t104, t105, t106,

	nl,write('%%%%%%%%%%%%%%%%%% Testes comparadores %%%%%%%%%%%%%%%%%%'),nl,
	t201, t202,

	nl,write('%%%%%%%%%%%%%%%%%% Testes de Let %%%%%%%%%%%%%%%%%%'),nl,
	t301, t302,

	nl,write('%%%%%%%%%%%%%%%%%% Testes de Declaração de Funções %%%%%%%%%%%%%%%%%%'),nl,
	t401, t402,

	nl,write('%%%%%%%%%%%%%%%%%% Testes de Recursão %%%%%%%%%%%%%%%%%%'),nl,
	t501.



