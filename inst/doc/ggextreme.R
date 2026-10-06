## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "ragg_png",
  dpi = 100,
  fig.width = 7.36,
  out.width = "100%"
)
# Frames have a fixed aspect ratio, so each figure is sized from the race it
# draws rather than left to stretch.
inches <- function(x) unname(ggextreme::race_size(x)[["height"]]) / 100

## ----setup--------------------------------------------------------------------
library(ggextreme)

## -----------------------------------------------------------------------------
head(clefts_qci)

## -----------------------------------------------------------------------------
race <- ggrace(
  clefts_qci,
  value = qci,
  name = country,
  time = year,
  top_n = 15,
  duration = 15,
  title = "Quality of care for orofacial clefts",
  caption = "Source: Sofi-Mahmudi et al. 2025, PLOS ONE 20(1): e0317267"
)

race

## -----------------------------------------------------------------------------
head(race$frames)

## ----first-frame, fig.height = inches(race)-----------------------------------
race_frame(race, 1)

## ----last-frame, fig.height = inches(race)------------------------------------
race_frame(race, race$n_frames)

## ----eval = FALSE-------------------------------------------------------------
# animate_race(race, "clefts.mp4")
# animate_race(race, "clefts.gif")

## ----top-ten, fig.height = 4.6------------------------------------------------
top10 <- ggrace(
  clefts_qci, qci, country, year,
  top_n = 10,
  duration = 15,
  title = "Ten highest scoring countries"
)

race_frame(top10, round(top10$n_frames / 2))

## ----groups, fig.height = 5.73------------------------------------------------
regional <- ggrace(
  clefts_qci, qci, country, year,
  group = region,
  legend_title = "Region",
  top_n = 15,
  duration = 15,
  breaks = scales::breaks_extended(6),
  title = "Quality of care for orofacial clefts"
)

race_frame(regional, regional$n_frames)

## ----flags, eval = requireNamespace("magick", quietly = TRUE) && requireNamespace("rsvg", quietly = TRUE)----
key <- unique(clefts_qci[c("country", "iso")])
flags <- setNames(race_flags(key$iso), key$country)

flagged <- ggrace(
  clefts_qci, qci, country, year,
  top_n = 15,
  duration = 15,
  images = flags,
  breaks = scales::breaks_extended(6),
  title = "Quality of care for orofacial clefts"
)

flagged

## -----------------------------------------------------------------------------
subset(race_flag_codes(), grepl("Korea|Turk", country))

