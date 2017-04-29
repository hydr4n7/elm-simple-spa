module Pages.HomePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode
import Model exposing (..)
import Html.Events.Extra exposing (onEnter)

homePage : Model -> Html Msg
homePage model =
    div []
        [ h1 [ id "dupa" ] [ text "Home page!" ]
        , button [ onClick LoadGif ] [ text "Click me!" ]
        , input [defaultValue model.topic, onInput ChangeTopic, onEnter LoadGif] []
        , div [] [text ("tempVar: " ++ model.tempVar)]
        , div [] [text ("topic: " ++ model.topic)]
        , br [] []
        , img [ src model.gifUrl ] []
        ]
