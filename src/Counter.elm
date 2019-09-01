module App exposing (..)

import Browser
import Html
import Html.Events as Events


init : Int
init =
    0


type Msg
    = Increment
    | Decrement


update : Msg -> Int -> Int
update msg data =
    case msg of
        Increment ->
            data + 1

        Decrement ->
            data - 1


view : Int -> Html.Html Msg
view data =
    Html.div []
        [ Html.div []
            [ Html.text "Counter App" ]
        , Html.div []
            [ Html.text (String.fromInt data) ]
        , Html.button
            [ Events.onClick Increment ]
            [ Html.text "inc" ]
        , Html.button
            [ Events.onClick Decrement ]
            [ Html.text "dec" ]
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
