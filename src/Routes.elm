module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


matchRoute : Parser (Route -> a) a
matchRoute =
    oneOf
        [ map HomeRoute top
        , map AboutRoute (s "about")
        , map NotFoundRoute (s "404")
        ]

type Route
    = HomeRoute
    | AboutRoute 
    | NotFoundRoute

extractRoute : Location -> Route
extractRoute location =
    case (parseHash matchRoute location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute