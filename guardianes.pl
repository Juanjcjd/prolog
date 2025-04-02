% Guardianes (predicados monarios)
guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

% Templos (predicados monarios)
templo(fuego).
templo(agua).
templo(tierra).
templo(aire).

% Relación binaria: qué templo puede custodiar cada guardián (según restricciones)
puede_custodiar(apolo, agua).
puede_custodiar(apolo, aire).    % Apolo no cuida fuego ni tierra

puede_custodiar(hecate, fuego).
puede_custodiar(hecate, agua).
puede_custodiar(hecate, tierra). % Hécate no cuida aire

puede_custodiar(ares, fuego).
puede_custodiar(ares, tierra).   % Ares no cuida agua ni aire

puede_custodiar(hermes, fuego).
puede_custodiar(hermes, agua).   % Hermes cuida fuego o agua

% Unificación: asignar templos a guardianes asegurando que sean diferentes
solucion(Apolo, Hecate, Ares, Hermes) :-
    puede_custodiar(apolo, Apolo),
    puede_custodiar(hecate, Hecate),
    puede_custodiar(ares, Ares),
    puede_custodiar(hermes, Hermes),

    % Asegurar que cada guardián tenga un templo distinto
    Apolo \= Hecate, Apolo \= Ares, Apolo \= Hermes,
    Hecate \= Ares, Hecate \= Hermes,
    Ares \= Hermes.
