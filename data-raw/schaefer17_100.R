## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer17_100_3d.rda"))

## make ggseg atlas ----

schaefer17_100 <- make_schaefer_2d(schaefer17_100_3d, 17, 100)

## write out ----

usethis::use_data(schaefer17_100, overwrite = TRUE)
