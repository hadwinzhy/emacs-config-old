;;;;;;;;;;;;;;;;;;;;;;add by Hadwin start;;;;;;;;;;;;;;;;;;;
;;try to load all config file under the base folder and subfolder, 
;;now we just support three level folder

(defun scanfolder(base)
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
		 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;;;please change the base folder name here
(let ((base "/local/github/emacs-config"))
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
		 (not (equal f ".."))
                 (not (equal f ".")))
	(scanfolder name)))))

;;;;;;;;;;;;;;;;;;;;;;add by Hadwin end ;;;;;;;;;;;;;;;;;;;;

(require 'init-util)


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


