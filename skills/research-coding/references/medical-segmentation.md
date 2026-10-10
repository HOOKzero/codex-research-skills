# Medical Image Segmentation — load only for relevant image/volume tasks

## Data and privacy contracts

- Check data access authorization, de-identification and whether outputs may leave the local environment. Do not upload patient-level data, IDs, raw slices, or protected metadata to external services without proper authorization.
- Respect patient/subject/site separation when creating splits. Multiple slices, crops or visits from one patient must not cross train/test boundaries unintentionally.
- Track 2D vs 2.5D vs 3D inference, spacing, orientation, resampling, modality/channel conventions, voxel anisotropy and crop/reconstruction logic.

## Label/mask contracts

- Fix foreground and background class IDs, label-map versions, ignore index, absent-organ conventions, multi-label vs mutually exclusive softmax behavior, small-structure sampling and handling of unlabeled organs.
- Use visual overlays for representative cases; check empty masks, missing labels, inverse transforms, connected components and post-processing. A good aggregate metric can hide failures for small structures.

## Metrics and validation

- Specify Dice/IoU reduction: per-case vs global, macro vs class-weighted, background included/excluded, empty-ground-truth + empty-prediction policy.
- If using HD95/surface Dice, record physical spacing and surface distance definition. Thresholds and post-processing must be chosen using permitted validation data, not tuned on test data.
- Report per-organ and per-case performance, failures and uncertainty where feasible. Ensure inference path reproduces full-size/original-space masks, not only resized training crops.

## Foundation models and supervision

- Track exact SAM/SAM2/SAM3/CLIP checkpoint origin and version. Identify which encoder/decoder components were frozen or fine-tuned and where prompts came from.
- For text-only/weak supervision claims, audit every training signal and derived proposal; never silently use test masks or pixel annotation to optimize a claimed pure-text method.
- For organ-level competition, prototype methods and special losses, verify gradient paths, negative/absent-class behavior, class imbalance, and stability on cases without particular organs.

Project-specific immutable vendor directories and checkpoint paths belong in the project's `AGENTS.md`, not this shared reference.
