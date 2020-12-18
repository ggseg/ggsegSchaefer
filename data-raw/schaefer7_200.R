## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer7_200_3d.rda"))

## make ggseg atlas ----

schaefer7_200 <- make_schaefer_2d(schaefer7_200_3d, 7, 200)

## write out ----

usethis::use_data(schaefer7_200, overwrite = TRUE)
