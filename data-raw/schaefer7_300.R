## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer7_300_3d.rda"))

## make ggseg atlas ----

schaefer7_300 <- make_schaefer_2d(schaefer7_300_3d, 7, 300)

## write out ----

usethis::use_data(schaefer7_300, overwrite = TRUE)
