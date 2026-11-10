# Speech Analytics Bootcamp (University of Melbourne, 11 Nov 2026)
# Run this once BEFORE the workshop (takes 5-10 minutes). R >= 4.1 and RStudio recommended.

options(repos = "https://cloud.r-project.org")

# 1. Core packages --------------------------------------------------------------
core <- c("tuneR", "seewave", "soundgen",      # audio I/O, plots, features
          "tidyverse", "glmnet", "pROC",       # wrangling, models, AUC
          "rmarkdown", "knitr")                # render the notebook
install.packages(setdiff(core, rownames(installed.packages())))

# 2. voiceR ---------------------------------------------------------------------
# voiceR (Busquet & Hildebrand) was archived on CRAN in June 2026, so
# install.packages("voiceR") no longer works. Two fixes:
#  (a) voiceR 0.1.0 needs soundgen < 3.0 (soundgen 3.0, Sept 2026, changed analyze()),
#      so we install soundgen 2.9.0 from the CRAN archive;
#  (b) install voiceR's dependencies, then the archived voiceR source package.
# If anything here fails, the notebook still runs: it falls back to soundgen::analyze().
if (packageVersion("soundgen") >= "3.0.0") {
  install.packages(c("dtw", "nonlinearTseries"))
  install.packages("https://cran.r-project.org/src/contrib/Archive/soundgen/soundgen_2.9.0.tar.gz",
                   repos = NULL, type = "source")
}
voiceR_deps <- c("doParallel", "DT", "foreach", "FSA", "ggpubr", "ggthemes", "gridExtra",
                 "gtable", "kableExtra", "phia", "plotly", "rcompanion", "shiny",
                 "shinyFiles", "shinyjs", "xfun")
install.packages(setdiff(voiceR_deps, rownames(installed.packages())))
if (!requireNamespace("voiceR", quietly = TRUE)) {
  install.packages("https://cran.r-project.org/src/contrib/Archive/voiceR/voiceR_0.1.0.tar.gz",
                   repos = NULL, type = "source")
}

# 3. Optional (bonus section only) ----------------------------------------------
# install.packages("openai")   # Whisper speech-to-text, needs an API key

# 4. Check ----------------------------------------------------------------------
ok <- sapply(c("tuneR", "seewave", "soundgen", "tidyverse", "glmnet", "pROC", "voiceR"),
             requireNamespace, quietly = TRUE)
print(ok)
if (all(ok[c("tuneR", "seewave", "soundgen")])) {
  library(tuneR)
  w <- readWave("data/1_alexa/alexa_cmd1.wav")   # run from the repository root
  print(w)
  message("Setup looks good. Mac users without sound: tuneR::setWavPlayer('/usr/bin/afplay')")
}
