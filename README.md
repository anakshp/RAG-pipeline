# Team 6 — AI, historical texts and collective memory

`restructured` consolidates the group's research and is the intended future main branch. Inclusion of a result here does not mean it has been selected for the paper.

## Directory guide

| Location | Contents |
| --- | --- |
| src/pipeline/ | Original PDF extraction, LLM cleaning and RAG scripts |
| src/text_analysis/ | Response cleaning, DocuScope, MATTR, POS and rating extrema |
| src/evaluation/ | Rating aggregation, significance tests, SPACE test, randomization |
| data/responses/ | Current semicolon-delimited response table and source with debris |
| data/qualitative/ | Raw ratings, cleaned ratings, combined rating tables |
| data/processed/docuscope_input/ | Three cleaned model-response texts |
| data/processed/docuscope_runs/ | Imported DocuScope run and token-level exports |
| outputs/docuscope/ | Categories, token tags and moving-average results |
| outputs/mattr/, outputs/pos/ | MATTR and POS result tables and figures |
| outputs/significance_tests/ | Statistical tables and per-response values |
| outputs/human_evaluation/summary_stats/ | Individual-rater summaries |
| outputs/randomised_forms/ | Existing HTML selection tool and optional generated forms |
| archive/ | Previous variants and scripts before path adaptation |
| assets/ | Original response table retained; current analysis uses data/responses/ |
| docs/ | Integration decisions, source provenance, validation and figure inventory |

Matching CSV/PDF/PNG results stay together by analysis and filename. Numerical rating summaries are distinct from close reading, despite the inherited qualitative directory names.

## Research deliverables status

This checklist reflects the group's meeting requirements. “Present” means that the relevant material is currently identifiable in this branch; it does not mean that the method or result has been selected for the paper.

| Requirement | Current status | Where to look / remaining issue |
| --- | --- | --- |
| MATTR code and visualisations | **Present** | `src/text_analysis/mattr_moving_average.py`, `outputs/mattr/`; confirm which `majority`, `middle` or `by_length` figure is final. |
| POS-tagging code and visualisations | **Present** | `src/text_analysis/pos_tags.py`, `outputs/pos/`; `SPACE` is handled separately by `src/evaluation/space_significance_test.py`. |
| DocuScope code and visualisations | **Present, with an external dependency** | `src/text_analysis/`, `data/processed/docuscope_runs/`, `outputs/docuscope/`; the DocuScope application/version and complete rerun procedure are not stored here. |
| Summary statistics code and plots | **Partially present** | Summary code and CSV tables exist in `src/evaluation/qualitative_starter.py`, `src/text_analysis/low_high_per_model.py`, `data/qualitative/` and `outputs/human_evaluation/summary_stats/`. A clearly identified set of summary-statistics plots or a dedicated plotting script has not been found. |
| Correlation statistics code and plots | **Missing / incomplete** | No independent correlation-analysis script, correlation-results directory or correlation plots have been identified. `significance_tests.py` contains a matched-pairs rank-biserial effect size, but this does not replace a complete correlation analysis. Please add the intended correlation definition, code, result tables and plots. |
| Paired-samples t-test code and plots | **Missing** | No paired t-test script, output table or plot has been identified. Please add the script, test outputs, figure(s), input-rating definition and missing-value/pairing rules. |
| Text cleaning code | **Present** | `src/pipeline/pdf_to_txt.py`, `src/pipeline/text_cleaning_openai.py`, `src/text_analysis/cleaned_model_responses.py`; confirm which response dataset is the canonical input. |
| RAG pipeline code | **Present but not fully reproducible** | `src/pipeline/rag_pipeline.py`; FAISS index, metadata, source corpus and index-building workflow remain external. The manuscript says top-k = 20 while the code uses `TOP_K = 40`; this needs confirmation. |
| Comparative dataset / model responses | **Present, with versions to reconcile** | `data/responses/Team6_comparative_analysis.csv` is the current analysis input; `assets/` and `source_with_debris.csv` are retained legacy/source versions. Confirm the canonical file and model labels (`GPT-4`/`GPT-4o`). |
| Anonymised individual ratings | **Present, anonymisation and pairing need confirmation** | `data/qualitative/raw_gradings/` and `data/qualitative/cleaned_gradings/` contain `A`, `K`, `L`, `S`, `Y` files. Confirm that these are final anonymous IDs, that no identity key is shared, and that they match the ratings used for the paired t-test and its plots. |

### Priority gaps before calling the repository complete

The most important missing uploads are:

1. the paired-samples t-test script, result tables and plots;
2. the correlation-analysis script, result tables and plots;
3. clearly labelled summary-statistics plots and, if applicable, their plotting code.

The repository also needs a short experiment note identifying the canonical response dataset, the model naming convention, the paired-rating sample, the t-test pairing rule and the correlation measure. Until these files and decisions are added, the corresponding requirements should be treated as incomplete rather than inferred from nearby significance-test outputs.

## Running analyses

Install `requirements.txt` in your Python environment. NLP scripts also require the spaCy `en_core_web_lg` model and NLTK sentence-tokenization resources. DocuScope is an external processing step; an existing export is included.

From the project root:

```bash
python src/text_analysis/cleaned_model_responses.py
# If input texts change, rerun DocuScope externally before continuing.
python src/text_analysis/docuscope_categories_plot.py
python src/text_analysis/top_token_tags.py
python src/text_analysis/docuscope_moving_average.py
python src/text_analysis/mattr_moving_average.py
python src/text_analysis/pos_tags.py
python src/evaluation/significance_tests.py
python src/evaluation/space_significance_test.py
```

For human-rating summaries:

```bash
python src/evaluation/qualitative_starter.py
python src/text_analysis/low_high_per_model.py
```

Commands regenerate their output files. Save a result snapshot first when retaining every version matters. Significance tests include 10,000 permutations and 5,000 bootstrap samples.

The optional `src/evaluation/generate_randomised_grading_forms.py` writes five ordering lists into `outputs/randomised_forms/generated/`. It displays model names, omits answer text and has no fixed seed; it is not a validated blinded-evaluation protocol.

## RAG reproduction boundary

The original pipeline requires Colab/Google Drive configuration, API credentials and external FAISS index/metadata. The corpus and index-construction workflow are not included. Its original experimental parameters have been retained.

## Adding work

Copy new work into the corresponding folder on this branch and retain its source branch. Record the source commit/path, preserve differing older versions in `archive/`, and keep scripts, inputs and results consistent. Mark selected manuscript figures in [figure inventory](docs/figure_inventory.csv).

See [integration notes](docs/integration_notes.md), [exact provenance](docs/file_provenance.json) and [validation](docs/validation_report.json). No source branch or research file has been deleted by this integration.
