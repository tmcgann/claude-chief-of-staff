# /gm — Morning Briefing

## Description
Start your day with a structured briefing: today's calendar, squad status,
priority tasks, urgent messages, code review queue, and hiring updates.
Know exactly what matters before you open your inbox.

## Instructions

You are running the morning briefing for Taylor McGann (Engineering Manager, Neo.Tax).
Follow these steps in order, collecting information before presenting the final briefing.

### Step 0: Get Current Time

Call the Google Calendar `get-current-time` tool to get the authoritative
date and time. Extract the day of week, date, and timezone. Never guess
the day of week — always verify.

### Step 1: Calendar Review

Fetch today's calendar events using `list-events` with today's date range.

For each event, note:
- Time and duration
- Title and attendees
- Whether it requires preparation (1:1s, planning sessions, interviews)
- Any conflicts or back-to-back meetings

Flag:
- Meetings that conflict with hard constraints
- Back-to-back meetings with no buffer
- Meetings with no clear agenda or purpose
- 1:1s that need prep (offer to run `/1on1`)

### Step 1.5: Squad Status Quick Look (if Linear connected)

Check Linear for blockers across all 3 squads:
- Any issues marked "blocked" in ASC, R&D Product, or Platform
- Any issues overdue or stale (no update in 3+ days)
- Brief pulse: are squads on track this sprint/cycle?

Keep this quick — just surface what needs Taylor's attention.

### Step 1.6: Code Review Queue (if GitHub connected)

Check GitHub for PRs needing Taylor's review:
- PRs where Taylor is requested as reviewer
- PRs from direct reports that have been open 24+ hours without review
- Any CI failures on open PRs

### Step 2: Task Review

Read `~/.claude/my-tasks.yaml` and identify:
- Tasks due TODAY (urgent)
- Tasks OVERDUE (critical — should have been done)
- Tasks due in the next 3 days (approaching)
- Tasks that can be completed today given the calendar

### Step 3: Goals Check

Read `~/.claude/goals.yaml` and briefly assess:
- Which goals have stalled (no progress update in 7+ days)?
- Does today's calendar align with the highest-priority goals?
- Any goal-aligned work that should be scheduled today?

### Step 4: Comms Quick Scan

Do a quick scan for anything urgent:

**Email (if Gmail connected):**
- Search for emails from the last 12 hours
- Flag Tier 1 items (from Firas, Ibrahim, Forrest, or marked urgent)

**Slack (if connected):**
- Check DMs for unread messages from direct reports
- Scan for engineer blockers, escalations, or review requests
- Check for any production incidents or alerts

Don't do a full triage — just surface what's critical.

### Step 4.5: Hiring Pipeline Glance

Quick check:
- Any candidates waiting on a response from Taylor?
- Any interviews scheduled today or tomorrow?
- If there are interviews today, offer to run `/hiring prep`

### Step 5: Present the Briefing

Format the briefing as follows:

```
Good morning. It's [Day], [Date]. Here's your day:

CALENDAR ([count] meetings)
- [time]  [title] ([duration]) [any flags]
- ...

[If applicable: "Heads up: [conflict or concern]"]

SQUAD STATUS
- ASC: [1-line status or "clear"]
- R&D: [1-line status or "clear"]
- Platform: [1-line status or "clear"]
[If blockers: "[Name] is blocked on [issue] — may need your help"]

CODE REVIEWS
- [count] PRs waiting for your review
[If any: "[PR title] from [author] — open [X] hours"]

TASKS
- DUE TODAY: [list or "Nothing due today"]
- OVERDUE: [list or "All clear"]
- APPROACHING: [list of next 3 days]

GOALS
- [Brief status on top 1-2 goals, especially if stalled]

URGENT
- [Any Tier 1 items from inbox/Slack, or "No urgent items"]

HIRING
- [Pipeline status or "No action needed today"]

FOCUS RECOMMENDATION
Based on your calendar and priorities, here's what I'd focus on today:
1. [Top priority]
2. [Second priority]
3. [Third priority, if time allows]
```

### Day-of-Week Awareness

Adjust the focus recommendation based on Taylor's weekly rhythm:

- **Monday:** Add "Squad review prep" — offer to run `/weekly plan`
- **Tuesday/Thursday:** Note async check-in day — flag if any reports haven't checked in
- **Wednesday/Friday:** Note sync check-in day — flag items to discuss with squads
- **Thursday:** Add "Planning session prep" — surface backlog items for grooming with Firas and Forrest
- **Days with 1:1s:** Add "1:1 prep" with offer to run `/1on1 <name>`
- **All-hands day:** Add "Shout-out review" — offer to run `/shoutouts review`

### Guidelines

- Be concise. The whole briefing should fit on one screen.
- Lead with the most important information.
- If there are no urgent items, say so — that's good news.
- The focus recommendation should reflect goal alignment and day-of-week rhythm.
- If today's calendar is misaligned with goals, say so explicitly.
- End with an offer: "Want me to run a full triage, prep for a 1:1, or dig into any of these?"
