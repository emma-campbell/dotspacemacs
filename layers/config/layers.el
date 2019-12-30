;;; -*- lexical-binding: t; -*-

(configuration-layer/declare-layers
 '(
   ;; Core
   (auto-completion :variables
                    auto-completion-return-key-behavior 'complete
                    auto-completion-tab-key-behavior nil
                    auto-completion-enable-snippets-in-popup t)
   better-defaults
   git

   (org :variables
        org-want-todo-bindings t)
   (ivy :variables
        ivy-extra-directories nil)
   (shell :variables
          shell-default-height 30
          shell-default-position 'bottom)
   syntax-checking
   (version-control :variables
                    version-control-global-margin t
                    version-control-diff-tool 'git-gutter+)

   ;; Display
   themes-megapack

   ;; Markup
   csv
   html
   markdown

   ;; Languages
   c-c++
   emacs-lisp
   javascript
   typescript
   python
   java))

;;;; Aggressive Indent

(defun config/pre-init-aggressive-indent ()
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

;;;; Post-Init Magit
(defun config/post-init-magit ()
  (bind-keys :map magit-mode-map
             ("M-1" . winum-select-window-1)
             ("M-2" . winum-select-window-2)
             ("M-3" . winum-select-window-3)
             ("M-4" . winum-select-window-4)))

;;;; Org

(defun config/pre-init-org-bullets ()
  (setq org-bullets-bullet-list '("" "" "" "")))

(defun config/pre-init-ob ()
  (setq org-confirm-babel-evaluate   nil)
  (setq org-src-fontify-natively     t)
  (setq org-src-tab-acts-natively    t)
  (setq org-src-preserve-indentation t)
  (setq org-src-window-setup         'current-window)

  (spacemacs|use-package-add-hook org
    :post-config (add-to-list 'org-babel-load-languages '(dot . t))))

(defun config/pre-init-org ()
  (setq org-ellipsis "")
  (setq org-priority-faces
        '((65 :inherit org-priority :foreground "red")
          (66 :inherit org-priority :foreground "yellow")
          (67 :inherit org-priority :foreground "green")))
  (setq org-structure-template-alist
        '(("n" "#+NAME: ?")
          ("L" "#+LaTeX: ")
          ("h" "#+HTML: ")
          ("q" "#+BEGIN_QUOTE\n\n#+END_QUOTE")
          ("s" "#+BEGIN_SRC ?\n\n#+END_SRC")
          ("se" "#+BEGIN_SRC emacs-lisp\n\n#+END_SRC")
          ("sp" "#+BEGIN_SRC python\n\n#+END_SRC")))

  (add-hook 'org-mode-hook (lambda () (auto-fill-mode 1)))
  (add-hook 'org-mode-hook 'flyspell-mode)

  ;; Experimenting with Indentation vars
  (setq org-startup-indented nil)
  (setq org-hide-leading-stars t)
  (setq org-hide-emphasis-markers nil)
  (setq org-indent-indentation-per-level 1))

(defun config/post-init-org ()
  (evil-define-key '(normal visual motion) org-mode-map
    "gh" 'outline-up-heading
    "gj" 'outline-forward-same-level
    "gk" 'outline-backward-same-level
    "gl" 'outline-next-visible-heading
    "gu" 'outline-previous-visible-heading)
  (spacemacs/set-leader-keys "aof" `org-open-at-point-global)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode-map
    "r" 'org-refile
    "h" 'org-metaleft  ; Because of MacOS's damned, indestructable M-h binding...
    "s p" 'org-sort-entries-priorities))

(defun config/init-dash-functional ()
  (use-package dash-functional))
