module Pages.ContactPage exposing (contactPage)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)


contactPage : Html Msg
contactPage =
    h1 [] [ text "Contact page!" ]
