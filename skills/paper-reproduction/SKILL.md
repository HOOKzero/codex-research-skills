---
name: paper-reproduction
description: Use to faithfully implement or reproduce a research paper's method, from source-version and claim extraction through equation-to-code mapping, reproducibility protocol, staged tests, and independent evidence audit. Not for generic coding, literature summaries alone, or automatically claiming paper-level reproduction from a smoke test.
metadata:
  version: "1.0.0"
---

# Paper Reproduction

Distinguish **understanding**, **core implementation**, **official rerun**, **independent reproduction**, and **benchmark/claim validation**. State the requested scope first; do not silently equate them.

## 1. Pin the Source and Claims

Record paper title/DOI/arXiv version, relevant method/appendix/equations, official repository commit if available, and the precise claims being tested. Source claims from the actual paper/code; mark unresolved or inaccessible details explicitly. Do not implement from the abstract alone.

## 2. Map Mechanism to Code

Describe in one sentence: **what entity/transformation changes, where in this codebase it acts, and what invariant/output it should produce**. Build a short equation/pseudocode → code module/function → test mapping. For formal extraction use `references/method-extraction.md` only when needed.

## 3. Freeze a Comparable Protocol

Before claim-bearing experiments, define data/split, initialization, preprocessing, losses, hyperparameters, seeds, compute budget, checkpoint selection, exact metrics, expected tolerances and known paper/code ambiguities. Separate faithful replication from adapted implementations; no silent substitutions.

## 4. Implement and Validate in Stages

Use minimal mathematical/shape/gradient/property tests first, then smoke or pilot. Only perform full training/evaluation when within user authorization and budget; use `research-coding` for training execution and run provenance. Keep original code and baseline outputs protected unless authorized otherwise.

## 5. Audit Claim Scope

Recompute key metrics from retained raw evidence when possible, preferably using an independent path. A `PASS` from an internal helper is not independent scientific validation. Use `references/reproduction-verification.md` when assessing a claim. Label outcome precisely: `METHOD_IMPLEMENTED`, `MECHANICALLY_VERIFIED`, `PARTIAL_REPRODUCTION`, `REPRODUCED_WITHIN_SCOPE`, or `INCONCLUSIVE`. Never fill gaps with imagined experiments.

## Deliverables

For substantive reproductions, keep a concise **method map**, **frozen protocol/deviations**, **verification evidence**, and **gap list**, reusing existing project artifacts rather than generating duplicated reports. A paper-level conclusion requires evidence beyond runnable code.
