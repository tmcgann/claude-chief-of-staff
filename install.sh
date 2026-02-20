#!/bin/bash

# AI Chief of Staff (Engineering Manager Edition) — Installer
# Sets up your personal AI operating system in ~/.claude/

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo ""
echo -e "${BOLD}============================================${NC}"
echo -e "${BOLD}   AI Chief of Staff — EM Edition Setup${NC}"
echo -e "${BOLD}============================================${NC}"
echo ""
echo "This will set up your AI operating system for engineering management"
echo "by installing template files to ~/.claude/"
echo ""

# Check for Claude Code
if ! command -v claude &> /dev/null; then
    echo -e "${YELLOW}Warning: Claude Code CLI not found.${NC}"
    echo "Install it from: https://docs.anthropic.com/en/docs/claude-code"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Detect if this is a fresh install or update
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    IS_UPDATE=true
    echo -e "${BLUE}Existing installation detected. Running update.${NC}"
    echo "Skills will be synced. User data files will not be overwritten."
    echo ""
else
    IS_UPDATE=false
fi

# Only gather user info on fresh install
if [ "$IS_UPDATE" = false ]; then
    echo -e "${BLUE}Let's personalize your setup.${NC}"
    echo ""

    read -p "Your full name: " USER_NAME
    read -p "Your first name (for message sign-offs): " FIRST_NAME
    read -p "Work email: " WORK_EMAIL
    read -p "Personal email: " PERSONAL_EMAIL

    echo ""
    echo -e "${BLUE}Your team structure:${NC}"
    read -p "Company name: " USER_COMPANY
    read -p "Your CTO's name: " CTO_NAME
    read -p "Your PM's name: " PM_NAME

    echo ""
    echo -e "${BLUE}Your squads (enter member names, comma-separated):${NC}"
    read -p "Squad 1 name (e.g., ASC): " SQUAD1_NAME
    read -p "Squad 1 members: " SQUAD1_MEMBERS
    read -p "Squad 2 name (e.g., R&D Product): " SQUAD2_NAME
    read -p "Squad 2 members: " SQUAD2_MEMBERS
    read -p "Squad 3 name (e.g., Platform): " SQUAD3_NAME
    read -p "Squad 3 members: " SQUAD3_MEMBERS

    echo ""
    echo -e "${BLUE}Time constraints (leave blank to skip):${NC}"
    read -p "Earliest meeting time? (e.g., 9:00 AM): " EARLIEST_MEETING

    echo ""
    echo -e "${BLUE}Preferences:${NC}"
    read -p "Timezone (e.g., America/New_York): " TIMEZONE
    TIMEZONE=${TIMEZONE:-America/New_York}
fi

# Create directory structure
echo ""
echo -e "${GREEN}Creating directory structure...${NC}"

mkdir -p "$CLAUDE_DIR"
mkdir -p "$CLAUDE_DIR/contacts"
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/objectives"
mkdir -p "$CLAUDE_DIR/task-outputs"

# --- CLAUDE.md: only copy + customize on fresh install ---
if [ "$IS_UPDATE" = false ]; then
    echo -e "${GREEN}Customizing CLAUDE.md...${NC}"

    cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

    # Replace placeholders
    sed -i.bak "s/{{YOUR_NAME}}/$USER_NAME/g" "$CLAUDE_DIR/CLAUDE.md"
    sed -i.bak "s/{{YOUR_FIRST_NAME}}/$FIRST_NAME/g" "$CLAUDE_DIR/CLAUDE.md"
    sed -i.bak "s/{{WORK_EMAIL}}/$WORK_EMAIL/g" "$CLAUDE_DIR/CLAUDE.md"
    sed -i.bak "s/{{PERSONAL_EMAIL}}/$PERSONAL_EMAIL/g" "$CLAUDE_DIR/CLAUDE.md"
    sed -i.bak "s|{{TIMEZONE}}|$TIMEZONE|g" "$CLAUDE_DIR/CLAUDE.md"

    if [ -n "$EARLIEST_MEETING" ]; then
        sed -i.bak "s/{{EARLIEST_MEETING_TIME}}/$EARLIEST_MEETING/g" "$CLAUDE_DIR/CLAUDE.md"
    fi

    # Clean up sed backup files
    rm -f "$CLAUDE_DIR/CLAUDE.md.bak"
fi

# --- Skills: always sync (overwrite) from repo ---
# Skills are the repo's source of truth and should always be up to date.
echo -e "${GREEN}Syncing skills...${NC}"

sync_skill() {
    local src_dir="$1"
    local skill_name=$(basename "$src_dir")
    local dest_dir="$CLAUDE_DIR/skills/$skill_name"

    mkdir -p "$dest_dir"
    cp "$src_dir/SKILL.md" "$dest_dir/SKILL.md"
    echo "  Synced: /$(basename "$skill_name")"
}

# Sync all skills from repo
for skill_dir in "$SCRIPT_DIR/.claude/skills/"*/; do
    if [ -f "$skill_dir/SKILL.md" ]; then
        sync_skill "$skill_dir"
    fi
done

# Clean up skills that no longer exist in repo
echo -e "${GREEN}Checking for removed skills...${NC}"
if [ -d "$CLAUDE_DIR/skills" ]; then
    for installed_skill in "$CLAUDE_DIR/skills/"*/; do
        skill_name=$(basename "$installed_skill")
        if [ ! -d "$SCRIPT_DIR/.claude/skills/$skill_name" ]; then
            echo -e "  ${YELLOW}Removing stale skill:${NC} /$skill_name"
            rm -rf "$installed_skill"
        fi
    done
