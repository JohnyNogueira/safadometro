;; made by Mauricio Rocha @ 20151216
;; Safadometro for Emacs 24
;; Paste the code inside a buffer and eval the buffer to execute
(defun safadometro ()
  (interactive)
  (let (birthdate)
    (progn
      (setq birthdate (read-no-blanks-input "Digite sua data de nascimento dd/mm/aa: "))
      )
    (if (and (< 7 (length birthdate))
             (> 9 (length birthdate)))
        (let ((sum 0) list day month year safadeza)
        (progn
          (setq list (split-string birthdate "/"))
          (setq day (string-to-int (nth 0 list)))
          (setq month (string-to-int (nth 1 list)))
          (setq year (string-to-int (nth 2 list)))
          (while (> month 0)
            (setq sum (+ sum month))
            (setq month (1- month)))
          (setq safadeza (+ sum (* (/ year 100.0) (- 50 day))))
          (message (format "Você é %s safado, e %s anjo." safadeza (- 100 safadeza)))
          )
        )
        (message "Por favor, digite no formato dd/mm/aa.")
      ) 
    )
)

(safadometro)
