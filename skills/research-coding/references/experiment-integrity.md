# Experiment Integrity — load for baselines, ablations, or comparisons

## Freeze the question

Record primary hypothesis, primary metric, intended improvement direction, baseline identity, fixed evaluation split, and the decision rule **before** seeing the test result. Different questions may justify additional metrics, but do not quietly replace the primary one after evaluation.

## Fairness matrix

| Item | Check |
| --- | --- |
| Training/evaluation data | Same dataset version; train/val/test cases and patient/group IDs separated; no leaked slices or derived views |
| Preprocessing | Same normalization, spacing/crop policy, label mapping, augmentation policy and image resolution unless this factor is being tested |
| Initialization | Same pretrained model/checkpoint or an explicitly declared exception |
| Compute/tuning | Same training steps/epochs, optimizer/LR schedule, effective batch size, precision, stopping/selection rules, hyperparameter search budget, and GPU accounting as relevant |
| Evaluation | Identical post-processing, class set, Dice/IoU/HD95 definitions, background and absent-class rules, aggregation and confidence thresholds |
| Stochasticity | Record seeds and run-to-run variation; avoid treating multiple slices from one patient as independent trials |
| Deviations | List each controlled difference and its intended attribution |

**Ablation rule:** vary one causal component at a time where feasible. If interactions matter, explicitly design factorial experiments. Ablations that change several factors must not attribute gains to a single component.

Use a fixed holdout for final claims. Report repeated-seed summaries and uncertainty when variability or claim strength requires it. Do not infer statistical significance from one run or a tiny numerical difference.

## Supervision claims

For weakly supervised, text-supervised, zero-shot or foundation-model claims, audit every supervision source: training labels, prompts, mask proposals, validation-driven choices, pseudo-labels, pretrained weights and tuning information. Describe the *effective* supervision, not just the name of the training loss. Never claim "pure text supervision" if pixel-level masks are used for parameter optimization without disclosing the exception.

## Report minimum for a comparison

Baseline ID, candidate ID, controlled differences, dataset/split version, metric definition, per-run evidence links, actual values, uncertainty if measured, threats to validity and whether the claim is `SUPPORTED`, `INCONCLUSIVE`, or `NOT_TESTED` in the declared scope.
