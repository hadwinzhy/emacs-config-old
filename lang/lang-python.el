(provide 'lang-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fgallina Python Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: https://github.com/fgallina/python.el
;;Usage:M-x describe-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fgallina Python End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(require 'python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Pymacs Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download:https://github.com/pinard/Pymacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Pymacs End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")


(defun setup-ropemacs ()
  "Setup the ropemacs harness"
  (message "****************************")
  (if (and (getenv "PYTHONPATH") (not (string= (getenv "PYTHONPATH") "")))
      (message "true")
    (message "false"))
  (message "****************************")
  ;; If PYTHONPATH is set and not an empty string
  (if (and (getenv "PYTHONPATH") (not (string= (getenv "PYTHONPATH") "")))
      ;; append at the end with separator
      (setenv "PYTHONPATH"
	      (concat
	       (getenv "PYTHONPATH") path-separator
	       (concat epy-install-dir "python-libs/")))
    ;; else set it without separator
    (setenv "PYTHONPATH"
	    (concat epy-install-dir "python-libs/"))
    )
  
  (pymacs-load "ropemacs" "rope-")
  
  ;; Stops from erroring if there's a syntax err
  (setq ropemacs-codeassist-maxfixes 3)

  ;; Configurations
  (setq ropemacs-guess-project t)
  (setq ropemacs-enable-autoimport t)


  (setq ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"
				      "django.*"))

 

  ;; Adding hook to automatically open a rope project if there is one
  ;; in the current or in the upper level directory
   (add-hook 'python-mode-hook
            (lambda ()
              (cond ((file-exists-p ".ropeproject")
                     (rope-open-project default-directory))
                    ((file-exists-p "../.ropeproject")
                     (rope-open-project (concat default-directory "..")))
                    )))
  )

;; Ipython integration with fgallina/python.el
(defun epy-setup-ipython ()
  "Setup ipython integration with python-mode"
  (interactive)

  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \[[0-9]+\]: "
   python-shell-prompt-output-regexp "Out\[[0-9]+\]: "
   python-shell-completion-setup-code ""
   python-shell-completion-string-code "';'.join(get_ipython().complete('''%s''')[1])\n")
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Python Mode Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download:https://github.com/pinard/Pymacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Python Mode End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'python-mode)
(setq py-load-pymacs-p t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PyComplete Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: 1) pycomplete.py: http://www.rwdev.eu/python/pycomplete/pycomplete.py
;;          2) pycomplete.el: http://www.rwdev.eu/python/pycomplete/pycomplete.el
;;Usage: put pycomplete.py to /usr/local/lib/python2.7/dist-packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PyComplete End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode settings
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist(cons '("python" . python-mode)
                             interpreter-mode-alist))
;; path to the python interpreter, e.g.: ~rw/python27/bin/python2.7
(setq py-python-command "python")
(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq pymacs-python-command py-python-command)

(require 'pycomplete)
