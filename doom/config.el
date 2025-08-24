;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Set Gruvbox theme
(setq doom-theme 'doom-gruvbox)

;; Set include paths for SFML
(setq lsp-clients-clangd-args
      '("-j=4"
        "--background-index"
        "--clang-tidy"
        "--completion-style=detailed"
        "--header-insertion=never"
        "--header-insertion-decorators=0"
        ;; Add your SFML include paths here:
        "--query-driver=/usr/bin/g++"
        "--all-scopes-completion"
        "--cross-file-rename"))

;; C/C++ specific settings
(after! cc-mode
  (setq c-default-style "linux")
  (setq c-basic-offset 4)
  (add-hook 'c-mode-hook #'lsp!)
  (add-hook 'c++-mode-hook #'lsp!))

;; SFML compilation flags
(setq flycheck-clang-include-path
      '("/usr/include/SFML"  ; Update with your SFML path
        "/usr/local/include/SFML"))

;; CMake integration
(use-package! cmake-mode
  :mode "CMakeLists\\.txt\\'")

;; Enable transparent background globally
(defun apply-transparency ()
  (set-frame-parameter (selected-frame) 'alpha '(95 . 95)))
(add-hook 'after-make-frame-functions 'apply-transparency)
(add-hook 'server-after-make-frame-hook 'apply-transparency)
