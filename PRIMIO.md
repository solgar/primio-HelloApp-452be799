# HelloApp

## Overview
A minimal Material 3 hello world app demonstrating a polished greeting screen with smooth entrance animation. Targeted at developers wanting a clean starting point.

## Tech Stack & Key Decisions
- Pure Flutter with Material 3 — no external packages needed for this scope
- Single-screen app — no router needed; state is widget-local

## Architecture
- Single screen with entrance animation managed via AnimationController
- No data layer, services, or providers — app has no business logic or data

## Conventions
- Theme uses ColorScheme.fromSeed for automatic tonal palette generation
- Animation controllers created in initState and disposed in dispose

## Key Patterns & Gotchas
- SingleTickerProviderStateMixin used for the entrance animation controller

## Design System
- Clean Material 3 aesthetic with indigo seed color for a professional feel
- Default Material 3 typography; no custom fonts needed for this scope
- Centered layout with icon + heading + subtitle hierarchy
