# Reproduction Verification — load for reporting or auditing a paper claim

## Distinct verification levels

1. **Code/contract:** correct interfaces, shapes, invariants and testable equations.
2. **Mechanical:** raw run coverage, seeds, actual configs, data integrity, metric aggregation, checkpoint selection and results can be recomputed independently.
3. **Protocol fidelity:** compare training, data, initialization, preprocessing, hyperparameters, compute and evaluation against the original paper and official repo. List deviations and unreported fields.
4. **Scientific claim:** evidence is sufficient for the claimed model, dataset, metric, effect and uncertainty; fairness and statistical variation considered.

Passing (2) does **not** automatically imply (3) or (4).

## Audit independence

Where possible use a fresh context or separate code path for independent metric recomputation, reading raw outputs and frozen protocol before executor's summary. Check: run completeness, patient/group leakage, seeds, label definitions, NaN/Inf, metric denominators, data-processing changes, checkpoint selection, early stopping, postprocessing and hidden manual exclusions.

Do not modify raw evidence to make a check pass. If results conflict, preserve both versions and identify the smallest test that explains the difference.

## Claim language

- `METHOD_IMPLEMENTED`: relevant code exists, no full evaluation implied.
- `MECHANICALLY_VERIFIED`: specified implementation or raw computations passed reproducible checks.
- `PARTIAL_REPRODUCTION`: reduced scope or substituted components; identify each gap.
- `REPRODUCED_WITHIN_SCOPE`: supported claim with documented comparability, evidence and limitations.
- `INCONCLUSIVE`: missing/ambiguous evidence or unresolved protocol conflict.

Report paper claim and source, measured results (never fabricated), comparison tolerance if pre-specified, what checks truly passed, outstanding gaps, adaptations, and a rerun command. Do not call the original paper false simply because one independent run differs.
