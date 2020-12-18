## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer17_400_3d <- make_schaefer_3d(17, 400)

## write out ----

usethis::use_data(schaefer17_400_3d, overwrite = TRUE)
