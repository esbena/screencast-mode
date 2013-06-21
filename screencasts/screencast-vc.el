;;; screencast-vc.el

;; Copyright (C) 2009 ESBEN Andreasen <esbenandreasen@gmail.com>

;; Authors: esbenandreasen <esbenandreasen@gmail.com>

;; Keywords: screencast

;; This file is not an official part of emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, you can either send email to this
;; program's maintainer or write to: The Free Software Foundation,
;; Inc.; 59 Temple Place, Suite 330; Boston, MA 02111-1307, USA.

;;; Code:

(require 'screencast-record)

(setq screencast-speech nil)
(defun screencast-vc (&optional arg)
  (interactive "P")
  (apply (if arg
             'screencast-record
           'screencast)
         screencast-vc-text
         "vc"
         1.1
         26
         ()
         )
  )

(setq screencast-vc-text
      '(
        "This is the screencast for using the version control system
   in Emacs."n
   "You are assumed to have an understanding of how a version
   control system works."n
   "This screencast will be using a directory which is already
   under version control."n
   b
   "VC supplies a uniform interface for interacting with a lot of
   different version control systems."n
   "The most important command to know is vc-next-action, it
   changes behavior based on the state of the file."
   (progn (save-buffer))
   (vc-next-action nil)
   "In the minibuffer, you can see that vc-next-action detected
   that our file wasn't under version control, and chose to
   register it"n
   "If we do vc-next-action again, we will be prompted for the
log message to be used when the file is committed:"
   (progn (split-window-vertically))
   (vc-next-action nil)
   (screencast-producer-new-buffer
    '(
      "Let's type the message, and commit:"
      (i "initial commit")
      (progn (save-buffer))
      (log-edit-done))
    "*VC-log*")
   "The file is now committed to the version control system."
   b
   "If we edit it, and do vc-next-action once again - it will be committed once more:"
   (i "This is some text")
   (progn (save-buffer))
   (message (buffer-name (current-buffer)))
   (vc-next-action)
   ;;    (screencast-producer-new-buffer
   ;;     '(
   ;;       "Notice that the previous log message is in the buffer, it
   ;; is easily removed as it is between point and mark!"
   ;;       (kill-region (point) (mark))
   ;;       "We can also browse the old log message(s):"
   ;;       (log-edit-previous-comment 1)
   ;;       "And forward:"
   ;;       (log-edit-next-comment 1)
   ;;       "(searching old log messages is also possible using
   ;; log-edit-comment-search-backward)"
   ;;       "If the commit involves more than one file, you might want
   ;; to see which those are:"
   ;;       (log-edit-show-files)
   ;;       "That's just the one we expected"
   ;;       (i "added some text")
   ;;       (log-edit-done)
   ;;       (progn (save-buffer)
   ;;              (message ""))
   ;;       )
   ;;     "*VC-log*")
   ;;    "That was one command.. now the rest - there's really not many more to know"n
   ;;    "Before a commit - the diff should be viewed: vc-diff handles that:"
   ;;    (vc-diff)
   ;; cleanup
   (progn (shell-command "svn rm --force vc"))
   )
      )
