module Projects.Unote exposing (..)

import Projects exposing (ProjectPageState)
import Projects exposing (Project(..))
import Html exposing (Html, p, a, text)
import Html.Attributes exposing (href)
import List exposing (length)
import Projects exposing (ProjectInfo)


info: ProjectInfo msg
info =
    { name = "uNote"
    , briefDescription = "A cloud-syncing notepad progressive web app, designed for offline-first operation."
    , technologies = "PHP, JavaScript, RIOT.js, MySQL, Webpack"
    , imgs = 
        [ "resx/projects/unote/1.png"
        , "resx/projects/unote/2.png"
        ]
    , description =
        [ p []
            [ text ("In the years 2018-2020, I developed and hosted uNote - a cloud-syncing, offline-first notepad app. "++
                " The app was split into two parts that communicated via an API - a PHP-based backend, and a JavaScript-based "++
                " frontend. ") ]
        , p []
            [ text ("The frontend was a single-page progressive web app. It was responsive and offline-first, designed "++
                "with bandwidth-limited mobile devices in mind. ") ]
        ]
    , links =
        [ a [ href "https://github.com/sleepycrow/unote-fe" ]
            [ text "Frontend Source Code >>" ]
        , a [ href "https://github.com/sleepycrow/unote-be" ]
            [ text "Backend Source Code >>" ]
        ]
    }


init: ProjectPageState
init =
    ProjectPageState Unote 0 (length (info.imgs))