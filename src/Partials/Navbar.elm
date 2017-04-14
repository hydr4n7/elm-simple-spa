module Partials.Navbar exposing (navbar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


viewLinks : String -> Html Msg
viewLinks name =
    div [] [ a [ href ("#" ++ name) ] [ text name ] ]


navbar : Html Msg
navbar =
    nav [] (List.map viewLinks [ "home", "about", "contact" ])
