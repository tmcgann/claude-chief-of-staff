# /triage — Inbox Triage

## Description
Scan all connected communication channels, prioritize items by urgency,
and draft responses in your voice. Clear your inbox in minutes.

## Arguments
- `quick` — Tier 1 items only, no drafts (fastest)
- `digest` — Full scan with summaries, drafts for Tier 1-2
- (no argument) — Full scan with drafts for everything actionable

## Instructions

You are running inbox triage for Taylor McGann (Engineering Manager, Neo.Tax).
The goal is to process all incoming messages quickly and surface what needs attention.

### Step 0: Verify Time and Context

Get the current time so you know what "today" and "recent" mean.
Check the calendar briefly to understand where Taylor is in their day.

### Step 1: Scan Channels

Scan each connected channel. Only scan channels with active MCP servers.
Report progress as you go.

**Channels to scan (in order):**

1. **Slack** — Primary communication channel for engineering
   - Query: Recent DMs and @mentions
   - Focus on: Direct reports asking for help, blockers, review requests
   - Check: Messages from Firas (CTO), Forrest (PM), Ibrahim (CEO)
   - Skip: Channel chatter unless directly relevant or tagging Taylor

2. **Linear** — Engineering work tracking
   - Check: Issues assigned to Taylor or needing Taylor's input
   - Check: Blocked issues across all 3 squads (ASC, R&D, Platform)
   - Check: Unassigned issues in Taylor's squads
   - Check: Stale issues (no update in 5+ days)

3. **GitHub** — Code and PRs
   - Check: PRs where Taylor is a requested reviewer
   - Check: PRs from direct reports waiting 24+ hours
   - Check: CI failures on open PRs
   - Check: @mentions in PR comments

4. **Gmail** — Work email
   - Query: Messages from the last 24 hours (or since last triage)
   - Focus on: Direct emails (not newsletters, automated, or CC-only)
   - Priority: Emails from leadership, candidates, cross-functional partners

### Step 2: Classify Each Item

For each item found, assign a triage tier:

| Tier | Criteria | Action |
|------|----------|--------|
| **Tier 1** | Direct report blockers, CTO/CEO requests, production incidents, hiring deadlines, someone blocked waiting on Taylor | Respond NOW |
| **Tier 2** | PR reviews, cross-functional requests, planning items, candidate scheduling, non-urgent team questions | Handle today |
| **Tier 3** | Newsletters, automated notifications, FYI threads, bot messages, informational updates | Archive or brief ack |

**Tier assignment factors:**
- Is an engineer blocked waiting for Taylor?
- Is it from Firas (CTO), Ibrahim (CEO), or Forrest (PM)?
- Is there a deadline or time-sensitivity?
- Has it been waiting a long time? (Older = higher urgency)
- Does it relate to hiring (time-sensitive by nature)?
- Does it align with active goals?

### Step 3: Check for Already-Handled

Before drafting any response, verify Taylor hasn't already responded:
- Check sent mail for responses to the same thread
- Check Slack thread for Taylor's replies
- If already handled, skip it entirely

### Step 4: Draft Responses

For each actionable item (Tier 1 and Tier 2), draft a response that:
- Matches Taylor's writing style (reference CLAUDE.md Part 4)
- Is send-ready (not a starting point for editing)
- Is appropriately concise for the context
- Includes specific scheduling proposals if timing is involved (verify calendar first)
- For Slack: matches Slack's casual tone
- For Linear: provides clear direction or unblocks
- For GitHub: provides substantive review feedback

For `quick` mode: Skip drafts, just list Tier 1 items.
For `digest` mode: Include drafts for Tier 1, summaries for Tier 2.

### Step 5: Present Results

Format output as:

```
Scanned: [channels] ([counts])

TIER 1 — Respond Now
1. [Sender] — [Subject/summary] ([channel], [wait time])
   Draft: "[proposed response]"

2. ...

TIER 2 — Handle Today
3. [Sender] — [Subject/summary] ([channel])
   Draft: "[proposed response]"

4. ...

LINEAR — Needs Attention
- [X] blocked issues across squads
- [X] unassigned issues
- [X] stale issues (5+ days without update)

GITHUB — Review Queue
- [PR title] by [author] — [age] ([files changed])
- ...

TIER 3 — FYI
5-N. [Brief list, auto-archived if possible]

SUMMARY: [X] items need action, [Y] drafts ready to send.
```

### Step 6: Await Approval

**NEVER send any message without explicit approval.**

After presenting drafts, wait for Taylor to:
- Say "Send" or "Y" to approve a specific draft
- Say "Send all" to approve all drafts
- Edit a draft and then approve
- Skip items

### Guidelines

- Speed matters. A triage should take 2-3 minutes, not 10.
- Don't over-explain. Taylor knows the team — just surface what's important.
- If a channel's MCP server isn't connected, skip it silently.
- Track what was surfaced to avoid re-surfacing in the next triage run.
- If you find nothing urgent, say so clearly: "Inbox clear. No items need immediate attention."
- For long email threads, summarize the thread — don't just quote the last message.
- For Linear, focus on blockers and stale items — don't list every issue.
- When scanning Slack, watch for engineers asking for help or flagging problems — these are often implicit Tier 1 items even if not marked urgent.
