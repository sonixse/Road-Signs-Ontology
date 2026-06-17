# Road Signs Knowledge Representation Project

This repository contains the complete deliverables for the Road Signs Ontology project, integrating the Vienna Convention, the Mapillary dataset (MTSD), and advanced probabilistic reasoning.

---

## Fast Navigation

### Core Deliverables (Start Here)
* **`Record Ontology Project.pdf`**: The comprehensive final report explaining the methodology, taxonomy, and reasoning.
* **`final_ontology.owl`**: **The definitive, fully integrated ontology file.** Load this file directly for final evaluations.

### Development History (`/Session files`)
* `Session1` to `Session5_and_6`: The step-by-step Protégé files tracking the ontology's evolution and property additions.

### Advanced Reasoning (`/Probabilistic Ontologies`)
* **`BORN Plugin/`**: Contains ProbLog networks (`.pl`) and OWL files for probabilistic hazard detection (check the `updated/` folder).
* **`EL++ Files/`**: Sub-ontologies specifically constrained to the EL++ profile for efficient reasoning.

### Scripts & Extras (`/Extra Files`)
* **`cq_runner.py`**: Python script to automatically test Competency Questions (CQs) using Owlready2.
* **`Session 2 Files/`**: Dataset processing scripts (`extract_labels.py`) and the extracted labels (`MTSD_labels.txt`).
* **`Session 1 Taxonomy/`**: High-resolution diagrams (`.png`) of the class hierarchies and color taxonomies.
* **`Resources/mtsd_v2_fully_annotated/`**: MSTD Dataset was downloaded from https://www.mapillary.com/dataset/trafficsign (../images/ contains only the ones in the final report)

### Visualizations (`/Dangerous Traffic Signs`)
* `dangerous-signs.html`: Interactive visual data explorer.
* `images/`: Images to see the road signs rendered.

---

## How to Test the Ontology
To evaluate the logical queries (e.g., retrieving signs by shape, color, or classification):

1. Open `Extra Files/cq_runner.py`.
2. Set the `ONTOLOGY_PATH` variable to point to **`final_ontology.owl`** located in the root directory.
3. Execute the script in your terminal to see the reasoner's inferred results.

---

## Authors

Kacper Kotowski, Miriam Morales, Sonia Serra Grivina
