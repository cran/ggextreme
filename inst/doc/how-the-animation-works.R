## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "ragg_png",
  dpi = 100,
  fig.width = 7.36,
  fig.height = 4.2,
  out.width = "100%"
)

## ----setup--------------------------------------------------------------------
library(ggextreme)

## -----------------------------------------------------------------------------
race <- ggrace(clefts_qci, qci, country, year, top_n = 15,
               duration = 15, fps = 20)

range(diff(race$times))

## -----------------------------------------------------------------------------
kenya <- subset(race$frames, name == "Kenya")
plot(kenya$time, -kenya$rank, type = "l", lwd = 2, col = "#22928F",
     xlab = "year", ylab = "position", yaxt = "n",
     main = "One country's position through the race")
axis(2, at = -(1:15), labels = 1:15, las = 1)

## -----------------------------------------------------------------------------
sum(abs(diff(kenya$rank)) > 1e-8)  # frames spent moving
nrow(kenya)                        # frames in total

## -----------------------------------------------------------------------------
top5 <- ggrace(clefts_qci, qci, country, year, top_n = 5, duration = 15)
range(top5$frames$rank)

## -----------------------------------------------------------------------------
head(race$colors, 4)

## -----------------------------------------------------------------------------
frame <- race_frame(race, 100)
length(frame$layers)
vapply(frame$layers, function(l) class(l$geom)[1], character(1))

