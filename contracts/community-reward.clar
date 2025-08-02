;; ----------------------------------------------
;; On-Chain Community Reward Funding System (OCRFS)
;; Contract: community-rewards.clar
;; ----------------------------------------------

(define-data-var reward-pool uint u0)

;; Optional: Track individual donation totals
(define-map donor-history principal uint)

;; -----------------------------
;; 1. Contribute to Reward Pool
;; -----------------------------
(define-public (donate (amount uint))
  (let ((transfer-amount amount))
    (begin
      ;; Validate: Only accept non-zero donations
      (asserts! (> amount u0) (err u300))

      ;; Transfer STX from sender to contract
      (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))

      ;; Update total reward pool
      (var-set reward-pool (+ (var-get reward-pool) amount))

      ;; Update donor history
      (let ((prev (default-to u0 (map-get? donor-history tx-sender))))
        (map-set donor-history tx-sender (+ prev amount)))

      (ok amount))))
