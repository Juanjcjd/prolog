:- dynamic eliza_estado/1.
:- discontiguous replace0/5.

eliza_estado([]).

eliza:-	
    nb_setval(eliza_estado, []),
    writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
    readln(Input),
    eliza(Input),!.

eliza(Input):- Input == ['adios'],
    writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
    writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Bye', '.'],
    writeln('Bye espero haber podido responder todas tus preguntas.'), !.
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    % si he llegado aquí es que he
    % hallado el template correcto:
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).
template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template(['Hola', 'soy', s(_), '.'], ['Hola', 'que', tal, 0, '?'], [2]).
template(['Hola', ',', 'me', 'llamo', s(_), '.'], ['Hola', 0, 'Como', 'estas', '?'], [4]).
template(['Buenos', 'dias', ',', 'soy', s(_), '.'], ['Buenos', 'dias', 'que', tal, 0, '?'], [4]).
template(['Que', 'tal', ',', 'mi', 'nombre', 'es', s(_), '.'], ['Que', 'tal', 0, 'en', 'que', 'puedo', 'ayudarte', '?'], [6]).
template(['Un', 'gusto', 'conocerte', ',', 'soy', s(_), '.'], ['Un', 'gusto', 'conocerte', 0, 'que', 'necesitas', '?'], [5]).
template(['Hola', ',', 'soy', s(_), 'me', 'puedes', 'ayudar', '.'], ['Hola', 0, 'en que puedo ayudarte', '?'], [3]).
template(['Saludos', ',', 'mi', 'nombre', 'es', s(_), '.'], ['Saludos', 0, 'como', 'estas', '?'], [5]).
template(['Hola', 'de', 'nuevo', ',', 'soy', s(_), '.'], ['Hola', 'de', 'nuevo', 0, 'como', 'te', 'va', '?'], [5]).
template(['Buenos', 'dias', ',', 'mi', 'nombre', 'es', s(_), '.'], ['Buenos', 'dias', 0, 'como', 'puedo', 'ayudarte', '?'], [6]).
template(['Hola', ',', 'me', 'presento', ',', 'soy', s(_), '.'], ['Hola', 0, 'que', 'tal', '?'], [6]).
template(['Hola', 'de', 'parte', 'de', s(_), '.'], ['Hola', 0, 'que', 'puedo', 'hacer', 'por', 'ti', '?'], [4]).
template(['Hola', s(_), ',', 'mi', 'nombre', 'es', s(_), '.'], ['Hola', 0, 'como', 'estas', '?'], [6]).
template(['Saludos', ',', 'soy', s(_), '.'], ['Saludos', 0, 'como', 'te', 'encuentras', '?'], [3]).
template(['Hola', 'buenas', 'noches', 'soy', s(_), '.'], ['Hola', 0, 'buenas noches', 'en que puedo ayudarte', '?'], [4]).
template(['Un', 'placer', 'conocerte', ',', 'mi', 'nombre', 'es', s(_), '.'], ['Un', 'placer', 'conocerte', 0, 'como', 'estas', '?'], [7]).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [3]).
template([eres, s(_), '?'], [flagIs], [1]).

