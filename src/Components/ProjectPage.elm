module Components.ProjectPage exposing (render)

import Html exposing (Html, div, text, h1, p, button, li, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import ProjectUtils exposing (getProjectInfo)
import Projects exposing (ProjectPageState)


render: msg -> Maybe ProjectPageState -> Html msg
render close pageState =
    case pageState of
        Nothing ->
            div [ class "overlay-modal" ]
                []
        Just state ->
            let
                info = getProjectInfo state.project
            in
            div [ class "overlay-modal overlay-modal--visible" ]
                [ div [ class "project-page" ]
                    [ h1 [] [ text info.name ]
                    , div [] (info.description)
                    , p [ class "project-page__meta" ] [ text ("Technologies used: "++info.technologies) ]
                    , ul [ class "project-page__meta" ]
                        (List.map
                            (\link -> (li [] [ link ]))
                            info.links)
                    ]
                , button [ class "overlay-close-btn", onClick close ] [ text "X" ]
                ]