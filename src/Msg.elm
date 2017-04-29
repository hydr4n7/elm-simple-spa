module Msg exposing (..)

import Navigation
import Http


type Msg
    = UrlChange Navigation.Location
    | LoadGif
    | NewGif (Result Http.Error String)
    | ChangeTopic String

