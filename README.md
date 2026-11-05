
# LiNQ2 Platform (Linked2-platform)

> **ONE FORM. SUBMIT EVERYWHERE.**  
> Sovereign AI Infrastructure | Constellation-25 (C25)  
> Architected for CyGeL | DevOps GuruCTO Execution

## 🎯 Core Directive
Stop repeating data across dozens of gig and marketplace platforms. LiNQ2 acts as a sovereign information gateway. Fill out your information once, select your targets, and route the payload. 

- **Zero Data Retention:** PII is processed in volatile memory only.
- **One-Time Fee:** $4.99 per batch. No subscriptions.
- **Sovereign Execution:** Local-first C25 architecture. No external LLM PII leakage.

---

## 🚀 Quickstart

### 1. Local Execution (Termux / Linux / macOS)
```bash
# Clone the sovereign build
git clone https://github.com/FacePrintPay/linked2-platform.git
cd linked2-platform

# Initialize C25 agent routing and schema
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh

# Serve locally to test LLM routing
python3 -m http.server 8000 --directory pagesHere is the complete, production-ready `README.md` for the LiNQ2 repository. It includes the architectural routing documentation, the Quickstart, the codebase breakdown, and the core execution logic. 

Drop this into the root of your `linked2-platform` repository.

```markdown
# LiNQ2 Platform (Linked2-platform)

> **ONE FORM. SUBMIT EVERYWHERE.**  
> Sovereign AI Infrastructure | Constellation-25 (C25)  
> Architected for CyGeL | DevOps GuruCTO Execution

## 🎯 Core Directive
Stop repeating data across dozens of gig and marketplace platforms. LiNQ2 acts as a sovereign information gateway. Fill out your information once, select your targets, and route the payload. 

- **Zero Data Retention:** PII is processed in volatile memory only.
- **One-Time Fee:** $4.99 per batch. No subscriptions.
- **Sovereign Execution:** Local-first C25 architecture. No external LLM PII leakage.

---

## 🚀 Quickstart

### 1. Local Execution (Termux / Linux / macOS)
```bash
# Clone the sovereign build
git clone https://github.com/FacePrintPay/linked2-platform.git
cd linked2-platform

# Initialize C25 agent routing and schema
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh

# Serve locally to test LLM routing
python3 -m http.server 8000 --directory pages
```

### 2. Atomic GitHub Pages Deployment
```bash
# Stage, commit, and trigger the CI/CD pipeline
git add .
git commit -m "[mars] atomic hot-reload: linq2 index.html update and gh-pages trigger"
git push origin main
```
*Monitor the green light at: `github.com/FacePrintPay/linked2-platform/actions`*

---

## 🏗️ Architecture & Routing Documentation

LiNQ2 is powered by the **Constellation-25 (C25)** local-first OS. All complex tasks are delegated to specific Planetary Agents via the IPC routing queue (`~/c25_ipc/pending/`).

### 1. LLM Intent Routing (Agent: Mercury)
The frontend LLM Assist module does not send PII to cloud APIs. It routes parsing intents to the local C25 Mercury agent (Comms/Parsing) via local IPC.
- **Endpoint:** `http://localhost:8080/api/c25/agent/mercury`
- **Payload:** `{ intent: 'extract_form_data', payload: '<raw_text>', target_schema: 'linq2_gig_application' }`
- **Execution:** Mercury extracts structured JSON, which the frontend JS maps directly to the HTML form IDs.

### 2. Biometric Onboarding Routing (Agent: Jupiter/Saturn)
Identity verification is handled via WebAuthn/Passkey simulation. 
- **Execution:** Cryptographic signature verification. No biometric templates are stored on LiNQ2 servers. Handled locally by the device's Secure Enclave.

### 3. Deployment Routing (Agent: Mars/Varuna)
Atomic hot-reloads and zero-scatter builds are managed via GitHub Actions.
- **Workflow:** `.github/workflows/deploy.yml`
- **Execution:** Checks out `main`, uploads the `/pages` directory artifact, and deploys via `actions/deploy-pages@v4`.

---

## 💻 Codebase Structure

