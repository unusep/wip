module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = HomeRoute
    | AboutRoute 
    | NotFoundRoute

enumRoutes : List (Route)
enumRoutes = 
    [ HomeRoute
    , AboutRoute 
    , NotFoundRoute
    ]

matchRoute : Parser (Route -> a) a
matchRoute =
    oneOf
        [ map HomeRoute top
        , map AboutRoute (s <| routeToUrlString AboutRoute)
        , map NotFoundRoute (s <| routeToUrlString NotFoundRoute)
        ]

extractRoute : Location -> Route
extractRoute location =
    case (parseHash matchRoute location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute

tabNumToRoute : Int -> Route
tabNumToRoute n = 
    case n of
        0 -> HomeRoute
        1 -> AboutRoute
        _ -> NotFoundRoute

routeToTabNum : Route -> Int
routeToTabNum route = 
    case route of
        HomeRoute -> 0
        AboutRoute -> 1
        NotFoundRoute -> -1

routeToUrlString : Route -> String
routeToUrlString route =
    let url = 
        case route of
            HomeRoute -> ""
            AboutRoute -> "about"
            NotFoundRoute -> "404"
    in url

routeToTitleString : Route -> String
routeToTitleString route =
    case route of
        HomeRoute -> "Home"
        AboutRoute -> "About"
        NotFoundRoute -> "None"