#set page(width: auto, height: auto, margin: 0pt)
#set image(width: 100%)

#let empty = []
#let hdr(label) = align(center + horizon)[#strong(label)]

#grid(
  columns: (auto, ..(4cm,) * 5),
  gutter: 3pt,
  // data rows (top to bottom: r2 … r5)
  hdr("r2"), image("plots/0a_qxc_gpt4/r1_vs_r2.pdf"),
  empty, empty,
  empty, empty,
  hdr("r3"), image("plots/0a_qxc_gpt4/r1_vs_r3.pdf"),
  image("plots/0a_qxc_gpt4/r2_vs_r3.pdf"), empty,
  empty, empty,

  hdr("r4"), image("plots/0a_qxc_gpt4/r1_vs_r4.pdf"),
  image("plots/0a_qxc_gpt4/r2_vs_r4.pdf"), image("plots/0a_qxc_gpt4/r3_vs_r4.pdf"),
  empty, empty,

  hdr("r5"), image("plots/0a_qxc_gpt4/r1_vs_r5.pdf"),
  image("plots/0a_qxc_gpt4/r2_vs_r5.pdf"), image("plots/0a_qxc_gpt4/r3_vs_r5.pdf"),
  image("plots/0a_qxc_gpt4/r4_vs_r5.pdf"), empty,

  hdr("r6"), image("plots/0a_qxc_gpt4/r1_vs_r6.pdf"),
  image("plots/0a_qxc_gpt4/r2_vs_r6.pdf"), image("plots/0a_qxc_gpt4/r3_vs_r6.pdf"),
  image("plots/0a_qxc_gpt4/r4_vs_r6.pdf"), image("plots/0a_qxc_gpt4/r5_vs_r6.pdf"),
  // bottom headers
  empty, hdr("r1"),
  hdr("r2"), hdr("r3"),
  hdr("r4"), hdr("r5"),
)
