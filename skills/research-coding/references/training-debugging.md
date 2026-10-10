# Training Debugging — load only when diagnosing runs or GPU efficiency

## Lowest-cost diagnostic order

1. **Data:** verify files, split IDs, samples, target/label distribution, shape, dtype, spacing/orientation, data loader transforms and visual overlays. Check foreground counts and rare-class coverage.
2. **Model:** confirm checkpoint actually loaded, trainable/frozen parameters, feature/decoder interfaces, normalization modes, output shape, class logits and meaningful predictions.
3. **Loss & gradients:** verify loss terms separately, finite values, absent-class handling, reduction scaling, nonzero gradient on intended params, no unintended detach, loss masking, AMP overflow or accidental freezing.
4. **Optimization:** inspect LR schedule, optimizer state, gradient accumulation, effective batch size, clipping, weight decay, class sampling, train/eval mode, seed variation.
5. **Evaluation:** confirm the same preprocessing and metric rules are applied across compared runs; inspect per-class/case metrics rather than aggregate only; look for leakage and wrong checkpoint selection.
6. **Systems:** check VRAM, dataloader stalls, CPU/I/O bottlenecks, GPU utilization, NaN/Inf, CUDA/library compatibility. Profile a representative step before performance rewrites.

Debug symptom by evidence: `OOM` -> peak allocations, shapes, batch/precision/checkpointing; `NaN` -> first nonfinite tensor/loss term + AMP; declining Dice -> label/data changes, checkpoint loading, loss and evaluator; slow throughput -> timed pipeline stages. Change one hypothesis at a time and recheck the original failure.

## Compute escalation

Prefer static check → one batch forward/backward → tiny deterministic subset → short pilot → formal experiment, stopping early when a cheaper stage disproves the hypothesis. A small pilot **does not** establish convergence or publication-grade performance. Confirm authorization before a new long or costly GPU run; if the user has explicitly requested and scoped it, follow that authorization without redundant interruptions.

## Output hygiene

Keep raw training output in files with a stable path. In the conversation, carry only the first relevant error, last relevant diagnostic metrics, command/config, checkpoint path and the inference supported by evidence. Do not delete failed-run artifacts needed for diagnosis or audit without permission.
