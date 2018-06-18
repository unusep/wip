module Models exposing (..)

import Material
import Routes exposing (..)


type alias Model =
    { currentRoute : Route
    , mdl : Material.Model
    }

initialModel : Route -> Model
initialModel route = Model route Material.model