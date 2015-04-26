module BouncingPonies (slide,main) where

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (fps)
import Signal exposing ((<~), (~), foldp)
import Text
import List
import BoxesAndBubbles exposing (..)
import BoxesAndBubblesBodies exposing (..)

type alias Bouncy = Body {img: Form}

bounciness = 0.9
constgravity t = ((0,-0.2), (0,0)) -- constant downward gravity

luna = bubble 50 1 bounciness (300,300) (-10,0)
celestia = bubble 50 1 bounciness (-300,300) (30,5)
elm = box (150,150) (1/0) 1 (0,0) (0,0)

toBouncy url body = case body.shape of
  Box (wh,hh) -> 
    let w = round (wh*2)
        h = round (hh*2)
    in { body | img = image w h url |> toForm }
  Bubble r -> 
    let a =  round (r*2)
    in { body | img = image a a url |> toForm }

bound = List.map (toBouncy "../img/logo.svg") (bounds (750,750) 100 1 (0,0))
bodies = [
  toBouncy "../img/luna.png" luna ,
  toBouncy "../img/celestia.png" celestia,
  toBouncy "../img/logo.svg" elm
  ] ++ bound

drawBouncy: Bouncy -> Form
drawBouncy {pos,img} = move pos img

scene: List Bouncy -> Element
scene bodies = collage 800 800 <| List.map drawBouncy bodies

tick = constgravity <~ foldp (+) 0 (fps 40)

slide = scene <~ run bodies tick
main = slide