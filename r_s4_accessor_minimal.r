library(purrr)
library(magrittr)

# -----------------------------------------------------------------------------
# class hierarchie

setClass("Shape")

setClass(
  "Polygon", 
  representation(
    sides = "integer"
    ),
  contains = "Shape"
)

setClass(
  "Triangle",
  contains = "Polygon"
)

setClass(
  "Square",
  contains = "Polygon"
)

setClass(
  "Circle",
  contains = "Shape"
)


# -----------------------------------------------------------------------------
# class attributes

getSlots("Polygon")


# -----------------------------------------------------------------------------
# generic methods

setGeneric("sides", function(object) {
  standardGeneric("sides")
})

setMethod(
  "sides",
  signature(
    object = "Polygon"),
    function(object) {
      object@sides
    }
  )


# -----------------------------------------------------------------------------
# instance creation

p1 <- new("Polygon", sides = 3L)

ps <- list(
  new("Polygon", sides = 1L),
  new("Polygon", sides = 2L),
  new("Polygon", sides = 3L)
)

ps[[1]]

class(ps)

# accessor functions
sides(p1)
p1@sides
slot(p1, "sides")

map(ps, sides)
ps %>% map(function(o) { slot(o, "sides")})
ps %>% map(function(o) o@sides)
