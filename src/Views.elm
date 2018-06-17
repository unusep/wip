module Views exposing (..)

import Html exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Models exposing (..)
import Routes exposing (..)

view : Model -> Html msg
view model =
    Grid.container []
        [ CDN.stylesheet -- creates an inline style node with the Bootstrap CSS
        , Grid.row []
            [ Grid.col []
                [ text "Some content for my view here..."
                , viewForModel model
                ]
            ]

        ]

viewForModel : Model -> Html msg
viewForModel model =
    let msg =
        case model.currentRoute of
            HomeRoute -> toString model.currentRoute
            AboutRoute -> toString model.currentRoute
            NotFoundRoute -> "404: Not found"
    in div [] [ text msg ]