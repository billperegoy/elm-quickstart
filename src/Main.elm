module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Utils


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Flags =
    ()



-- Model


type alias Model =
    { name : String }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( Model "world", Cmd.none )



-- Update


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    h1 []
        [ text ("Hello " ++ (Utils.capitalize model.name)) ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
