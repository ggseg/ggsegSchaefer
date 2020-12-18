## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer7_400_3d.rda"))

## make ggseg atlas ----

schaefer7_400 <- make_schaefer_2d(schaefer7_400_3d, 7, 400)

## write out ----

usethis::use_data(schaefer7_400, overwrite = TRUE)
