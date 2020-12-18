## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer7_100_3d.rda"))

## make ggseg atlas ----

schaefer7_100 <- make_schaefer_2d(schaefer7_100_3d, 7, 100)

## write out ----

usethis::use_data(schaefer7_100, overwrite = TRUE)
