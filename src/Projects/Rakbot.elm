module Projects.Rakbot exposing (..)

import Projects exposing (ProjectPageState)
import Projects exposing (Project(..))
import Html exposing (Html, p, a, text)
import Html.Attributes exposing (href)
import List exposing (length)
import Projects exposing (ProjectInfo)


info: ProjectInfo msg
info =
    { name = "Rakbot"
    , briefDescription = "A multipurpose, modular Discord bot, designed for simple extendability."
    , technologies = "JavaScript, Node.js, SQLite, Linux"
    , imgs = 
        []
    , description =
        [ p []
            [ text ("In the years 2016-2021 I developed and hosted a general-purpose discord bot. The bot was "++
                "written in JavaScript/Node.js and was modular in design, for simple extendability. ") ]
        ]
    , links =
        [ a [ href "https://github.com/sleepycrow/rakbot" ]
            [ text "Source Code >>" ]
        ]
    }


init: ProjectPageState
init =
    ProjectPageState Rakbot 0 (length (info.imgs))