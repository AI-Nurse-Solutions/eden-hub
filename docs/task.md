# Mac Studio Hub - EDEN Orchestration Task List

## Phase 1: Architecture & Hardware Planning
- [x] Research & Define Mac Studio Specs
    - [x] Compare M2 Max vs M2 Ultra for parallel container workloads.
    - [x] Calculate RAM requirements for 9+ containers and local LLMs (Robert's Ultra-Hub Update).
    - [x] Select high-speed external storage solution (Thunderbolt 5 ready).
- [x] Orchestration Layer Design
    - [x] Choose a container management UI (e.g., Coolify).
    - [x] Design the automated deployment flow for graduates.
    - [x] Plan integration between OpenCLAW, Claude Code, and Antigravity.

## Phase 2: Docker Environment Setup
- [x] Configure Docker Desktop / OrbStack for Mac.
    - [x] Verify Docker installation and connectivity.
    - [x] Build the "Incubator" base image.
- [ ] Set up local LLM infrastructure (Ollama + small models).
- [x] Implement the container spawning script.

## Phase 3: Integration & Testing
- [x] Initial Test Spawn
    - [x] Spawn a test incubator and verify its connectivity.
- [x] Simulate the multi-incubator environment (9+ containers).
- [ ] Integrate Antigravity with Docker orchestration (The 'Orchestrator Skill').
- [x] Test parallel execution of 9 Incubators.
- [ ] Verify deployment flow for new graduate containers.
