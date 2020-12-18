## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_700_3d <- make_schaefer_3d(7, 700)

## write out ----

usethis::use_data(schaefer7_700_3d, overwrite = TRUE)
