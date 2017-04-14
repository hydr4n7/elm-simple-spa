module Pages.HomePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)


homePage : Html Msg
homePage =
    h1 [ id "dupa" ] [ text "Home page!" ]
