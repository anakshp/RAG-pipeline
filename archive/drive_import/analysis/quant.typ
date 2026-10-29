#set par(justify: true)

= Quant
Group 6

== Rating correlations

#figure(caption: [Median Pearson's _r_ and root mean square error values for GPT4 ratings], table(
  align: center,
  columns: 3,
  row-gutter: (2pt, 0pt, 0pt),
  column-gutter: (2pt, 0pt),
  stroke: 0.5pt,
  inset: 5pt,

  [GPT4], [_r_], [RMSE],

  [Criteria $times$ Questions], [0.393], [0.987],

  [Criteria], [0.835], [0.451],

  [Questions], [0.22], [0.71],
))

#figure(caption: [Median Pearson's _r_ and root mean suqare error values for GPT 5 ratings], table(
  align: center,
  columns: 3,
  row-gutter: (2pt, 0pt, 0pt),
  column-gutter: (2pt, 0pt),
  stroke: 0.5pt,
  inset: 5pt,

  [GPT5], [_r_], [RMSE],

  [Criteria $times$ Questions], [0.15], [1.24],

  [Criteria], [0.554], [0.667],

  [Questions], [-0.007], [0.805],
))

// ── Helper ────────────────────────────────────────────────────────────────────
#let empty = []
#let hdr(label) = align(center + horizon)[#strong(label)]

// ── (0a) Q×C — GPT4 ───────────────────────────────────────────────────────────
// rows: r2–r5 (left label), cols: r1–r4 (bottom label)
// cell [row=ri, col=rj] => rj_vs_ri.png  (rj < ri)
#figure(
  caption: [Pairwise agreement plots: Q×C level, GPT4],
  grid(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    // data rows (top to bottom: r2 … r5)
    hdr("r2"), image("plots/newer/0a_qxc_gpt4/r1_vs_r2.png"), empty, empty, empty, empty,
    hdr("r3"),
    image("plots/newer/0a_qxc_gpt4/r1_vs_r3.png"),
    image("plots/newer/0a_qxc_gpt4/r2_vs_r3.png"),
    empty,
    empty,
    empty,

    hdr("r4"),
    image("plots/newer/0a_qxc_gpt4/r1_vs_r4.png"),
    image("plots/newer/0a_qxc_gpt4/r2_vs_r4.png"),
    image("plots/newer/0a_qxc_gpt4/r3_vs_r4.png"),
    empty,
    empty,

    hdr("r5"),
    image("plots/newer/0a_qxc_gpt4/r1_vs_r5.png"),
    image("plots/newer/0a_qxc_gpt4/r2_vs_r5.png"),
    image("plots/newer/0a_qxc_gpt4/r3_vs_r5.png"),
    image("plots/newer/0a_qxc_gpt4/r4_vs_r5.png"),
    empty,

    hdr("r6"),
    image("plots/newer/0a_qxc_gpt4/r1_vs_r6.png"),
    image("plots/newer/0a_qxc_gpt4/r2_vs_r6.png"),
    image("plots/newer/0a_qxc_gpt4/r3_vs_r6.png"),
    image("plots/newer/0a_qxc_gpt4/r4_vs_r6.png"),
    image("plots/newer/0a_qxc_gpt4/r5_vs_r6.png"),
    // bottom headers
    empty, hdr("r1"), hdr("r2"), hdr("r3"), hdr("r4"), hdr("r5"),
  ),
)

// ── (0b) Q×C — GPT5 ───────────────────────────────────────────────────────────
#figure(
  caption: [Pairwise agreement plots: Q×C level, GPT5],
  grid(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    hdr("r2"), image("plots/newer/0b_qxc_gpt5/r1_vs_r2.png"), empty, empty, empty,
    hdr("r3"),
    image("plots/newer/0b_qxc_gpt5/r1_vs_r3.png"),
    image("plots/newer/0b_qxc_gpt5/r2_vs_r3.png"),
    empty,
    empty,

    hdr("r4"),
    image("plots/newer/0b_qxc_gpt5/r1_vs_r4.png"),
    image("plots/newer/0b_qxc_gpt5/r2_vs_r4.png"),
    image("plots/newer/0b_qxc_gpt5/r3_vs_r4.png"),
    empty,

    hdr("r5"),
    image("plots/newer/0b_qxc_gpt5/r1_vs_r5.png"),
    image("plots/newer/0b_qxc_gpt5/r2_vs_r5.png"),
    image("plots/newer/0b_qxc_gpt5/r3_vs_r5.png"),
    image("plots/newer/0b_qxc_gpt5/r4_vs_r5.png"),

    empty, hdr("r1"), hdr("r2"), hdr("r3"), hdr("r4"),
  ),
)

