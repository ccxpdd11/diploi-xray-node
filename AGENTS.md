# AGENTS.md

This project runs on [Diploi](https://diploi.com). Its components and add-ons - a framework, a database, ... - are
declared in `diploi.yaml` in this folder, each one in the folder of its `identifier`.

When you work on a component, read the `AGENTS.md` in its folder if there is one: components ship instructions for
the stack they set up, and those are more specific than this file.

## In a Diploi development environment

`/etc/diploi/AGENTS.md` explains how the development environment relates to the containers the application runs in,
and what to do instead of guessing. The `diploi` MCP server sends the same text as its instructions ("Working on
Diploi"): if you already have them, there is no need to read the file; otherwise read it first.

The `diploi` MCP server is configured for you (run `diploi agents init` if your client does not see it). Use its
tools, or the same things as commands in the terminal:

- `diploi status` - what is running and what needs attention
- `diploi describe [component]` - addresses, environment variables and where they come from
- `diploi logs <component>`, `diploi events [component]` - what a component says, and why it restarts
- `diploi exec <component> -- <command>` - run something inside a component's container
- `diploi restart <component>`, `diploi apply` - restart a component, apply `diploi.yaml` changes
- `diploi components [query]` - components and add-ons you can add, their versions and `diploi.yaml` entry

## Somewhere else

Only the code is here; the deployment is not. Read the documentation at https://docs.diploi.com
(https://docs.diploi.com/llms-full.txt as one text) and leave the deployment to someone working in it.
