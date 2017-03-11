;;; -*- Coding: iso-2022-7bit -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic setting

;; load-path $B$rDL$9(B
(add-to-list 'load-path "~/.emacs.d/elisp")

;; $BF|K\8l$r%G%U%)%k%H$K$9$k(B
;(set-language-environment "Japanese")

;; $B3F<oJ8;z%3!<%I;XDj(B
;(prefer-coding-system 'utf-8-unix)           ; $B%U%!%$%k$N?75,:n@.;~$K;HMQ$9$k(Bencoding
;(set-default-coding-systems 'euc-japan)
;(set-terminal-coding-system 'utf-8)          ;
;(set-buffer-file-coding-system 'euc-japan)

;; $B%G%U%)%k%H%U%l!<%`%Q%i%a!<%?(B
(setq default-frame-alist
      (append (list 
	       ;;size
	       '(width . 100)
	       '(height . 40)

	       ;; curssor
;	       '(cursor-type . heirline-caret)
;	       '(cursor-height . 4) ; height is n/4 of char
;	       '(cursor-color . "white")

	       ;;fount
	       ;; (frame-parameter nil 'font) $B$7$FF@$i$l$?J8;zNs$r@_Dj(B
	       '(font . "-unknown-VL $B%4%7%C%/(B-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1")
	       )
	      default-frame-alist))


;;; package installer $B$N=`Hw(B
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages"))

;;; Backup-files
(setq backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*\$" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))


;;; $B8-$$%P%C%U%!%j%9%H(B
(global-set-key "\C-x\C-b" 'bs-show)  ;buffer selection (bs-show) $B$K:9$7BX$((B
(global-set-key [?\C-\.] 'bs-cycle-next)            ;$B%P%C%U%!$N=[4D@ZBX$((B ($B?J$`(B)
(global-set-key [?\C-\,] 'bs-cycle-previous)        ;$B%P%C%U%!$N=[4D@ZBX$((B ($BLa$k(B)
(setq bs-default-configuration "files-and-scratch") ;files$B$K2C$((Bscratch$B$bI=<((B

    ;<memo> bs-show $B$N%3%^%s%I(B
    ;   C-u C-x C-b     $B%U%!%$%k0J30$bA4ItI=<($9$k(B
    ;   'C' <shift-c>   $B%U%#%k%?$NJQ99!#(BUse configuration: (file / all) $B$G@ZBX(B
    ;   'S' <shift-s>   $B%=!<%HJ}K!$rJQ99!#(B
    ;    k              $B%+!<%=%k9T$N$N%P%C%U%!!<$rJD$8$k(B(kill)
    ;    s              $B%+!<%=%k9T$N%P%C%U%!!<$rJ]B8$9$k(B(save)


;;; cua-mode
(cua-mode t)                     ;cua-mode$B$r:G=i$+$iM-8z$K$9$k(B
(setq cua-enable-cua-keys nil)   ;cua-mode $BFCM-$N$X$s$J%-!<%P%$%s%I$rL58z$K$9$k(B

    ;<memo> cua-mode $B$N%3%^%s%I(B
    ;   M-p     $B6k7A$NI}$r8GDj(B
    ;   M-b     $B6uGrJ8;z$GKd$a$k!#(B open-rectangle $B$HF1Ey(B
    ;   M-s     $BJ8;zNs$GCV$-49$($k!#(B string-rectangle $B$HF1Ey(B
    ;   M-f     1$B<oN`$NJ8;z$GKd$a$k!#(B string-rectangle $B$G(B1$BJ8;z;XDj$7$?$H$-$HF1Ey(B
    ;   M-i     $B6k7ANN0hFb$N?t;z$r%$%s%/%j%a%s%H$9$k(B
    ;   M-n     $B6k7ANN0h$rO"HV$GKd$a$k!#%U%)!<%^%C%H;XDj2D(B


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; $B$3$^$+$$%*%W%7%g%s(B

;; $B%m%42hLL$r$9$CHt$P$9(B
(setq inhibit-startup-message t)

;;; $B9T0\F0$G?7$7$$9T$rDI2C$7$J$$(B
(setq next-line-add-new-lines nil)

;;; $BM>7W$J2~9T$rF~$l$J$$(B
(put 'set-goal-column 'disabled nil)

;;; $BD9$$9T$G$b@^$jJV$5$J$$(B
(setq-default truncate-lines t)

;;; $B%j!<%8%g%s%O%$%i%$%H(B
(setq transient-mark-mode t)

;;; $B%D!<%k%P!<$rL58z$K$9$k(B
(tool-bar-mode 0)

;;; $B%S!<%W2;$r>C$9!J$+$o$j$K2hLL$,%U%i%C%7%e$9$k!K(B
;(setq visible-bell t)

;;; $B%?%V%*!<%@!<!J%G%U%)%k%H(B=4, shell-mode=8$B!K(B
(setq default-tub-width 4)
(add-hook 'shell-mode-hook
	  '(lambda () (setq tab-width 8)))

;; narrowing $B$rM-8z$K(B
(put 'narrow-to-region 'disabled nil)

;; $B%P%C%U%!Cf$N9THV9fI=<((B
(global-linum-mode t)

;; mode-line $B$K9THV9f$rI=<((B
(column-number-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key-bind (global)

;; C-h => backspace
(keyboard-translate ?\C-h ?\C-?)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $BF|K\8lF~NO(B

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; azik-anthy / anthy-azik.el
;;;  (anthy-azik.el >> http://www.koders.com/lisp/fidCAA0A0EF322B0E2783D5B410AEC8AD6523A5CC05.aspx?s=%22Ruby%22)

;; anthy.el $B$r%m!<%I=PMh$k$h$&$K$9$k!JI,MW$K1~$8$F!K(B
;(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)

;; anthy.el $B$r%m!<%I$9$k(B
;(load-library "anthy")

;; japanese-anthy $B$r%G%U%)%k%H$N(B input method $B$K$9$k(B
;(setq default-input-method "japanese-anthy")

;; anthy-elisp.el
;(load-library "anthy-azik")
;(anthy-azik-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; scim-bridge

;; scim-bridge.el
;(require 'scim-bridge)
;(add-hook 'after-init-hook 'scim-mode-on)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibus-el (ibus-mode)

;(require 'ibus)

;(add-hook 'after-init-hook 'ibus-mode-on)

;(ibus-define-common-key ?\C-\s nil) ; for emacs region-markup
;(ibus-define-common-key ?\C-/ nil)  ; for emacs undo

;; Change cursor color depending on IBus status
;(setq ibus-cursor-color '("limegreen" "white" "blue"))

;(global-set-key "\C-\\" 'ibus-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mozc-el

(require 'mozc)
(setq default-input-method "japanese-mozc")

(global-set-key "\C-\\" 'toggle-input-method)
;(global-set-key [zenkaku-hankaku] 'toggle-input-method)
(global-set-key "\M-`" 'toggle-input-method)
(global-set-key [M-escape] 'toggle-input-method)
(global-set-key "\C-j" 'toggle-input-method) ;; $B2,It$5$s$*$9$9$a(B

;; $BA43QH>3Q$G%H%0%k$9$k$H(B Wrong response server$B$,H/@8$9$kIT6q9g$X$N%O%C%/(B
;; $B85%M%?(B: http://d.hatena.ne.jp/kitokitoki/20110815/p3
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
(add-hook 'mozc-mode-hook
	  (lambda()
	    (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-theme 
;;   https://code.google.com/p/gnuemacscolorthemetest/
;;   $B?'8+K\(B:  http://sakito.jp/emacs/colortheme.html

(load "color-theme")
(color-theme-initialize)

;(color-theme-blue-sea)
;(color-theme-parus)

(defun color-theme-minekoa-blue ()
  "My defalut teme. based blue-sea theme by ZON."
  (interactive)
  (color-theme-install
   '(color-theme-minekoa-blue
     ((foreground-color . "lavender blush");floral white;gray
      (background-color . "MidnightBlue")
      (background-toolbar-color . "gray")
      (bottom-toolbar-shadow-color . "#79e77df779e7")
      (top-toolbar-shadow-color . "#fffffbeeffff")
      (background-mode . dark))
     (default ((t (nil))))
     (region ((t (:background "DarkSlateBlue"))))
     (underline ((t (:foreground "yellow" :underline t))))

     (modeline ((t (:foreground "wheat" :background "gray16"))))
     (mode-line-inactive ((t (:background "gray16" :foreground "wheat"))))
     (modeline-buffer-id ((t (:foreground "beige" :background "gray16"))))
     (modeline-mousable ((t (:foreground "light cyan" :background "slate blue"))))
     (modeline-mousable-minor-mode ((t (:foreground "wheat" :background "slate blue"))))

     (fringe ((t (:background "#100e4e" :foreground "gray"))))
;     (fringe ((t (:background "#10125e" :foreground "gray"))))

     (italic ((t (:foreground "dark red" :italic t))))
     (bold-italic ((t (:foreground "dark red" :bold t :italic t))))
     (font-lock-builtin-face ((t (:foreground "aquamarine"))))
     (font-lock-doc-string-face ((t (:foreground "sky blue"))))
     (font-lock-comment-face ((t (:foreground "light blue"))));powder blue;light blue
     (font-lock-function-name-face ((t (:bold t :foreground "aquamarine"))))
     (font-lock-keyword-face ((t (:foreground "pale turquoise" :bold t))))
     (font-lock-reference-face ((t (:foreground "pale green"))))
     (font-lock-constant-face ((t (:foreground "pale green"))))
     (font-lock-string-face ((t (:foreground "light sky blue"))))
     (font-lock-type-face ((t (:foreground "sky blue" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "turquoise" :bold t))))

     (svn-mark-face ((t (:background "cyan" :foreground "black"))))

     (elscreen-tab-background-face ((t (:foreground "wheat" :background "gray16"))))
     (elscreen-tab-control-face ((t (:foreground "LavenderBlush4" :background "gray16"))))
     (elscreen-tab-current-screen-face ((t (:foreground "wheat" :background "gray23"))))
     (elscreen-tab-other-screen-face ((t (:foreground "LavenderBlush4" :background "gray18"))))

     (bold ((t (:bold)))))))

;; $B%F!<%^$rE,MQ(B
(color-theme-minekoa-blue)

;; $B%^%&%9$G%]%$%s%H$7$F$$$k2U=j$N(B face $B$r<hF@$9$k(B
;; http://sakito.jp/emacs/colortheme.html
(defun describe-face-at-point ()
 (interactive)
 (message "%s" (get-char-property (point) 'face)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EOF$B$rI=<((B

(defface my-eof-face '((t (:foreground "#555588"))) nil)

(defun set-buffer-end-mark()
  (let ((overlay (make-overlay (point-max) (point-max))))
    (overlay-put overlay 'before-string #("[EOF]" 0 5 (face my-eof-face)))
    (overlay-put overlay 'insert-behind-hooks
		 '((lambda (overlay after beg end &optional len)
		     (when after
		       (move-overlay overlay (point-max) (point-max))))))))

(add-hook 'find-file-hooks 'set-buffer-end-mark)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elscreen
;;;
;;; melpa (http://melpa.org/packages/) $B$h$j(B
;;; M-x package-install elscreen $B$G!"%$%s%9%H!<%k(B

(load "elscreen")
(elscreen-start)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jaspace
;;;    http://homepage3.nifty.com/satomii/software/elisp.ja.html
(if t
    (progn
      ;; customize
      (setq jaspace-highlight-tabs ?^) ;$B%?%V$r(B^ $B$GCV$-49$($k>l9g(B(emacs22$B0J>e(B)
      (setq jaspace-alternate-eol-string "\xab\n")
    
      ;; font-face
      (custom-set-faces
       '(jaspace-highlight-eol-face ((t (:foreground "#555588"))))
       '(jaspace-highlight-tab-face ((t (:foreground "#555588"
					 :strike-throuth nil)))) ;tab $B$rJ8;z$GCV$-49$($F$$$k$H$-$O$3$A$i(B
       '(jaspace-highlight-jaspace-face ((t (:foreground "#555588"))))
       )

      ;; loading
      (require 'jaspace)
      ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; what-char ($BJ8;z%3!<%I$NI=<((B)
;;;    http://homepage3.nifty.com/satomii/software/elisp.ja.html
(load "what-char")
(what-char-add-to-mode-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gtags
(add-to-list 'load-path "/usr/local/share/gtags")

(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

(add-hook 'c++-mode-hook 'gtags-mode)
(add-hook 'c-mode-hook 'gtags-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cc-mode

(defun insert-c-style-comment ()
  "C-style comment (/**/) insert to this."
  (interactive)
  (progn
    (insert "/*  */")
    (backward-char 3)))

(setq-default c-basic-offset 4 ;;$B4pK\%$%s%G%s%HNL(B4
	      tab-width 4      ;;$B%?%VI}(B4
	      indent-tabs-mode nil)

(add-hook 'c++-mode-hook
	  '(lambda()
	     (local-set-key [?\C-\;] 'insert-c-style-comment)
;;	     (c-set-style "stroustrup") ; set Allman Style
	     (c-set-style "bsd") ; set Allman Style
	     (setq c-basic-offset 4)
	     (setq indent-tabs-mode nil)
	     ))
(add-hook 'c-mode-hook
	  '(lambda()
	     (local-set-key [?\C-\;] 'insert-c-style-comment)
;;	     (c-set-style "stroustrup") ; set Allman Style
	     (c-set-style "bsd") ; set Allman Style
	     (setq c-basic-offset 4)
	     (setq indent-tabs-mode nil)
	     ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tuareg-mode (ocaml)
;;    http://tuareg.forge.ocamlcore.org/
(add-to-list 'load-path "~/.elisp/tuareg-2.0.6")

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code." t)
(autoload 'tuareg-run-caml "tuareg" "startup a Caml toplevel" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger." t)

(add-to-list 'auto-mode-alist '("\\.ml[ilyp]?$" . tuareg-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang-mode
(setq load-path (cons "/usr/lib/erlang/lib/tools-2.8.6/emacs"
      load-path))
(setq erlang-root-dir "/usr/local/otp")
(setq exec-path (cons "/usr/local/otp/bin" exec-path))

(require 'erlang-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gdb

;;$BM-MQ$J%P%C%U%!$r3+$/%b!<%I(B
(setq gdb-many-windows t)

;;$B%^%&%9%*!<%P!<$GJQ?t$NCM$rI=<((B
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;;I/O$B%P%C%U%!$rI=<((B
(setq gdb-use-separate-io-buffer t)

;;minibuffer$B$KCM$rI=<($7$J$$(B
(setq gud-tooltip-echo-area nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smalltalk (gst)
(add-to-list 'load-path "~/local/share/emacs/site-lisp")

(autoload 'smalltalk-mode "smalltalk-mode.elc" "" t)
(autoload 'gst "gst-mode.elc" "" t)

(push '("\\.st\\'" . smalltalk-mode) auto-mode-alist)
;(push "\\.star\\'" inhibit-first-line-modes-regexps)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; W3M
;;;

;(require 'w3m-load)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dsvn

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit

;(require 'magit)
;(require 'magit-svn)
;;(require 'magit-stgit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; migemo
;;
;;   melpa (http://melpa.org/packages/) $B$h$j(B
;;   M-x package-install migemo $B$G%$%s%9%H!<%k(B

(load "migemo")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\a"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keisen
(load "keisen")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keisen-x-mode (minor-mode)
;;   keisen.el $B$r;H$C$F(B  C-$BLp0u(B $B$G7S@~$r=q$/(B 
;;   xyzzy$B$N(B box-drowings-mode $BIw(B $B%^%$%J!<%b!<%I(B($B>C$;$J$$$1$I(B)

;; $B%b!<%IJQ?t(B
(defvar keisen-x-mode nil
  "Non-nil means `keisen-x-mode' is enabled.")

;; $B%m!<%+%k%-!<%^%C%W(B
(defvar keisen-x-mode-map nil
  "$B7S@~%b!<%I$N%m!<%+%k%-!<%^%C%W(B")
(if keisen-x-mode-map
    nil
  (setq keisen-x-mode-map (make-sparse-keymap))
  (define-key keisen-x-mode-map [C-right] 'keisen-right-move)
  (define-key keisen-x-mode-map [C-left]  'keisen-left-move)
  (define-key keisen-x-mode-map [C-up]    'keisen-up-move)
  (define-key keisen-x-mode-map [C-down]  'keisen-down-move))

;; $B%b!<%I9TI=<((B
(if (not (assq 'keisen-x-mode minor-mode-alist))
    (setq minor-mode-alist
             (cons '(keisen-x-mode " Keisen")
              minor-mode-alist)))

;; $B%b!<%I4X?t(B
(defun keisen-x-mode (&optional arg)
  "Toggle `keisen-x-mode'."
  (interactive "P")

  ;; Toggle mode-variable
  (cond
   ((< (prefix-numeric-value arg) 0)             ; $B0z?t$,(B1$BL$K~$N?tCM$J$i5/F0$7$J$$(B
    (setq keisen-x-mode nil))
   (arg (setq keisen-x-mode t))                  ; $B2?$+$7$i$N0z?t$r$b$D$J$i$P5/F0(B
   (t (setq keisen-x-mode (not keisen-x-mode)))) ; symbol t $B$r0z?t$K$b$D$J$i$P%b!<%I$r5UE>!#(B

  ;; content$B!J6qBN=hM}!K(B
  (if keisen-x-mode
      (progn
	(use-local-map keisen-x-mode-map))
      nil)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kml-foo-mode

(load-library "hideshow")
(autoload 'kml-foo-mode "kml-foo-mode" "" t)
(add-hook 'kml-foo-mode-hook 'jaspace-mode)

;(set-face-foreground 'font-lock-operator-face "red")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ???

