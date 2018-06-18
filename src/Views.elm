module Views exposing (..)

import Material
import Material.Layout as Layout
import Material.Color as Color
import Material.Scheme
import Material.Button as Button
import Material.Options exposing (css)
import Html.Attributes exposing (href, class, style)
import Html exposing (..)
import Models exposing (..)
import Routes exposing (..)
import Msgs exposing (..)


view : Model -> Html Msg
view model =
    let contents = 
        Layout.render Mdl model.mdl
            [ Layout.fixedHeader
            , Layout.onSelectTab SelectTab
            , Layout.selectedTab (routeToTabNum model.currentRoute)
            ]
            { header = [ h1 [] [ text "Home" ] ]
            , drawer = []
            , tabs = ( [ text "HOME", text "ABOUT" ], [] )
            , main = [ viewForModel model ]
            }
    in Material.Scheme.topWithScheme Color.Teal Color.LightGreen contents

viewForModel : Model -> Html msg
viewForModel model =
    let msg =
        case model.currentRoute of
            HomeRoute -> toString model.currentRoute
            AboutRoute -> toString model.currentRoute
            NotFoundRoute -> "404: Not found"
    in div [] [ text msg ]