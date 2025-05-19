:- discontiguous template/3.

start :-
    writeln('Hola , mi nombre es Eliza tu chatbot,'),
    writeln('por favor ingresa tu consulta,'),
    writeln('usar solo minúsculas sin . al final:'),
    readln(Input),
    eliza(Input).

eliza:- 
    start.

eliza(Input):- ( Input == ['adios']
            ; Input == ['adios', '.']
            ; Input == ['chao']
            ; Input == ['chao', '.']
            ; Input == ['hasta', 'luego']
            ; Input == ['hasta', 'luego', '.']
            ; Input == ['nos', 'vemos']
            ; Input == ['nos', 'vemos', '.']
            ; Input == ['me', 'voy']
            ; Input == ['me', 'voy', '.']
            ; Input == ['que', 'te', 'vaya', 'bien']
            ; Input == ['que', 'te', 'vaya', 'bien', '.']
            ; Input == ['hasta', 'pronto']
            ; Input == ['hasta', 'pronto', '.']
            ; Input == ['nos', 'hablamos']
            ; Input == ['nos', 'hablamos', '.']
            ; Input == ['adiosito']
            ; Input == ['adiosito', '.']
            ; Input == ['cuídate']
            ; Input == ['cuídate', '.']
            ) ->
    despedida_random(R),
    writeln(R), !
    ;
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

% Plantillas de saludos (15 ejemplos)
template([hola], Resp, []) :- saludo_random(Resp).
template([hola, '.'], Resp, []) :- saludo_random(Resp).
template([buenos, 'días'], Resp, []) :- saludo_random(Resp).
template([buenos, 'días', '.'], Resp, []) :- saludo_random(Resp).
template([buenas, 'tardes'], Resp, []) :- saludo_random(Resp).
template([buenas, 'tardes', '.'], Resp, []) :- saludo_random(Resp).
template([buenas, 'noches'], Resp, []) :- saludo_random(Resp).
template([buenas, 'noches', '.'], Resp, []) :- saludo_random(Resp).
template([qué, tal], Resp, []) :- saludo_random(Resp).
template([qué, tal, '.'], Resp, []) :- saludo_random(Resp).
template([cómo, estás], Resp, []) :- saludo_random(Resp).
template([cómo, estás, '.'], Resp, []) :- saludo_random(Resp).
template([holi], Resp, []) :- saludo_random(Resp).
template([holi, '.'], Resp, []) :- saludo_random(Resp).
template([hey], Resp, []) :- saludo_random(Resp).

% Plantillas generales previas que ya tenías (ejemplos)
template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, '¿Cómo', estás, tú, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['Buen', 'día', '¿Cómo', estás, tú, 0, '?'], [4]).
template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, '¿Cómo', estás, tú, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buen', 'día', '¿Cómo', estás, tú, 0, '?'], [5]).
template([hola, _], ['Hola', '¿cómo', estás, tú, '?'], []).
template([buendia, _], ['Buen', 'día', '¿Cómo', estás, tú, '?'], []).

template([yo, s(_), yo, soy, s(_), '.'], ['¿Por qué', 0, 'eres', 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], ['Why', 'do', 'you', 0, 'me', '?'], [1]).
template([yo, soy, s(_), '.'], ['¿Por qué', 'eres', 'tú', 0, '?'], [2]).

template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

template([tu, eres, s(_), _], [flagDo], [2]).
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], ['Yo', 'estoy', 'bien', ',', 'gracias', 'por', 'preguntar', '.'], []).

template([yo, pienso, que, _], ['Bueno, esa es tu opinión'], []).
template([porque, _], ['Esa no es una buena razón.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', 'have', 'to', 'deal', 'with', 'your', 0, 'and', 'your', 1, 'in', 'a', 'mature', 'way', '.'], [2, 4]).
template([i, s(_),  _], ['I', 'can', 'recommend', 'you', 'a', 'book', 'about', 'that', 'issue'], []).
template([please, s(_), _], ['No', 'I', 'can', 'not', 'help', ',', 'I', 'am', 'just', 'a', 'machine'], []). 
template([tell, me, a, s(_), _], ['No', 'I', 'can', 'not', ',', 'I', 'am', 'bad', 'at', 'that'], []).

template(_, ['Por favor, explica un poco más.'], []).

% Respuestas para saludos (15)
saludo_random(['Hola, ¿en qué puedo ayudarte?']).
saludo_random(['¡Hola! ¿Cómo estás?']).
saludo_random(['¡Buen día! ¿Qué tal?']).
saludo_random(['¡Hola! ¿Qué tal tu día?']).
saludo_random(['¡Hola! Estoy aquí para ayudarte.']).
saludo_random(['¡Hola! ¿En qué puedo asistirte hoy?']).
saludo_random(['¡Hola! ¿Cómo te sientes hoy?']).
saludo_random(['Hola, un placer saludarte.']).
saludo_random(['¡Hey! ¿Qué necesitas?']).
saludo_random(['Hola, dime cómo puedo ayudarte.']).
saludo_random(['¡Hola! ¿Qué te gustaría saber?']).
saludo_random(['¡Hola! ¿Quieres charlar?']).
saludo_random(['Hola, ¿qué tal?']).
saludo_random(['¡Hola! ¿Cómo va todo?']).
saludo_random(['Hola, espero que estés bien.']).

% Respuestas para despedidas (15)
despedida_random(['Adiós. Espero poder verte ayudado.']).
despedida_random(['Hasta luego. ¡Cuídate!']).
despedida_random(['Nos vemos pronto.']).
despedida_random(['Chao, que tengas un buen día.']).
despedida_random(['Hasta la próxima.']).
despedida_random(['Cuídate mucho.']).
despedida_random(['Nos hablamos luego.']).
despedida_random(['Adiós, fue un gusto ayudarte.']).
despedida_random(['Que te vaya bien.']).
despedida_random(['Hasta pronto, vuelve cuando quieras.']).
despedida_random(['Me alegra haberte ayudado, adiós.']).
despedida_random(['Cuídate, nos vemos.']).
despedida_random(['Hasta luego, que estés bien.']).
despedida_random(['Adiós, espero que vuelvas pronto.']).
despedida_random(['Chao, que tengas un excelente día.']).

% Reglas para likes
elizaLikes(X, R):- likes(X), R = ['Sí, me gustan', X].
elizaLikes(X, R):- \+likes(X), R = ['No, no me gustan', X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
likes(carros).

% Reglas para does
elizaDoes(X, R):- does(X), R = ['Sí, yo', X, 'y me encanta.'].
elizaDoes(X, R):- \+does(X), R = ['No, no', X, '. Es muy difícil para mí.'].
does(study).
does(cook).
does(work).

% Reglas para is
elizaIs(X, R):- is0(X), R = ['Sí, yo soy', X].
elizaIs(X, R):- \+is0(X), R = ['No, no soy', X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

% Coincidencia
match([], []).
match([], _) :- true.
match([S|Stim], [I|Input]) :-
    atom(S),
    S == I,
    match(Stim, Input), !.
match([S|Stim], [_|Input]) :-
    \+atom(S),
    match(Stim, Input), !.

% Reemplazo para respuestas con variables
replace0([], _, _, Resp, R):- append(Resp, [], R), !.

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    elizaLikes(Atom, R).

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    elizaDoes(Atom, R).

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
    elizaIs(Atom, R).

replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1),
    append(R1, [], R), !.

replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R), !.
