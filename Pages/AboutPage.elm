module Pages.AboutPage exposing (aboutPage)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)


aboutPage : Html Msg
aboutPage =
    div []
        [ h1 [] [ text "About page!" ]
        , p [] [ text "Flexbox is a perfect fit for this type of problem. While mostly known for laying out content in the horizontal direction, Flexbox actually works just as well for vertical layout problems. All you have to do is wrap the vertical sections in a flex conta" ]
        ]
