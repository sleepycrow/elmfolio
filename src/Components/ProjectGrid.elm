module Components.ProjectGrid exposing (render)

import Projects exposing (Project)
import Html exposing (Html, ul, text, li, h3, p)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import ProjectUtils exposing (getProjectInfo)


render: (Project -> msg) -> List Project -> Html msg 
render open projects =
    ul [ class "project-grid" ]
        ( List.map (renderSingleTile open) projects )


renderSingleTile: (Project -> msg) -> Project -> Html msg
renderSingleTile open proj =
    let
        info = getProjectInfo proj
    in
    li [ class "project", onClick (open proj) ]
        [ h3 [] [ text info.name ]
        , p [] [ text info.briefDescription ]
        , p [ class "project__tech" ] [ text info.technologies ]
        ]