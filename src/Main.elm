module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Utils


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    { contacts : List Contact }


type alias Contact =
    { firstName : String
    , lastName : Maybe String
    , title : Maybe String
    , company : Maybe String
    , email : String
    , lists : List EmailList
    , phone : List Phone
    , customFields : List CustomField
    , tags : List Tag
    , state : ContactState
    }


simpleContact : String -> String -> Contact
simpleContact firstName email =
    { firstName = firstName
    , lastName = Nothing
    , title = Nothing
    , company = Nothing
    , email = email
    , lists = []
    , phone = []
    , customFields = []
    , tags = []
    , state = NotSet
    }


type ContactState
    = NotSet
    | TempHold
    | PendingConfirmation
    | Implicit
    | Explicit
    | OptOut
    | Deprecated
    | Active


type alias EmailList =
    { name : String
    }


type alias Phone =
    { kind : PhoneType
    , number : String
    }


type PhoneType
    = Home
    | Work
    | Mobile
    | Fax
    | Other


type CustomField
    = Website String
    | Twitter String
    | Facebook String
    | Google String
    | Flickr String
    | Custom String String


type alias Tag =
    { name : String }


init : ( Model, Cmd Msg )
init =
    { contacts =
        [ simpleContact "Jay" "jay@mydomain.com"
        , simpleContact "Jim" "jim@james.com"
        ]
    }
        ! []


type ContactFilterType
    = ContactActive
    | ContactUnsubscribed



-- Update


type Msg
    = FilterByState ContactFilterType
    | FilterByList String
    | FilterByTag String
      --
    | UpdateSearchString String
    | Search
    | ShowAdvancedSearchModal
      --
    | ShowAddListModal
    | AddNewList String
    | ShowListMenu
    | ShowRenameListModal
    | ShowDeleteListModal
    | DeleteList String
    | DeleteListAndContacts
    | UpdateListName String String
      --
    | ShowAddTagModal
    | AddNewTag String
    | ShowTagMenu
    | ShowRanmeTagModal
    | ShowDeleteTagModal
    | DeleteTag String
    | DeleteTagAndContacts
    | UpdateTagName String String
      --
    | SelectContact
    | SelectAllContacts
    | AddContactToLists
    | RemoveContactFromLists
      --
    | ShowManageTagsModal
    | SelectTag
    | SearchForTag
    | CreateNewTag
    | SaveContactTagChanges
      --
    | ShowQuickSendModal
    | DeleteContact
      --
    | AddSingleContact
    | AddMultipleContacts
    | UploadContacts
    | ImportContacts


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            model ! []



-- View


view : Model -> Html Msg
view model =
    ul []
        (List.map
            (\contact -> li [] [ text contact.firstName ])
            model.contacts
        )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
