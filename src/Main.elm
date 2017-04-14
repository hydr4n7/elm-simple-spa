module Main exposing (..)

-- Packages imports

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation


-- Pages imports

import Pages.HomePage exposing (homePage)
import Pages.AboutPage exposing (aboutPage)
import Pages.ContactPage exposing (contactPage)


-- Partials imports

import Partials.Navbar exposing (navbar)
import Partials.Footer exposing (footerView)


-- Misc imports

import Model exposing (..)
import Msg exposing (..)
import Subscriptions exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = (\_ -> ( Model Home, Cmd.none ))
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


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


view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ div [ class "navbar" ] [ navbar ]
        , div [ class "content" ] [ (content model) ]
        , div [ class "footer" ] [ footerView ]
        ]


content : Model -> Html Msg
content model =
    case model.page of
        Home ->
            homePage

        About ->
            aboutPage

        Contact ->
            contactPage