template([como, estas, tu, '?'], [yo, estoy, bien, gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

% ===== TEMPLATES PARA PREGUNTAS DE FAMILIA MEJORADOS =====

% Preguntas básicas de parentesco
template([s(_), es, hijo, de, s(_)], [flagFamilia, hijo], [0, 4]).
template([s(_), es, hija, de, s(_)], [flagFamilia, hijo], [0, 4]).
template([s(_), es, padre, de, s(_)], [flagFamilia, padre], [0, 4]).
template([s(_), es, madre, de, s(_)], [flagFamilia, madre], [0, 4]).
template([s(_), es, hermano, de, s(_)], [flagFamilia, hermano], [0, 4]).
template([s(_), es, hermana, de, s(_)], [flagFamilia, hermano], [0, 4]).
template([s(_), es, abuelo, de, s(_)], [flagFamilia, abuelo], [0, 4]).
template([s(_), es, abuela, de, s(_)], [flagFamilia, abuelo], [0, 4]).
template([s(_), es, tio, de, s(_)], [flagFamilia, tio], [0, 4]).
template([s(_), es, tia, de, s(_)], [flagFamilia, tio], [0, 4]).
template([s(_), es, primo, de, s(_)], [flagFamilia, primo], [0, 4]).
template([s(_), es, prima, de, s(_)], [flagFamilia, primo], [0, 4]).

% Nuevas relaciones familiares
template([s(_), es, nieto, de, s(_)], [flagFamilia, nieto], [0, 4]).
template([s(_), es, nieta, de, s(_)], [flagFamilia, nieto], [0, 4]).
template([s(_), es, sobrino, de, s(_)], [flagFamilia, sobrino], [0, 4]).
template([s(_), es, sobrina, de, s(_)], [flagFamilia, sobrino], [0, 4]).
template([s(_), es, esposo, de, s(_)], [flagFamilia, esposo], [0, 4]).
template([s(_), es, esposa, de, s(_)], [flagFamilia, esposo], [0, 4]).
template([s(_), es, cunado, de, s(_)], [flagFamilia, cunado], [0, 4]).
template([s(_), es, cunada, de, s(_)], [flagFamilia, cunado], [0, 4]).

% Preguntas sobre relaciones múltiples
template([quien, es, el, padre, de, s(_)], [flagFamilia, quien_padre], [5]).
template([quien, es, la, madre, de, s(_)], [flagFamilia, quien_madre], [5]).
template([quienes, son, los, hijos, de, s(_)], [flagFamilia, quien_hijos], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flagFamilia, quien_hermanos], [5]).
template([quienes, son, los, abuelos, de, s(_)], [flagFamilia, quien_abuelos], [5]).
template([cuantos, hijos, tiene, s(_)], [flagFamilia, cuantos_hijos], [3]).
template([cuantos, hermanos, tiene, s(_)], [flagFamilia, cuantos_hermanos], [3]).

% Pregutas sobre enfermedades
template([tengo, s(_), y, s(_)], [flagDiagnostico], [1, 3]).
template([tengo, s(_)], [flagDiagnostico], [1]).
% Medicamentos
template([que, medicina, necesito, para, s(_)], [flagMedicina], [4]).
template([como, se, trata, la, s(_)], [flagMedicina], [4]).
% Causas
template([que, causa, la, s(_)], [flagCausa], [3]).
template([por, que, da, la, s(_)], [flagCausa], [4]).
% Síntomas
template([cuales, son, los, sintomas, de, s(_)], [flagSintoma], [5]).
template([que, sintomas, tiene, la, s(_)], [flagSintoma], [4]).
% Dónde se da
template([donde, se, da, la, s(_)], [flagLugar], [4]).
template([en, que, lugar, es, comun, la, s(_)], [flagLugar], [6]).
template([cuales, son, los, paises, mas, afectados, por, la, s(_)], [flagPaises], [8]).
template([en, que, paises, hay, mas, casos, de, s(_)], [flagPaises], [7]).
template([que, medicamentos, puedo, tomar, para, la, s(_)], [flagMedicinas], [6]).
template([cuales, son, los, medicamentos, para, la, s(_)], [flagMedicinas], [6]).

% NUEVAS PREGUNTAS SOBRE CARROS
template([cual, es, la, mejor, marca, de, carros], [flagCarros, mejor_marca], []).
template([cual, es, el, carro, mas, rapido, del, mundo], [flagCarros, mas_rapido], []).
template([cuanto, cuesta, un, s(_)], [flagCarros, precio], [3]).
template([donde, se, fabrica, el, s(_)], [flagCarros, fabrica], [4]).
template([cuantos, caballos, tiene, el, s(_)], [flagCarros, potencia], [4]).
template([que, motor, tiene, el, s(_)], [flagCarros, motor], [4]).
template([cuanto, consume, el, s(_)], [flagCarros, consumo], [3]).
template([que, tan, seguro, es, el, s(_)], [flagCarros, seguridad], [5]).

template(_, ['Please', explain, a, little, more, '.'], []).

% ===== BASE DE DATOS FAMILIAR AMPLIADA =====

% Personas por generación
abuelo_paterno(carlos).
abuela_paterna(maria).
abuelo_materno(ricardo).
abuela_materna(sofia).

padre(eduardo).
padre(andres).
padre(fernando).
madre(mariana).
madre(cecilia).
madre(paola).
madre(luisa).

% Relaciones matrimoniales ampliadas
esposo(eduardo, mariana).
esposo(carlos, maria).
esposo(ricardo, sofia).
esposo(andres, paola).
esposo(fernando, luisa).
esposa(mariana, eduardo).
esposa(maria, carlos).
esposa(sofia, ricardo).
esposa(paola, andres).
esposa(luisa, fernando).

% Relaciones padre-hijo ampliadas
padrede(carlos, eduardo).
padrede(carlos, cecilia).
padrede(ricardo, mariana).
padrede(eduardo, andres).
padrede(eduardo, fernando).
padrede(andres, tomas).
padrede(andres, javier).
padrede(andres, simon).
padrede(fernando, daniel).
padrede(fernando, samuel).
padrede(fernando, valeria).

% Relaciones madre-hijo ampliadas
madrede(maria, eduardo).
madrede(maria, cecilia).
madrede(sofia, mariana).
madrede(mariana, andres).
madrede(mariana, fernando).
madrede(cecilia, patricia).
madrede(cecilia, roberto).
madrede(paola, tomas).
madrede(paola, javier).
madrede(paola, simon).
madrede(luisa, daniel).
madrede(luisa, samuel).
madrede(luisa, valeria).

% Géneros ampliados
hombre(carlos).
hombre(ricardo).
hombre(eduardo).
hombre(andres).
hombre(fernando).
hombre(tomas).
hombre(javier).
hombre(simon).
hombre(daniel).
hombre(samuel).
hombre(roberto).

mujer(maria).
mujer(sofia).
mujer(mariana).
mujer(cecilia).
mujer(paola).
mujer(luisa).
mujer(valeria).
mujer(patricia).

% ===== REGLAS FAMILIARES MEJORADAS =====

% Abuelo/Abuela (considera género)
abuelo(X, Y) :- 
    hombre(X),
    (padrede(X, Z); madrede(X, Z)), 
    (padrede(Z, Y); madrede(Z, Y)).

abuela(X, Y) :- 
    mujer(X),
    (padrede(X, Z); madrede(X, Z)), 
    (padrede(Z, Y); madrede(Z, Y)).

% Hermano/Hermana mejorado
hermano(X, Y) :- 
    hombre(X),
    ((padrede(Z, X), padrede(Z, Y)); (madrede(W, X), madrede(W, Y))), 
    X \= Y.

hermana(X, Y) :- 
    mujer(X),
    ((padrede(Z, X), padrede(Z, Y)); (madrede(W, X), madrede(W, Y))), 
    X \= Y.

% Tío/Tía mejorado
tio(X, Y) :- 
    hombre(X),
    (hermano(X, Z); hermana(Z, X)), 
    (padrede(Z, Y); madrede(Z, Y)), 
    X \= Z.

tia(X, Y) :- 
    mujer(X),
    (hermano(Z, X); hermana(X, Z)), 
    (padrede(Z, Y); madrede(Z, Y)), 
    X \= Z.

% Primo/Prima mejorado
primo(X, Y) :- 
    hombre(X),
    (padrede(Z, X); madrede(Z, X)), 
    (padrede(W, Y); madrede(W, Y)), 
    (hermano(Z, W); hermana(Z, W); hermano(W, Z); hermana(W, Z)), 
    X \= Y, Z \= W.

prima(X, Y) :- 
    mujer(X),
    (padrede(Z, X); madrede(Z, X)), 
    (padrede(W, Y); madrede(W, Y)), 
    (hermano(Z, W); hermana(Z, W); hermano(W, Z); hermana(W, Z)), 
    X \= Y, Z \= W.

% Nieto/Nieta
nieto(X, Y) :- 
    hombre(X),
    (padrede(Z, X); madrede(Z, X)), 
    (padrede(Y, Z); madrede(Y, Z)).

nieta(X, Y) :- 
    mujer(X),
    (padrede(Z, X); madrede(Z, X)), 
    (padrede(Y, Z); madrede(Y, Z)).

% Sobrino/Sobrina
sobrino(X, Y) :- 
    hombre(X),
    (padrede(Z, X); madrede(Z, X)), 
    (hermano(Z, Y); hermana(Z, Y)), 
    Z \= Y.

sobrina(X, Y) :- 
    mujer(X),
    (padrede(Z, X); madrede(Z, X)), 
    (hermano(Z, Y); hermana(Z, Y)), 
    Z \= Y.

% Cuñado/Cuñada
cunado(X, Y) :- 
    hombre(X),
    esposo(X, Z), 
    (hermano(Z, Y); hermana(Z, Y)), 
    Z \= Y.

cunada(X, Y) :- 
    mujer(X),
    esposa(X, Z), 
    (hermano(Z, Y); hermana(Z, Y)), 
    Z \= Y.

% ===== FUNCIONES AUXILIARES PARA CONSULTAS MÚLTIPLES =====

% Encontrar todos los hijos de una persona
todos_los_hijos(Padre, Hijos) :-
    findall(Hijo, (padrede(Padre, Hijo); madrede(Padre, Hijo)), Hijos).

% Encontrar todos los hermanos de una persona
todos_los_hermanos(Persona, Hermanos) :-
    findall(H, (hermano(H, Persona); hermana(H, Persona)), Hermanos).

% Contar hijos
contar_hijos(Padre, Cantidad) :-
    todos_los_hijos(Padre, Hijos),
    length(Hijos, Cantidad).

% Contar hermanos
contar_hermanos(Persona, Cantidad) :-
    todos_los_hermanos(Persona, Hermanos),
    length(Hermanos, Cantidad).

% Enfermedades
enfermedad(colitis_ulcerosa).
enfermedad(diabetes).

% Síntomas
sintomade(dolor_abdominal, colitis_ulcerosa).
sintomade(diarrea_con_sangre, colitis_ulcerosa).
sintomade(pérdida_de_peso, colitis_ulcerosa).
sintomade(fatiga, colitis_ulcerosa).
sintomade(fiebre, colitis_ulcerosa).

sintomade(mucha_sed, diabetes).
sintomade(mucha_orina, diabetes).
sintomade(hambre_excesiva, diabetes).
sintomade(pérdida_peso, diabetes).
sintomade(visión_borrosa, diabetes).
sintomade(cansancio, diabetes).

% Medicinas recomendadas
medicinade(aminosalicilatos, colitis_ulcerosa).
medicinade(corticoesteroides, colitis_ulcerosa).
medicinade(inmunomoduladores, colitis_ulcerosa).
medicinade(biológicos, colitis_ulcerosa).

medicinade(insulina, diabetes).
medicinade(metformina, diabetes).
medicinade(sulfonilureas, diabetes).
medicinade(inhibidores_sglt2, diabetes).

% Causas
causade(factores_geneticos, colitis_ulcerosa).
causade(sistema_inmune_reactivo, colitis_ulcerosa).
causade(factores_ambientales, colitis_ulcerosa).

causade(genetica, diabetes).
causade(sobrepeso, diabetes).
causade(mala_alimentacion, diabetes).
causade(inactividad_fisica, diabetes).

% Lugares donde ocurren
lugarde(colitis_ulcerosa, [
  'Más común en países desarrollados, especialmente en América del Norte y Europa Occidental. Su prevalencia ha ido en aumento en regiones urbanas con estilo de vida occidental.'
]).

lugarde(diabetes, [
  'Presente en todo el mundo, pero con mayor incidencia en países con estilo de vida sedentario y dietas altas en azúcares y grasas. También es común en regiones urbanas y en países en desarrollo con cambios en hábitos alimenticios.'
]).

% Países afectados
paisafectadopor(colitis_ulcerosa, [
  'Países con mayor prevalencia incluyen Estados Unidos, Reino Unido, Canadá, Australia y países nórdicos. La incidencia está aumentando en Asia y América Latina debido a la occidentalización del estilo de vida.'
]).

paisafectadopor(diabetes, [
  'India, China, Estados Unidos, México y Brasil son de los países con mayor número de personas con diabetes. La OMS advierte que es una epidemia mundial en crecimiento, especialmente en países de ingresos medios y bajos.'
]).

% Información de tratamiento general
medicamento(colitis_ulcerosa, [
  'El tratamiento incluye medicamentos antiinflamatorios como los aminosalicilatos, inmunosupresores, corticosteroides y terapias biológicas. En casos graves, puede requerirse cirugía para extirpar parte del colon.'
]).

medicamento(diabetes, [
  'El tratamiento incluye insulina para la diabetes tipo 1, medicamentos orales como la metformina para la tipo 2, y cambios en el estilo de vida como dieta saludable, ejercicio regular y control del peso. En algunos casos, se combinan varios tratamientos.'
]).

% BASE DE DATOS DE CARROS
mejor_marca(toyota).
carro_mas_rapido(bugatti_chiron).

% Información de precios (en miles de dólares)
precio(toyota_corolla, 25).
precio(honda_civic, 28).
precio(ford_mustang, 35).
precio(bmw_x3, 45).
precio(mercedes_c_class, 50).
precio(ferrari_488, 280).
precio(lamborghini_huracan, 250).
precio(bugatti_chiron, 3500).

% Lugares de fabricación
fabrica_en(toyota_corolla, [japon, tailandia, brasil]).
fabrica_en(honda_civic, [japon, estados_unidos, canada]).
fabrica_en(ford_mustang, [estados_unidos]).
fabrica_en(bmw_x3, [alemania, estados_unidos]).
fabrica_en(mercedes_c_class, [alemania, sudafrica]).
fabrica_en(ferrari_488, [italia]).
fabrica_en(lamborghini_huracan, [italia]).
fabrica_en(bugatti_chiron, [francia]).

% Potencia en caballos de fuerza
potencia(toyota_corolla, 169).
potencia(honda_civic, 158).
potencia(ford_mustang, 450).
potencia(bmw_x3, 248).
potencia(mercedes_c_class, 255).
potencia(ferrari_488, 661).
potencia(lamborghini_huracan, 631).
potencia(bugatti_chiron, 1479).

% Tipo de motor
motor(toyota_corolla, 'motor 4 cilindros 2.0L').
motor(honda_civic, 'motor 4 cilindros 1.5L turbo').
motor(ford_mustang, 'motor V8 5.0L').
motor(bmw_x3, 'motor 4 cilindros 2.0L turbo').
motor(mercedes_c_class, 'motor 4 cilindros 2.0L turbo').
motor(ferrari_488, 'motor V8 3.9L biturbo').
motor(lamborghini_huracan, 'motor V10 5.2L').
motor(bugatti_chiron, 'motor W16 8.0L quad-turbo').

% Consumo de combustible (km por litro)
consumo(toyota_corolla, 15).
consumo(honda_civic, 16).
consumo(ford_mustang, 8).
consumo(bmw_x3, 12).
consumo(mercedes_c_class, 13).
consumo(ferrari_488, 6).
consumo(lamborghini_huracan, 7).
consumo(bugatti_chiron, 4).

% Calificación de seguridad (sobre 5 estrellas)
seguridad(toyota_corolla, 5).
seguridad(honda_civic, 5).
seguridad(ford_mustang, 4).
seguridad(bmw_x3, 5).
seguridad(mercedes_c_class, 5).
seguridad(ferrari_488, 4).
seguridad(lamborghini_huracan, 4).
seguridad(bugatti_chiron, 4).

% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).

% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

% Match
match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
    atom(S), % si I es un s(X) devuelve falso
    S == I,
    match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
    \+atom(S),
    match(Stim, Input),!.

% Extrae solo los síntomas válidos
extraer_sintomas([], []).
extraer_sintomas([Token | Resto], [Token | SintomasResto]) :-
    sintomade(Token, _),
    extraer_sintomas(Resto, SintomasResto).
extraer_sintomas([_ | Resto], SintomasResto) :-
    extraer_sintomas(Resto, SintomasResto).

% Quitar duplicados
sin_repetidos(Lista, Unica) :- list_to_set(Lista, Unica).

% ===== TODAS LAS CLAUSES DE replace0/5 ESTÁN AQUÍ JUNTAS =====

% CARROS (reemplaza la sección de fútbol)
replace0([], _, _, [flagCarros, mejor_marca], R) :-
    mejor_marca(Marca),
    R = [la, mejor, marca, de, carros, es, Marca].

replace0([], _, _, [flagCarros, mas_rapido], R) :-
    carro_mas_rapido(Carro),
    R = [el, carro, mas, rapido, del, mundo, es, el, Carro].

replace0([I], Input, _, [flagCarros, precio], R) :-
    nth0(I, Input, Carro),
    (precio(Carro, Precio) ->
        R = [el, Carro, cuesta, aproximadamente, Precio, mil, dolares];
        R = [no, tengo, informacion, del, precio, del, Carro]).

