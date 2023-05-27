port module Main exposing (main)

import Browser
import Html exposing (Html, div, span, img, text, section, header, canvas, sup, h1, h3, p, i, a, br, ul, li, footer)
import Html.Attributes exposing (class, id, style, height, href, src, target)
import Html.Events exposing (onClick, on)
import Projects exposing (Project, ProjectPageState, Project(..))
import ProjectUtils exposing (initProjectPage, getProjectInfo)
import Components.AboutMe
import Components.ProjectPage
import Json.Decode as Decode


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


-- PORTS
port heroWasLoaded: () -> Cmd msg


-- INIT
type alias Model =
    { page: Maybe ProjectPageState
    , loaded: Bool
    }

init: flags -> (Model, Cmd Msg)
init _ =
    ({page = Nothing, loaded = False}, Cmd.none)


-- UPDATE
type Msg
    = OpenProjectPage Project
    | CloseProjectPage
    | ChangeCurrentImg Int
    | HeroLoaded

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        OpenProjectPage proj ->
            ({ model | page = Just (initProjectPage proj)}, Cmd.none)
        
        CloseProjectPage ->
            ({ model | page = Nothing }, Cmd.none)
        
        ChangeCurrentImg offset ->
            case model.page of
                Just state ->
                    let
                        withOffset = state.currentImg + offset
                        nextImg =
                            (if withOffset < 0 then
                                (state.totalImgs - 1)
                            else if withOffset >= state.totalImgs then
                                0
                            else
                                withOffset)
                    in
                    ({ model | page = Just { state | currentImg = nextImg  }}, Cmd.none)
                Nothing ->
                    (model, Cmd.none)
        
        HeroLoaded ->
            ({ model | loaded = True }, heroWasLoaded ())


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


-- VIEW
view : Model -> Browser.Document Msg
view model =
    { title = (getPageTitle model)
    , body =
        [ header [ id "hero", class "hero" ]
            [ div [ class "hero__bg-img" ]
                [ img [ src "resx/bg.jpg", (on "load" (Decode.succeed HeroLoaded)) ] [] ]
            , div [ class "hero__bg-canvas" ]
                [ canvas [ id "grid", style "pointer-events" "none", height 540 ] [] ]
            , div [ id "hero-content", class (if model.loaded then "hero__content hero__content--visible" else "hero__content") ]
                [ h1 [] [ text "Z", sup [] [ text "Z", sup [] [ text "Z" ] ] ]
                , h3 [] [ text "Hi, I'm sleepycrow!" ]
                , p [] [ text "A full-stack developer based in Cracow. Let's work together!" ]
                ]
            ]
        
        , section [ class "about" ]
            [ header [] [ text "About Me"]
            , Components.AboutMe.render
            ]
        
        , section [ class "technologies" ]
            [ header [] [ text "What I Do"]
            , ul [ class "flex-technologies" ]
                (List.map renderTechnologyIcon
                    [ ("javascript-plain", "JavaScript")
                    , ("typescript-plain", "TypeScript")
                    , ("nodejs-plain", "Node.js")
                    , ("vuejs-plain", "Vue.js")
                    , ("html5-plain", "HTML5 & CSS3")
                    , ("php-plain", "PHP")
                    , ("mysql-plain", "MySQL")
                    , ("lua-plain", "Lua")
                    , ("react-original", "React.js")
                    , ("wordpress-plain", "Wordpress")
                    , ("woocommerce-plain", "WooCommerce")
                    , ("godot-plain", "Godot")
                    , ("git-plain", "git")
                    , ("linux-plain", "Linux")
                    ])
            ]
        
        , section [ class "projects" ]
            [ header [] [ text "Personal Projects & Experiments" ]
            , ul [ class "project-grid" ]
                (
                    (List.map renderProjectTile [Webshop, Cytubemmo, Rakbot, Unote, Quatro])
                    ++
                    [ a [ class "project project--more", href "https://github.com/sleepycrow", target "_blank" ]
                        [ h3 [] [ text "See more..." ] ] 
                    ]
                )
            ]
        
        , section [ class "projects" ]
            [ header [] [ text "Professional Experience" ]
            , ul [ class "project-grid" ]
                (List.map renderProjectTile [Ekartmagnesy])
            ] 
        
        , section [ class "contact" ]
            [ header [] [ text "Get In Touch!" ]
            , p []
                [ text "I am open for opportunites and would love to join your team!"
                , br [] []
                , text "Feel free to reach out to me by e-mail at "
                , a [ href "mailto:hello@sleepycrow.dev" ] [ text "hello@sleepycrow.dev" ]
                , text "."
                ]
            ]
        
        , footer []
            [ text "Made with 💕️ and 🍵️ and "
            , i [ class "devicon-elm-plain" ] []
            , text " in Poland by "
            , a [ href "https://github.com/sleepycrow", target "_blank" ] [ text "Daniel Romero/sleepycrow" ]
            ]
        
        , Components.ProjectPage.render CloseProjectPage ChangeCurrentImg model.page
        
        , div [ id "loading-overlay", class (if model.loaded then "loading-overlay loading-overlay--hidden" else "loading-overlay") ]
            [ p [] [ text "Z", sup [] [ text "Z", sup [] [ text "Z" ]]]]
        ]
    }


-- UTILS
getPageTitle: Model -> String
getPageTitle model =
    case model.page of
        Just state ->
            (getProjectInfo state.project).name ++ " • sleepycrow's Portfolio"
        Nothing ->
            "sleepycrow's Portfolio"


renderProjectTile: Project -> Html Msg
renderProjectTile project =
    let
        info = getProjectInfo project
    in
    li [ class "project", onClick (OpenProjectPage project) ]
        [ h3 [] [ text info.name ]
        , p [] [ text info.briefDescription ]
        , p [ class "project__tech" ] [ text info.technologies ]
        ]


renderTechnologyIcon: (String, String) -> Html Msg
renderTechnologyIcon (icon, name) =
    li []
        [ i [ class ("devicon-"++icon) ] []
        , span [] [ text name ]
        ]