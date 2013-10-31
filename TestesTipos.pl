	
checaTipo(Esq,Dir, T):-	
	
	((Esq == 'inteiro',
	Dir == 'inteiro') ->
	T = 'inteiro';
	
	((Esq == 'booleano',
	Dir == 'booleano') ->
	T = 'booleano';
	(write('Erro na Checagem de tipos '),
	T = 'quebra', fail))).
