;;; test-casual-dired-settings.el --- Casual Dired Settings Tests  -*- lexical-binding: t; -*-

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
(require 'casual-dired-settings)

(ert-deftest test-casual-dired-settings-tmenu-bindings ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (push (casualt-suffix-test-vector "l" #'casual-dired--customize-dired-use-ls-dired) test-vectors)
    (push (casualt-suffix-test-vector "r" #'casual-dired--customize-dired-auto-revert-buffer) test-vectors)
    (push (casualt-suffix-test-vector "t" #'casual-dired--customize-dired-dwim-target) test-vectors)
    (push (casualt-suffix-test-vector "s" #'casual-dired--customize-dired-listing-switches) test-vectors)
    (push (casualt-suffix-test-vector "d" #'casual-dired--customize-dired-group) test-vectors)
    (push (casualt-suffix-test-vector "a" #'casual-dired-about) test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-dired-settings-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))



(provide 'test-casual-dired-settings)
;;; test-casual-dired-setttings.el ends here
