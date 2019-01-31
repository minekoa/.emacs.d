;;; -*- Coding: iso-2022-7bit -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic setting

;; load-path を通す
(add-to-list 'load-path "~/.emacs.d/elisp")

;; 日本語をデフォルトにする
;(set-language-environment "Japanese")

;; 各種文字コード指定
;(prefer-coding-system 'utf-8-unix)           ; ファイルの新規作成時に使用するencoding
;(set-default-coding-systems 'euc-japan)
;(set-terminal-coding-system 'utf-8)          ;
;(set-buffer-file-coding-system 'euc-japan)

;; デフォルトフレームパラメータ
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
	       ;; (frame-parameter nil 'font) して得られた文字列を設定
;;	       '(font . "-unknown-VL ゴシック-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1")
           '(font . "-VL  -VL ゴシック-normal-normal-normal-*-14-*-*-*-*-0-iso10646-1")
	       )
	      default-frame-alist))

;(dolist (x (x-list-fonts "*")) (print x))
; で一覧取ってきて探すといいよ

;;; package installer の準備
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages"))

;;; Backup-files
(setq backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*\$" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))


;;; 賢いバッファリスト
(global-set-key "\C-x\C-b" 'bs-show)  ;buffer selection (bs-show) に差し替え
(global-set-key [?\C-\.] 'bs-cycle-next)            ;バッファの循環切替え (進む)
(global-set-key [?\C-\,] 'bs-cycle-previous)        ;バッファの循環切替え (戻る)
(setq bs-default-configuration "files-and-scratch") ;filesに加えscratchも表示

    ;<memo> bs-show のコマンド
    ;   C-u C-x C-b     ファイル以外も全部表示する
    ;   'C' <shift-c>   フィルタの変更。Use configuration: (file / all) で切替
    ;   'S' <shift-s>   ソート方法を変更。
    ;    k              カーソル行ののバッファーを閉じる(kill)
    ;    s              カーソル行のバッファーを保存する(save)


;;; cua-mode
(cua-mode t)                     ;cua-modeを最初から有効にする
(setq cua-enable-cua-keys nil)   ;cua-mode 特有のへんなキーバインドを無効にする

    ;<memo> cua-mode のコマンド
    ;   M-p     矩形の幅を固定
    ;   M-b     空白文字で埋める。 open-rectangle と同等
    ;   M-s     文字列で置き換える。 string-rectangle と同等
    ;   M-f     1種類の文字で埋める。 string-rectangle で1文字指定したときと同等
    ;   M-i     矩形領域内の数字をインクリメントする
    ;   M-n     矩形領域を連番で埋める。フォーマット指定可


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; こまかいオプション

;; ロゴ画面をすっ飛ばす
(setq inhibit-startup-message t)

;;; 行移動で新しい行を追加しない
(setq next-line-add-new-lines nil)

;;; 余計な改行を入れない
(put 'set-goal-column 'disabled nil)

;;; 長い行でも折り返さない
(setq-default truncate-lines t)

;;; リージョンハイライト
(setq transient-mark-mode t)

;;; ツールバーを無効にする
(tool-bar-mode 0)

;;; ビープ音を消す（かわりに画面がフラッシュする）
;(setq visible-bell t)

;;; タブオーダー（デフォルト=4, shell-mode=8）
(setq default-tub-width 4)
(add-hook 'shell-mode-hook
	  '(lambda () (setq tab-width 8)))

;; narrowing を有効に
(put 'narrow-to-region 'disabled nil)

;; バッファ中の行番号表示
(global-linum-mode t)

;; mode-line に行番号を表示
(column-number-mode t)

;; カスタム変数は別ファイルに
(setq custom-file (locate-user-emacs-file "custom.el"))

;; 保存時に末尾の空白を削る
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key-bind (global)

;; C-h => backspace
(keyboard-translate ?\C-h ?\C-?)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 日本語入力

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; azik-anthy / anthy-azik.el
;;;  (anthy-azik.el >> http://www.koders.com/lisp/fidCAA0A0EF322B0E2783D5B410AEC8AD6523A5CC05.aspx?s=%22Ruby%22)

;; anthy.el をロード出来るようにする（必要に応じて）
;(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)

;; anthy.el をロードする
;(load-library "anthy")

;; japanese-anthy をデフォルトの input method にする
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
;(global-set-key "\M-`" 'toggle-input-method)
(global-set-key [M-escape] 'toggle-input-method)
(global-set-key "\C-j" 'toggle-input-method) ;; 岡部さんおすすめ

;; 全角半角でトグルすると Wrong response serverが発生する不具合へのハック
;; 元ネタ: http://d.hatena.ne.jp/kitokitoki/20110815/p3
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
(add-hook 'mozc-mode-hook
	  (lambda()
	    (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

(setq mozc-candidate-style 'overlay)
;(setq mozc-candidate-style 'echo-area) ;; ミニバッファに表示するならこれ

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-theme
;;   https://code.google.com/p/gnuemacscolorthemetest/
;;   色見本:  http://sakito.jp/emacs/colortheme.html

(load "color-theme")
(color-theme-initialize)

;; テーマを適用
(load "color-theme-minekoa")
(color-theme-minekoa-blue)

;; frame-background-mode を使っている子(rst-mode)のために
;; (dark が取れてframe-background-modo にセットされる)
(setq frame-background-mode (frame-parameter nil 'background-mode))

;; マウスでポイントしている箇所の face を取得する
;; http://sakito.jp/emacs/colortheme.html
(defun describe-face-at-point ()
 (interactive)
 (message "%s" (get-char-property (point) 'face)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EOFを表示

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
;;; melpa (http://melpa.org/packages/) より
;;; M-x package-install elscreen で、インストール

(load "elscreen")
(elscreen-start)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jaspace
;;;    http://homepage3.nifty.com/satomii/software/elisp.ja.html
(if t
    (progn
      ;; customize
      (setq jaspace-highlight-tabs ?^) ;タブを^ で置き換える場合(emacs22以上)
      (setq jaspace-alternate-eol-string "\xab\n")

      ;; font-face
      (custom-set-faces
       '(jaspace-highlight-eol-face ((t (:foreground "#555588"))))
       '(jaspace-highlight-tab-face ((t (:foreground "#555588"
					 :strike-throuth nil)))) ;tab を文字で置き換えているときはこちら
       '(jaspace-highlight-jaspace-face ((t (:foreground "#555588"))))
       )

      ;; loading
      (require 'jaspace)
      ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; what-char (文字コードの表示)
;;;    http://homepage3.nifty.com/satomii/software/elisp.ja.html
;(load "what-char")
;(what-char-add-to-mode-line)


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

(setq-default c-basic-offset 4 ;;基本インデント量4
	      tab-width 4      ;;タブ幅4
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gdb

;;有用なバッファを開くモード
(setq gdb-many-windows t)

;;マウスオーバーで変数の値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;;I/Oバッファを表示
(setq gdb-use-separate-io-buffer t)

;;minibufferに値を表示しない
(setq gud-tooltip-echo-area nil)


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
;;   melpa (http://melpa.org/packages/) より
;;   M-x package-install migemo でインストール

(load "migemo")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\a"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)


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
; (setq load-path (cons "/usr/lib/erlang/lib/tools-2.8.6/emacs"
;       load-path))
; (setq erlang-root-dir "/usr/local/otp")
; (setq exec-path (cons "/usr/local/otp/bin" exec-path))
;
; (require 'erlang-start)

(add-hook 'erlang-mode-hook 'jaspace-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elm

(add-hook 'elm-mode-hook 'jaspace-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smalltalk (gst)
;(add-to-list 'load-path "~/local/share/emacs/site-lisp")
;
;(autoload 'smalltalk-mode "smalltalk-mode.elc" "" t)
;(autoload 'gst "gst-mode.elc" "" t)
;
;(push '("\\.st\\'" . smalltalk-mode) auto-mode-alist)
;;(push "\\.star\\'" inhibit-first-line-modes-regexps)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keisen
;(load "keisen")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kml-foo-mode

(load-library "hideshow")
(autoload 'kml-foo-mode "kml-foo-mode" "" t)
(add-hook 'kml-foo-mode-hook 'jaspace-mode)

;(set-face-foreground 'font-lock-operator-face "red")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown-mode
;;  marked は npm でインストールしといてください

(setq markdown-command "marked")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ???

