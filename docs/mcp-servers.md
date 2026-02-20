# MCP Server Setup (Engineering Manager Edition)

MCP (Model Context Protocol) servers give Claude access to external services.
The more servers you connect, the more powerful your AI Chief of Staff becomes.

For engineering managers, the key integrations are communication (Slack, email),
work tracking (Linear), and scheduling (Calendar).

---

## Required Servers

These are the minimum for a useful engineering management experience.

### Gmail

Enables: Email triage, drafting, sending, searching

**Installation:**

```bash
npx @anthropic-ai/claude-code mcp add gmail
```

Follow the OAuth flow to authorize access to your Gmail account.

**Configuration:**

The Gmail MCP server is configured in your Claude Code MCP settings, typically at:

```
~/.claude/mcp_settings.json
```

**Multiple accounts:**

If you have separate work and personal Gmail accounts:

```bash
npx @anthropic-ai/claude-code mcp add gmail         # Work account
npx @anthropic-ai/claude-code mcp add gmail-personal # Personal account
```

**Verify it works:**

```
> Search my email for messages from today
```

---

### Google Calendar

Enables: Scheduling, availability checks, meeting prep, calendar creation

**Installation:**

```bash
npx @anthropic-ai/claude-code mcp add google-calendar
```

Follow the OAuth flow to authorize calendar access.

**Verify it works:**

```
> What's on my calendar today?
> Am I free next Tuesday at 2pm?
```

---

### Slack

Enables: Slack DM triage, channel monitoring, message drafting, team communication

This is critical for engineering managers — most day-to-day communication
with your team happens here.

**Installation:**

```bash
npx @anthropic-ai/claude-code mcp add slack
```

You'll need a Slack app token with appropriate scopes (channels:history,
im:history, search:read, chat:write, users:read).

**Verify it works:**

```
> Show me my recent Slack DMs
> Search Slack for messages about "deployment"
```

---

### Linear

Enables: Issue tracking, sprint status, squad health, blocker detection

Linear is the backbone of engineering work tracking. With Linear connected,
Claude can pull squad-level status, detect blockers, track velocity, and
prep for planning sessions.

**Installation:**

```bash
npx @anthropic-ai/claude-code mcp add linear
```

**Verify it works:**

```
> Show my assigned Linear issues
> What issues are blocked in the Platform squad?
```

---

## Recommended Servers

These significantly enhance the experience but aren't strictly required.

### Notion

Enables: 1:1 notes access, quarterly goal tracking, team documentation

If your 1:1s are tracked in Notion (as Taylor's are), this integration
unlocks rich 1:1 prep with historical context.

**Installation:**

```bash
npx @anthropic-ai/claude-code mcp add notion
```

You'll need a Notion integration token with access to relevant databases.

**Setup:**
1. Create a Notion integration at https://www.notion.so/my-integrations
2. Share your 1:1 database with the integration
3. Share any relevant team docs or goal-tracking databases

**Verify it works:**

```
> Search my Notion for "1:1 notes"
```

---

### Granola

Enables: Meeting notes search and retrieval

Granola records and summarizes your meetings. The MCP server lets Claude
search and retrieve those notes for meeting prep and context.

```bash
npx @anthropic-ai/claude-code mcp add granola
```

**Verify it works:**

```
> Search my meeting notes for "sprint planning"
```

---

## Optional Servers

Add these based on your workflow.

### GitHub

Enables: PR review queue, CI status, code context, @mention tracking

Useful if you're doing code reviews or staying hands-on with technical work.

```bash
npx @anthropic-ai/claude-code mcp add github
```

**Verify it works:**

```
> Show PRs where I'm requested as a reviewer
```

---

### Workable (or your ATS)

Enables: Hiring pipeline tracking, candidate status, interview scheduling

If your company uses Workable or another ATS with MCP support, connecting
it automates the `/hiring status` pipeline view.

```bash
npx @anthropic-ai/claude-code mcp add workable
```

---

## Adding Custom MCP Servers

Claude Code supports any MCP-compatible server. If you use a service that has
an MCP server available, you can add it:

```bash
# Generic pattern
npx @anthropic-ai/claude-code mcp add <server-name>

# Or configure manually in mcp_settings.json
```

After adding a server, update your CLAUDE.md's "MCP Servers" section so Claude
knows it's available.

---

## Troubleshooting

### "MCP server not found"

Make sure the server is installed:
```bash
npx @anthropic-ai/claude-code mcp list
```

### "Authentication failed"

Re-authenticate:
```bash
npx @anthropic-ai/claude-code mcp remove gmail
npx @anthropic-ai/claude-code mcp add gmail
```

### "Rate limited"

MCP servers may rate-limit requests. If you see rate limit errors:
- Reduce automation frequency in `schedules.yaml`
- Use `quick` mode for triage instead of full scans
- Batch queries when possible

### Server-specific issues

Each MCP server may have its own setup requirements (API keys, OAuth scopes,
permissions). Check the server's documentation for specific troubleshooting.

---

## Recommended Connection Order

If you're just getting started, connect servers in this order:

1. **Gmail** — Unlocks email triage (essential baseline)
2. **Google Calendar** — Unlocks scheduling intelligence
3. **Slack** — Unlocks team communication triage (where most EM work happens)
4. **Linear** — Unlocks squad status, blocker detection, sprint tracking
5. **Notion** — Unlocks 1:1 history and goal tracking
6. **Granola** — Unlocks meeting notes context
7. **GitHub** — Unlocks PR review queue (if staying hands-on)

You can always add more servers later. The system degrades gracefully —
if a server isn't connected, Claude simply skips that channel during triage.
