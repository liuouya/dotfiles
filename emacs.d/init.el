;; *****************************************
;;              Package Manager
;; *****************************************

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/elisp")   ; set default emacs load path

(require 'package-require)
(package-require '(company exec-path-from-shell expand-region flx-ido
 smex markdown-mode markdown-mode+ hgignore-mode move-text paredit
 rainbow-delimiters rainbow-mode json-mode json-reformat flycheck
 solarized-theme terraform-mode visual-regexp yasnippet yaml-mode
 zencoding-mode sr-speedbar nyan-mode))



;; *****************************************
;;              General
;; *****************************************

(setq-default
 gc-cons-threshold 20000000                   ; gc every 20 MB allocated (form flx-ido docs)
 inhibit-splash-screen t                      ; disable splash screen
 truncate-lines t                             ; truncate, not wrap, lines
 indent-tabs-mode nil                         ; only uses spaces for indentation
 split-width-threshold 181                    ; min width to split window horizontially
 split-height-threshold 120                   ; min width to split window vertically
 reb-re-syntax 'string                        ; use string syntax for regexp builder
 require-final-newline 'visit-save)           ; add a newline automatically

(put 'set-goal-column 'disabled nil)          ; enable goal column setting
(put 'narrow-to-region 'disabled nil)         ; enable hiding
(put 'narrow-to-page 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p)                 ; replace yes/no prompts with y/n
(windmove-default-keybindings)                ; move between windows with shift-arrow

(column-number-mode t)                        ; show column numbers
(delete-selection-mode t)                     ; replace highlighted text
(which-function-mode t)                       ; function name at point in mode line
(transient-mark-mode t)                       ; highlight selection between point and mark
(electric-pair-mode t)                        ; automatically close opening characters
(global-font-lock-mode t)                     ; syntax highlighting
(global-subword-mode t)                       ; move by camelCase words
(global-hl-line-mode t)                       ; highlight current line
(global-set-key (kbd "C-c c") 'compile)       ; compile
(global-set-key (kbd "C-c r") 'recompile)     ; recompile
(global-set-key (kbd "C-c a") 'align-regexp)  ; align
(global-set-key (kbd "C-c g") 'rgrep)         ; grep

;;; color-modes map
(mapc
 (lambda (x)
   (add-hook x
    (lambda ()
      (rainbow-mode t)
      (linum-mode t)
      (rainbow-delimiters-mode t))))
 '(text-mode-hook
   c-mode-common-hook
   python-mode-hook
   haskell-mode-hook
   js2-mode-hook
   html-mode-hook
   css-mode-hook
   sass-mode-hook
   clojure-mode-hook
   emacs-lisp-mode-hook
   conf-mode-hook
   yaml-mode-hook))



;; *****************************************
;;              Formatting
;; *****************************************

;; 4 spaces indentation no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;;; text-mode
(add-hook 'fundamental-mode-hook 'flyspell-mode)      ; spellcheck text
(add-hook 'fundamental-mode-hook 'turn-on-auto-fill)  ; autofill text

;;; whitespace-mode
(global-whitespace-mode t)                            ; show whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)      ; cleanup whitespace on exit
(setq-default
 whitespace-line-column 120                           ; column width
 whitespace-style                                     ; whitespace to highlight
 '(trailing lines-tail empty indentation
            space-before-tab space-after-tab))



;; *****************************************
;;              Navigation
;; *****************************************

;; highlight matching braces
;; (setq-default
;;  show-paren-style 'expression
;;  show-paren-delay 0)
;; (set-face-attribute
;;  'show-paren-match nil
;;  :background (face-background 'highlight)
;;  :foreground (face-foreground 'highlight))
(show-paren-mode t)



;; *****************************************
;;              Auto Complete
;; *****************************************

;;; company-mode
(global-company-mode t)
(global-set-key (kbd "C-c") 'company-complete)
(setq-default
 company-idle-delay nil
 company-minimum-prefix-length 2
 company-selection-wrap-around t
 company-show-numbers t
 company-tooltip-align-annotations t)



;; *****************************************
;;              IDE
;; *****************************************

;; sr-speedbar
(setq
 sr-speedbar-width 30)
(sr-speedbar-open)

;; nyan cat mode :3
(nyan-mode 1)
