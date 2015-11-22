;
; Chapter 1 of The Little Prover
; Old Games, New Rules
;
; Code examples assemled by Peteris Krumins (peter@catonmat.net).
; His blog is at http://www.catonmat.net - good coders code, great coders reuse.
;
; Get yourself this wonderful book at Amazon: http://amzn.to/1I4JnqC
;

; Salutations

't ; for true
'nul ; for everything else

(car (cons 'ham '(eggs)))               ; 'ham
(car (cons 'ham '(cheese)))             ; also 'ham
(car (cdr (cons 'eggs '(ham))))         ; still 'ham
(car (cons (car '(ham)) '(eggs)))       ; yup 'ham

(atom '())                              ; 't
(atom (cons 'ham '(eggs)))              ; 'nil

(atom (cons a b))                       ; 'nil for any a, b

(equal 'flapjack (atom (cons a b)))     ; 'f
(equal 'flapjack 'nil)                  ; 'f

(atom (cdr (cons (car (cons p q)) '())))    ; ?
(atom (cdr (cons (p '())))                  ; ?
(atom '())                                  ; 't

(atom (cdr (cons (car (cons p q)) '())))    ; ?
(atom '())                                  ; 't

; four axioms

(atom (cons a b))                   ; always equal to 'nil
(car (cons x y))                    ; always equal to x
(cdr (cons (car (cons x y)) '()))   ; always equal to '()
(cdr (cons x '()))                  ; always equal to '()

; actually three axioms

(atom (cons a b))                   ; always equal to 'nil
(car (cons x y))                    ; always equal to x
(cdr (cons x y))                    ; always equal to y

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                        The Axioms of Cons (initial)                        ;;
;;                                                                            ;;
;;                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   ;;
;;                   ; (dethm atom/cons (x y)             ;                   ;;
;;                   ;    (equal (atom (cons x y)) 'nil)) ;                   ;;
;;                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   ;;
;;                                                                            ;;
;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;
;;    ; (dethm car/cons (x y)        ;    ; (dethm cdr/cons (x y)        ;    ;;
;;    ;  (equal (car (cons x y)) x)) ;    ;  (equal (cdr (cons x y)) y)) ;    ;;
;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(equal 'eggs '(ham))                            ; 'nil

(car (cons (equal (cons x y) (cons x y)) '(and crumpets)))  ; ?
(car (cons 't '(and crumpets)))                             ; ?
(car '(t and crumpets))                                     ; 't

(equal (cons x y) (cons 'bagels '(and lox)))    ; depends on x y

; these are equal

(equal (cons x y) (cons 'bagels '(and lox)))
(equal (cons 'bagels '(and lox)) (cons x y))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                        The Axioms of Equal (initial)                       ;;
;;                                                                            ;;
;;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;
;;   ; (dethm equal-same (x)    ;    ; (dethm equal-swap (x)             ;    ;;
;;   ;  (equal (equal x x) 't)) ;    ;  (equal (equal x y) (equal y x))) ;    ;;
;;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cons y (equal (car (cons (cdr x) (car y))) (equal (atom x) 'nil)))     ; ?
(cons y (equal (cdr x) (equal (atom x) 'nil)))                          ; ?

; is equal to works in both directions

(cons y (equal (car (cons (car (cons (cdr x) (car y))) '(oats))) (equal (atom x) 'nil)))
(cons y (equal (car (cons (car (cons (cdr x) (car y))) '(oats))) (equal (atom x) (atom (cons (atom (cdr (cons a b))) (equal (cons a b) c))))))
(cons y (equal (car (cons (car (cons (cdr x) (car y))) '(oats))) (equal (atom x) (atom (cons (atom b) (equal (cons a b) c)))))) 
(cons y (equal (car (cons (car (cons (cdr x) (car y))) '(oats))) (equal (atom x) (atom (cons (atom b) (equal c (cons a b)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                           The Law of Dethm (initial)                       ;;
;;                                                                            ;;
;;                                                                            ;;
;; For any theorem (dethm name (x1 ... xn) bodyx), the variables x1 ... xn    ;;
;; in bodyx can be replaced with any corresponding expressions e1 ... en.     ;;
;; The result, bodye, can be used to rewrite a focus p to become q provided   ;;
;; bodye is either (equal p q) or (equal q p).                                ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(dethm car/cons (x y)                   ; name is car/cons
  (equal (car (cons x y)) x))           ; x1, x2 are x, y
                                        ; bodyx is (equal (car (cons x y)) x)

(atom (car (cons (car a) (cdr b))))     ; e1 is (car a)
                                        ; e2 is (car b)

; bodye

; let's fortify ourselves with two helpings of our favorite breakfast

