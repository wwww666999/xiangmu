English | [简体中文](README_CN.md)

> **Note**: Runtime Environment
> Most scripts in the DM series rely on functions provided by third-party executors and **cannot** run fully in vanilla Roblox or Roblox Studio.
>
> **Code Protection**: To prevent tampering and unauthorized redistribution, all scripts have been obfuscated. We apologize if loading fails due to low UNC (Unified Naming Convention) compatibility with your executor.
>
> **Completely Free**: All scripts in this series are free and open-source/shared. Any form of reselling or charging is a violation of our terms; please beware of scams.

> **Warning**: Use at Your Own Risk
> Since this series relies on third-party executors to run, using them means you voluntarily assume all associated risks and consequences (including but not limited to account bans).
>
> **No Infringement**: Reverse engineering any scripts in this series is strictly prohibited.
>
> **Disclaimer**: By running any script in this series, you acknowledge that you have read, understood, and agreed to all the terms above. If you do not agree, please stop using them immediately.

# DMUI4 API Framework

DMUI4 is a modern, full-featured Lua UI framework and script library designed specifically for Roblox client-side executors. Built with a modular design, it provides a rich set of UI components, global state management, multilingual support, and various practical in-game features.

## Core Features

*   **Dynamic Context Menu**: Supports custom context menus bound to buttons, optimized for both PC and mobile, featuring screen-edge adaptation and dynamic multilingual rebinding.
*   **Player Profile System**: Supports queries by UserId or username. Retrieves account creation date, age, friends, ban status, follower/following counts, etc.
*   **Notification & History System**: Supports multi-position alerts, auto-close on timeout, and button interactions. Includes a standalone notification history window with persistent saving and dynamic cleanup.
*   **Integrated In-Game Utilities**:
    *   **Unified Flight**: Integrates Standard, Vehicle, and CFrame flight modes with adjustable speed.
    *   **Spectate System**: Auto-follows target upon respawn, prevents camera reset, and safely restores local camera view upon exit.
    *   **Live Tracking**: Calculates target relative distance and direction based on ViewportFrame.
    *   **Object/Player Selector**: Provides a standardized UI for scripts to select in-game models, parts, or online players.

# Plugin Development Advantages

DMUI4 reserves a `PluginAPI` interface within its core script. Given the vast differences in server architectures and gameplay across different Roblox games, the main script cannot natively accommodate all game-specific logic. Therefore, DMUI4 adopts a complementary "Main Framework + Plugins" architecture, allowing features for specific servers or customized requirements to be implemented via plugins.

Developing plugins within the DMUI4 ecosystem offers the following significant advantages:

### 1. Breaking Through Multi-Game Compatibility Bottlenecks
If the main script (DMUI4 Core) built in logic for every specific game, it would result in extremely bloated code and be highly prone to crashes from single-game updates. By writing independent plugins, developers can deeply customize and rapidly iterate for specific games without waiting for main framework updates, nor will it affect the stability of the main framework.

### 2. Rapid Development & Out-of-the-Box
No need to handle UI rendering, window dragging, or resolution adaptation from scratch. Developing plugins in DMUI4 allows direct access to ready-made advanced components:
- Call `BuildWinUI` to generate a uniformly styled template window with support for scaling and dragging.
- Directly reuse existing interactive components such as the notification system, player selector, and context menus.
This allows developers to invest 100% of their effort into the core business logic of the plugin.

### 3. Unified Interaction and Visual Experience
All DMUI4 plugins share the same underlying UI standards: consistent window focus animations, context menu response logic intelligently adapted for PC and mobile, unified sound feedback, and theme colors. This ensures that the learning curve is virtually zero for end-users when interacting with any third-party plugin.

### 4. Decoupling Core Framework from Business Logic
By providing unified API calls through `APIFold` (such as flight, spectate, tracking, etc.), plugins do not need to concern themselves with the underlying implementation of physical flight or anti-camera reset. This high-cohesion, low-coupling architecture ensures that:
- Updates or bug fixes to the underlying API instantly benefit all plugins.
- Plugins only need to focus on their own logic; even if an error occurs internally within a plugin, it will not easily crash the entire DMUI core framework.
