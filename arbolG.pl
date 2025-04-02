% Predicados monarios (hombres y mujeres)
hombre(juan).
hombre(carlos).
hombre(pedro).
hombre(luis).
hombre(raul).
hombre(fernando).
hombre(diego).
hombre(mario).
hombre(alberto).
hombre(manuel).
hombre(ernesto).
hombre(ricardo).
hombre(javier).
hombre(alejandro).
mujer(ana).
mujer(maria).
mujer(luisa).
mujer(carmen).
mujer(sofia).
mujer(julia).
mujer(elena).
mujer(marta).
mujer(patricia).
mujer(isabel).
mujer(rosa).
mujer(gabriela).
mujer(claudia).
mujer(monica).

% Predicados binarios (relaciones familiares)
padre_de(juan, carlos).
padre_de(juan, maria).
padre_de(pedro, ana).
padre_de(pedro, luis).
padre_de(raul, fernando).
padre_de(raul, sofia).
padre_de(diego, elena).
padre_de(diego, mario).
padre_de(alberto, patricia).
padre_de(manuel, ricardo).
padre_de(manuel, ernesto).
padre_de(ernesto, javier).
padre_de(ernesto, alejandro).
padre_de(ricardo, rosa).
padre_de(ricardo, gabriela).
madre_de(luisa, carlos).
madre_de(luisa, maria).
madre_de(carmen, ana).
madre_de(carmen, luis).
madre_de(julia, fernando).
madre_de(julia, sofia).
madre_de(marta, elena).
madre_de(marta, mario).
madre_de(patricia, alberto).
madre_de(isabel, ricardo).
madre_de(isabel, ernesto).
madre_de(rosa, javier).
madre_de(rosa, alejandro).
madre_de(gabriela, claudia).
madre_de(gabriela, monica).

abuelo_de(X, Y) :- padre_de(X, Z), padre_de(Z, Y).
abuelo_de(X, Y) :- padre_de(X, Z), madre_de(Z, Y).
abuela_de(X, Y) :- madre_de(X, Z), padre_de(Z, Y).
abuela_de(X, Y) :- madre_de(X, Z), madre_de(Z, Y).

hermano_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), X \= Y.
hermano_de(X, Y) :- madre_de(Z, X), madre_de(Z, Y), X \= Y.

hermana_de(X, Y) :- madre_de(Z, X), madre_de(Z, Y), X \= Y.
hermana_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), X \= Y.

tio_de(X, Y) :- hermano_de(X, Z), padre_de(Z, Y).
tio_de(X, Y) :- hermano_de(X, Z), madre_de(Z, Y).

tia_de(X, Y) :- hermana_de(X, Z), padre_de(Z, Y).
tia_de(X, Y) :- hermana_de(X, Z), madre_de(Z, Y).

primo_de(X, Y) :- padre_de(Z, X), padre_de(W, Y), hermano_de(Z, W).
primo_de(X, Y) :- madre_de(Z, X), madre_de(W, Y), hermano_de(Z, W).
primo_de(X, Y) :- padre_de(Z, X), madre_de(W, Y), hermano_de(Z, W).
primo_de(X, Y) :- madre_de(Z, X), padre_de(W, Y), hermano_de(Z, W).

prima_de(X, Y) :- padre_de(Z, X), padre_de(W, Y), hermana_de(Z, W).
prima_de(X, Y) :- madre_de(Z, X), madre_de(W, Y), hermana_de(Z, W).
prima_de(X, Y) :- padre_de(Z, X), madre_de(W, Y), hermana_de(Z, W).
prima_de(X, Y) :- madre_de(Z, X), padre_de(W, Y), hermana_de(Z, W).

nieto_de(X,Y) :- 

% Consultas
abuelo_de(X, Y). 
abuela_de(X, Y). 
hermano_de(X, Y).  
hermana_de(X, Y).  
tio_de(X, Y).  
tia_de(X, Y). 
primo_de(X, Y). 
prima_de(X, Y). 
padre_de(X, Y).  
madre_de(X, Y).  


