(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (proof-general))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; no newlines for electric terminator
(setq coq-one-command-per-line nil)


;; For Agda
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; with Agda, this appears to be a readable theme
(load-theme 'tango)

; Change Ctrl+c Ctrl+, and Ctrl+c Ctrl+.
; in Agda mode so they show the normalized rather
; than the "simplified" goals
(defun agda2-normalized-goal-and-context ()
    (interactive)
    (agda2-goal-and-context '(3)))
(defun agda2-normalized-goal-and-context-and-inferred ()
    (interactive)
    (agda2-goal-and-context-and-inferred '(3)))
(eval-after-load "agda2-mode"
    '(progn
        (define-key agda2-mode-map (kbd "C-c ,")
            'agda2-normalized-goal-and-context)
        (define-key agda2-mode-map (kbd "C-c .")
            'agda2-normalized-goal-and-context-and-inferred)))
