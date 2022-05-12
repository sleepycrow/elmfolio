module Projects.Ekartmagnesy exposing (..)

import Projects exposing (ProjectPageState)
import Projects exposing (Project(..))
import Html exposing (Html, p, a, text)
import Html.Attributes exposing (href)
import List exposing (length)
import Projects exposing (ProjectInfo)


info: ProjectInfo msg
info =
    { name = "EkartMagnesy.pl"
    , briefDescription = "Website design and WordPress/WooCommerce template for ekartmagnesy.pl"
    , technologies = "PHP, WordPress, WooCommerce "
    , imgs = 
        [ "resx/projects/ekartmagnesy/1.png"
        , "resx/projects/ekartmagnesy/2.png"
        ]
    , description =
        [ p []
            [ text (" In 2021 I worked with souvenir & promotional product production company Ekart to overhaul "++
                "their online presence, as well as design and create their new website and online storefront.") ]
        , p []
            [ text ("After closely working together to create the initial design for the website and determine "++
                "the optimal technologies for the project, over the course of a month, I implemented the design "++
                "as a responsive WordPress/WooCommerce template, then deployed, set up and hardened a WordPress "++
                "installation for the client. ") ]
        ]
    , links =
        []
    }


init: ProjectPageState
init =
    ProjectPageState Ekartmagnesy 0 (length (info.imgs))