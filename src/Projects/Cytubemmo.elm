module Projects.Cytubemmo exposing (..)

import Projects exposing (ProjectPageState)
import Projects exposing (Project(..))
import Html exposing (Html, p, a, text)
import Html.Attributes exposing (href)
import List exposing (length)
import Projects exposing (ProjectInfo)


info: ProjectInfo msg
info =
    { name = "CyTube-MMO"
    , briefDescription = "A proof-of-concept embeddable multiplayer game that doesn't require a server and allows for custom, user-created maps."
    , technologies = "JavaScript, WebSocket, Rollup.js"
    , imgs = 
        [ "resx/projects/cytubemmo/1.png"
        , "resx/projects/cytubemmo/2.png"
        ]
    , description =
        [ p []
            [ text ("A proof-of-concept embeddable multiplayer game that doesn't require a server and allows "
                ++"for custom, user-created maps.") ]
        , p []
            [ text ("Originally created in 2019 during a flash of inspiration, the game hijacks the cytube "
                ++"chatroom to allow users to play together without requiring them to set up their own servers. "
                ++"Pulling this off required some amount of reverse-engineering and working around the constraints "
                ++"imposed by CyTube, but within a day of work, the MVP was complete. The game is powered by "
                ++"a home-grown game engine. ") ]
        ]
    , links =
        [ a [ href "https://github.com/sleepycrow/cytube-mmo" ]
            [ text "Source Code >>" ]
        ]
    }


init: ProjectPageState
init =
    ProjectPageState Cytubemmo 0 (length (info.imgs))