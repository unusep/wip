module Views exposing (..)

import Material.Typography as Typo
import Material.Options exposing (Style, styled, css)
import Material.Layout as Layout exposing (row, spacer, title)
import Material.Grid exposing (..)
import Material.Color as Color
import Material.Scheme
import Material.Button as Button
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
            { header = initHeader
            , drawer = []
            , tabs = initTabs
            , main = [ viewForRoute model.currentRoute ]
            }
    in Material.Scheme.topWithScheme Color.Teal Color.LightGreen contents

viewForRoute : Route -> Html msg
viewForRoute route =
    let msg =
        case route of
            HomeRoute -> toString route
            AboutRoute -> toString route
            NotFoundRoute -> "404: Not found"
    in grid [] 
        [ cell [ size All 4 ]
            [ styled h4 [ Typo.headline ] [ text msg ] 
            ]
        ]

initHeader : List (Html msg)
initHeader = 
    [ row [] 
        [ title [] [ 
            styled h1 [ Typo.title ] [ text "WIP Website" ] ]
        ]
    ]

isLegitRoute : Route -> Bool
isLegitRoute route =
    case route of
        NotFoundRoute -> False
        _ -> True

initTabs : (List (Html msg), List (Style msg))
initTabs = 
    let allRoutes =
            List.filter isLegitRoute enumRoutes
        texts =
            List.map (text << routeToTitleString) allRoutes
    in
        ( texts, [ Typo.subhead ] )