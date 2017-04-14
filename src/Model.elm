module Model exposing (..)


type Page
    = Home
    | About
    | Contact


type alias Model =
    { page : Page
    }
