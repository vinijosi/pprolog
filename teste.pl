Testes algebricos

	avalie(soma(iConst(4), iConst(5)),R,T).

	avalie(subtrai(iConst(4), iConst(5)),R,T).

	avalie(subtrai(soma(iConst(4), iConst(5)), iConst(5)),R,T).
	
	avalie(multiplica(iConst(4), iConst(5)),R,T).

	avalie(divide(iConst(4), iConst(2)),R, T).

	avalie(divide(multiplica(iConst(4), iConst(5)), iConst(5)), R, T).
	
Testes logicos.

	avalie(conjuncao(booleano('true'), booleano('false'))).
	avalie(disjuncao(booleano('true'), booleano('false'))).

%%%	DeMorgan %%%%%%%%%%%
	
	avalie(negacao(disjuncao(booleano('false'), booleano('false')))).
	
	
	avalie(conjuncao(negacao(booleano('false')), negacao(booleano('false')))).
	
	
	(disjuncao(booleano('false'), booleano('false')))).
	
Teste de Let

	avalie(let('X', iConst(4), variavel('X')), R, T).
	
	avalie(let('X', iConst(4), (let('Y', iConst(5), soma(variavel('X'),variavel('Y'))))), R, T).
	

Teste de Declaracao de Funcao


	avalie(declaraFunc('soma4', soma(soma(variavelLocal('A'),variavelLocal('B')),soma(variavelLocal('C'),variavelLocal('D'))),	['A','B','C','D']),	R, T).

Teste de Aplicacao de Funcao

	Teste correto:
	
	avalie(aplicaFunc('soma4', [iConst(4), iConst(3),iConst(2),iConst(1)]), R, T).
	
	Teste com Erro:
	
	avalie(aplicaFunc('soma4', [iConst(4), iConst(3),iConst(2),booleano('true')]), R, T).
