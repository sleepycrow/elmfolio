module ProjectUtils exposing (..)

import Projects exposing (Project)
import Projects exposing (Project(..))
import Projects.Webshop
import Projects.Cytubemmo
import Projects exposing (ProjectPageState)
import Projects exposing (ProjectInfo)


initProjectPage: Project -> ProjectPageState
initProjectPage proj =
    case proj of
        Webshop ->
            Projects.Webshop.init
        Cytubemmo ->
            Projects.Cytubemmo.init
        _ ->
            ProjectPageState Webshop 0 0 -- FIXME: REMOVE BEFORE RELEASE


getProjectInfo: Project -> ProjectInfo msg
getProjectInfo proj =
    case proj of
        Webshop ->
            Projects.Webshop.info
        Cytubemmo ->
            Projects.Cytubemmo.info
        _ ->
            ProjectInfo "borked" "borked" "borked" [] [] [] -- FIXME: REMOVE BEFORE RELEASE