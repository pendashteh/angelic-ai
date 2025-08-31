# Multi-Entity Coordination Dashboard

## Overview

A comprehensive dashboard demonstrating how people, services, and agents coordinate on **Cases** with full **explainability** and **REA (Resource-Event-Agent) events**. The system provides protocol-level health monitoring for AGNTCY/A2A/MCP protocols while maintaining transparency and auditability.

## Architecture

### Core Concepts

- **Cases**: Central coordination units representing service requests or interactions
- **REA Events**: Resource-Event-Agent ledger tracking all state changes
- **Agent Mesh**: Network of autonomous agents coordinating via AGNTCY/A2A protocols
- **MCP Tools**: Model Context Protocol for structured agent-to-service interactions
- **RaC (Rules as Code)**: DMN/Rego/BPMN policy engine with versioning

### Protocol Stack

```
┌─────────────────┐
│   Dashboard UI  │
├─────────────────┤
│ AGNTCY Discovery│
│ A2A Messaging   │
│ MCP Tool Calls  │
├─────────────────┤
│ SLIM Transport  │
│ (Message Queue) │
├─────────────────┤
│ REA Event Store │
│ Policy Engine   │
└─────────────────┘
```

## Features

### 1. Case Timeline (REA Ledger)
- **Event Stream**: Complete audit trail of case progression
- **Resource Tracking**: Inventory changes, voucher usage, capacity allocation
- **Agent Coordination**: Multi-party interactions with identity verification
- **Explainability Engine**: 
  - Rules fired with justification
  - Dataset provenance and quality metrics
  - Counterfactual analysis ("what if" scenarios)

### 2. Live Agent Mesh
- **AGNTCY Discovery**: Real-time agent registry with capabilities and attestations
- **A2A Conversations**: Inter-agent communication monitoring
  - Request/response patterns
  - Latency and error rate tracking
  - Protocol compliance validation
- **MCP Monitoring**: Tool call success rates, schema validation, performance metrics
- **SLIM Health**: Message queue status, throughput, backpressure indicators

### 3. Policy & Rules Center (RaC)
- **Rule Repository**: Version-controlled DMN/Rego/BPMN artifacts
- **Quality Scorecards**: Coverage, fairness, freshness metrics
- **Promotion Pipeline**: Sandbox → Advisory → Actioning workflow
- **Testing Framework**: Automated policy validation and regression testing

### 4. Service Directory & Data Provenance
- **Dataset Catalog**: Comprehensive metadata with lineage tracking
- **Quality Badges**: Confidence scores, staleness indicators, validation status
- **Refresh Controls**: Manual and automated data pipeline management
- **Impact Analysis**: Downstream effect tracking for data changes

### 5. Operational KPIs
- **Performance Metrics**: Success rates, resolution times, handoff efficiency
- **Inclusion Tracking**: Accessibility compliance, interpreter usage, barrier identification
- **Safety Monitoring**: Guardrail activations, consent violations, risk incidents

## User Roles & Access Control

### Community Staff
- Case timeline access with explainability
- Agent mesh visibility for coordination
- Basic KPI dashboards

### Volunteers
- Limited case view (assigned cases only)
- Service directory access
- Inclusion metrics visibility

### Program Managers
- Full dashboard access
- Policy promotion controls
- Advanced analytics and reporting

### Tech Ops
- System health monitoring
- Protocol-level diagnostics
- Performance optimization tools

### Auditors
- Read-only access to all data
- Enhanced explainability features
- Compliance reporting tools

## API Specification

### Core Endpoints

```
GET    /cases/{id}                    # Case details + REA events
GET    /cases/{id}/explanations       # Rule firing analysis
GET    /agents/mesh                   # AGNTCY directory + A2A status
GET    /tools/activity                # MCP call logs + validation
GET    /packs                         # Policy packs + scorecards
POST   /packs/promote                 # Pack promotion workflow
GET    /datasets                      # Data catalog + provenance
GET    /kpis                          # Operational metrics
```

### WebSocket Streams

```
a2a.conversations    # Real-time agent communication
mcp.calls           # Tool invocation monitoring
case.events         # Case state changes
system.health       # Protocol status updates
```

