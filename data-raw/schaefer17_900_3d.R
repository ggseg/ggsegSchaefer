## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer17_900_3d <- make_schaefer_3d(17, 900)

## write out ----

usethis::use_data(schaefer17_900_3d, overwrite = TRUE)
