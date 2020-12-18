## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_1000_3d <- make_schaefer_3d(7, 1000)

## write out ----

usethis::use_data(schaefer7_1000_3d, overwrite = TRUE)
