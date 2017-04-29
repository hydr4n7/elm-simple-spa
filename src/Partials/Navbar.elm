module Partials.Navbar exposing (navbar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


viewLinks : String -> Html Msg
viewLinks name =
    li [ class "nav-item" ] [ a [ href ("#" ++ name) ] [ text name ] ]


navbar : Html Msg
navbar =
    ul [class "navbar"] (List.map viewLinks [ "home", "about", "contact", "Very Long title", "a" ])
