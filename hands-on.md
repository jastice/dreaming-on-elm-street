# Dreaming on Elm Street: Hand-on Session

You can start programming in Elm without any installation. Have a look at the [examples](http://elm-lang.org/Examples.elm) or go straight to [http://elm-lang.org/try](http://elm-lang.org/try).

Elm has a fairly small set of default imports. For these exercises, add this set of imports at the top of your code:

    import Graphics.Collage (..)
    import Graphics.Element (..)
    import Color (..)
    import Time
    import Signal
    import Signal ((<~),(~))
    import Mouse

# Get acquainted

Have a look at [the examples](http://elm-lang.org/Examples.elm).

See the [syntax reference](http://elm-lang.org/learn/Syntax.elm).


# Draw Stuff

Draw a circle. Draw another. Fill them with color. Draw a whole caterpillar!

You will need:

* [Graphics.Collage](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Graphics-)Collage
* [Color](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Color)
* [`circle`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Graphics-Collage#circle)
* [`filled`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Graphics-Collage#filled)
* [`collage`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Graphics-Collage#collage)


# Moving Things

Group your caterpillar. Make it follow the mouse cursor

You will need:
* [`group`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Graphics-Collage#group)
* [`Mouse.position`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Mouse#position)
* [`Signal.map` or `<~`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Signal#map)


# Passing Time

Your caterpillar is probably a bit rigid. Make the segments move in a wave-form.

You will need:
* [The Basics](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Basics)
* [`Time.every`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Time#every)


# Folding Time

The caterpillar wants to move on its own. Help it move in a straight line.
It will eventually fall off the screen. Tell it to turn around once it reaches the edge.
Try to retain the wave motion.

You will need:
* [`Signal.foldp`](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Signal#foldp)
* tuples or [records](http://elm-lang.org/learn/Syntax.elm#records)


# Advanced: My Little Pong

Install the [Elm Platform](http://elm-lang.org/Install.elm). Make a Pong game where the ponies Luna and Celestia pass a ball back and forth.

## Building blocks

* Luna and Celestia pngs and in-code objects
* a ball-type in-code object (circle)
* code to move them with keys
* a playing field


See also: http://elm-lang.org/blog/Pong.elm
My solution: https://github.com/jastice/my-little-pong