// ── (1a) Criteria — GPT4 ──────────────────────────────────────────────────────
#figure(
  caption: [Pairwise agreement plots: criteria level, GPT4],
  grid(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    hdr("r2"), image("plots/newer/1a_c_gpt4/r1_vs_r2.png"), empty, empty, empty, empty,
    hdr("r3"),
    image("plots/newer/1a_c_gpt4/r1_vs_r3.png"),
    image("plots/newer/1a_c_gpt4/r2_vs_r3.png"),
    empty,
    empty,
    empty,

    hdr("r4"),
    image("plots/newer/1a_c_gpt4/r1_vs_r4.png"),
    image("plots/newer/1a_c_gpt4/r2_vs_r4.png"),
    image("plots/newer/1a_c_gpt4/r3_vs_r4.png"),
    empty,
    empty,

    hdr("r5"),
    image("plots/newer/1a_c_gpt4/r1_vs_r5.png"),
    image("plots/newer/1a_c_gpt4/r2_vs_r5.png"),
    image("plots/newer/1a_c_gpt4/r3_vs_r5.png"),
    image("plots/newer/1a_c_gpt4/r4_vs_r5.png"),
    empty,

    hdr("r6"),
    image("plots/newer/1a_c_gpt4/r1_vs_r6.png"),
    image("plots/newer/1a_c_gpt4/r2_vs_r6.png"),
    image("plots/newer/1a_c_gpt4/r3_vs_r6.png"),
    image("plots/newer/1a_c_gpt4/r4_vs_r6.png"),
    image("plots/newer/1a_c_gpt4/r5_vs_r6.png"),

    empty, hdr("r1"), hdr("r2"), hdr("r3"), hdr("r4"), hdr("r5"),
  ),
)

// ── (1b) Criteria — GPT5 ──────────────────────────────────────────────────────
#figure(
  caption: [Pairwise agreement plots: criteria level, GPT5],
  grid(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    hdr("r2"), image("plots/newer/1b_c_gpt5/r1_vs_r2.png"), empty, empty, empty,
    hdr("r3"), image("plots/newer/1b_c_gpt5/r1_vs_r3.png"), image("plots/newer/1b_c_gpt5/r2_vs_r3.png"), empty, empty,
    hdr("r4"),
    image("plots/newer/1b_c_gpt5/r1_vs_r4.png"),
    image("plots/newer/1b_c_gpt5/r2_vs_r4.png"),
    image("plots/newer/1b_c_gpt5/r3_vs_r4.png"),
    empty,

    hdr("r5"),
    image("plots/newer/1b_c_gpt5/r1_vs_r5.png"),
    image("plots/newer/1b_c_gpt5/r2_vs_r5.png"),
    image("plots/newer/1b_c_gpt5/r3_vs_r5.png"),
    image("plots/newer/1b_c_gpt5/r4_vs_r5.png"),

    empty, hdr("r1"), hdr("r2"), hdr("r3"), hdr("r4"),
  ),
)

// ── (2a) Questions — GPT4 ─────────────────────────────────────────────────────
#figure(
  caption: [Pairwise agreement plots: question level, GPT4],
  grid(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    hdr("r2"), image("plots/newer/2a_q_gpt4/r1_vs_r2.png"), empty, empty, empty, empty,
    hdr("r3"),
    image("plots/newer/2a_q_gpt4/r1_vs_r3.png"),
    image("plots/newer/2a_q_gpt4/r2_vs_r3.png"),
    empty,
    empty,
    empty,

    hdr("r4"),
    image("plots/newer/2a_q_gpt4/r1_vs_r4.png"),
    image("plots/newer/2a_q_gpt4/r2_vs_r4.png"),
    image("plots/newer/2a_q_gpt4/r3_vs_r4.png"),
    empty,
    empty,

    hdr("r5"),
    image("plots/newer/2a_q_gpt4/r1_vs_r5.png"),
    image("plots/newer/2a_q_gpt4/r2_vs_r5.png"),
    image("plots/newer/2a_q_gpt4/r3_vs_r5.png"),
    image("plots/newer/2a_q_gpt4/r4_vs_r5.png"),
    empty,

    hdr("r6"),
    image("plots/newer/2a_q_gpt4/r1_vs_r6.png"),
    image("plots/newer/2a_q_gpt4/r2_vs_r6.png"),
    image("plots/newer/2a_q_gpt4/r3_vs_r6.png"),
    image("plots/newer/2a_q_gpt4/r4_vs_r6.png"),
    image("plots/newer/2a_q_gpt4/r5_vs_r6.png"),

    empty, hdr("r1"), hdr("r2"), hdr("r3"), hdr("r4"), hdr("r5"),
  ),
)

