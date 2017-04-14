module Pages.ContactPage exposing (contactPage)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)


contactPage : Html Msg
contactPage =
    h1 [] [ text "Contact page!" ]
