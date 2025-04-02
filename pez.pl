resolver(DuenoDelPez) :-
    % Definimos las casas
    Casas = [[rojo, britanico, _, _, _],
             [verde, _, cafe, _, _],
             [blanca, _, _, _, _],
             [amarilla, _, _, dunhill, _],
             [_, sueco, _, _, perro],
             [_, danes, te, _, _],
             [_, noruego, _, _, _],
             [_, _, leche, _, _],
             [_, _, _, prince, _],
             [_, _, _, pallmall, pajaro],
             [_, _, _, blens, gato],
             [_, _, _, blens, agua],
             [_, _, _, dunhill, caballo],
             [_, _, _, bluemaster, cerveza]],

    % Aplicamos las pistas
    member([rojo, britanico, _, _, _], Casas),
    member([_, sueco, _, _, perro], Casas),
    member([_, danes, te, _, _], Casas),
    member([_, noruego, _, _, _], Casas),
    member([_, aleman, _, prince, _], Casas),
    nextto([verde, _, _, _, _], [blanca, _, _, _, _], Casas),
    member([verde, _, cafe, _, _], Casas),
    member([_, _, _, pallmall, pajaro], Casas),
    member([amarilla, _, _, dunhill, _], Casas),
    member([_, _, leche, _, _], Casas),
    nextto([_, _, _, blens, _], [_, _, _, _, gato], Casas),
    nextto([_, _, _, _, caballo], [_, _, _, dunhill, _], Casas),
    member([_, _, _, bluemaster, cerveza], Casas),
    nextto([_, _, _, blens, _], [_, _, _, _, agua], Casas),
    member([_, _, _, _, pez], Casas),

    % Encontramos el dueño del pez
    member([DuenoDelPez, _, _, _, pez], Casas).
