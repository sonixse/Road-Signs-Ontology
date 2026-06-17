# BEL / BORN: Road Hazard & Contextual Sign Classification

This project implements a Bayesian ontology in the sense of BEL to classify road hazards and determine the required road sign features based on geographic context. It uses an OWL 2 EL ontology with subclass axioms annotated by propositional literals, coupled with a Bayesian network defined over those literals written in ProbLog syntax.

## Files

* `road_hazard.owl`: OWL 2 EL ontology in functional syntax, containing both hazard logic and contextual sign requirements.
* `road_hazard_bn.pl`: Bayesian network in ProbLog syntax, defining priors and conditional dependencies for both hazards ($x_0–x_5$) and geographic contexts.

## Derivation Logic

The system identifies hazardous conditions and determines high-risk areas using a probabilistic chain mapped through TBox axioms.

### 1. The Main Derivation

The following path defines how environmental conditions propagate into high-accident risk assessments:

```text
EnvironmentContext
  -> HazardousCondition                  [x0]
  -> exists hasCondition.Ice             [x0]
  -> IcyRoadCase                         [x2]

EnvironmentContext
  -> HazardousCondition                  [x0]
  -> exists hasCondition.Snow            [x0]
  -> SnowyRoadCase                       [not x1]

IcyRoadCase and SnowyRoadCase
  -> SlipperyRoadCase                    [x3]

EnvironmentContext
  -> MountainousRoadCase                 [x4]

SlipperyRoadCase and MountainousRoadCase
  -> HighAccidentAreaCase                [x5]

```

# Probabilistic Query Types

## Scenario-Probability Query

A scenario-probability query that calculates the likelihood of a specific "slice" of reality occurring where all hazard variables are fixed. This represents the joint probability of the precise hazardous state defined in the derivation path below.

```text
x0 and not x1 and x2 and x3 and x4 and x5

```
Query: query(high_risk_scenario) (where high_risk_scenario :- x0, \+x1, x2, x3, x4, x5.)
Under the supplied Bayesian network this context has probability `0.016524`.

## Class-Membership Query (Probabilistic Subsumption)

A class-membership query that calculates the marginal probability (total risk) across all possible environments. It represents the degree of belief that an EnvironmentContext qualifies as a HighAccidentAreaCase.

This query is not tied to a single scenario; it is supported by the entire Bayesian Network state space. It aggregates the probability mass of all states where the accident risk criteria are met, weighted by the priors of variables ($x_0$ through $x_5$).

Query: sub('ont:HighAccidentAreaCase', 'ont:EnvironmentContext')
Under the supplied Bayesian network this context has probability `0.3706`.


