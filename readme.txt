This repository contains all the code examples from "The Little Prover" book.
The Little Prover teaches the readers how to determine facts about recursive
functions using induction. The book starts with programming concepts such as
recursive functions and lists, and leads the reader along the shortest path
to inductive proofs.

If you're interested, get the book from Amazon: http://amzn.to/1I4JnqC

While working through this book, you'll need j-bob, the proof assistant:

https://github.com/the-little-prover/j-bob

The code examples were copied (and completed where necessary) from
"The Little Prover" by Peteris Krumins (peter@catonmat.net).

His blog is at http://www.catonmat.net -- good coders code, great coders reuse

------------------------------------------------------------------------------

Table of contents:
    [01] Chapter  1: Old Games, New Rules
         01-old-games-new-rules.ss
    [02] Chapter  2: Even Older Games
         02-even-older-games.ss

[01]-Chapter-1-Old-Games-New-Rules--------------------------------------------

See 01-old-games-new-rules.ss file for code examples.

Chapter 1 introduces axioms and theorems. An axiom is a basic assumption that
is presumed to be true. A theorem is an expression that is always true. Axioms
are theorems that are assumed to be true, whereas other theorems must be shown
to be true.

.------------------------------------.
| The Axioms of Cons (initial)       |
`------------------------------------'
|                                    |
| (dethm atom/cons (x y)             |
|  (equal (atom (cons x y)) 'nil))   |
|                                    |
| (dethm car/cons (x y)              |
|  (equal (car (cons x y)) x))       |
|                                    |
| (dethm cdr/cons (x y)              |
|  (equal (cdr (cons x y)) y))       |
|                                    |
`------------------------------------'

.------------------------------------.
| The Axioms of Equal (initial)      |
`------------------------------------'
|                                    |
| (dethm equal-same (x)              |
|   (equal (equal x x) 't))          |
|                                    |
| (dethm equal-swap (x y)            |
|   (equal (equal x y) (equal y x))) |
|                                    |
`------------------------------------'

What does dethm mean? It means define a theorem.

.---------------------------------------------------------------------------.
| The Law of Dethm (initial)                                                |
`---------------------------------------------------------------------------.
|                                                                           |
| For any theorem (dethm name (x1 ... xn) bodyx), the variables x1 ... xn   |
| in bodyx can be replaced with any corresponding expressions e1 ... en.    |
| The result, bodye, can be used to rewrite a focus p to become q provided  |
| body e is either (equal p q) or (equal q p).                              |
|                                                                           |
`---------------------------------------------------------------------------'

[02]-Chapter-2-Even-Older-Games-----------------------------------------------

.------------------------------------.
| The Axioms of If (initial)         |
`------------------------------------'
|                                    |
| (dethm if-true (x y)               |
|   (equal (if 't x y) x))           |
|                                    |
| (dethm if-false (x y)              |
|   (equal (if 'nil x y) y))         |
|                                    |
| (dethm if-same (x y)               |
|   (equal (if x y y) y))            |
|                                    |
`------------------------------------'

.------------------------------------.
| The Axioms of Equal (final)        |
`------------------------------------'
|                                    |
| (dethm equal-same (x)              |
|   (equal (equal x x) 't))          |
|                                    |
| (dethm equal-swap (x y)            |
|   (equal (equal x y) (equal y x))) |
|                                    |
| (dethm equal-if (x y)              |
|   (if (equal x y) (equal y x) 't)) |
|                                    |
`------------------------------------'

