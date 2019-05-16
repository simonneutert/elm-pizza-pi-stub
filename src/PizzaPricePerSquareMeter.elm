module PizzaPricePerSquareMeter exposing (..)


import Pi exposing (..)
import Round


calc model =
  let 
    diameter = Maybe.withDefault 0 (String.toFloat model.diameter)
    price = Maybe.withDefault 0 (String.toFloat model.price)
    squareMeter = (diameter / 2)^2 * Pi.pi / 10000
    pricePerSquareMeter = Round.round 2 (price / squareMeter)
    pricePerSquareMeterText = pricePerSquareMeter
      |> String.replace "." ","
      |> String.append "Ein m2 dieser Pizza kostet: "
  in
    String.append pricePerSquareMeterText " Euro"
