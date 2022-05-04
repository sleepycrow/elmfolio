module Components.AboutMe exposing (..)

import Html exposing (Html, div, text, img, strong, p, a)
import Html.Attributes exposing (class, src, alt, title, href)
import Markdown


render: Html msg 
render =
    div [ class "deco-table deco-table--about" ]
        [ div [ class "deco-table__left deco-table__decoration" ]
            [ img [ src "resx/white_crow.png", alt "A stylized drawing of a crow.", title "A stylized drawing of a crow." ] [] ]
        , div [ class "deco-table__right deco-table__content" ]
            [ div []
                [ p [] [ strong [] [ text "Cześć!" ] ]
                , p []
                    [ Markdown.toHtml [] ("I am Daniel Romero, a passionate developer with a keen eye for aesthetics and usability. "
                        ++"I am primarily a _web_ developer, having started creating websites in **PHP** back in primary school. "
                        ++"Currently, I primarily write **JavaScript** and am very familiar with its ecosystem, as well as many of its "
                        ++"most commonly used frameworks, conventions and best practices. "
                        ++"Additionally, I also have experience writing **Python**, **Lua** and **C/C++**.") ]
                , p []
                    [ text ("I am highly adaptable and love solving problems, whether that takes reading up on documentation, picking up a lesson "++
                        "in a framework I'm not familiar with yet or figuring out undocumented code.") ]
                , p []
                    [ a [ href "files/cv_en.pdf" ] [ text "Download my CV (pdf)" ] ]
                ]
            ]
        ]