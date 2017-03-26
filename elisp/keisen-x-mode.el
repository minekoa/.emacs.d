;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keisen-x-mode (minor-mode)
;;   keisen.el を使って  C-矢印 で罫線を書く 
;;   xyzzyの box-drowings-mode 風 マイナーモード(消せないけど)

(require 'keisen)


;; モード変数
(defvar keisen-x-mode nil
  "Non-nil means `keisen-x-mode' is enabled.")

;; ローカルキーマップ
(defvar keisen-x-mode-map nil
  "罫線モードのローカルキーマップ")
(if keisen-x-mode-map
    nil
  (setq keisen-x-mode-map (make-sparse-keymap))
  (define-key keisen-x-mode-map [C-right] 'keisen-right-move)
  (define-key keisen-x-mode-map [C-left]  'keisen-left-move)
  (define-key keisen-x-mode-map [C-up]    'keisen-up-move)
  (define-key keisen-x-mode-map [C-down]  'keisen-down-move))

;; モード行表示
(if (not (assq 'keisen-x-mode minor-mode-alist))
    (setq minor-mode-alist
             (cons '(keisen-x-mode " Keisen")
              minor-mode-alist)))

;; モード関数
(defun keisen-x-mode (&optional arg)
  "Toggle `keisen-x-mode'."
  (interactive "P")

  ;; Toggle mode-variable
  (cond
   ((< (prefix-numeric-value arg) 0)             ; 引数が1未満の数値なら起動しない
    (setq keisen-x-mode nil))
   (arg (setq keisen-x-mode t))                  ; 何かしらの引数をもつならば起動
   (t (setq keisen-x-mode (not keisen-x-mode)))) ; symbol t を引数にもつならばモードを逆転。

  ;; content（具体処理）
  (if keisen-x-mode
      (progn
	(use-local-map keisen-x-mode-map))
      nil)
)
