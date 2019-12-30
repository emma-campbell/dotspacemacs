;; pretty-code.el --- Utils for prettify-symbols -*- lexical-binding:t -*-

(require 'dash)
(require 'prettify-utils)

;;;; Configuration

(defvar pretty-code-options-alist
  '(;; Functions
    (:lambda "λ") (:def "ƒ")


    ;; Types
    (:true "𝕋") (:false "𝔽") (:int "ℤ") (:float "ℝ") (:str "𝕊") (:bool "𝔹")

    ;; Seqs
    (:for "∀") (:in "∈") (:not-in "∉")


    ;; Flow
    (:not "￢") (:and "∧") (:or "∨")

    ;; Misc
    (:return "⟼") (:yield "⟻") (:some "∃") (:composition "∘") (:tuple "⨂")
    ))

;;;;; Core

;;;#autoload
(defun pretty-code-add-hook (hook kwd-name-alist)
  "Set `prettify-symbols-alist' for HOOK with choices in KWD-NAME-ALIST."
  (add-hook hook
            (lambda ()
              (setq prettify-symbols-alist
                    (->> kwd-name-alist
                         (-map (-lambda ((kwd name))
                                 (cons name
                                       (alist-get kwd pretty-code-options-alist))))
                         (apply #'prettify-utils-generate-f)))
              (prettify-symbols-mode 1))))

(provide 'pretty-code)