replace0([I], Input, _, [flagCarros, fabrica], R) :-
    nth0(I, Input, Carro),
    (fabrica_en(Carro, Lugares) ->
        R = [el, Carro, se, fabrica, en | Lugares];
        R = [no, se, donde, se, fabrica, el, Carro]).

replace0([I], Input, _, [flagCarros, potencia], R) :-
    nth0(I, Input, Carro),
    (potencia(Carro, HP) ->
        R = [el, Carro, tiene, HP, caballos, de, fuerza];
        R = [no, tengo, informacion, de, la, potencia, del, Carro]).

replace0([I], Input, _, [flagCarros, motor], R) :-
    nth0(I, Input, Carro),
    (motor(Carro, TipoMotor) ->
        R = [el, Carro, tiene, TipoMotor];
        R = [no, tengo, informacion, del, motor, del, Carro]).

replace0([I], Input, _, [flagCarros, consumo], R) :-
    nth0(I, Input, Carro),
    (consumo(Carro, KmL) ->
        R = [el, Carro, consume, aproximadamente, KmL, km, por, litro];
        R = [no, tengo, informacion, del, consumo, del, Carro]).

replace0([I], Input, _, [flagCarros, seguridad], R) :-
    nth0(I, Input, Carro),
    (seguridad(Carro, Estrellas) ->
        R = [el, Carro, tiene, una, calificacion, de, seguridad, de, Estrellas, estrellas];
        R = [no, tengo, informacion, de, seguridad, del, Carro]).

