# Download the full RAVDESS speech set and keep the 192 calm/angry "Kids are talking by the door" clips
# used in the Speech Analytics Bootcamp (24 actors x 2 emotions x 2 intensities x 2 repetitions).
# Source: Livingstone & Russo (2018), https://doi.org/10.5281/zenodo.1188976 (CC BY-NC-SA 4.0)
# The zip is ~210 MB. Run from the repository root.

url  <- "https://zenodo.org/records/1188976/files/Audio_Speech_Actors_01-24.zip?download=1"
zipf <- file.path(tempdir(), "ravdess_speech.zip")
out  <- "data/3_ravdess_full"

options(timeout = 1200)
download.file(url, zipf, mode = "wb")
all_files <- unzip(zipf, list = TRUE)$Name

# modality 03 (audio), vocal 01 (speech), emotion 02/05, statement 01 ("Kids ...")
keep <- grep("03-01-0[25]-0[12]-01-0[12]-[0-9]{2}\\.wav$", all_files, value = TRUE)
dir.create(out, showWarnings = FALSE, recursive = TRUE)
unzip(zipf, files = keep, exdir = tempdir())
file.copy(file.path(tempdir(), keep), file.path(out, basename(keep)), overwrite = TRUE)
message(length(keep), " clips copied to ", out)   # expect 192
