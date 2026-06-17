% Bayesian network for road-hazard.owl
% Syntax follows ProbLog for the BORN Reasoner
% ---------------------------------------------------------
% Suggested BORN probabilistic subsumption queries:
% ---------------------------------------------------------

% Marginal probability of a SlipperyRoadCase occurring within a US context.
% query(sub('ont:SlipperyRoadCase', 'ont:USContext')).

% Marginal probability of a SlipperyRoadCase occurring within a European context.
% query(sub('ont:SlipperyRoadCase', 'ont:EuropeanContext')).

% Degree of belief that a HighAccidentAreaCase is a probabilistic subset of the EnvironmentContext.
% query(sub('ont:HighAccidentAreaCase', 'ont:EnvironmentContext')).

% Logical assertion that EnvironmentContext is not a subclass of HighAccidentAreaCase (General root cannot be a subset of specific leaf).
% query(sub('ont:EnvironmentContext', 'ont:HighAccidentAreaCase')).

% Conditional probability that a SlipperyRoadCase results in a HighAccidentAreaCase.
% query(sub('ont:SlipperyRoadCase', 'ont:HighAccidentAreaCase')).

% Logical assertion that HighAccidentAreaCase is not a parent (subsumer) of SlipperyRoadCase.
% query(sub('ont:HighAccidentAreaCase', 'ont:SlipperyRoadCase')).

% ---------------------------------------------------------
% Context Priors
% ---------------------------------------------------------
% High likelihood of European context
0.89::european_union. 

% Conditional logic for Vienna Convention based on EU membership
0.28::vienna_convention :- \+european_union.
0.14::vienna_convention :- european_union.

% ---------------------------------------------------------
% Base Priors
% ---------------------------------------------------------
0.60::x0. % prior: winter season / hazardous baseline active
0.80::x4. % prior: road is in mountainous terrain

% ---------------------------------------------------------
% Conditional Dependencies
% ---------------------------------------------------------

% x1: Recently plowed or salted
0.85::x1 :- x0. 
0.10::x1 :- \+x0.

% x2: Ice observation is reliable
0.90::x2 :- x0.
0.40::x2 :- \+x0.

% x3: Slippery conditions are active 
0.95::x3 :- x2, x1.
0.30::x3 :- x2, \+x1.
0.20::x3 :- \+x2, x1.
0.05::x3 :- \+x2, \+x1.

% x5: High-accident warning active 
% Note: In our ontology, we use high_accident_area (x5)
0.85::x5 :- x3, x4. 

0.95::slippery_sign_triangle :- european_union.
0.05::slippery_sign_triangle :- \+european_union.

0.95::slippery_sign_diamond :- \+european_union.
0.05::slippery_sign_diamond :- european_union.

high_risk_scenario :- x0, \+x1, x2, x3, x4, x5.
