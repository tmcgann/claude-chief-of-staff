# AI Chief of Staff — Engineering Manager Edition

Forked from [Mike Murchison's AI Chief of Staff](https://github.com/mimurchison/claude-chief-of-staff) (CEO of [Ada](https://ada.cx)), adapted for engineering managers.

I'm [Taylor McGann](https://linkedin.com/in/taylormcgann), Engineering Manager at [Neo.Tax](https://neo.tax). I manage 7 engineers across 3 squads and needed a version of the AI Chief of Staff that optimizes for what EMs actually spend time on: keeping engineers unblocked, developing people, shipping reliably, hiring, and staying technical.

This repo gives you the same AI-powered operating system, reframed for engineering management.

---

## What It Does

### 1. Communicate
Triage Slack, Linear, GitHub, and email. Draft responses in your voice, prioritized by who's blocked and what's urgent. Engineers waiting on you get surfaced first.

### 2. Manage Your Team
1:1 prep with context from Linear, Slack, and meeting notes. Coaching and feedback tracking per direct report. Shout-out tracking for all-hands recognition. Hiring pipeline management.

### 3. Stay On Top of Delivery
Cross-squad status at a glance. Blocker detection from Linear. Weekly planning prep for sprint reviews. Status updates ready for your CTO.

### 4. Achieve Goals
Define quarterly objectives. Every triage decision, scheduling recommendation, and task prioritization is filtered through what you said matters most. Claude flags when your calendar doesn't match your goals.

---

## Quick Start

### Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- Gmail MCP server (for email)
- Google Calendar MCP server (for scheduling)
- Slack MCP server (recommended — where most EM communication happens)
- Linear MCP server (recommended — for squad status tracking)

### 3 Steps

```bash
# 1. Clone
git clone https://github.com/taylormcgann/claude-chief-of-staff.git
cd claude-chief-of-staff

# 2. Install
chmod +x install.sh
./install.sh

# 3. Try it
claude
# Then type: /gm
```

---

## Commands

### Core (from original)
| Command | What It Does |
|---------|-------------|
| `/gm` | Morning briefing — calendar, squad status, tasks, code reviews, hiring |
| `/triage` | Inbox triage across Slack, Linear, GitHub, Gmail |
| `/my-tasks` | Task tracking with execution support |
| `/enrich` | Contact enrichment with coaching note tracking |

### New for EMs
| Command | What It Does |
|---------|-------------|
| `/1on1 <name>` | 1:1 prep — pulls Linear, Slack, Notion, coaching notes |
| `/hiring [status\|prep\|debrief\|jd]` | Hiring pipeline management |
| `/weekly [plan\|status\|retro]` | Weekly squad review, status updates, retros |
| `/shoutouts [add\|review\|draft]` | Track and draft all-hands recognition |

---

## What's Included

```
claude-chief-of-staff/
├── CLAUDE.md                         # AI operating system — EM edition
├── install.sh                        # Setup + update script
├── goals.yaml                        # Quarterly objectives
├── my-tasks.yaml                     # Task tracking
├── schedules.yaml                    # Automation schedules
├── shoutouts.yaml                    # Shout-out tracker
├── .claude/
│   └── skills/                       # Claude Code slash commands
│       ├── gm/SKILL.md              # /gm — Morning briefing
│       ├── triage/SKILL.md          # /triage — Inbox triage
│       ├── my-tasks/SKILL.md        # /my-tasks — Task management
│       ├── enrich/SKILL.md          # /enrich — Contact enrichment
│       ├── 1on1/SKILL.md           # /1on1 — 1:1 prep
│       ├── hiring/SKILL.md         # /hiring — Hiring pipeline
│       ├── weekly/SKILL.md         # /weekly — Weekly planning & retros
│       └── shoutouts/SKILL.md      # /shoutouts — Shout-out tracking
├── contacts/
│   ├── example-contact.md            # General contact template
│   └── direct-report-template.md     # Direct report template
└── docs/
    ├── setup-guide.md                # Detailed setup walkthrough
    ├── mcp-servers.md                # MCP server installation
    └── customization.md              # Customization guide
```

### How skills work

This repo is a **configuration repository** — you edit and improve skills here, but you use them everywhere else (your main codebase, home directory, etc.).

Claude Code only loads project-level skills from the directory you're working in. So `.claude/skills/` in this repo lets you **test** skills before deploying, but to actually use `/gm` from your day-to-day projects, you need them installed globally.

**`install.sh` handles this.** It copies skills to `~/.claude/skills/` where Claude Code loads them regardless of your working directory.

| Location | Purpose |
|----------|---------|
| `.claude/skills/` (this repo) | Author, edit, and test skills |
| `~/.claude/skills/` (global) | Use skills from anywhere — deployed by `install.sh` |

### Updating skills

Re-run `install.sh` anytime after pulling changes. It always syncs skills to the latest version, removes skills that no longer exist in the repo, and preserves your user data (goals, tasks, contacts, shout-outs).

---

## MCP Servers

| Server | Priority | What It Enables |
|--------|----------|-----------------|
| Gmail | **Required** | Email triage, drafting |
| Google Calendar | **Required** | Scheduling, availability, meeting prep |
| Slack | **Required** | Team communication, blocker detection |
| Linear | **Required** | Sprint tracking, squad status, blockers |
| Notion | Recommended | 1:1 notes, quarterly goals, team docs |
| Granola | Recommended | Meeting notes context |
| GitHub | Optional | PR review queue, CI status |
| Workable | Optional | Hiring pipeline (ATS) |

See [docs/mcp-servers.md](docs/mcp-servers.md) for installation instructions.

---

## What Changed from the Original

The [original repo](https://github.com/mimurchison/claude-chief-of-staff) was built for a CEO. This fork adapts it for engineering managers:

| Area | CEO Version | EM Version |
|------|------------|------------|
| **Primary channels** | Email, WhatsApp, iMessage | Slack, Linear, GitHub, Email |
| **Key relationships** | Board, investors, customers | Direct reports, CTO, PM |
| **Core activities** | Fundraising, board prep, exec comms | 1:1s, coaching, hiring, delivery |
| **New commands** | — | `/1on1`, `/hiring`, `/weekly`, `/shoutouts` |
| **Contact tracking** | General CRM | Direct report coaching + feedback logs |
| **Triage focus** | External stakeholders | Engineer blockers + team communication |
| **Recognition** | — | Shout-out tracker for all-hands |

---

## Customization

The `CLAUDE.md` file is the core. It defines:

- **Your team** — squad structure, direct reports, cross-functional partners
- **How you write** — so every draft sounds like you
- **Your goals** — so Claude knows what matters
- **Your constraints** — meeting times, weekly rhythm
- **Your coaching approach** — growth areas, feedback style

The longer you use it, the better it gets. Context compounds.

See [docs/customization.md](docs/customization.md) for the full guide.

---

## Credits

Built on top of [Mike Murchison's AI Chief of Staff](https://github.com/mimurchison/claude-chief-of-staff). Watch his [walkthrough and demo](https://x.com/mimurchison/status/2022368529417224480).

---

## Stay Connected

- [Taylor McGann](https://linkedin.com/in/taylormcgann) on LinkedIn

---

MIT License. See [LICENSE](LICENSE) for details.
