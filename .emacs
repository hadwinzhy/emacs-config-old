;;;;;;;;;;;;;;;;;;;;;;add by Hadwin start;;;;;;;;;;;;;;;;;;;
;;try to load all config file under the base folder and subfolder, 
;;now we just support three level folder

(defvar basePath "/local/code/github/emacs-config"
  "the basePath of .emacs.d")

(defun scanfolder(base)
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
		 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;;;please change the base folder name here
(dolist (f (directory-files basePath))
  (let ((name (concat basePath "/" f)))
    (when (and (file-directory-p name) 
               (not (equal f ".."))
               (not (equal f ".")))
      (scanfolder name))))

;;;;;;;;;;;;;;;;;;;;;;add by Hadwin end ;;;;;;;;;;;;;;;;;;;;

(require 'init-util)
(require 'init-lang)

;(require 'lang-shell)
;(require 'lang-c)
;(require 'lang-c)
;(load "rc-gnus.el")
;(require 'rc-autocomplete)
;(load "rc-cedet.el")
;(load "lang-tex.el")
;(load "lang-c.el")
;(load "lang-java.el")
;(load "lang-objc.el")
;(load "lang-python.el")
;(load "rc-key.el")




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline bold bold-italic modeline])
 '(ansi-color-names-vector ["black" "red" "PaleGreen" "yellow" "DodgerBlue1" "magenta" "cyan" "white"])
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.17032967032967034 . 0.2857142857142857) (ecb-sources-buffer-name 0.17032967032967034 . 0.22448979591836735) (ecb-methods-buffer-name 0.17032967032967034 . 0.2857142857142857) (ecb-history-buffer-name 0.17032967032967034 . 0.1836734693877551)) ("left-analyse" (ecb-directories-buffer-name 0.1978021978021978 . 0.2653061224489796) (ecb-sources-buffer-name 0.1978021978021978 . 0.24489795918367346) (ecb-methods-buffer-name 0.1978021978021978 . 0.22448979591836735) (ecb-analyse-buffer-name 0.1978021978021978 . 0.24489795918367346)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
