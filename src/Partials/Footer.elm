module Partials.Footer exposing (footerView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


footerView : Html Msg
footerView =
    footer [] [ 
    i [class "fa fa-facebook-official fa-2x"] []
    , text "This is my footer" ]
