module Projects.Webshop exposing (..)

import Projects exposing (ProjectPageState)
import Projects exposing (Project(..))
import Html exposing (Html, p, a, text)
import Html.Attributes exposing (href)
import List exposing (length)
import Projects exposing (ProjectInfo)


info: ProjectInfo msg
info =
    { name = "Webshop"
    , briefDescription = "An extensible online store, written for a final project for a server applications class."
    , technologies = "PHP, MySQL, JavaScript"
    , imgs = 
        [ "resx/projects/webshop/1.png"
        , "resx/projects/webshop/2.png"
        , "resx/projects/webshop/3.png"
        ]
    , description =
        [ p []
            [ text ("In 2021 I wrote an extensible online storefront from scratch as a final project for a server "
                ++"applications class. Written in PHP, the project is powered by a clean, homebrew MVC framework "
                ++"and supports theming and extensions.") ]
        , p []
            [ text "The website is fully responsive, and was designed with a mobile-first approach." ]
        ]
    , links =
        [ a [ href "https://github.com/sleepycrow/webshop" ]
            [ text "Source Code >>" ]
        ]
    }


init: ProjectPageState
init =
    ProjectPageState Webshop 0 (length (info.imgs))