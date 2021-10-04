## setup ----
library(ggsegExtra)
library(dplyr)
devtools::load_all(".")
source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_600_3d <- make_schaefer_3d(7, 600)

schaefer7_600_3d <- schaefer7_600_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

schaefer7_600 <- make_ggseg3d_2_ggseg(schaefer7_600_3d,
                                       steps = 2:7,
                                       tolerance = 1,
                                       output_dir = "~/Desktop/")
## write out ----

usethis::use_data(schaefer7_600_3d,
                  schaefer7_600,
                  overwrite = TRUE)
