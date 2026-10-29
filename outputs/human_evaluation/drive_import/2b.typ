#set page(width: auto, height: auto, margin: 0pt)
#set image(width: 100%)

#let empty = []
#let hdr(label) = align(center + horizon)[#strong(label)]

#grid(
  columns: (auto, ..(5cm,) * 4),
  gutter: 3pt,
  hdr("r2"), image("plots/2b_q_gpt5/r1_vs_r2.pdf"),
  empty, empty,
  empty, hdr("r3"),
  image("plots/2b_q_gpt5/r1_vs_r3.pdf"), image("plots/2b_q_gpt5/r2_vs_r3.pdf"),
  empty, empty,

  hdr("r4"), image("plots/2b_q_gpt5/r1_vs_r4.pdf"),
  image("plots/2b_q_gpt5/r2_vs_r4.pdf"), image("plots/2b_q_gpt5/r3_vs_r4.pdf"),
  empty,

  hdr("r5"), image("plots/2b_q_gpt5/r1_vs_r5.pdf"),
  image("plots/2b_q_gpt5/r2_vs_r5.pdf"), image("plots/2b_q_gpt5/r3_vs_r5.pdf"),
  image("plots/2b_q_gpt5/r4_vs_r5.pdf"),

  empty, hdr("r1"),
  hdr("r2"), hdr("r3"),
  hdr("r4"),
)
