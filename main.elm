module Main exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (style)
import List


main : Html a
main =
    view
        [ ( "red", "white", "super" )
        , ( "dodgerblue", "black", "soup" )
        , ( "purple", "yellow", "happy trails" )
        , ( "yellow", "brown", "daruma" )
        , ( "black", "white", "b/w" )
        , ( "beige", "brown", "banana" )
        ]



-- style attribute helper


(=>) : a -> b -> ( a, b )
(=>) =
    (,)



-- Note ¥ not supported as backslash in atom
-- Use alt-¥ for \
-- type alias Count =
--      { count: Int }
-- debug.log "divComp: "
--view : List ( String, String, String ) -> Html msg


view : List ( String, String, String ) -> Html msg



--  Written either as a function or using lambda notation work without issue
-- However Atom Dev editor does not support japanese ¥ as backslash character
{--
view tuple =
    let
        divComp ( bkgndcolor, txtcolor, newtxt ) =
            div
                [ style
                    [ Debug.log "style:bkgndcolor: " ("background-color" => bkgndcolor)
                    , Debug.log "style:color" ("color" => txtcolor)
                    ]
                ]
                [ Html.text <| Debug.log "style:text :" newtxt ]
    in
        div [ style [ "padding" => "20px", "text-align" => "center" ] ]
            (List.map divComp (Debug.log "tuple list: " tuple))

--}


view tuple =
    let
        {--div Html Component helper function
            Args:
                  @bkgndcolor   background-color  style attribute
                  @txtcolor     color             style attribute
                  @divtxt       text              text to be viewed
            Returns:
                  Html msg
        --}
        divComp =
            (\( bkgndcolor, txtcolor, divtxt ) ->
                div
                    [ style
                        [ Debug.log "style:bkgndcolor: " ("background-color" => bkgndcolor)
                        , Debug.log "style:color" ("color" => txtcolor)
                        ]
                    ]
                    [ Html.text <| Debug.log "style:text :" divtxt ]
            )
    in
        div [ style [ "padding" => "20px", "text-align" => "center" ] ]
            (List.map divComp (Debug.log "tuple list: " tuple))



{-
    Outputs:

    <div style="padding: 20px; text-align: center;">
        <div style="background-color: red; color: white;">super</div>
        <div style="background-color: dodgerblue; color: black;">soup</div>
        <div style="background-color: purple; color: yellow;">happy trails</div>
        <div style="background-color: yellow; color: brown;">daruma</div>
        <div style="background-color: black; color: white;">b/w</div>
        <div style="background-color: beige; color: brown;">banana</div>
   </div>

-}
