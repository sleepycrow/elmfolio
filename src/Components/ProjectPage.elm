module Components.ProjectPage exposing (render)

import Html exposing (Html, div, text, h1, p, button, li, ul, img)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import ProjectUtils exposing (getProjectInfo)
import Projects exposing (ProjectPageState)


render: msg -> (Int -> msg) -> Maybe ProjectPageState -> Html msg
render close changeCurrentImg pageState =
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
                    , (if state.totalImgs > 0 then
                        renderGallery changeCurrentImg info.imgs state.currentImg
                       else
                        div [] [])
                    , div [] (info.description)
                    , p [ class "project-page__meta" ] [ text ("Technologies used: "++info.technologies) ]
                    , ul [ class "project-page__meta" ]
                        (List.map
                            (\link -> (li [] [ link ]))
                            info.links)
                    ]
                , button [ class "overlay-close-btn", onClick close ] [ text "X" ]
                ]


renderGallery: (Int -> msg) -> List String -> Int -> Html msg
renderGallery changeCurrentImg imgs currentImg =
    div [ class "gallery" ]
        [ div [ class "gallery__main" ]
            (List.indexedMap (renderGalleryItem currentImg) imgs)
        , div [ class "gallery__nav" ]
            [ div [ class "gallery__left", onClick (changeCurrentImg -1) ] [ div [] [ text "<" ] ]
            , div [ class "gallery__right", onClick (changeCurrentImg 1) ] [ div [] [ text ">" ] ]
            ]
        ]


renderGalleryItem: Int -> Int -> String -> Html msg
renderGalleryItem currentImg id image =
    let
        classname = if id == currentImg then "gallery__active" else ""
    in
    img [ src image, class classname ] []