### Event Schema (REA Model)

```json
{
  "event_id": "uuid",
  "timestamp": "2025-08-30T10:30:00Z",
  "case_id": "case_123",
  "event_type": "booking_confirmed",
  "resources": [
    {
      "type": "appointment_slot",
      "id": "slot_456",
      "delta": -1,
      "location": "council_office_a"
    }
  ],
  "agents": [
    {
      "id": "resident_agent_789",
      "role": "requester",
      "attestation": "did:key:..."
    },
    {
      "id": "council_booking_agent",
      "role": "provider",
      "attestation": "did:web:council.gov.au"
    }
  ],
  "explanation": {
    "rules_fired": ["booking_eligibility", "capacity_check"],
    "datasets_used": ["resident_registry", "appointment_availability"],
    "confidence": 0.94,
    "alternatives_considered": 3
  }
}
```

## Compliance & Security

### Accessibility (WCAG 2.2 AA)
- Keyboard navigation support
- Screen reader compatibility
- High contrast mode
- Caption support for multimedia content

### Privacy & Data Protection
- No PII in browser storage
- Consent receipt management
- Data minimization principles
- Export/deletion capabilities

### Performance Requirements
- 99.9% uptime SLA
- <2s load time for dashboards (p95)
- Real-time streaming for trace data
- Graceful degradation under load

## Development Setup

### Prerequisites
- Node.js 18+
- TypeScript 5+
- React 18+
- WebSocket support

### Dependencies
```json
{
  "react": "^18.0.0",
  "recharts": "^2.8.0",
  "lucide-react": "^0.263.1",
  "tailwindcss": "^3.0.0"
}
```

### Environment Variables
```bash
DASHBOARD_API_BASE=https://api.coordination.gov.au
WEBSOCKET_ENDPOINT=wss://events.coordination.gov.au
AGNTCY_DISCOVERY_URL=https://discovery.agntcy.network
```

## Demo Scenarios

### Scenario 1: Explainable Booking Decision
1. Navigate to Case Timeline for case ID "council_appointment_001"
2. Click on "booking_confirmed" event
3. View explainability panel showing:
   - Rules fired: eligibility_check, capacity_allocation
   - Dataset used: resident_registry (freshness: 2 hours)
   - Alternatives: 3 other slots considered, ranked by proximity + availability

### Scenario 2: Cross-Org A2A Coordination
1. Open Live Agent Mesh view
2. Locate ongoing conversation between council_agent and ngo_translator
3. Follow message trace showing:
   - Initial request with language preference
   - Capability negotiation
   - Service fulfillment confirmation

### Scenario 3: Guardrail Activation
1. Navigate to Safety Monitoring in KPIs
2. View recent "blocked_by_guardrail" incident
3. See details:
   - Rule: prevent_double_booking
   - Trigger: attempted slot collision
   - Remediation: alternative slot suggested

### Scenario 4: Policy Pack Promotion
1. Access Policy & Rules Center
2. View "accessibility_enhancement_v2" pack in Advisory stage
3. Review scorecard (98% test coverage, fairness validated)
4. Execute promotion to Actioning stage

## Monitoring & Observability

### Health Checks
- `/health/live` - Basic service availability
- `/health/ready` - Full system readiness
- `/health/protocols` - AGNTCY/A2A/MCP status

### Metrics Collection
- Prometheus-compatible endpoints
- Distributed tracing with OpenTelemetry
- Custom business metrics via `/metrics/business`

### Alerting Thresholds
- Response time p95 > 5s
- Error rate > 1%
- Agent mesh connectivity < 95%
- Policy test coverage < 90%

## Contributing

### Code Standards
- TypeScript strict mode
- ESLint + Prettier configuration
- Component-driven architecture
- Accessibility-first development

### Testing Strategy
- Unit tests for business logic
- Integration tests for API interactions
- E2E tests for demo scenarios
- Accessibility testing with axe-core

## License

MIT License - See LICENSE file for details

## Support

For technical issues or feature requests, contact the coordination platform team at support@coordination.gov.au
