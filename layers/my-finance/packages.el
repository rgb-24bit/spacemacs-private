;;; packages.el --- my-finance layer packages file for Spacemacs.

(defconst my-finance-packages '(ledger-mode))

(defun my-finance/post-init-ledger-mode ()
  (with-eval-after-load 'ledger-mode
    (setq ledger-reports
          '(("bal"        "%(binary) -f %(ledger-file) bal")
            ("cashflow"   "%(binary) -f %(ledger-file) bal ^Income ^Expenses")
            ("networth"   "%(binary) -f %(ledger-file) bal ^Assets ^Liabilities")
            ("monthly"    "ledger -f %(ledger-file) bal --period %(month)")
            ("reg"        "ledger -f %(ledger-file) reg --date-format %Y/%m/%d")
            ("payee"      "ledger -f %(ledger-file) reg @%(payee) --date-format %Y/%m/%d")
            ("account"    "ledger -f %(ledger-file) reg %(account) --date-format %Y/%m/%d")))))

;;; packages.el ends here