% Diagnóstico acumulando síntomas
replace0(_, Input, _, [flagDiagnostico], Respuesta) :-
    nb_getval(eliza_estado, EstadoPrevio),
    extraer_sintomas(Input, SintomasNuevos),
    append(SintomasNuevos, EstadoPrevio, TodosSintomas),
    sin_repetidos(TodosSintomas, SintomasAcumulados),
    length(SintomasAcumulados, N),
    (
        N >= 3 ->
            findall(Enfermedad, (
                enfermedad(Enfermedad),
                forall(member(S, SintomasAcumulados), sintomade(S, Enfermedad))
            ), Enfermedades),
            (Enfermedades \= [] ->
                Respuesta = [segun, los, sintomas, proporcionados, podrias, tener | Enfermedades]
            ;
                Respuesta = [no, tengo, suficiente, informacion, para, darte, un, diagnostico]
            )
    ;
        Faltan is 3 - N,
        Respuesta = [necesito, Faltan, sintomas, mas, para, darte, un, posible, diagnostico]
    ),
    nb_setval(eliza_estado, SintomasAcumulados).

% flagSintoma
replace0([I], Input, _, [flagSintoma], R) :-
    nth0(I, Input, Enfermedad),
    findall(S, sintomade(S, Enfermedad), Sintomas),
    (Sintomas \= [] ->
        R = [los, sintomas, de, Enfermedad, son | Sintomas];
        R = [no, tengo, sintomas, para, Enfermedad]).

