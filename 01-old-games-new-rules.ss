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

(car                                           ;
  (cons (equal (cons x y) (cons x y))          ; 't
    '(and crumpets)))                          ;

(equal (cons x y) (cons 'bagels '(and lox)))   ; depends on x y

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                           The Law of Dethm (initial)                       ;;
;;                                                                            ;;
;;                                                                            ;;
;; For any theorem (dethm name (x1 ... xn) bodyx), the variables x1 ... xn    ;;
;; in bodyx can be replaced with any corresponding expressions e1 ... en.     ;;
;; The result, bodye, can be used to rewrite a focus p to become q provided   ;;
;; body e is either (equal p q) or (equal q p).                               ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

