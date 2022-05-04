module Components.Technologies exposing (..)

import Html exposing (Html, ul, li, i, span, text)
import Html.Attributes exposing (class)

render: Html msg 
render =
    ul [ class "flex-technologies" ]
        [ renderTechnology "javascript-plain" "JavaScript"
        , renderTechnology "nodejs-plain" "Node.js"
        , renderTechnology "vuejs-plain" "Vue.js"
        , renderTechnology "html5-plain" "HTML5 & CSS3"
        , renderTechnology "php-plain" "Node.js"
        , renderTechnology "mysql-plain" "MySQL"
        , renderTechnology "lua-plain" "Lua"
        , renderTechnology "python-plain" "Python"
        , renderTechnology "wordpress-plain" "Wordpress"
        , renderTechnology "woocommerce-plain" "WooCommerce"
        , renderTechnology "godot-plain" "Godot"
        , renderTechnology "git-plain" "git"
        , renderTechnology "linux-plain" "Linux"
        ]


renderTechnology: String -> String -> Html msg
renderTechnology icon name =
    li []
        [ i [ class ("devicon-"++icon) ] []
        , span [] [ text name ]
        ]