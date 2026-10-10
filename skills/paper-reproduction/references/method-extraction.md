# Method Extraction — load when translating a paper into code

## Primary-source checklist

- Pin the paper version (DOI/arXiv revision, supplement), repo commit, code release and any external baseline/tool dependencies.
- Read method, figures, equations, ablations and relevant appendix; if ambiguous, separate `PAPER_STATES`, `OFFICIAL_CODE_DOES`, `IMPLEMENTATION_CHOICE`, and `UNKNOWN`.
- Define each symbol and tensor: meaning, shape, units, normalization, source equation/algorithm step and data dependency.
- Capture the actual novelty: operation, scope, constraints, invariants, and expected behavior. An architectural illustration without explicit implementation details is not a complete specification.

## Compact mapping table

| Paper source | Exact mechanism/claim | Input/output shape | Implementation location | Test/invariant | Status |
| --- | --- | --- | --- | --- | --- |
| Eq. / Alg. / Section | ... | ... | ... | ... | PLANNED |

For every novelty-bearing change, identify where it hooks into existing preprocessing, encoder, decoder, postprocessing, prompt pipeline, loss, inference or evaluation. In greenfield work, define the smallest function/module API instead of an existing call site.

## Source inconsistencies

If paper prose, pseudocode, equations, appendix, and official repo disagree, surface the conflict and the chosen resolution with evidence. Do not normalize contradictory claims into a fictitious specification. Record controlled deviations separately from faithful implementations.

## Implementation tests

Prefer unit/property and gradient checks for formula-level components: shape/dtype, invariants, limiting cases, normalization, stability, finite differences when appropriate, behavior of no-positive/no-negative samples. These validate the mechanism, not end-to-end SOTA.
