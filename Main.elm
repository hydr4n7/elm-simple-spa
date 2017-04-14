module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = (\_ -> ( Model Home, Cmd.none ))
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


type Page
    = Home
    | About
    | Contact


type alias Model =
    { page : Page
    }


type Msg
    = UrlChange Navigation.Location


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
    div []
        [ div [class "navbar"] [ navbar ]
        , div [class "content"] [ (content model) ]
        , div [class "footer"] [ footerView ]
        ]

viewLinks : String -> Html Msg
viewLinks name =
    div [] [ a [ href ("#" ++ name) ] [ text name ] ]

navbar : Html Msg
navbar =
    nav [] (List.map viewLinks [ "home", "about", "contact" ])


footerView : Html Msg
footerView = 
    footer [] [text "This is my footer"]

content : Model -> Html Msg
content model =
    case model.page of
        Home ->
            h1 [id "dupa"] [ text "Home page!" ]

        About ->
            h1 [] [ text "About page!" ]

        Contact ->
            h1 [] [ text "Contact page!" ]
