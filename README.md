## Introduction

A command-line text adventure game where you win when you wake the wizard up. This can be served over the web using [simple-web-server](https://github.com/shaaza/simple-web-server).

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


## Modifications
Many modifications were made based on my learning and changing preferences over time. Three definite sources that primarily influenced these changes were:
* The Systematic Program Design (MOOC on edX) by Prof. Gregor Kiczales at UBC
* The Introduction to Game Design (MOOC on edX) by Prof. Philip Tan and Prof. Sarah Verilli at MIT
* Structure and Interpretation of Computer Programs (book) by Gerald Sussman and Hal Abelson

#### Code Changes
Restructured with increased modularity with future refactoring of each module in mind. For e.g., separating the scene rendering code permits one to render via web, native 3D graphics etc. without changing the other sections.

#### Game Mechanics
Added new UI actions, and a few changes are yet to come.
