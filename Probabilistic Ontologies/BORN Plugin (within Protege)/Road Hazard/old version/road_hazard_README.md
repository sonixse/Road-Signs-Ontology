# BEL / BORN Example: Road Hazard Classification

This example is a Bayesian ontology in the sense of BEL: an OWL 2 EL ontology
whose subclass axioms are annotated with single propositional literals, plus a
Bayesian network over those literals written in ProbLog syntax.

Files:

* `road_hazard.owl`: OWL 2 EL ontology in functional syntax.
* `road_hazard_bn.pl`: Bayesian network in ProbLog syntax.

The intended subsumption query is:

```prolog
query(sub('ont:EnvironmentContext', 'ont:HighAccidentAreaCase')).

```

The main derivation is:

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

Thus the query is supported in the context:

```text
x0 and not x1 and x2 and x3 and x4 and x5

```

Under the supplied Bayesian network this context has probability `0.0585`.