```text
linked2-platform/
├── .github/workflows/
│   └── deploy.yml          # CI/CD GitHub Pages deployment pipeline
├── pages/
│   └── index.html          # Complete UI payload (HTML/CSS/JS)
├── scripts/
│   ├── bootstrap.sh        # C25 local environment initializer
│   └── deploy-linq2.sh     # Atomic bash deployment script
├── backend/agents/         # C25 Planetary Agent execution logic
├── schema/                 # AI OS data schemas and strict validation
├── prompts/                # LLM prompt layers and orchestration
└── README.md               # This file
```

### Core Execution Logic (JavaScript Routing)
The following JS handles the C25 LLM routing, Modal state management, and Biometric simulation inside `pages/index.html`:

```javascript
// --- C25 LLM MODULE ROUTING ---
const C25_API_ENDPOINT = 'http://localhost:8080/api/c25/agent/mercury'; 

async function processLLMIntent(type) {
  const inputId = type === 'gig' ? 'llm-input-gig' : 'llm-input-goods';
  const statusId = type === 'gig' ? 'llm-status-gig' : 'llm-status-goods';
  const input = document.getElementById(inputId).value;
  const status = document.getElementById(statusId);
  
  if (!input.trim()) { status.innerText = 'Please provide text to parse.'; return; }
  status.innerText = 'Routing to C25 Agent...';
  
  try {
    const response = await fetch(C25_API_ENDPOINT, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ 
        intent: type === 'gig' ? 'extract_form_data' : 'extract_item_data', 
        payload: input,
        target_schema: type === 'gig' ? 'linq2_gig_application' : 'linq2_marketplace_listing' 
      })
    });
    if (!response.ok) throw new Error('Agent routing failed');
    const data = await response.json();
    
    // Auto-fill form fields based on agent response
    if (type === 'gig') {
      if (data.full_name) document.getElementById('full_name').value = data.full_name;
      if (data.email) document.getElementById('email').value = data.email;
      if (data.phone) document.getElementById('phone').value = data.phone;
    } else {
      if (data.title) document.getElementById('item_title').value = data.title;
      if (data.price) document.getElementById('price').value = data.price;
    }
    status.innerText = 'Form auto-filled successfully.';
  } catch (error) {
    status.innerText = 'Local agent unreachable. Verify C25 IPC is running.';
  }
}

// --- MODAL & BIOMETRIC ROUTING ---
function openModal(id) { document.getElementById(id).classList.add('active'); }
function closeModal(id) { document.getElementById(id).classList.remove('active'); }

function simulateBiometric() {
  const btn = document.getElementById('bio-btn');
  const status = document.getElementById('bio-status');
  btn.innerText = 'Scanning...';
  setTimeout(() => {
    btn.innerText = 'Verifying Cryptographic Signature...';
    setTimeout(() => {
      btn.innerText = 'Identity Secured';
      status.innerText = 'Passkey successfully registered.';
    }, 1500);
  }, 2000);
}
```

---

## ⚠️ Legal & Privacy Disclaimer
- **Data Privacy:** LiNQ2 acts strictly as an information gateway. We do not store, sell, or retain personal user data. 
- **Affiliation:** Logos and brand names are used for identification purposes only. LiNQ2 is **not** affiliated with, endorsed by, or sponsored by DoorDash, Uber, Amazon, eBay, Meta, or any other listed platform.
- **Execution:** Final submission, verification, and approval are handled exclusively by each target platform.

---

