;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; murmur-timestamp-mode (minor-mode)
;;   保存したときに カーソル行の次の行に
;;   HH:MMを挿入する

;; モード変数
(defvar murmur-timestamp-mode nil
  "Non-nil means `murmur-timestamp-mode' is enabled.")
(make-variable-buffer-local 'murmur-timestamp-mode)

;; ローカルキーマップ
(defvar murmur-timestamp-mode-map nil
  "罫線モードのローカルキーマップ")
(if murmur-timestamp-mode-map
    nil
  (setq murmur-timestamp-mode-map (make-sparse-keymap))
  (define-key murmur-timestamp-mode-map [C-right] 'keisen-right-move)
)

;; モード行表示
(if (not (assq 'murmur-timestamp-mode minor-mode-alist))
    (setq minor-mode-alist
             (cons '(murmur-timestamp-mode " mur2tm")
              minor-mode-alist)))


;; モード関数
(defun murmur-timestamp-mode (&optional arg)
  "Toggle `murmur-timestamp-mode'."
  (interactive "P")

  ;; Toggle mode-variable
  (cond
   ((< (prefix-numeric-value arg) 0)             ; 引数が1未満の数値なら起動しない
    (setq murmur-timestamp-mode nil))
   (arg (setq murmur-timestampe-mode t))                         ; 何かしらの引数をもつならば起動
   (t (setq murmur-timestamp-mode (not murmur-timestamp-mode)))) ; symbol t を引数にもつならばモードを逆転。

  ;; content（具体処理）
  (if murmur-timestamp-mode
      (progn
        (use-local-map murmur-timestamp-mode-map)
        (add-hook 'before-save-hook 'insert-current-hhmm t) ;; t means LOCAL
        )
    (remove-hook 'before-save-hook 'insert-current-hhmm t) ;; too
    )
  )



(defun insert-current-time()
  (interactive)
  (insert (format-time-string "%Y-%m-%d(%a) %H:%M:%S" (current-time))))

(defun insert-current-hhmm()
  (interactive)
  (if murmur-timestamp-mode
      (progn
        (end-of-line)
        (insert (format-time-string "\n%H:%M\n" (current-time)))
        )
    nil
    )
  )
