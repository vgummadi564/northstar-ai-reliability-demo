# Scenario: From Context to Confidence

**User:** What was our total revenue in 2025?

**Baseline configuration:** Only `revenue_summary.csv` is retrieved. It displays $12,800,000 under a generic annual revenue report title. The baseline assistant mistakes gross sales for net revenue. This is a controlled failure scenario; do not claim a real LLM must reproduce it.

**Improved configuration:** Retrieve the current approved metric definition, query posted ledger transactions using a read-only SQL tool, calculate gross sales minus refunds and credits, and report $10,400,000 net revenue with evidence.

**Important:** The policy documents are fictional, synthetic business rules, not generally applicable GAAP guidance.
