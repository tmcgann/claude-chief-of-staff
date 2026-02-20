# /enrich — Contact Enrichment

## Description
Build and maintain your personal CRM. Scan communications for contact mentions,
update interaction history, and surface relationships that need attention.
For direct reports, also tracks coaching notes, feedback, and growth areas.

## Arguments
- `all` — Scan channels and update all contact files with new interactions
- `stale` — Show contacts that haven't been engaged recently (based on tier cadence)
- `<contact-name>` — Enrich a specific contact's file with latest information

## Contact Files
Location: `~/.claude/contacts/`
Index: `~/.claude/contact-index.yaml` (optional, for quick lookups)

## Instructions

### /enrich all

Scan connected channels for recent interactions and update contact files.

1. **Scan channels** for the last 24 hours (or since last enrichment):
   - Slack: DMs and mentions involving known contacts
   - Linear: Activity from direct reports (issues completed, comments, blocked items)
   - GitHub: PR activity from direct reports (reviews, comments, merges)
   - Email: Recent sent/received with known contacts
   - Calendar: Meetings that occurred with known contacts
   - Notion: 1:1 notes if connected
   - Granola: Meeting notes if connected

2. **For each interaction found:**
   - Look up the contact file in `~/.claude/contacts/`
   - If the file exists: Update "Last Interaction" and add to "Interaction History"
   - If no file exists and the person seems important: Suggest creating one
   - Add any new context learned (mentioned a project, changed roles, etc.)

3. **For direct reports specifically:**
   - Update current projects from Linear activity
   - Note any coaching-relevant observations (e.g., "Took initiative on debugging prod issue")
   - Flag potential shout-out candidates — add to `~/.claude/shoutouts.yaml`
   - Track feedback delivery — note if positive or constructive feedback was given

4. **Present a summary:**
   ```
   ENRICHMENT COMPLETE

   Updated:
   - Tricia MacPherson — completed 3 Linear issues, active on auth refactor PR (today)
   - Gareth Ivatt — Slack discussion about infra migration (today)
   - Forrest Brown — planning email re: Q2 roadmap (today)

   Coaching Notes Added:
   - Cristiano Firmani — took point on debugging prod issue without being asked (growth!)

   Shout-Out Candidates Detected:
   - Yuya Fujimoto — shipped ASC parser ahead of schedule
     → Added to shout-out log

   New contacts detected (no file yet):
   - [Name] ([context]) — Want me to create a contact file?

   No updates needed:
   - [List of contacts with no new interactions]
   ```

### /enrich stale

Check which contacts are overdue for engagement based on their tier.

1. **Read all contact files** in `~/.claude/contacts/`
2. **Compare last interaction date** against tier cadence:
   - Tier 1 (direct reports): Flag if no contact in 14+ days
   - Tier 2 (CTO, PM, cross-functional): Flag if no contact in 30+ days
   - Tier 3 (extended network): Flag if no contact in 60+ days

3. **Present stale contacts:**
   ```
   RELATIONSHIP HEALTH CHECK

   NEEDS ATTENTION (overdue)
   - Cristiano Firmani (Tier 1, R&D squad) — Last contact: 18 days ago
     Suggestion: "Schedule a quick check-in or review his recent Linear work"
     1:1 scheduled? [Yes/No — check calendar]

   - Richard Cook (Tier 1, Platform squad) — Last contact: 16 days ago
     Suggestion: "Review his PRs or drop a Slack message"

   APPROACHING
   - Forrest Brown (Tier 2, PM) — Last contact: 25 days ago
     Suggestion: "Sync on Q2 roadmap priorities"

   HEALTHY
   - [X] contacts are within their cadence

   DIRECT REPORT COVERAGE
   All 7 engineers contacted within cadence? [Yes/No]
   Next 1:1s: [list upcoming 1:1s from calendar]

   Want me to draft any touchpoint messages?
   ```

### /enrich <contact-name>

Deep enrichment of a specific contact.

1. **Find the contact file** in `~/.claude/contacts/`
2. **Scan all channels** for recent mentions/interactions with this person:
   - Slack: DMs, mentions, shared channels
   - Linear: Their issues, comments, activity
   - GitHub: Their PRs, reviews, comments
   - Email: Recent threads
   - Calendar: Meetings together
   - Notion: 1:1 notes (if connected)
   - Granola: Meeting notes (if connected)

3. **Update the file** with:
   - Latest interaction details
   - Any new context from conversations
   - Updated talking points for next interaction
   - For direct reports: updated current projects, coaching observations

4. **Check for meeting prep needs:**
   - Is there a meeting with this person coming up?
   - If it's a 1:1, offer to run `/1on1 <name>`

5. **Present what was updated:**
   ```
   ENRICHED: Tricia MacPherson (R&D Product squad)

   Updated:
   - Last interaction: Feb 18 (was Feb 4)
   - Added interaction: Slack DM about auth refactor approach
   - Current projects updated: Auth refactor (in progress), API v2 design (planning)
   - Coaching note: Showed strong ownership in debugging prod issue (added 2026-02-18)

   Feedback Log:
   - Last positive: Feb 4 (1:1 — recognized thorough PR reviews)
   - Last constructive: Jan 21 (1:1 — discussed estimation accuracy)

   Upcoming:
   - 1:1 with Tricia on Feb 24 at 3pm
     → Want me to run /1on1 tricia?
   ```

### Creating New Contact Files

When a new contact is suggested, create using the standard template:

```markdown
# Contact: [Full Name]

## Quick Reference

| Field | Value |
|-------|-------|
| **Name** | [Full Name] |
| **Role** | [Role at Company] |
| **Tier** | [1/2/3] |
| **Email** | [email] |
| **Phone** | [if known] |
| **Location** | [if known] |
| **Met through** | [how you connected] |

## Relationship Context

[Brief context on the relationship]

## Communication Style

[Observations on how they prefer to communicate]

## Personal Notes

[Any personal details learned from conversations]

## Interaction History

| Date | Type | Summary |
|------|------|---------|
| [date] | [type] | [what happened] |

## Talking Points for Next Interaction

- [topics to bring up]

## Last Interaction

- **Date:** [date]
- **Channel:** [channel]
- **Follow-up needed:** [if any]
```

For direct reports, use the enhanced template from
`contacts/direct-report-template.md` which includes squad, projects,
coaching goals, feedback log, and career aspirations.

### Guidelines

- Always include dates when adding notes (e.g., "Took point on debugging (added 2026-02-18)")
- Don't over-enrich. Only add genuinely useful context, not filler.
- When scanning channels, respect privacy — don't surface private/sensitive content in contact notes.
- Tier assignments should reflect actual relationship importance, not aspirational importance.
- Stale contact alerts are suggestions, not demands. Some relationships naturally ebb and flow.
- For direct reports, coaching notes are the most valuable enrichment — prioritize these.
- When you spot potential shout-outs during enrichment, add them to `~/.claude/shoutouts.yaml`.
