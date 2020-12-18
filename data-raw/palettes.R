require(tidyverse)
require(magrittr)
require(ggseg)

# Eventuallly we can get all the pals this way
# map2(rep(c(7, 17), times = 10),
#      rep(seq(100, 1000, 100), each = 2),
#      ~load(here::here("data", paste0("schaefer", .x, "_", .y, ".rda"))))
load("data/schaefer7_100.rda")
load("data/schaefer17_100.rda")
load("data/schaefer7_200.rda")
load("data/schaefer17_200.rda")
load("data/schaefer7_400.rda")

brain_pals <- list(schaefer7_100 = schaefer7_100$palette,
                   schaefer17_100 = schaefer17_100$palette,
                   schaefer7_200 = schaefer7_200$palette,
                   schaefer17_200 = schaefer17_200$palette,
                   schaefer7_400 = schaefer7_400$palette)

usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