// ── (2b) Questions — GPT5 ─────────────────────────────────────────────────────
#figure(
  caption: [Pairwise agreement plots: question level, GPT5],
  grid(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    hdr("r2"), image("plots/newer/2b_q_gpt5/r1_vs_r2.png"), empty, empty, empty,
    hdr("r3"), image("plots/newer/2b_q_gpt5/r1_vs_r3.png"), image("plots/newer/2b_q_gpt5/r2_vs_r3.png"), empty, empty,
    hdr("r4"),
    image("plots/newer/2b_q_gpt5/r1_vs_r4.png"),
    image("plots/newer/2b_q_gpt5/r2_vs_r4.png"),
    image("plots/newer/2b_q_gpt5/r3_vs_r4.png"),
    empty,

    hdr("r5"),
    image("plots/newer/2b_q_gpt5/r1_vs_r5.png"),
    image("plots/newer/2b_q_gpt5/r2_vs_r5.png"),
    image("plots/newer/2b_q_gpt5/r3_vs_r5.png"),
    image("plots/newer/2b_q_gpt5/r4_vs_r5.png"),

    empty, hdr("r1"), hdr("r2"), hdr("r3"), hdr("r4"),
  ),
)

== Paired samples t-test

The Irrelevance criterion was excluded from inferential analyses due to a skewed distribution (ceiling effect), as inspection of its histogram revealed ratings concentrated at the higher end of the scale, violating the normality assumption.

A paired samples t-test was conducted to compare ratings between GPT-4 (_M_ = 3.31, _SD_ = 0.949) and GPT-5 (_M_ = 3.35, _SD_ = 0.955) across seven criteria. No significant overall difference was found (_t_(565) = -1.04,_p_ = .299, mean diff = -0.049, 95% CI [-0.143, 0.044]).

Per-criterion analyses were conducted with Bonferroni correction applied(*$alpha$* = .05/7 = .007). Two criteria showed significant differences after correction: GPT-4 was rated significantly higher on Narrativity (_t_(74) = 5.22, _p_ < .001, _d_ = 0.603), while GPT-5 was rated significantly higher on Factuality (_t_(74) = -3.20, _p_ = .014, _d_ = -0.370). Both represent medium effect sizes. Recall and Reduction showed uncorrected significant differences that did not survive Bonferroni correction (both _p_ > .30 after correction).

A limitation of this study is the small number of raters (_n_ = 5). However, given the Central Limit Theorem, the aggregated ratings are expected to approximate a normal distribution, supporting the validity of parametric testing.

#pagebreak()
== Discard: Inter-Rater Reliability

Inter-rater reliability was assessed using Krippendorff's $alpha$ (ordinal) across six raters for GPT-4, five raters for GPT-5, and eight evaluation criteria. Overall agreement was below the commonly accepted threshold of 0.667 [\@krippendorff] for both models (GPT-4 $alpha$ = 0.372, GPT-5 $alpha$ = 0.117; pg: 11). Agreement varied considerably across criteria: Ambiguity and Narrativity showed near-zero or negative $alpha$ values for both models, indicating systematic disagreement, while Repetition showed the highest agreement for GPT-4 ($alpha$ = 0.543), approaching but not reaching the acceptable threshold. GPT-5 agreement remained low across all criteria (pg: 11--12). A sensitivity analysis excluding each rater individually showed that no single rater was responsible for the low agreement — the most impactful exclusion (R3) improved GPT-4 $alpha$ from 0.372 to 0.535 and GPT-5 $alpha$ from 0.117 to 0.216 (pg: 12--15). This suggests the disagreement is structural, likely reflecting the inherent subjectivity of certain criteria rather than individual rater error. Given this, all five raters were retained for subsequent analyses.
