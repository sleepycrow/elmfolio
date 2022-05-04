module Projects exposing (..)
import Html exposing (Html)


type Project
    = Webshop
    | Cytubemmo
    | Rakbot
    | Unote
    | Quatro
    | Ekartmagnesy


type alias ProjectPageState = 
    { project: Project
    , currentImg: Int
    , totalImgs: Int
    }


type alias ProjectInfo msg =
    { name: String
    , briefDescription: String
    , technologies: String
    , imgs: List String
    , description: List (Html msg)
    , links: List (Html msg)
    }