;;; -*- Lexical Binding: t -*-

;; Display Modifcations for (dark theme) lush and (light theme)
;; whiteboard

;; Theming updates are structured and modularized where possible

;; 1. All outline/org-level heading styling
;; 2. Comments/Strings italicized
;; 3. Transparent active and monochrome inactive modelines
;; 4. Various small gradient changes to core font-lock-faces

;;; Configuration
;;;; Core

(setq whiteboard-use-variable-pitch nil)
(setq face-remapping-alist '(;; Headers - outlines match org
                             (outline-1 org-level-1)
                             (outline-2 org-level-2)
                             (outline-3 org-level-3)

                             ;; Modeline -- ivis. active,
                             ;; monochrome inactive
                             (powerline-active1 mode-line)
                             (powerline-active2 mode-line)
                             (spaceline-highlight-face mode-line)

                             (powerline-active0 mode-line)
                             (mode-line-active mode-line)
                             (mode-line-inactive mode-line)
                             (mode-line-inactive0 mode-line)
                             (mode-line-inactive1 mode-line)
                             (mode-line-inactive2 mode-line)
                             ))

;;;; Styling
;;;;; Headers

(setq display/headers/common '(:underline t :inherit nil))
(setq display/headers/lush
      `((org-level-1
         ,@display/headers/common
         :height 1.35
         :foreground "#FFE329")
        (org-level-2
         ,@display/headers/common
         :height 1.25
         :foreground "#FFF191")
        (org-level-3
         ,@display/headers/common
         :height 1.15
         :foreground "#82A7E0")))
(setq display/headers/whiteboard
      `((org-level-1
         ,@display/headers/common
         :height 1.35
         :foreground "#01688B")
        (org-level-2
         ,@display/headers/common
         :height 1.25
         :foreground "#6B838B")
        (org-level-3
         ,@display/headers/common
         :height 1.15
         :foreground "#CD6600")))

;;;;; Org-blocks

(setq display/org-blocks/common '(:italic nil :underline nil :box t))
(setq display/org-blocks
      `((org-block-begin-line
         ,@display/org-blocks/common)
        (org-block-end-line
         ,@display/org-blocks/common)))

;;;;; Company

(setq display/company/common '(:weight bold :underline nil))
(setq display/company
      `((complany-tooltip-common
         ,@display/company/common
         :inherit company-tooltip)
        (company-tooltip-common-selection
         ,@display/company/common
         :inherit company-toolkit-selection)))

;;;;; Mode-line

(setq display/mode-line/common '(:box nil :underline nil))
(setq display/mode-line
      `((mode-line
         ,@display/mode-line/common
         :background nil)
        (mode-line-inactive
         ,@display/mode-line/common)))

;;;;; Font-Locks

(setq display/font-locks
      `((font-lock-comment-face
         :italic t
         :weight normal)
        (font-lock-doc-face
         :italic t
         :weight normal)))

;;; Theming
;;;; Common

(setq display/common-theming
      `(,@display/company
        ,@display/mode-line
        ,@display/org-blocks

        (avy-background-face :italic nil)
        (fringe :background nil)))

;;;; Themes
(setq display/lush-theming
      `(;; Overwrites
        (mode-line-inactive :background "#202020"
                            ,@(alist-get 'mode-line-inactive
                                         display/mode-line))

        (font-lock-comment-face :foreground "#5CA19C"
                                ,@(alist-get 'font-lock-comment-face
                                             display/font-locks))

        ))

(setq display/whiteboard-theming
      `(;; Overwrites
        (font-lock-comment-face :foreground "#65627F"
                                ,@(alist-get 'font-lock-comment-face
                                             display/font-locks))

        (font-lock-doc-face :foreground "#65627F"
                            ,@(alist-get 'font-lock-doc-face
                                         display/font-locks))))

;;;; Set Modifications

(setq theming-modifications
      `((lush       ,@display/common-theming
                    ,@display/headers/lush
                    ,@display/lush-theming)
        (whiteboard ,@display/common-theming
                    ,@display/headers/whiteboard
                    ,@display/whiteboard-theming)))
