---
name: research-coding
description: Use for implementing, debugging, training, evaluating, or comparing ML and deep-learning experiments, especially PyTorch, computer vision, and medical segmentation. Protect baselines, enforce fair comparison and run provenance, gate expensive compute, and match verification to scientific claims. Not for general repo search or paper-only reading.
metadata:
  version: "1.0.0"
---

# Research Coding

A runnable model is not a validated research result. Separate **implementation**, **pilot evidence**, **formal evaluation**, and **scientific conclusion**.

## Experiment Gate

Before changing an experiment, identify: question/hypothesis, reference baseline, intended single change, dataset/split, evaluation metric and aggregation, resource budget, and success/failure criteria. If uncertain, state the gap; do not invent prior results. For comparisons or ablations, read `references/experiment-integrity.md` only when needed.

## Baseline and Implementation Integrity

Keep official/vendor code, baseline configs, evaluated checkpoints, and frozen results unchanged unless explicitly authorized. Make experimental changes isolated and reversible; record deviations from the baseline. Preserve tensor shapes, loss semantics, preprocessing, class mapping, and train/validation behavior. Follow project-level `AGENTS.md` for protected paths and environments.

## Verification Ladder

1. **Static:** config/import/shape/class and data contract checks.
2. **Local:** deterministic unit test; loss finite; gradient flows where intended.
3. **Pilot:** few batches/short run; inspect qualitative masks and basic metrics.
4. **Formal:** approved full training/evaluation with fixed protocol and run provenance.
5. **Claim:** fair baseline comparison, adequate seeds/uncertainty and independent metric checks as warranted.

Do not promote a lower-level PASS into a higher-level claim. Before costly new GPU runs, establish expected device, duration/budget, checkpoint and output location, and user authorization; do not launch an unrequested full run. For training failures consult `references/training-debugging.md`; for medical image segmentation consult `references/medical-segmentation.md`.

## Provenance and Evidence

For claim-bearing runs, save a compact manifest alongside outputs: code state/commit (or snapshot), resolved config, dataset/split version, initialization checkpoint, seed(s), environment, run command, metrics, validation protocol, and status. Use `assets/run-manifest.template.json` as an optional starting point. Respect patient-data privacy and external-transfer restrictions.

Mark states distinctly: `NOT_RUN`, `SMOKE_PASSED`, `PILOT_ONLY`, `FULL_RUN_COMPLETE`, `INDEPENDENTLY_VERIFIED`, or `INCONCLUSIVE`. Never fabricate scores, speedups, significance, or SOTA claims. Report observed facts separately from hypotheses and proposed actions.