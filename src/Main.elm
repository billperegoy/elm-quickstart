import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)

main : Program Never
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


type alias Model = 
  { name : String }

init : (Model, Cmd Msg)
init =
  (Model "world", Cmd.none)

type Msg 
  = NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)

view : Model ->  Html Msg
view model =
  div []
    [ text ("Hello " ++ model.name)]


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
