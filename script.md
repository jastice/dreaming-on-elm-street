# Unicorns on Elm Street

## Elm logo

> This talk is about Elm. But let's start with ...

## big type `JavaScript` animated

> JavaScript!

> so how would you program *this* in JavaScript?
> I mean, I don't really know, you tell me.


## O'Reilly JavaScript definitive guide cover

> You might be familiar with this big, fat book featuring a big fat animal on the cover.

> As this cover exemplifies, it's obviously big and ugly, but also a kind of magical unicorn --
if you look at it in a certain way.

> But what if we had a more pretty unicorn?
> One that can fly?

## _Nightmare_ from MLP

> This (former) Night-Mare and I am going to take you on a trip to Elm Street today.

## Ulmenstrasse

> Since we're in Germany, it's of course called Ulmenstrasse
> I actually used to live on this street.

> We'll have to take a link...

## Baustelle

> Oh damn, it's still under construction!
> We better start building something

> Let's code up a street and put in our Night-Mare
> (I actually used to live on Elm Street)

## Some concepts

* main
* Element
* Form
    * Path
* Collage
* images

## Ulmenstrasse

> Let's have Princess Luna move ...
> And put her back into Elm Street
> You see, we'll have to change the scene to take Luna as a parameter

* bind Luna's position to mouse x position signal -> Luna signal!

## What just happened?

## <radio symbol>

## Signals!

* the only way to get outside input in elm
* the type reflects this

* mapping a function onto a signal transforms your signal
* but never ever do you get a non-signal value from a signal
* it's a good idea to "stay pure" as much as you can

## Folding the past

## Ulmenstrasse 3

> So it's a bit hard moving Luna by hand, I want her to move on her own
> For this I'll use the fps signal, which just produces milliseconds with whatever frequency I choose

Luna walking in circles

## foldp signature

> This is the only way to keep state in Elm, and it's all you need.
> Your current state is simply a transition from the previous state.
> All you need to make this transition is a function.

## De Lorian

### Time traveling Debugger

* boxes and bubbles: bouncing ponies
* roll back time "braid for free!"


## Resources

* Website: elm-lang.org
* Try it! elm-lang.org/try
* Install the toolchain: github.com/elm-lang/elm-platform

* This presentation: github.com/jastice/dreaming-on-elm-street
