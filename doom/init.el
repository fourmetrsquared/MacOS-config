;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;; ... (keep your existing input settings)

       :completion
       company           ; auto-completion framework
       (vertico +icons)  ; search engine

       :ui
       doom              ; UI framework
       doom-dashboard    ; fancy home screen
       doom-quit         ; quit prompts
       (emoji +unicode)  ; emojis
       hl-todo           ; highlight TODO/FIXME
       modeline          ; snazzy status line
       ophints           ; highlight on operations
       (popup +defaults) ; popup rules
       treemacs          ; file tree sidebar
       unicode           ; extended unicode support
       vc-gutter         ; version control diff indicators
       workspaces        ; workspace manager
       zen               ; distraction-free mode
       ;; Theme and visual settings
       doom-themes       ; theme pack
       ;; Set Gruvbox Dark Soft theme
       (setq doom-theme 'doom-gruvbox)
       (setq doom-gruvbox-dark-variant "soft")
       ;; Enable transparency
       (set-frame-parameter (selected-frame) 'alpha '(95 . 95))
       (add-to-list 'default-frame-alist '(alpha . (95 . 95)))

       :editor
       (evil +everywhere) ; vim emulation
       file-templates     ; auto insert file templates
       fold              ; code folding
       format            ; code formatting
       snippets          ; code snippets
       word-wrap         ; soft line wrapping

       :emacs
       dired             ; file manager
       electric          ; smarter electric modes
       ibuffer           ; better buffer list
       undo              ; persistent undo history
       vc                ; version control

       :term
       vterm             ; best terminal emulation

       :checkers
       syntax            ; real-time syntax checking
       spell             ; spell checking

       :tools
       (lsp +eglot)      ; Language Server Protocol
       debugger          ; debugging support
       ein               ; jupyter notebooks
       eval              ; code evaluation
       lookup            ; documentation browser
       magit             ; git integration
       make              ; run projects tasks
       pdf               ; PDF tools
       tree-sitter       ; syntax parsing

       :lang
       cc                ; C/C++
       data              ; config file formats
       emacs-lisp        ; elisp
       json              ; JSON
       javascript        ; JS/TS
       markdown          ; lightweight markup
       (org +pretty)     ; organized notes
       python            ; python
       rest              ; REST clients
       sh                ; shell scripts
       web               ; web templates
       yaml              ; YAML

       :config
       (default +bindings +smartparens))
