---
name: weekly
description: Weekly planning and review for engineering management. Prep for squad reviews, generate cross-squad status updates, and run end-of-week retros.
argument-hint: "[plan|status|retro]"
---

# /weekly — Weekly Review & Planning

## Description
Weekly planning and review for engineering management. Prep for squad reviews,
generate cross-squad status updates, and run end-of-week retros.

## Arguments
- `plan` — Monday: Prep for squad review meetings with Linear status per squad
- `status` — Anytime: Cross-squad status update for leadership
- `retro` — Friday: Week-in-review with shout-out candidates

## Instructions

You are helping Taylor with weekly engineering management rhythm.

### /weekly plan (Monday)

Prep for the week's squad review meetings.

1. **Get current time** and confirm it's the start of the week.

2. **Pull Linear status per squad** (if connected):

   For each squad (ASC, R&D Product, Platform):
   - Issues completed last week
   - Issues in progress this week
   - Issues blocked (and what's blocking them)
   - Any overdue issues
   - Sprint/cycle health (on track, at risk, behind)

3. **Check calendar** for this week's key meetings:
   - Squad review times (Monday)
   - 1:1s scheduled this week
   - Planning session (Thursday)
   - All-hands

4. **Check tasks** for anything due this week.

5. **Present the weekly plan:**

```
WEEKLY PLAN — Week of [Date]

STATE OF THE SQUADS

ASC Squad (Yuya + hiring)
- Last week: [completed count] issues closed
- This week: [in progress count] in flight
- Blocked: [list or "None"]
- Hiring: [ASC role status]
- Watch: [anything concerning]

R&D Product Squad (Tricia, Cristiano)
- Last week: [completed count] issues closed
- This week: [in progress count] in flight
- Blocked: [list or "None"]
- Watch: [anything concerning]

Platform Squad (Gareth, Miguel, Richard)
- Last week: [completed count] issues closed
- This week: [in progress count] in flight
- Blocked: [list or "None"]
- Watch: [anything concerning]

THIS WEEK'S KEY MEETINGS
- [Day] [Time]: [Meeting] — [prep needed?]
- ...

TASKS DUE THIS WEEK
- [task list]

FOCUS AREAS
1. [Top priority for the week]
2. [Second priority]
3. [Third priority]

DISCUSSION TOPICS FOR SQUAD REVIEWS
- [Topic for ASC review]
- [Topic for R&D review]
- [Topic for Platform review]
```

### /weekly status (Anytime)

Generate a cross-squad status update suitable for sharing with Firas (CTO) or leadership.

1. **Pull Linear data** for all 3 squads (same as plan).
2. **Check for notable events:**
   - Major features shipped or milestones hit
   - Incidents or production issues
   - Hiring updates
   - Cross-squad dependencies or blockers

3. **Present status:**

```
ENGINEERING STATUS — [Date]

HIGHLIGHTS
- [What shipped / what's notable]

BY SQUAD
ASC:      [1-line status] | [on_track / at_risk / behind]
R&D:      [1-line status] | [on_track / at_risk / behind]
Platform: [1-line status] | [on_track / at_risk / behind]

BLOCKERS / RISKS
- [Cross-squad or external blockers]

HIRING
- ASC role: [status]

GOAL ALIGNMENT
- [How current work maps to quarterly objectives]

NEXT WEEK
- [What's coming up]
```

### /weekly retro (Friday)

End-of-week review: what shipped, what didn't, what to carry forward.

1. **Pull Linear data** for completed work this week.
2. **Check shout-out log** (`~/.claude/shoutouts.yaml`).
3. **Review the week's calendar** for meetings that happened.
4. **Check tasks** for completions and carryovers.

5. **Present retro:**

```
WEEK IN REVIEW — [Date Range]

SHIPPED
- [What got done, by squad]

DIDN'T SHIP (carrying forward)
- [What slipped and why]

SHOUT-OUT CANDIDATES (for all-hands)
- [Person] — [what they did]
- [Person] — [what they did]

WINS
- [Positive observations about the team]

CONCERNS
- [Things to watch next week]

NEXT WEEK PREVIEW
- [What's coming]
```

6. Ask: "Want me to draft shout-outs for all-hands? (`/shoutouts draft`)"

### Guidelines

- Keep status updates scannable — leadership reads these in 30 seconds.
- If Linear isn't connected, ask Taylor to provide squad status verbally and format it.
- Flag patterns across squads (e.g., all squads blocked on the same dependency).
- The retro should feel honest — don't sugarcoat what didn't ship.
- Always connect work back to quarterly goals when possible.
