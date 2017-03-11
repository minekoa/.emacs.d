;;; -*- Coding: iso-2022-7bit -*-
(require 'generic-x)

(define-generic-mode kml-foo-mode
  ;; 1. comment-list
  '( 
     ("@[-" . "-]")
;     ("@{-" . "-}") ;; 複数組は成立しない
;     ("@(-" . "-)")
     )

  ;; 2. keyword-list
  '("state" "transition" "inherits" "invariant" "post" "when" "target" "verify" "check" "prepare"
    "var" "let" "in" "exists" "forall" "if" "else" "then" "case" "of" "type" "chan" "given")

  ;; 3. font-lock-list
  '(
    ("//.*$"    . font-lock-comment-face)
    ("@--.*$"   . font-lock-comment-face)
;;    ("@\\[-[.\\n]*-\\]"   . font-lock-comment-face)
    ("@(-.*-)"   . font-lock-comment-face)
    ("@(.*)"   . font-lock-comment-face)
    ("@{-.*-}"   . font-lock-comment-face)
    ("[0-9][\\.0-9]*"   . font-lock-constant-face)
    ("\\s-[A-Z][a-zA-Z0-9_]*" . font-lock-type-face)
    ("\\s-[a-z][a-zA-Z0-9_]*'" . font-lock-variable-name-face)
    ("<-"       . font-lock-builtin-face)
    ("-->"      . font-lock-builtin-face)
    ("->"       . font-lock-builtin-face)
    ("&&"       . font-lock-builtin-face)
    ("&"        . font-lock-builtin-face)
    ("#"        . font-lock-builtin-face)
    ("\\^"      . font-lock-builtin-face)
    ("::"       . font-lock-builtin-face)
    ("++"       . font-lock-builtin-face)
    ("[||]"     . font-lock-builtin-face)
    ("||"       . font-lock-builtin-face)
    ("|->"      . font-lock-builtin-face)
    ("="        . font-lock-builtin-face)
    ("!="       . font-lock-builtin-face)
    ("!"        . font-lock-builtin-face)
    ("?"        . font-lock-builtin-face)
    )

  ;; 4. auto-mode-list
  '("\\.kml$")

  ;; 5. hook functions
  ;;'(hideshowvis-enable)
  nil

  ;; 6. docstring
  "Major mode for KML")

