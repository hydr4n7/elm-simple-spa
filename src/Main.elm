module Main exposing (..)

-- Packages imports

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation
import Http
import Json.Decode as Decode


-- Pages imports

import Pages.HomePage exposing (homePage)
import Pages.AboutPage exposing (aboutPage)
import Pages.ContactPage exposing (contactPage)


-- Partials imports

import Partials.Navbar exposing (navbar)
--import Partials.NavbarMobile exposing (navbarMobile)
import Partials.Footer exposing (footerView)


-- Misc imports

import Model exposing (..)
import Msg exposing (..)
import Subscriptions exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init =   init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( Model Home "cats" "" ""
    , getRandomGif "cats"
    )

getPage : String -> Page
getPage hash =
    case hash of
        "#home" ->
            Home 

        "#about" ->
            About

        "#contact" ->
            Contact

        _ ->
            Home


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | page = (getPage location.hash) } ! [ Cmd.none ]
        LoadGif ->
            --{ model | topic = model.tempVar} ! [getRandomGif model.topic]
            let 
                newModel  = { model | topic = model.tempVar}
            in
                newModel ! [ getRandomGif newModel.topic]

        NewGif (Ok newUrl) ->
            { model | gifUrl = newUrl} ! [ Cmd.none ]

        NewGif (Err _) ->
            ( model, Cmd.none )
        ChangeTopic newTopic ->
            { model | tempVar = newTopic } ! [Cmd.none]



view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ div [ class "navbar-wrapper" ] [ navbar ]
        --, div [ class "navbarMobile" ] [ navbarMobile ]
        , div [ class "content" ] [ (content model) ]
        , div [ class "footer" ] [ footerView ]
        ]



content : Model -> Html Msg
content model =
    case model.page of
        Home ->
            homePage model

        About ->
            aboutPage

        Contact ->
            contactPage


getRandomGif : String -> Cmd Msg
getRandomGif topic =
    let
        url =
            "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
    in
        Http.send NewGif (Http.get url decodeGifUrl)


decodeGifUrl : Decode.Decoder String
decodeGifUrl =
    Decode.at [ "data", "image_url" ] Decode.string
