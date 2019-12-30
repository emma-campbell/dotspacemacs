;; -*- mode: emacs-lisp -*-
;;
;; Author: Emma Campbell
;; Last Modified: 2019-10-01
;;
;; This file is loaded by Spacemacs at startup.

(defun dotspacemacs/init ()
  "Initialization function. All `dotspacemacs-' variables defined in `~/.emacs.d/core/core-dotspacemacs.el'."
  (setq-default

   ;; General

   dotspacemacs-elpa-https nil
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil

   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'random
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 5)
                                (agenda . 5))

   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode

   ;; Display

   dotspacemacs-themes '(lush
                         whiteboard)

   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Fira Code"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-mode-line-theme 'all-the-icons

   ;; Key Bindings

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5

   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom

   ;; Spacemacs Startup
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 75
   dotspacemacs-inactive-transparency 30
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/layers ()
  "Instanciate spacemacs layers and package configurations"
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layers '((
                                        markdown
                                        python
                                        yamlconfig :location local)
                                       (display :location local)
                                       )
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")
   dotspacemacs-additional-packages '(all-the-icons vue-mode)
   dotspacemacs-excluded-packages '(
                                    org-projectile fringe importmagic scss-mode vi-tilde-fringe

                                           ;; Packages I don't use (non-exhaustive)
                                           anzu centered-cursor-mode column-enforce-mode company-statistics
                                           doom-modeline eshell-prompt-extras evil-anzu evil-mc evil-tutor
                                           fancy-battery fill-column-indicator gnuplot golden-ratio indent-guide
                                           live-py-mode multi-term multiple-cursors mwim paradox py-isort
                                           yapfify)))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (helm-pydoc helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag ace-jump-helm-line helm helm-core vue-mode edit-indirect ssass-mode vue-html-mode org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot prettify-utils spaceline-all-the-icons bumbleberry-theme zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme memoize all-the-icons ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode paradox spinner org-bullets open-junk-file move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link neotree 0blayout yapfify web-mode web-beautify unfill tide typescript-mode tagedit smeargle slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org-plus-contrib mwim mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode haml-mode gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit transient git-commit with-editor emmet-mode disaster diff-hl cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emacs-eclim eclim company-c-headers company-anaconda company coffee-mode cmake-mode clang-format auto-yasnippet yasnippet anaconda-mode pythonic f s ac-ispell auto-complete popup xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help dash which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra lv helm-make flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(avy-background-face ((t (:italic nil))))
 '(company-tooltip-common-selection ((t (:weight bold :underline nil :inherit company-toolkit-selection))))
 '(complany-tooltip-common ((t (:weight bold :underline nil :inherit company-tooltip))))
 '(font-lock-comment-face ((t (:foreground "#5CA19C" :italic t :weight normal))))
 '(fringe ((t (:background nil))))
 '(mode-line ((t (:box nil :underline nil :background nil))))
 '(mode-line-inactive ((t (:box nil :underline nil))))
 '(org-block-begin-line ((t (:italic nil :underline nil :box t))))
 '(org-block-end-line ((t (:italic nil :underline nil :box t))))
 '(org-level-1 ((t (:underline t :inherit nil :height 1.35 :foreground "#FFE329"))))
 '(org-level-2 ((t (:underline t :inherit nil :height 1.25 :foreground "#FFF191"))))
 '(org-level-3 ((t (:underline t :inherit nil :height 1.15 :foreground "#82A7E0")))))
