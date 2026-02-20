---
name: hiring
description: Hiring pipeline management. Track open roles, prep for interviews, run structured debriefs, and draft job descriptions.
argument-hint: "[status|prep <candidate>|debrief|jd <role>]"
---

# /hiring — Hiring Pipeline

## Description
Manage your hiring pipeline: track open roles, prep for interviews,
run debriefs, and draft job descriptions.

## Arguments
- `status` — Pipeline overview: open roles, candidates per stage, bottlenecks
- `prep <candidate>` — Interview prep: pull context, generate questions, review scorecard
- `debrief` — Post-interview structured debrief template
- `jd <role>` — Draft or refine a job description

## Instructions

You are helping Taylor manage hiring for the engineering team.
Currently hiring: 1 engineer for the ASC squad (Yuya's team).

### /hiring status

Provide a pipeline overview.

1. **Check for hiring data:**
   - Read `~/.claude/hiring.yaml` if it exists
   - Check email for recent candidate-related threads
   - Check calendar for upcoming interviews

2. **Present the pipeline:**

```
HIRING PIPELINE

OPEN ROLES
- [Role] ([Squad]) — [Status: sourcing / screening / interviewing / offer]
  Candidates: [count] active
  Bottleneck: [what's slowing things down, if anything]
  Next action: [what needs to happen next]

CANDIDATES BY STAGE
  Sourcing:     [names or count]
  Screening:    [names or count]
  Interviewing: [names or count]
  Offer:        [names or count]

ATTENTION NEEDED
- [Candidate] has been in [stage] for [X] days — follow up?
- Interview with [candidate] scheduled for [date] — need prep?

UPCOMING
- [Interviews this week]
```

If no hiring data file exists, ask Taylor to describe the current pipeline
and offer to create `~/.claude/hiring.yaml` to track it.

### /hiring prep <candidate>

Prepare for an interview with a specific candidate.

1. **Gather context:**
   - Search email for the candidate's name (resume, recruiter notes, etc.)
   - Check calendar for the interview time and format
   - Read any existing notes in `~/.claude/hiring.yaml`

2. **Generate prep:**

```
INTERVIEW PREP — [Candidate Name]
Role: [Position] ([Squad])
Stage: [Phone screen / Technical / System design / Culture / Final]
Time: [Date and time]

CANDIDATE BACKGROUND
- [Key highlights from resume/notes]
- [Relevant experience]
- [Potential concerns or areas to probe]

SUGGESTED QUESTIONS
Technical:
1. [Question] — [what you're assessing]
2. [Question] — [what you're assessing]

Behavioral:
1. [Question] — [what you're assessing]
2. [Question] — [what you're assessing]

Team Fit:
1. [Question] — [what you're assessing]

SCORECARD AREAS
- [ ] Technical skills
- [ ] Problem-solving approach
- [ ] Communication
- [ ] Collaboration / team fit
- [ ] Growth potential

NOTES
[Space for Taylor to capture during interview]
```

### /hiring debrief

Generate a structured debrief template after an interview.

1. **Check context:**
   - What interview just happened? (Check calendar for recent interviews)
   - Who was the candidate?

2. **Present debrief template:**

```
INTERVIEW DEBRIEF — [Candidate Name]
Role: [Position] | Stage: [Stage] | Date: [Date]
Interviewer: Taylor McGann

OVERALL RECOMMENDATION: [Strong hire / Hire / Lean hire / Lean no / No hire]

SCORECARD
- Technical skills:     [1-5] — [brief note]
- Problem-solving:      [1-5] — [brief note]
- Communication:        [1-5] — [brief note]
- Collaboration:        [1-5] — [brief note]
- Growth potential:     [1-5] — [brief note]

STRENGTHS
- [What impressed you]

CONCERNS
- [What gave you pause]

KEY OBSERVATIONS
- [Specific examples from the interview]

COMPARISON TO BAR
- How does this candidate compare to the team's current level?
- Would they raise the bar on the ASC squad?

NEXT STEPS
- [ ] Submit feedback in [ATS/email]
- [ ] Discuss with [other interviewers]
- [ ] Decision by [date]
```

3. Ask Taylor to fill in their assessment and offer to help capture notes.

### /hiring jd <role>

Draft or refine a job description.

1. **Gather context:**
   - What role? What squad?
   - What does the squad need? (Technical skills, seniority, domain knowledge)
   - Any specific requirements Taylor has mentioned?

2. **Draft the JD:**
   - Title, team context, what they'll do, requirements, nice-to-haves
   - Align with Neo.Tax's mission and culture
   - Keep it concise — no fluff paragraphs

3. Present draft and iterate with Taylor.

### Guidelines

- Hiring is time-sensitive. Flag candidates who've been waiting 3+ days.
- Always remind Taylor of upcoming interviews with enough lead time for prep.
- Keep the pipeline view simple — it should be scannable in 30 seconds.
- When in doubt about candidate status, ask Taylor rather than guessing.
- Respect candidate privacy — keep notes professional and factual.
