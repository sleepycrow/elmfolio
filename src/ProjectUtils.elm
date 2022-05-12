module ProjectUtils exposing (..)

import Projects exposing (Project)
import Projects exposing (Project(..))
import Projects.Webshop
import Projects.Cytubemmo
import Projects exposing (ProjectPageState)
import Projects exposing (ProjectInfo)
import Projects.Rakbot
import Projects.Unote
import Projects.Quatro
import Projects.Ekartmagnesy


initProjectPage: Project -> ProjectPageState
initProjectPage proj =
    case proj of
        Webshop ->
            Projects.Webshop.init
        Cytubemmo ->
            Projects.Cytubemmo.init
        Rakbot ->
            Projects.Rakbot.init
        Unote ->
            Projects.Unote.init
        Quatro ->
            Projects.Quatro.init
        Ekartmagnesy ->
            Projects.Ekartmagnesy.init
        --_ ->
        --    ProjectPageState Webshop 0 0 -- FIXME: REMOVE BEFORE RELEASE


getProjectInfo: Project -> ProjectInfo msg
getProjectInfo proj =
    case proj of
        Webshop ->
            Projects.Webshop.info
        Cytubemmo ->
            Projects.Cytubemmo.info
        Rakbot ->
            Projects.Rakbot.info
        Unote ->
            Projects.Unote.info
        Quatro ->
            Projects.Quatro.info
        Ekartmagnesy ->
            Projects.Ekartmagnesy.info
        --_ ->
        --    ProjectInfo "borked" "borked" "borked" [] [] [] -- FIXME: REMOVE BEFORE RELEASE