## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_500_3d <- make_schaefer_3d(7, 500)

## write out ----

usethis::use_data(schaefer7_500_3d, overwrite = TRUE)
