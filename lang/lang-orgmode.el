(provide 'lang-orgmode)

(setq load-path (cons "/usr/share/org-mode/lisp/" load-path))

(defun save-then-publish ()
  (interactive)
  (save-buffer)
  (org-save-all-org-buffers)
  (org-publish-current-project))

(setq org-publish-project-alist
      '(("blog-org" .  (:base-directory "/local/code/github/hadwinzhy.github.com/source/org_posts/"
                                        :base-extension "org"
                                        :publishing-directory "/local/code/github/hadwinzhy.github.com/source/_posts/"
                                        :sub-superscript ""
                                        :recursive t
                                        :publishing-function org-publish-org-to-octopress
                                        :headline-levels 4
                                        :html-extension "markdown"
                                        :octopress-extension "markdown"
                                        :body-only t))
        ("blog-extra" . (:base-directory "/local/code/github/hadwinzhy.github.com/source/org_posts/"
                                         :publishing-directory "~/git/blog/source/"
                                         :base-extension "css\\|pdf\\|png\\|jpg\\|gif\\|svg"
                                         :publishing-function org-publish-attachment
                                         :recursive t
                                         :author nil
                                         ))
        ("blog" . (:components ("blog-org" "blog-extra")))
        ))

