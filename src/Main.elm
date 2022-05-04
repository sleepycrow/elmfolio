module Main exposing (main)

import Browser
import Html exposing (Html, div, img, text, section, header, canvas, sup, h1, h3, p, i, a, br, footer)
import Html.Attributes exposing (class, id, style, height, href)
import Projects exposing (Project, ProjectPageState, Project(..))
import ProjectUtils exposing (initProjectPage, getProjectInfo)
import Components.AboutMe
import Components.ProjectGrid
import Components.ProjectPage
import Components.Technologies


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


-- INIT
type alias Model = Maybe ProjectPageState

init: flags -> (Model, Cmd Msg)
init _ =
    (Nothing, Cmd.none)


-- UPDATE
type Msg
    = OpenProjectPage Project
    | CloseProjectPage

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        OpenProjectPage proj ->
            (Just (initProjectPage proj), Cmd.none)
        
        CloseProjectPage ->
            (Nothing, Cmd.none)


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


-- VIEW
view : Model -> Browser.Document Msg
view model =
    { title = (getPageTitle model)
    , body =
        [ header [ class "hero" ]
            [ div [ class "hero__bg-canvas" ]
                [ canvas [ id "grid", style "pointer-events" "none", height 540 ] [] ]
            , div [ id "hero-content", class "hero__content" ]
                [ h1 [] [ text "Z", sup [] [ text "Z", sup [] [ text "Z" ] ] ]
                , h3 [] [ text "Hi, I'm Daniel Romero!" ]
                , p [] [ text "A full-stack developer based in Cracow. Let's work together!" ]
                ]
            ]
        
        , section [ class "about" ]
            [ header [] [ text "About Me"]
            , Components.AboutMe.render
            ]
        
        , section [ class "technologies" ]
            [ header [] [ text "What I Do"]
            , Components.Technologies.render
            ]
        
        , section [ class "projects" ]
            [ header [] [ text "Personal Projects & Experiments" ]
            , Components.ProjectGrid.render
                OpenProjectPage
                [ Webshop, Cytubemmo ]
            ]
        
        , section [ class "contact" ]
            [ header [] [ text "Get In Touch!" ]
            , p []
                [ text "I am open for opportunites and would love to join your team!"
                , br [] []
                , text "Feel free to reach out to me by e-mail at "
                , a [ href "mailto:hello@sleepycrow.one" ] [ text "hello@sleepycrow.one" ]
                , text "."
                ]
            ]
        
        , footer []
            [ text "Made with 💕️ and 🍵️ and "
            , i [ class "devicon-elm-plain" ] []
            , text " in Poland by "
            , a [ href "https://github.com/sleepycrow" ] [ text "Daniel Romero/sleepycrow" ]
            ]
        
        , Components.ProjectPage.render CloseProjectPage model
        ]
    }


-- UTILS
getPageTitle: Model -> String
getPageTitle model =
    case model of
        Just state ->
            (getProjectInfo state.project).name ++ " • sleepycrow's Portfolio"
        Nothing ->
            "sleepycrow's Portfolio"