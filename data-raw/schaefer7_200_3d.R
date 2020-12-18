## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_200_3d <- make_schaefer_3d(7, 200)

## write out ----

usethis::use_data(schaefer7_200_3d, overwrite = TRUE)
