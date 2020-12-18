## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer17_1000_3d.rda"))


## make ggseg3d atlas ----

schaefer17_1000_3d <- make_schaefer_3d(17, 1000)

## write out ----

usethis::use_data(schaefer17_1000_3d, overwrite = TRUE)
