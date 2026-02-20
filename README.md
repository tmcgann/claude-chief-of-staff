# AI Chief of Staff — Engineering Manager Edition

Forked from [Mike Murchison's AI Chief of Staff](https://github.com/mimurchison/claude-chief-of-staff) (CEO of [Ada](https://ada.cx)), adapted for engineering managers.

I'm [Taylor McGann](https://www.linkedin.com/in/taylor-mcgann), Engineering Manager at [Neo.Tax](https://neo.tax). I manage 7 engineers across 3 squads and needed a version of the AI Chief of Staff that optimizes for what EMs actually spend time on: keeping engineers unblocked, developing people, shipping reliably, hiring, and staying technical.

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

First morning briefing in under 15 minutes from clone.

---

## Features

### Morning Briefing (`/gm`)
Start every day knowing exactly what matters. Calendar, squad status across all your teams, code review queue, task deadlines, hiring pipeline, and urgent messages — before you open your inbox.

### Inbox Triage (`/triage`)
Scan all connected channels and get a prioritized list with draft responses.

| Tier | Action | Example |
|------|--------|---------|
| **Tier 1** | Respond NOW | Engineer blocked, CTO request, production incident |
| **Tier 2** | Handle today | PR review, cross-functional request, candidate scheduling |
| **Tier 3** | FYI / archive | Newsletters, bot messages, FYI threads |

### 1:1 Prep (`/1on1`)
Before every 1:1, Claude pulls context from Linear (recent work, blockers), Slack (interactions), Notion (past 1:1 notes), and your coaching files. You walk in with action items, feedback to deliver, and coaching questions ready.

### Weekly Planning (`/weekly`)
Monday squad review prep with Linear status per squad. Cross-squad status updates for your CTO anytime. Friday retros that surface what shipped, what didn't, and who to recognize.

### Hiring Pipeline (`/hiring`)
Track open roles, prep for interviews with suggested questions, run structured debriefs, and draft job descriptions. Flags when candidates have been waiting too long.

### Shout-Out Tracker (`/shoutouts`)
Log contributions worth recognizing as you spot them. Before all-hands, review accumulated shout-outs and get draft messages ready to deliver. Coverage checks ensure recognition is distributed across the team.

### Task Management (`/my-tasks`)
Tasks with execution, not just tracking. Claude drafts the email, does the research, preps the document. Goal alignment keeps you honest about where time goes.

### Contact Enrichment (`/enrich`)
Auto-scans Slack, Linear, GitHub, email, and meeting notes to build rich relationship profiles. For direct reports, tracks coaching notes, feedback delivery, and growth areas. Alerts you when contacts go stale.

### Goal-Aligned Everything
Your `goals.yaml` is the source of truth. Claude references it constantly — triaging messages, proposing meetings, scoring tasks. It pushes back when your time allocation drifts from your stated priorities.

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

## Philosophy

A few beliefs this system is built on:

1. **AI should push you, not just serve you.** A great chief of staff challenges priorities, says "no" to low-leverage work, and keeps you honest about where your time goes.

2. **Your team comes first.** The highest-leverage thing an EM can do is keep engineers unblocked, growing, and recognized. Everything else exists to serve that.

3. **Clarity beats comprehensiveness.** Fewer, clearer priorities. Explicit tradeoffs. Fast decisions with flagged assumptions.

4. **Systems compound.** Every interaction makes the system smarter. Contact notes get richer. Coaching history builds. The longer you use it, the better it gets.

5. **Ship, don't polish.** Drafts should be send-ready. Outputs should be usable immediately. Bias toward closing loops.

---

## Credits

Built on top of [Mike Murchison's AI Chief of Staff](https://github.com/mimurchison/claude-chief-of-staff). Watch his [walkthrough and demo](https://x.com/mimurchison/status/2022368529417224480).

---

## Stay Connected

- [Taylor McGann](https://www.linkedin.com/in/taylor-mcgann) on LinkedIn

---

MIT License. See [LICENSE](LICENSE) for details.