% flagMedicina
replace0([I], Input, _, [flagMedicina], R) :-
    nth0(I, Input, Enfermedad),
    findall(M, medicinade(M, Enfermedad), Medicinas),
    (Medicinas \= [] ->
        R = [para, Enfermedad, puedes, usar | Medicinas];
        R = [no, tengo, informacion, de, medicamentos, para, Enfermedad]).

% flagCausa
replace0([I], Input, _, [flagCausa], R) :-
    nth0(I, Input, Enfermedad),
    findall(C, causade(C, Enfermedad), Causas),
    (Causas \= [] ->
        R = [las, causas, de, Enfermedad, son | Causas];
        R = [no, conozco, las, causas, de, Enfermedad]).

% flagLugar
replace0([I], Input, _, [flagLugar], R) :-
    nth0(I, Input, Enfermedad),
    lugarde(Enfermedad, Lugares),
    (Lugares \= [] ->
        R = [la, Enfermedad, se, da | Lugares];
        R = [no, tengo, informacion, sobre, donde, ocurre, la, Enfermedad]).

% flagPaises
replace0([I], Input, _, [flagPaises], R) :-
    nth0(I, Input, Enfermedad),
    paisafectadopor(Enfermedad, Paises),
    R = [los, paises, mas, afectados, por, Enfermedad, son | Paises].

