(eval-when-compile
  (require 'color-theme))

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
     (default ((t (:foreground "lavender blush"))))
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


