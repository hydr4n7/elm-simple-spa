module Pages.HomePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


homePage : Html Msg
homePage =
    h1 [ id "dupa" ] [ text "Home page!" ]
