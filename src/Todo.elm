module Todo exposing (..)

import Browser
import Html
import Html.Attributes as Attr
import Html.Events as Events


type alias Model =
    { todos : List String
    , newTodoText : String
    }


init : Model
init =
    { todos = []
    , newTodoText = ""
    }


type Msg
    = AddNewTodo
    | UpdateNewTodoText String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddNewTodo ->
            { model
                | newTodoText = ""
                , todos =
                    model.todos
                        ++ List.singleton model.newTodoText
            }

        UpdateNewTodoText text ->
            { model | newTodoText = text }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.div []
            [ Html.input
                [ Events.onInput UpdateNewTodoText
                , Attr.value model.newTodoText
                ]
                []
            , Html.button
                [ Events.onMouseUp AddNewTodo ]
                [ Html.text "Add" ]
            ]
        , Html.div []
            (List.map
                (\todo ->
                    Html.div []
                        [ Html.text todo ]
                )
                model.todos
            )
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
