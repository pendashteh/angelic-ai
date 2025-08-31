[Channels] Web • Voice/IVR • SMS/WhatsApp • Kiosk • Staff Console
   |
[Ingress/API GW] (authN/Z, rate limit, schema validation)
   |
[AGNTCY layer]  ── Directory (OASF) • Identity (agent passports) • SLIM messaging • Observability
   |                                 (agents discover & prove who they are)
   +---- A2A (agent↔agent negotiation, delegation, status exchange)
   |
[Agent Orchestrator]
  ├─ Planner (LLM, JSON-only decoding)
  ├─ Tool Router (MCP clients ↔ MCP servers)
  ├─ Policy/Consent Engine (Rego/DMN; RaC)
  └─ Explainer (provenance, counterfactuals)
   |
[Symbolic/Workflow]
  ├─ Decision tables (DMN)   ← Rules-as-Code
  ├─ Policy guards (OPA/Rego)← Rules-as-Code
  └─ Workflows (BPMN/SCXML)  ← Rules-as-Code
   |
[Case/REA Ledger]
  ├─ Events (booking_requested, booking_confirmed, etc.)
  ├─ Resources (time slots, vouchers, stock, budgets)
  └─ Agents (people, services, AI agents)
   |
[Data & Adapters]
  ├─ Open data (service directories, GTFS, etc.)
  ├─ Council/NGO APIs (bookings, forms)
  └─ Notifications (SMS, email, calendar)
