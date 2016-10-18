(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)
(require-package 'evil-tabs)
(require-package 'company)
(require-package 'company-jedi)
(require-package 'pyvenv)
(require-package 'pyenv-mode-auto)
(require-package 'zenburn-theme)
(require-package 'twilight-bright-theme)
(require-package 'arjen-grey-theme)
(require-package 'solarized-theme)
(require-package 'cider)
(require-package 'paredit)
(require-package 'rainbow-delimiters)
(require-package 'clojure-mode)
(require-package 'all-the-icons)
(require-package 'neotree)
(require-package 'helm)
(require-package 'projectile)
(require-package 'helm-projectile)
(require-package 'magit)
(require-package 'ess)
(require-package 'highlight-indentation)
(require-package 'fill-column-indicator)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-tabs zenburn-theme zerodark-theme company-jedi company evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Custom functions
(defun show-file-name ()
  "SHow the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;; setup evil mode
(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

;;; additional evil colon commands
;;; http://emacs.stackexchange.com/questions/10350/how-can-i-add-a-new-colon-command-to-evil
(evil-ex-define-cmd "number" 'linum-mode)
(evil-ex-define-cmd "colcolumn" 'fci-mode)
(evil-ex-define-cmd "colorindent" 'highlight-indentation-mode)
(evil-ex-define-cmd "wrap" 'toggle-truncate-lines)
(evil-ex-define-cmd "name" 'show-file-name)
(evil-ex-define-cmd "ls" 'projectile-ibuffer)

;; stop creating backup~ files
(setq make-backup-files nil)

;; suppress the splash/startup screen
(setq inhibit-startup-screen t)

;; set tabs/space width
(setq tab-width 4)        ;; set your desired tab width
(setq indent-tabs-mode nil) ;; use tabs for indentation

;; show the column number
(setq column-number-mode t)

;; show the column indicator (80-column point)
(setq fci-rule-column 80)

;; evil tabs setup
(global-evil-tabs-mode t)
(define-key evil-normal-state-map (kbd "tt") 'elscreen-create)
(define-key evil-normal-state-map (kbd "C-h") 'elscreen-previous)
(define-key evil-normal-state-map (kbd "C-l") 'elscreen-next)

;; helm setup
(require 'helm-config)
(helm-mode 1)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(define-key helm-map (kbd "C-q") 'helm-quit)

;; projectile setup
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; company / auto-completion setup
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'after-init-hook 'global-company-mode) ; company mode enable on all buffers

;; setup an appropriate color theme and fonts
; the size is equal to height divided by 10 (e.g. 13pt = 130/10)
(defun graphical-mode-setup ()
  (tool-bar-mode -1)
  (load-theme 'solarized-light t)
  (setq fci-rule-width 3)
  (set-face-attribute 'default nil
		      :family "Monaco"
		      :height 120
		      :weight 'normal))

(defun terminal-mode-setup ()
  (load-theme 'zenburn t)
  (setq fci-rule-color "yellow"))

(if (display-graphic-p)
    (graphical-mode-setup)
    (terminal-mode-setup))

;; ibuffer
;; from https://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
(evil-define-key 'normal ibuffer-mode-map
  (kbd "j") 'ibuffer-
  (kbd "m") 'ibuffer-mark-forward
  (kbd "t") 'ibuffer-toggle-marks
  (kbd "u") 'ibuffer-unmark-forward
  (kbd "=") 'ibuffer-diff-with-file
  (kbd "j") 'ibuffer-jump-to-buffer
  (kbd "M-g") 'ibuffer-jump-to-buffer
  (kbd "M-s a C-s") 'ibuffer-do-isearch
  (kbd "M-s a M-C-s") 'ibuffer-do-isearch-regexp
  ;; ...
  )

;; Lisp
(defun lisp-stuff ()
  (enable-paredit-mode)
  (rainbow-delimiters-mode 1)
  (show-paren-mode 1))

(add-hook 'lisp-mode-hook #'lisp-stuff)
(add-hook 'emacs-lisp-mode-hook #'lisp-stuff)

;; Clojure
(add-hook 'clojure-mode-hook #'lisp-stuff)

;; Cider
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'evil-mode)
(add-hook 'cider-repl-mode-hook #'lisp-stuff)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)

(add-hook 'cider-mode-hook #'evil-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'lisp-stuff)

(evil-declare-key 'normal cider-repl-mode-map (kbd "C-a") 'beginning-of-line)
(evil-declare-key 'normal cider-repl-mode-map (kbd "C-e") 'end-of-line)
(evil-declare-key 'normal cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)
(evil-declare-key 'normal cider-repl-mode-map (kbd "C-p") 'cider-repl-backward-input)
(evil-declare-key 'normal cider-repl-mode-map (kbd "C-n") 'cider-repl-forward-input)
(evil-declare-key 'normal cider-repl-mode-map (kbd "q") 'cider-quit)

(evil-declare-key 'normal cider-mode-map (kbd ",cpe") 'cider-eval-last-sexp)
(evil-declare-key 'normal cider-mode-map (kbd ",cpp") 'cider-eval-last-sexp-to-repl)
(evil-declare-key 'visual cider-mode-map (kbd "cper") 'cider-eval-region)

;; neotree setup
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
(global-set-key [f3] 'neotree-projectile-action)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq neo-window-fixed-size nil)
(setq neo-theme 'arrow)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
