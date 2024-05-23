;;; test-casual-dired-utils.el --- Casual Dired Utils Tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Charles Choi

;; Author: Charles Choi <kickingvegas@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(require 'ert)
(require 'casual-dired-test-utils)
(require 'casual-dired-utils)

(ert-deftest test-casual-dired-utils-tmenu-bindings ()
  (casualt-setup)

  (let ((test-vectors (list)))
    (push (casualt-suffix-test-vector "F" #'dired-do-find-marked-files) test-vectors)
    (push (casualt-suffix-test-vector "Z" #'dired-do-compress) test-vectors)

    (push (casualt-suffix-test-vector "u" #'dired-upcase) test-vectors)
    (push (casualt-suffix-test-vector "d" #'dired-downcase) test-vectors)

    (push (casualt-suffix-test-vector "s" #'casual-dired-search-replace-tmenu) test-vectors)
    (push (casualt-suffix-test-vector "e" #'casual-dired-elisp-tmenu) test-vectors)
    (push (casualt-suffix-test-vector "l" #'casual-dired-link-tmenu) test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-dired-utils-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-dired-search-replace-tmenu-bindings ()
  (casualt-setup)

  (let ((test-vectors (list)))
    (push (casualt-suffix-test-vector "f" #'dired-do-find-regexp) test-vectors)
    (push (casualt-suffix-test-vector "" #'dired-do-isearch) test-vectors)
    (push (casualt-suffix-test-vector "ó" #'dired-do-isearch-regexp) test-vectors)
    (push (casualt-suffix-test-vector "s" #'dired-do-search) test-vectors)
    (push (casualt-suffix-test-vector "r" #'dired-do-query-replace-regexp) test-vectors)
    (push (casualt-suffix-test-vector "F" #'dired-do-find-regexp-and-replace) test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-dired-search-replace-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-dired-elisp-tmenu-bindings ()
  (casualt-setup)

  (let ((test-vectors (list)))
    (push (casualt-suffix-test-vector "B" #'dired-do-byte-compile) test-vectors)
    (push (casualt-suffix-test-vector "L" #'dired-do-load) test-vectors)
    (push (casualt-suffix-test-vector "D" #'byte-recompile-directory) test-vectors)
    (push (casualt-suffix-test-vector "c" #'checkdoc-dired) test-vectors)
    (push (casualt-suffix-test-vector "e" #'elint-directory) test-vectors)
    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-dired-elisp-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-dired-link-tmenu-bindings ()
  (casualt-setup)

  (let ((test-vectors (list)))
    (push (casualt-suffix-test-vector "h" #'dired-do-hardlink) test-vectors)
    (push (casualt-suffix-test-vector "H" #'dired-do-hardlink-regexp) test-vectors)
    (push (casualt-suffix-test-vector "S" #'dired-do-symlink-regexp) test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-dired-link-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-dired-unicode-db-get ()
  (let ((casual-dired-use-unicode-symbols nil))
    (should (string-equal (casual-dired-unicode-db-get :up-arrow) "Up"))
    (should (string-equal (casual-dired-unicode-db-get :down-arrow) "Down"))
    (should (string-equal (casual-dired-unicode-db-get :goto) "Goto"))
    (should (string-equal (casual-dired-unicode-db-get :directory) "Dir"))
    (should (string-equal (casual-dired-unicode-db-get :file) "File"))
    (should (string-equal (casual-dired-unicode-db-get :subdir) "Subdir")))

  (let ((casual-dired-use-unicode-symbols t))
    (should (string-equal (casual-dired-unicode-db-get :up-arrow) "↑"))
    (should (string-equal (casual-dired-unicode-db-get :down-arrow) "↓"))
    (should (string-equal (casual-dired-unicode-db-get :goto) "→"))
    (should (string-equal (casual-dired-unicode-db-get :directory) "📁"))
    (should (string-equal (casual-dired-unicode-db-get :file) "📄"))
    (should (string-equal (casual-dired-unicode-db-get :subdir) "🗂️"))))

(provide 'test-casual-dired-utils)
;;; test-casual-dired-utils.el ends here
