Community Reward Funding Contract (`community-reward.clar`)

A Clarity smart contract that implements the **On-Chain Community Reward Funding System (OCRFS)** — a decentralized, transparent reward pool for funding contributors to open-source or community-driven initiatives on the Stacks blockchain.

---

Overview

This contract allows individuals, organizations, and DAOs to **donate STX** into a secure reward pool. These funds can later be distributed to community members who complete verified tasks or contribute to approved projects.

Built as a core module of the **Proof of Community Work (PoCW) Protocol**, this contract ensures accountability, transparency, and non-custodial funding mechanisms on-chain.

---

Features

Accepts STX donations via a `donate` function
Tracks total pool balance
Records per-address donation history (`donor-history` map)
Rejects invalid (zero) donations
Includes read-only access to:
  - Admin address
  - Current reward pool balance
  - Total donated by any wallet

---

Contract Functions

`donate`

Allows anyone to contribute STX to the reward pool.

```clarity
(donate)
