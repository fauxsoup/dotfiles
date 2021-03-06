;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zachary Hueras"
      user-mail-address "zhueras@amdtelemedicine.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Hack Nerd Font" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material)
(setq doom-leader-key ",")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq jiralib-use-restapi t)
(setq jiralib-url "https://amdglobal.atlassian.net")
(setq org-jira-working-dir "~/org/jira/")
(setq org-gcal-client-id "743131239384-juro25oid0vt1re27jmo0j1u189a3d6l.apps.googleusercontent.com"
      org-gcal-client-secret "bpl0cM8DyeldHjhmu5AGwnO5"
      org-gcal-file-alist '(("zachary.hueras@gmail.com" . "gmail.org")))

(setq mu4e-maildir-list (list (expand-file-name "~/.mail/work"))
      mu4e-get-mail-command "mbscync -a"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include t
      mu4e-compose-signature "~/.mail/signature"
      mu4e-show-images t
      mu4e-change-filenames-when-moving t
      smtpmail-queue-mail nil
      message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "localhost"
      smtpmail-smtp-server "localhost"
      smtpmail-smtp-service 1025
      smtpmail-debug-info t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(setq projectile-project-search-path (list "~/projects/work" "~/projects/personal"))
(setq vterm-max-scrollback 9999)
;;(setq request-log-level 'debug)
;;(setq request-message-level 'debug)
(require 'org-jira)
(jiralib-login "zhueras@amdtelemedicine.com" "ZVUhQQExEoyNfuYgIBItE060")

(company-quickhelp-mode)

;; (define-key evil-normal-state-map ";" nil)
;; (define-key org-jira-map (kbd ";pg") 'org-jira-get-projects)
;; (define-key org-jira-map (kbd ";ib") 'org-jira-browse-issue)
;; (define-key org-jira-map (kbd ";ig") 'org-jira-get-issues)
;; (define-key org-jira-map (kbd ";ij") 'org-jira-get-issues-from-custom-jql)
;; (define-key org-jira-map (kbd ";ih") 'org-jira-get-issues-headonly)
;; (define-key org-jira-map (kbd ";iu") 'org-jira-update-issue)
;; (define-key org-jira-map (kbd ";iw") 'org-jira-progress-issue)
;; (define-key org-jira-map (kbd ";in") 'org-jira-progress-issue-next)
;; (define-key org-jira-map (kbd ";ia") 'org-jira-assign-issue)
;; (define-key org-jira-map (kbd ";ir") 'org-jira-refresh-issue)
;; (define-key org-jira-map (kbd ";iR") 'org-jira-refresh-issues-in-buffer)
;; (define-key org-jira-map (kbd ";ic") 'org-jira-create-issue)
;; (define-key org-jira-map (kbd ";ik") 'org-jira-copy-current-issue-key)
;; (define-key org-jira-map (kbd ";sc") 'org-jira-create-subtask)
;; (define-key org-jira-map (kbd ";sg") 'org-jira-get-subtasks)
;; (define-key org-jira-map (kbd ";cc") 'org-jira-add-comment)
;; (define-key org-jira-map (kbd ";cu") 'org-jira-update-comment)
;; (define-key org-jira-map (kbd ";wu") 'org-jira-update-worklogs-from-org-clocks)
;; (define-key org-jira-map (kbd ";tj") 'org-jira-todo-to-jira)
;; (define-key org-jira-map (kbd ";if") 'org-jira-get-issues-by-fixversion)

(dap-ui-mode 1)
(dap-mode 1)
(dap-tooltip-mode 1)
(tooltip-mode 1)
(dap-ui-controls-mode 1)
(setq lsp-semantic-highlighting :immedidate
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-show-hover t
      lsp-ui-sideline-show-code-actions t)

(custom-set-faces
 '(minimap-active-region-background ((t (:background "#212b30")))))

;; (require 'exwm)
;; (require 'exwm-randr)
;; (require 'exwm-systemtray)
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrandr" nil "xrandr --output DP-2 --right-of HDMI-0 --auto")))
;;
;; (setq exwm-workspace-show-all-buffers t
;;       exwm-randr-workspace-monitor-plist '(1 "DP-1" 2 "HDMI-0")
;;       menu-bar-mode 1
;;       tool-bar-mode 1
;;       scroll-bar-mode 1
;;       fringe-mode 1
;;       display-time-default-load-average nil
;;       exwm-workspace-number 4)
;;
;; (setq exwm-input-global-keys `(
;;                                ([?\s-r] . exwm-reset)
;;                                ([?\s-w] . exwm-workspace-switch)
;;                                ,@(mapcar (lambda (i)
;;                                            `(,(kbd (format "s-%d" i)) .
;;                                              (lambda ()
;;                                                (interactive)
;;                                                (exwm-workspace-switch-create ,i))))
;;                                          (number-sequence 0 9))
;;                                ;; Bind "s-&" to launch applications ('M-&' also works if the output
;;                                ;; buffer does not bother you).
;;                                ([?\s-p] . (lambda (command)
;;                                             (interactive (list (read-shell-command "$ ")))
;;                                             (start-process-shell-command command nil command)))
;;                                ;; Bind "s-<f2>" to "slock", a simple X display locker.
;;                                ([s-f2] . (lambda ()
;;                                            (interactive)
;;                                            (start-process "" nil "/usr/bin/slock")))
;;                                ))
;;
;; (display-time-mode t)
;; (exwm-randr-enable)
;; (exwm-systemtray-enable)
;; (exwm-enable)
;;
;; (push ?\s-\  exwm-input-prefix-keys)
;;
;; (defun exwm-logout ()
;;   (interactive)
;;   (recentf-save-list)
;;   (save-some-buffers)
;;   (start-process-shell-command "logout" nil "lxsession-logout"))
