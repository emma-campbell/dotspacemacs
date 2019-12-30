;;; Display Layer -*- lexical-binding: t; -*-

(setq display-packages
      '(
        all-the-icons

        spaceline-all-the-icons
        (prettify-utils :location (recipe :fetcher github
                                          :repo "Ilazki/prettify-utils.el"))

        (pretty-code  :location local)
        (pretty-fonts :location local)
        ))

(defun display/init-all-the-icons ()
  (use-package all-the-icons))

(defun display/post-init-spaceline-all-the-icons ()
  (spaceline-all-the-icons-theme)
  (setq spaceline-highlight-face-func 'spaceline-hightlight-face-default)

  (setq spaceline-all-the-icons-icon-set-modified         'chain)
  (setq spaceline-all-the-icons-icon-set-window-numbering 'square)
  (setq spaceline-all-the-icons-separator-type            'none)
  (setq spaceline-all-the-icons-primary-separator         "")


  ;; !!!!!!!!!!!!!!!!
  ;; !! https://github.com/domtronn/spaceline-all-the-icons.el/issues/55
  ;; !! If you remove this - expect EXTREMELY degraded performance
  ;; !! on files of more-or-less any size and of any type
  ;; !!!!!!!!!!!!!!!!
  (spaceline-toggle-projectile-root-off)
  (spaceline-toggle-all-the-icons-projectile-off)
  (spaceline-toggle-all-the-icons-buffer-id-off)

  ;; Mode Segments
  (spaceline-toggle-all-the-icons-minor-modes-off)

  ;; Buffer Segments
  (spaceline-toggle-all-the-icons-buffer-size-off)
  (spaceline-toggle-all-the-icons-buffer-position-off)

  ;; Git Segments
  (spaceline-toggle-all-the-icons-git-status-off)
  (spaceline-toggle-all-the-icons-vc-icon-off)
  (spaceline-toggle-all-the-icons-vc-status-off)

  ;; Misc Segments
  (spaceline-toggle-all-the-icons-eyebrowse-workspace-off)
  (spaceline-toggle-all-the-icons-flycheck-status-off)
  (spaceline-toggle-all-the-icons-time-off))

(defun display/init-pretty-mode ()

  (use-package pretty-mode
    :config
    (progn
      (global-pretty-mode t)

      (pretty-mode-deactivate-groups
       '(
         :equality :ordering :ordering-double :ordering-triple
                   :arrows-twoheaded :punctuation
                   :logic :sets)
       )
      (pretty-activate-groups
       '(
         :greek :sub-and-superscripts :arithmetic-nary)))))

  ;;;; Prettify-utils

  (defun display/init-prettify-utils ()
    (use-package prettify-utils))

(defun display/post-init-spaceline-all-the-icons ()
  (spaceline-all-the-icons-theme)

  (setq spaceline-highlight-face-func 'spaceline-highlight-face-default)

  (setq spaceline-all-the-icons-icon-set-modified         'chain)
  (setq spaceline-all-the-icons-icon-set-window-numbering 'square)
  (setq spaceline-all-the-icons-separator-type            'none)
  (setq spaceline-all-the-icons-primary-separator         "")

  ;; Mode Segments
  (spaceline-toggle-all-the-icons-minor-modes-off)

  ;; Buffer Segments
  (spaceline-toggle-all-the-icons-buffer-size-off)
  (spaceline-toggle-all-the-icons-buffer-position-off)

  ;; Git Segments
  (spaceline-toggle-all-the-icons-git-status-off)
  (spaceline-toggle-all-the-icons-vc-icon-off)
  (spaceline-toggle-all-the-icons-vc-status-off)

  ;; Misc Segments
  (spaceline-toggle-all-the-icons-eyebrowse-workspace-off)
  (spaceline-toggle-all-the-icons-flycheck-status-off)
  (spaceline-toggle-all-the-icons-time-off))


  ;;; Pretty Packages
  ;;;; Pretty Code

  (defun display/init-pretty-code ()
    (use-package pretty-code
                :config
                (progn
                  (pretty-code-add-hook 'emacs-lisp-mode-hook '((:def "defun")))
                  (pretty-code-add-hook 'python-mode-hook     '((:def "def")
                                                                (:lambda "lambda")
                                                                (:return "return")
                                                                (:not "not")
                                                                (:true "True")
                                                                (:false "False")))
                  (pretty-code-add-hook 'c-mode-hook '((:return "return")
                                                       (:not "!")
                                                       (:empty-set "NULL")))
                  (pretty-code-add-hook 'javascript-mode-hook '((:return "return")
                                                                (:not "!")
                                                                (:def "function"))))))

;;;; Pretty Fonts
(defun display/init-pretty-fonts ()
  (use-package pretty-fonts
    :config
    ;; !! This is required to avoid segfault when using emacs as daemon !!
    (spacemacs|do-after-display-system-init
     ;; (pretty-fonts-add-hook 'prog-mode-hook 'pretty-fonts-fira-code-alist)
     (pretty-fonts-add-hook 'prog-mode-hook pretty-fonts-fira-code-alist)
     (pretty-fonts-add-hook 'org-mode-hook  pretty-fonts-fira-code-alist)

     (pretty-fonts-set-fontsets-for-fira-code)
     (pretty-fonts-set-fontsets
      '(
        ("fontawesome"
         ;;                         
         #xf07c #xf0c9 #xf0c4 #xf0cb #xf017 #xf101)
        ("all-the-icons"
         ;;    
         #xe907 #xe928)
        ("github-octicons"
         ;;                               
         #xf091 #xf059 #xf076 #xf075 #xe192  #xf016 #xf071)
        ("material icons"
         ;;              
         #xe871 #xe918 #xe3e7  #xe5da

         ;;              
         #xe3d0 #xe3d1 #xe3d2 #xe3d4))))))

;;;; Pretty-magit

(defun display/init-pretty-magit ()
  (use-package pretty-magit
    :config
    (progn
      (pretty-magit-add-leaders
       '(("Feature" ? (:foreground "slate gray" :height 1.2))
         ("Add"     ? (:foreground "#375E97" :height 1.2))
         ("Fix"     ? (:foreground "#FB6542" :height 1.2))
         ("Clean"   ? (:foreground "#FFBB00" :height 1.2))
         ("Docs"    ? (:foreground "#3F681C" :height 1.2))))

      (pretty-magit-setup))))
