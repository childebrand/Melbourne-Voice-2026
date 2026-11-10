# Speech Analytics Bootcamp

**Guest workshop · University of Melbourne · Wednesday, 11 November 2026, 13:00–15:30**
Instructor: Prof. Dr. Christian Hildebrand, University of St.Gallen (HSG)

Course website: **https://childebrand.github.io/Melbourne-Voice-2026/**

A hands-on introduction to voice analytics for behavioural research: how speech is produced, which acoustic features map onto which psychological states, where construct validity breaks down, and a short lab in which you separate calm from angry speakers with R. This is the one-afternoon version of the 5-day GSERM course *Voice Analytics for Behavioral Scientists*.

## Quick start

1. Install R (4.5 or newer), RStudio and Audacity.
2. Download this repository ([zip](https://github.com/childebrand/Melbourne-Voice-2026/archive/refs/heads/main.zip)) and open the folder in RStudio.
3. From the repository root, run `source("setup/install_packages.R")`.
4. Open `lab/voice_lab.qmd` and run the first two chunks.

## Contents

| Path | What |
|---|---|
| `slides/` | Slides (PowerPoint with speaker notes and audio links; PDF) |
| `lab/voice_lab.qmd` | Hands-on notebook with Exercises 1–3 and folded solutions |
| `data/1_alexa/` | Frustrated Alexa user: two commands and three wake words |
| `data/2_micTests/` | One speaker on seven recording devices, plus breathing samples |
| `data/3_ravdess/` | 32 RAVDESS clips (actors 01–04, calm vs. angry) |
| `data/ravdess_features.csv`, `data/ravdess_embeddings.csv` | Features and embeddings for all 192 calm/angry clips |
| `setup/install_packages.R` | Package installation, including voiceR from the CRAN archive |
| `scripts/get_full_ravdess.R` | Downloads the full 192-clip subset from Zenodo |
| `*.qmd`, `_quarto.yml`, `assets/` | Source of the course website; rendered site in `docs/` |

## Notes on voiceR

`voiceR` was archived on CRAN in June 2026, and version 0.1.0 does not work with `soundgen` 3.0 (released September 2026). The setup script installs `soundgen` 2.9.0 and `voiceR` from the CRAN archive. If that fails, the notebook falls back to `soundgen::analyze()` and produces the same feature names.

## Rebuilding the website

```bash
quarto render          # renders all pages and the notebook into docs/
```

GitHub Pages: *Settings → Pages → Deploy from a branch → `main` / `docs`*.

## Readings

- Hildebrand, C., Cascio Rizzo, G. L., & Berger, J. (2026). The machine between us: How AI shapes the way we speak. *Current Opinion in Psychology*. <https://www.sciencedirect.com/science/article/pii/S2352250X26002216>
- Hildebrand, C., Efthymiou, F., Busquet, F., Hampton, W. H., Hoffman, D. L., & Novak, T. P. (2020). Voice analytics in business research: Conceptual foundations, acoustic feature extraction, and applications. *Journal of Business Research*, 121, 364–374. <https://doi.org/10.1016/j.jbusres.2020.09.020>
- Busquet, F., Efthymiou, F., & Hildebrand, C. (2024). Voice analytics in the wild: Validity and predictive accuracy of common audio-recording devices. *Behavior Research Methods*, 56(3), 2114–2134. <https://doi.org/10.3758/s13428-023-02139-9>

## Data and licences

- RAVDESS: Livingstone, S. R., & Russo, F. A. (2018). *PLoS ONE*, 13(5), e0196391. <https://doi.org/10.5281/zenodo.1188976>. CC BY-NC-SA 4.0; the subset is redistributed for non-commercial teaching under the same licence.
- Alexa and microphone recordings: workshop materials from Hildebrand et al. (2020, *Journal of Business Research*) and Busquet, Efthymiou & Hildebrand (2024, *Behavior Research Methods*).

Contact: [christian.hildebrand@unisg.ch](mailto:christian.hildebrand@unisg.ch)