% flagMedicinas
replace0([I], Input, _, [flagMedicinas], R) :-
    nth0(I, Input, Enfermedad),
    medicamento(Enfermedad, Medicinas),
    R = [los, medicamentos, que, puedes, tomar, para, la, Enfermedad, son | Medicinas].

% ===== REPLACE0 MEJORADO PARA FAMILIA =====

% Relaciones básicas (hijo/hija)
replace0([I1, I2], Input, _, [flagFamilia, hijo], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((padrede(B, A); madrede(B, A)) -> 
        R = [si, A, es, hijo, de, B];
        R = [no, A, no, es, hijo, de, B]).

% Padre
replace0([I1, I2], Input, _, [flagFamilia, padre], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    (padrede(A, B) -> 
        R = [si, A, es, padre, de, B];
        R = [no, A, no, es, padre, de, B]).

% Madre
replace0([I1, I2], Input, _, [flagFamilia, madre], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    (madrede(A, B) -> 
        R = [si, A, es, madre, de, B];
        R = [no, A, no, es, madre, de, B]).

% Hermano/Hermana
replace0([I1, I2], Input, _, [flagFamilia, hermano], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((hermano(A, B); hermana(A, B)) -> 
        R = [si, A, y, B, son, hermanos];
        R = [no, A, y, B, no, son, hermanos]).

% Abuelo/Abuela
replace0([I1, I2], Input, _, [flagFamilia, abuelo], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((abuelo(A, B); abuela(A, B)) -> 
        R = [si, A, es, abuelo, de, B];
        R = [no, A, no, es, abuelo, de, B]).

% Tío/Tía
replace0([I1, I2], Input, _, [flagFamilia, tio], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((tio(A, B); tia(A, B)) -> 
        R = [si, A, es, tio, de, B];
        R = [no, A, no, es, tio, de, B]).

% Primo/Prima
replace0([I1, I2], Input, _, [flagFamilia, primo], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((primo(A, B); prima(A, B)) -> 
        R = [si, A, y, B, son, primos];
        R = [no, A, y, B, no, son, primos]).

% Nieto/Nieta
replace0([I1, I2], Input, _, [flagFamilia, nieto], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((nieto(A, B); nieta(A, B)) -> 
        R = [si, A, es, nieto, de, B];
        R = [no, A, no, es, nieto, de, B]).

% Sobrino/Sobrina
replace0([I1, I2], Input, _, [flagFamilia, sobrino], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((sobrino(A, B); sobrina(A, B)) -> 
        R = [si, A, es, sobrino, de, B];
        R = [no, A, no, es, sobrino, de, B]).

% Esposo/Esposa
replace0([I1, I2], Input, _, [flagFamilia, esposo], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((esposo(A, B); esposa(A, B)) -> 
        R = [si, A, y, B, estan, casados];
        R = [no, A, y, B, no, estan, casados]).

% Cuñado/Cuñada
replace0([I1, I2], Input, _, [flagFamilia, cunado], R) :-
    nth0(I1, Input, A), nth0(I2, Input, B),
    ((cunado(A, B); cunada(A, B)) -> 
        R = [si, A, es, cunado, de, B];
        R = [no, A, no, es, cunado, de, B]).

% Consultas de "quién es"
replace0([I], Input, _, [flagFamilia, quien_padre], R) :-
    nth0(I, Input, Persona),
    (padrede(Padre, Persona) -> 
        R = [el, padre, de, Persona, es, Padre];
        R = [no, se, quien, es, el, padre, de, Persona]).

replace0([I], Input, _, [flagFamilia, quien_madre], R) :-
    nth0(I, Input, Persona),
    (madrede(Madre, Persona) -> 
        R = [la, madre, de, Persona, es, Madre];
        R = [no, se, quien, es, la, madre, de, Persona]).

replace0([I], Input, _, [flagFamilia, quien_hijos], R) :-
    nth0(I, Input, Persona),
    todos_los_hijos(Persona, Hijos),
    (Hijos \= [] -> 
        R = [los, hijos, de, Persona, son | Hijos];
        R = [Persona, no, tiene, hijos]).

replace0([I], Input, _, [flagFamilia, quien_hermanos], R) :-
    nth0(I, Input, Persona),
    todos_los_hermanos(Persona, Hermanos),
    (Hermanos \= [] -> 
        R = [los, hermanos, de, Persona, son | Hermanos];
        R = [Persona, no, tiene, hermanos]).

replace0([I], Input, _, [flagFamilia, quien_abuelos], R) :-
    nth0(I, Input, Persona),
    findall(A, (abuelo(A, Persona); abuela(A, Persona)), Abuelos),
    (Abuelos \= [] -> 
        R = [los, abuelos, de, Persona, son | Abuelos];
        R = [no, conozco, los, abuelos, de, Persona]).

% Consultas de cantidad
replace0([I], Input, _, [flagFamilia, cuantos_hijos], R) :-
    nth0(I, Input, Persona),
    contar_hijos(Persona, Cantidad),
    R = [Persona, tiene, Cantidad, hijos].

replace0([I], Input, _, [flagFamilia, cuantos_hermanos], R) :-
    nth0(I, Input, Persona),
    contar_hermanos(Persona, Cantidad),
    R = [Persona, tiene, Cantidad, hermanos].

    % Eliza likes:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
    elizaIs(Atom, R).

% Replace general
replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R),!.

% Caso base
replace0([], _, _, Resp, Resp) :- !.