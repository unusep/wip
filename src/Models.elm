module Models exposing (..)

import Routes exposing (..)


type alias Model =
    { currentRoute : Route
    }

initialModel : Route -> Model
initialModel route = Model route