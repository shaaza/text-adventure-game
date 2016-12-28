## Introduction

A command-line text adventure game where you win when you wake the wizard up. This can be served over the web using [simple-web-server](https://github.com/shaaza/simple-web-server) (in progress) and the  [xml-generator](https://github.com/shaaza/xml-generator) macro.

## How to Run the Game
1. If you haven't already, install CLISP.
2. From your command-line interface (Terminal for Mac OSX), run 'clisp game.lsp'

## Instructions

The following commands are valid:

```
1. look - examine your environment
2. walk @direction - where @direction is east, west, upstairs, downstairs. e.g.: walk west
3. pickup @object - pickup an object, where @object is the name of any object. e.g.: pickup bucket
4. inventory - view the objects you are carrying
```


## Article
[Architecting a Text Adventure Game](https://medium.com/@shaaz_a/architecting-a-text-adventure-game-2e0dc4d49812#.shi6wh4m1): My blog post on Medium that explains the architecture of this simple game.
