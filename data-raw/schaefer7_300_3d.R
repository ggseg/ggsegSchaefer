## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_300_3d <- make_schaefer_3d(7, 300)

## write out ----

usethis::use_data(schaefer7_300_3d, overwrite = TRUE)
