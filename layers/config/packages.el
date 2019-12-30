;; Declaring Configuration Layers
;;
;; ===============================================
;; Custom Configurations of Neotree, Spaceline,
;; and More!
;; ===============================================

(setq config-packages
      '(
        neotree
        ))

;; Neotree
(defun config/pre-init-neotree ()
  (use-package all-the-icons)
  (setq neo-theme 'icons))
