module Projects.Quatro exposing (..)

import Projects exposing (ProjectPageState)
import Projects exposing (Project(..))
import Html exposing (Html, p, a, text)
import Html.Attributes exposing (href)
import List exposing (length)
import Projects exposing (ProjectInfo)


info: ProjectInfo msg
info =
    { name = "Quatro"
    , briefDescription = "An independent social networking site."
    , technologies = "PHP, MySQL, JavaScript"
    , imgs = 
        [ "resx/projects/quatro/1.png"
        , "resx/projects/quatro/2.png"
        ]
    , description =
        [ p []
            [ text ("In the years 2014-2017 I developed and managed Quatro, an independent social networking site written in PHP.") ]
        ]
    , links =
        []
    }


init: ProjectPageState
init =
    ProjectPageState Quatro 0 (length (info.imgs))