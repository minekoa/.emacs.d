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
  "ミュるミュるモードのローカルキーマップ")
(if murmur-timestamp-mode-map
    nil
  (setq murmur-timestamp-mode-map (make-sparse-keymap))
  (define-key murmur-timestamp-mode-map (kbd "C-c C-t") 'insert-current-time)
;  (define-key murmur-timestamp-mode-map (kbd "C-c C-s") 'insert-time-and-save-buffer)
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
        ;; minor-mode の keymapを登録
        (if (not (assq 'murmur-timestamp-mode minor-mode-map-alist))
            (add-to-list 'minor-mode-map-alist
                         (cons 'murmur-timestamp-mode murmur-timestamp-mode-map)))

        ;; 保存時に勝手にタイムスタンプがおされるように
        (add-hook 'before-save-hook 'insert-current-time t) ;; t means LOCAL
        )
    (remove-hook 'before-save-hook 'insert-current-time t) ;; too
    nil
    )
  )

(defcustom murmur-timestamp-format "%H:%M"
  "Format time string. ex) \"%Y-%m-%d(%a) %H:%M:%S\"")

(defun insert-current-time()
  (interactive)
  (if murmur-timestamp-mode
      (progn
        (end-of-line)
        (while (> (current-column) 0)
          (next-line)
          (end-of-line))
;        (if (eq (current-column) 0)
;            nil
;          (insert "\n"))
        (insert (format-time-string murmur-timestamp-format (current-time)))
        (insert "\n\n")
        )
    nil
    )
  )

(defun insert-time-and-save-buffer()
  (interactive)
  (progn (insert-current-time)
         (save-buffer)
         ))