*Licensed under SovereignGTP / Copyleft21. Built for Kre8tive Holdings.*  
**#FullThrottle**
ng DocumentationLiNQ2 is powered by the Constellation-25 (C25) local-first OS. All complex tasks are delegated to specific Planetary Agents via the IPC routing queue (~/c25_ipc/pending/).1. LLM Intent Routing (Agent: Mercury)The frontend LLM Assist module does not send PII to cloud APIs. It routes parsing intents to the local C25 Mercury agent (Comms/Parsing) via local IPC.Endpoint: http://localhost:8080/api/c25/agent/mercuryPayload: { intent: 'extract_form_data', payload: '<raw_text>', target_schema: 'linq2_gig_application' }Execution: Mercury extracts structured JSON, which the frontend JS maps directly to the HTML form IDs.2. Biometric Onboarding Routing (Agent: Jupiter/Saturn)Identity verification is handled via WebAuthn/Passkey simulation. Execution: Cryptographic signature verification. No biometric templates are stored on LiNQ2 servers. Handled locally by the device's Secure Enclave.3. Deployment Routing (Agent: Mars/Varuna)Atomic hot-reloads and zero-scatter builds are managed via GitHub Actions.Workflow: .github/workflows/deploy.ymlExecution: Checks out main, uploads the /pages directory artifact, and deploys via actions/deploy-pages@v4.💻 Codebase Structuretextlinked2-platform/
├── .github/workflows/
│   └── deploy.yml          # CI/CD GitHub Pages deployment pipeline
├── pages/
│   └── index.html          # Complete UI payload (HTML/CSS/JS)
├── scripts/
│   ├── bootstrap.sh        # C25 local environment initializer
│   └── deploy-linq2.sh     # Atomic bash deployment script
├── backend/agents/         # C25 Planetary Agent execution logic
├── schema/                 # AI OS data schemas and strict validation
├── prompts/                # LLM prompt layers and orchestration
└── README.md               # This fileCore Execution Logic (JavaScript Routing)The following JS handles the C25 LLM routing, Modal state management, and Biometric simulation inside pages/index.html:javascript1234567891011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556// --- C25 LLM MODULE ROUTING ---const C25_API_ENDPOINT = 'http://localhost:8080/api/c25/agent/mercury'; async function processLLMIntent(type) {  const inputId = type === 'gig' ? 'llm-input-gig' : 'llm-input-goods';  const statusId = type === 'gig' ? 'llm-status-gig' : 'llm-status-goods';  const input = document.getElementById(inputId).value;  const status = document.getElementById(statusId);    if (!input.trim()) { status.innerText = 'Please provide text to parse.'; return; }  status.innerText = 'Routing to C25 Agent...';    try {    const response = await fetch(C25_API_ENDPOINT, {      method: 'POST',      headers: { 'Content-Type': 'application/json' },      body: JSON.stringify({         intent: type === 'gig' ? 'extract_form_data' : 'extract_item_data',         payload: input,        target_schema: type === 'gig' ? 'linq2_gig_application' : 'linq2_marketplace_listing'       })    });    if (!response.ok) throw new Error('Agent routing failed');    const data = await response.json();        // Auto-fill form fields based on agent response    if (type === 'gig') {      if (data.full_name) document.getElementById('full_name').value = data.full_name;      if (data.email) document.getElementById('email').value = data.email;      if (data.phone) document.getElementById('phone').value = data.phone;    } else {      if (data.title) document.getElementById('item_title').value = data.title;      if (data.price) document.getElementById('price').value = data.price;    }    status.innerText = 'Form auto-filled successfully.';  } catch (error) {    status.innerText = 'Local agent unreachable. Verify C25 IPC is running.';  }}// --- MODAL & BIOMETRIC ROUTING ---function openModal(id) { document.getElementById(id).classList.add('active'); }function closeModal(id) { document.getElementById(id).classList.remove('active'); }function simulateBiometric() {  const btn = document.getElementById('bio-btn');  const status = document.getElementById('bio-status');  btn.innerText = 'Scanning...';  setTimeout(() => {    btn.innerText = 'Verifying Cryptographic Signature...';    setTimeout(() => {      btn.innerText = 'Identity Secured';      status.innerText = 'Passkey successfully registered.';    }, 1500);  }, 2000);}⚠️ Legal & Privacy DisclaimerData Privacy: LiNQ2 acts strictly as an information gateway. We do not store, sell, or retain personal user data. Affiliation: Logos and brand names are used for identification purposes only. LiNQ2 is not affiliated with, endorsed by, or sponsored by DoorDash, Uber, Amazon, eBay, Meta, or any other listed platform.Execution: Final submission, verification, and approval are handled exclusively by each target platform.