fi

# Clean up legacy commands/ directory if it exists
if [ -d "$CLAUDE_DIR/commands" ]; then
    echo -e "  ${YELLOW}Removing legacy commands/ directory${NC} (migrated to skills/)"
    rm -rf "$CLAUDE_DIR/commands"
fi

# --- User data files: copy only if missing (never overwrite user data) ---
echo -e "${GREEN}Checking user data files...${NC}"

copy_if_missing() {
    local src="$1"
    local dest="$2"
    if [ ! -f "$dest" ]; then
        cp "$src" "$dest"
        echo "  Created: $dest"
    else
        echo -e "  ${YELLOW}Skipped (already exists):${NC} $dest"
    fi
}

copy_if_missing "$SCRIPT_DIR/goals.yaml" "$CLAUDE_DIR/goals.yaml"
copy_if_missing "$SCRIPT_DIR/my-tasks.yaml" "$CLAUDE_DIR/my-tasks.yaml"
copy_if_missing "$SCRIPT_DIR/schedules.yaml" "$CLAUDE_DIR/schedules.yaml"
copy_if_missing "$SCRIPT_DIR/shoutouts.yaml" "$CLAUDE_DIR/shoutouts.yaml"
copy_if_missing "$SCRIPT_DIR/contacts/example-contact.md" "$CLAUDE_DIR/contacts/example-contact.md"
copy_if_missing "$SCRIPT_DIR/contacts/direct-report-template.md" "$CLAUDE_DIR/contacts/direct-report-template.md"

# Summary
echo ""
echo -e "${BOLD}============================================${NC}"
if [ "$IS_UPDATE" = true ]; then
    echo -e "${GREEN}${BOLD}   Update Complete!${NC}"
else
    echo -e "${GREEN}${BOLD}   Setup Complete!${NC}"
fi
echo -e "${BOLD}============================================${NC}"
echo ""
echo -e "Skills installed globally to: ${BOLD}$CLAUDE_DIR/skills/${NC}"
echo ""
echo "  Skills are available as /slash-commands in Claude Code from any"
echo "  project directory. The repo's .claude/skills/ is the source of"
echo "  truth — edit skills there, then re-run install.sh to deploy."
echo ""

if [ "$IS_UPDATE" = true ]; then
    echo -e "${BOLD}Synced:${NC}"
    echo "  ~/.claude/skills/     — All skills updated to latest versions"
    echo ""
    echo -e "${BOLD}Preserved (not overwritten):${NC}"
    echo "  CLAUDE.md             — Your customized config"
    echo "  goals.yaml            — Your objectives"
    echo "  my-tasks.yaml         — Your tasks"
    echo "  shoutouts.yaml        — Your shout-outs"
    echo "  contacts/             — Your contact files"
    echo ""
else
    echo -e "${BOLD}Installed:${NC}"
    echo "  ~/.claude/CLAUDE.md           — Your AI operating system config"
    echo "  ~/.claude/goals.yaml          — Quarterly objectives (edit these!)"
    echo "  ~/.claude/my-tasks.yaml       — Task tracking"
    echo "  ~/.claude/schedules.yaml      — Automation schedules"
    echo "  ~/.claude/shoutouts.yaml      — Shout-out tracker for all-hands"
    echo "  ~/.claude/contacts/           — Contact files + direct report template"
    echo "  ~/.claude/skills/             — 8 skills deployed globally"
    echo ""
    echo -e "${BOLD}Next steps:${NC}"
    echo ""
    echo -e "  ${BLUE}1.${NC} Connect MCP servers (at minimum: Gmail + Google Calendar + Slack)"
    echo "     See docs/mcp-servers.md for installation instructions"
    echo "     Recommended: also connect Linear for squad status tracking"
    echo ""
    echo -e "  ${BLUE}2.${NC} Edit your goals:"
    echo "     Open $CLAUDE_DIR/goals.yaml and define your real objectives"
    echo ""
    echo -e "  ${BLUE}3.${NC} Customize your CLAUDE.md:"
    echo "     Open $CLAUDE_DIR/CLAUDE.md and fill in the remaining placeholders"
    echo "     (writing style examples, hard constraints, timezone)"
    echo ""
    echo -e "  ${BLUE}4.${NC} Create contact files for your direct reports:"
    echo "     Copy contacts/direct-report-template.md for each team member"
    echo "     Or run /enrich <name> to auto-create from channel data"
    echo ""
    echo -e "  ${BLUE}5.${NC} Try it out (from any project directory):"
    echo "     $ claude"
    echo "     > /gm              # Morning briefing"
    echo "     > /triage           # Inbox triage"
    echo "     > /1on1 <name>      # 1:1 prep"
    echo "     > /weekly plan      # Monday squad review prep"
    echo "     > /hiring status    # Hiring pipeline"
    echo "     > /shoutouts review # Check pending recognition"
    echo ""
    echo -e "${YELLOW}Tip:${NC} The more you customize CLAUDE.md, the better Claude performs."
    echo "     Spend 30 minutes filling in your writing style examples and team notes."
fi
echo ""
echo -e "${BOLD}Workflow:${NC} Edit skills in the repo → pull latest → run install.sh → use globally"
echo ""
