% Bayesian network for road-hazard.owl
% Syntax follows ProbLog for the BORN Reasoner

% Suggested BORN subsumption query:
% query(sub('ont:EnvironmentContext', 'ont:HighAccidentAreaCase')).

% ---------------------------------------------------------
% Base Priors
% ---------------------------------------------------------
0.60::x0. % prior: winter season / hazardous baseline active
0.80::x4. % prior: road is in mountainous terrain (High likelihood for alpine areas)

% ---------------------------------------------------------
% Conditional Dependencies
% ---------------------------------------------------------

% x1: Recently plowed or salted (depends on winter season)
% In harsh climates, winter preparation is often better funded/executed.
0.85::x1 :- x0. 
0.10::x1 :- \+x0.

% x2: Ice observation is reliable (depends on winter season)
% Assuming better sensor infrastructure in known hazard zones.
0.90::x2 :- x0.
0.40::x2 :- \+x0.

% x3: Slippery conditions are active 
% P(x_3 | x_0, x_2): Escalated risk factors given the environment.
0.95::x3 :- x0, x2.
0.60::x3 :- x0, \+x2.
0.50::x3 :- \+x0, x2.
0.10::x3 :- \+x0, \+x2.

% x5: High-accident warning active 
% P(x_5 | x_3, x_4): Warnings are triggered much more readily when slippery conditions meet mountain terrain.
0.95::x5 :- x3, x4.
0.75::x5 :- x3, \+x4.
0.60::x5 :- \+x3, x4.
0.10::x5 :- \+x3, \+x4.
