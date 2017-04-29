module Partials.NavbarMobile exposing (navbarMobile)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


viewLinks : String -> Html Msg
viewLinks name =
    div [ class "nav-item"] [ a [ href ("#" ++ name) ] [ text name ] ]


navbarMobile : Html Msg
navbarMobile =
    nav [] (List.map viewLinks [ "dupa", "dupa", "wieksza dupa" ])
