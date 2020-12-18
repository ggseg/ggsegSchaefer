## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer17_100_3d <- make_schaefer_3d(17, 100)

## write out ----

usethis::use_data(schaefer17_100_3d, overwrite = TRUE)
