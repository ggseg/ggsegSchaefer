## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_600_3d <- make_schaefer_3d(7, 600)

## write out ----

usethis::use_data(schaefer7_600_3d, overwrite = TRUE)
