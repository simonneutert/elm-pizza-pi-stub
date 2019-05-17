import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Pi exposing (pi)
import Round
import PizzaPricePerSquareMeter


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL


type alias Pizza =
  { diameter : String
  , price : String }


init : Pizza
init =
  { diameter = "30"
  , price = "5" }


-- UPDATE


type Msg
  = ChangeDiameter String
  |  ChangePrice String


update : Msg -> Pizza -> Pizza
update msg model =
  case msg of
    ChangeDiameter newDiameter ->
      { model | diameter = newDiameter }
    ChangePrice newPrice ->
      { model | price = newPrice }


-- VIEW


view : Pizza -> Html Msg
view model =
  Html.form []
    [ div []
      [ label [] [ text "Durchmesser: "
        , input [ placeholder "Durchmesser in cm eingeben", value model.diameter, onInput ChangeDiameter ] []
        ]
      ]
    , div []
      [ label [] [ text "Preis: "
        , input [ placeholder "Preis in Euro eingeben", value model.price, onInput ChangePrice ] []
        ]
      ]
    , div [] [ text (PizzaPricePerSquareMeter.calc model) ]
    ]