module Partials.Footer exposing (footerView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


footerView : Html Msg
footerView =
    footer [] [ text "This is my footer" ]
