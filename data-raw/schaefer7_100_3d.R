## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_100_3d <- make_schaefer_3d(7, 100)

## write out ----

usethis::use_data(schaefer7_100_3d, overwrite = TRUE)

library(ggseg)
library(ggsegSchaefer)
library(tidyverse)

schaefer17_100$data <- schaefer17_100$data %>%
  mutate(
    region = str_remove(region, "17Networks_LH_|17Networks_RH_"),
    network = str_split_fixed(region, "_", 2),
    network = ifelse(network[,1] == "", NA_character_, network[,1])
  ) %>%
  select(hemi:region, network,label, roi, geometry)

names(schaefer17_100$palette) <- str_remove(names(schaefer17_100$palette),
                                            "17Networks_LH_|17Networks_RH_")
plot(schaefer17_100,
     position = position_brain(hemi + side ~ .))
