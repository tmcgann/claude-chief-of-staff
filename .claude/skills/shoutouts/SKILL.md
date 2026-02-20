---
name: shoutouts
description: Track and manage shout-outs for all-hands recognition. Log contributions worth celebrating, review accumulated shout-outs, and draft delivery messages.
argument-hint: "[add|review|draft]"
---

# /shoutouts — Shout-Out Tracker

## Description
Track and manage shout-outs for all-hands recognition. Log contributions
worth celebrating, review accumulated shout-outs, and draft messages.

## Arguments
- `add "<person>" "<reason>"` — Log a shout-out candidate
- `review` — Show accumulated shout-outs since last all-hands
- `draft` — Draft shout-out messages ready for all-hands

## Storage
Location: `~/.claude/shoutouts.yaml`

## Instructions

### /shoutouts add "<person>" "<reason>"

Log a new shout-out candidate.

1. **Parse the input:**
   - Person: Match to Taylor's team if possible (fuzzy match OK)
   - Reason: What they did that's worth recognizing

2. **Read `~/.claude/shoutouts.yaml`** (create if it doesn't exist)

3. **Add the entry:**
   ```yaml
   - person: "[Name]"
     reason: "[What they did]"
     date_added: "[today's date]"
     source: "manual"  # or "triage", "1on1-prep", "weekly-retro"
     delivered: false
   ```

4. **Confirm:** "Added shout-out for [Name]: [reason]"

### /shoutouts review

Show all pending (undelivered) shout-outs.

1. **Read `~/.claude/shoutouts.yaml`**
2. **Filter** to entries where `delivered: false`
3. **Group by person** and present:

```
PENDING SHOUT-OUTS ([count] since last all-hands)

[Name] ([Squad])
- [Reason] (added [date])
- [Reason] (added [date])

[Name] ([Squad])
- [Reason] (added [date])

COVERAGE CHECK
Recognized recently: [names]
Not recognized recently: [names who haven't had a shout-out in 30+ days]
```

The coverage check helps Taylor ensure recognition is distributed across the team.

### /shoutouts draft

Draft shout-out messages ready for all-hands delivery.

1. **Read pending shout-outs** (same as review)
2. **Draft messages** for each person, combining multiple reasons if applicable:

```
SHOUT-OUT DRAFTS (ready for all-hands)

1. [Name] — "[Draft message that's warm, specific, and brief.
   Mentions what they did and why it mattered.]"

2. [Name] — "[Draft message]"

3. [Name] — "[Draft message]"
```

3. **After approval**, ask: "Mark these as delivered?"
4. If yes, update `~/.claude/shoutouts.yaml` to set `delivered: true` for each.

### Auto-Detection

Other commands should add shout-out candidates automatically:
- `/gm` — If a notable achievement is spotted during briefing
- `/triage` — If a team member's contribution stands out in messages
- `/1on1` — If Linear shows exceptional work during 1:1 prep
- `/weekly retro` — If the week-in-review surfaces standout contributions

When auto-adding, set `source` to the command that detected it.

### Guidelines

- Shout-outs should be specific. "Great work" is not a shout-out. "Shipped the auth refactor 2 days early with zero bugs" is.
- Recognition should be distributed. If one person keeps getting all the shout-outs, flag it.
- Keep drafts warm but brief — all-hands time is shared time.
- Don't duplicate — if the same contribution is logged twice, merge them.
- The coverage check matters. Quiet contributors are often under-recognized.
