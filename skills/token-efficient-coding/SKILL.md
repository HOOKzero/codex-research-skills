---
name: token-efficient-coding
description: Keep coding and research repository work token-efficient by minimizing repeated discovery, unnecessary file reads, verbose tool outputs, and long-session context loss. Use for repo exploration, debugging, code edits, reviews, or continuing a session; pair with research-coding or paper-reproduction for domain rules.
metadata:
  version: "2.2.0"
---

# Token-Efficient Coding

Minimize **total tokens to a correct result**, not reasoning needed for correctness.

## Scope Gate

Small/local task: targeted search, minimal read/edit, sufficient focused verification.
Complex/research task: read all assumptions, interfaces, dependencies, and evidence needed; never trade scientific validity for shorter context.

## Recover Before Exploring

Prefer known paths, checkpoints, manifests, frozen artifacts, and reports; verify they are current. Then inspect `git status`/`git diff` if Git exists; otherwise use existing snapshots, hashes, and file metadata. Only then use scoped `rg`/symbol search and relevant line ranges. Expand scope only when evidence requires it. Do not repeatedly retry unavailable Git or reread unchanged files.

## Keep Outputs Lean

For large logs, listings, traces, or search results, redirect full output to retrievable files when practical. Keep file paths and extract the relevant errors, metrics, and ranges; narrow overly broad commands before repeating. Avoid pasting entire files, diffs, and resolved logs into the conversation.

## Work and Verify

Identify likely root cause or violated assumption before modifying. Make the smallest **justified** change; necessary structural fixes are allowed. Validate to the strength of the claim, not only the smallest possible smoke test. Never invent execution evidence.

## Handoff

At completed/frozen stages, major transitions, independent verification, or a long-session handoff, make a short checkpoint when permitted to write (otherwise provide it inline): `Goal / Frozen Results / Decisions / Files & Versions / Validation / Risks / Next Task`. Store near existing project reports; on resume confirm referenced artifacts are still current before exploring again.

## Response

Simple work: `Changed / Validated / Remaining`. Complex work: add only essential assumptions, result scope, evidence, reproducible paths/commands, and risks. Other Skills own domain-specific checks; do not duplicate their procedures here.