English | [简体中文](README.md)

> **Note**: Runtime Environment
> Most scripts in the DM series rely on functions provided by third-party executors and **cannot** run fully in vanilla Roblox or Roblox Studio.
> **Code Protection**: To prevent tampering and unauthorized redistribution, all scripts have been obfuscated. We apologize if loading fails due to low UNC (Unified Naming Convention) compatibility with your executor.
> **Completely Free**: All scripts in this series are free and open-source/shared. Any form of reselling or charging is a violation of our terms; please beware of scams.

> **Warning**: Use at Your Own Risk
> Since this series relies on third-party executors to run, using them means you voluntarily assume all associated risks and consequences (including but not limited to account bans).
> **No Infringement**: Reverse engineering any scripts in this series is strictly prohibited.
> **Disclaimer**: By running any script in this series, you acknowledge that you have read, understood, and agreed to all the terms above. If you do not agree, please stop using them immediately.

---

# Introduction to the DMUI Series

DMUI (DM User Interface) is a comprehensive UI framework and foundational function library series designed specifically for Roblox client-side executors. Through multiple iterations, DMUI has evolved from a simple interface library into a complete development suite integrating low-level data retrieval, high-frequency practical features, component-based UI rendering, and a plugin ecosystem.

## Project Vision

In the Roblox scripting ecosystem, many scripts are often limited by rough UI interactions, single-language support, and "disposable" development models that prevent code reuse. The core mission of DMUI is to provide all script developers with an **industrial-grade, high-cohesion, and low-coupling** foundational standard. By offering a unified design language and modular APIs, developers no longer waste time on basic interface assembly and interaction logic, allowing them to build more professional, stable, and maintainable script projects.

## Core Features

*   **Unified Visual and Interactive Standards**: Employs modern micro-animation designs. Whether it's window dragging, focus switching, fullscreen scaling, or right-click menu shadows and easing, all follow consistent responsive logic and natively support different operational habits on PC and mobile.
*   **Native Multilingual Engine**: The framework features a built-in global multilingual dictionary that supports hot-swapping without reloading the interface. It covers Simplified Chinese, Traditional Chinese, English, Japanese, Spanish, and Portuguese, fundamentally solving the localization experience for users in different regions.
*   **All-Scenario Component Library**: Provides highly encapsulated UI components, including a template window generator (supporting minimization to the taskbar), real-time list scrollbars, dynamic specular effects, real-time notification and history panels, as well as standardized data form rendering.
*   **Plugin-Based Extension Architecture**: With the main framework at its core, by exposing the `PluginAPI`, it allows developers to rapidly build extension modules for specific games or scenarios based on a unified standard, breaking the limitations of traditional closed-source scripts.

## Architectural Philosophy: Main Framework & Plugin Complementarity

The Roblox platform contains tens of thousands of different games, each with vastly different server architectures, anti-cheat mechanisms, and core gameplay. Attempting to build all complex, game-specific logic into the main script would inevitably lead to extremely bloated code and make the entire system highly susceptible to global crashes due to updates in a single game.

Therefore, DMUI adopts an architecture combining a core foundation with external plugins. The main framework is responsible for providing stable UI rendering, interaction interception, low-level data communication, and general-purpose basic features. For functionalities that the main script cannot natively support or those requiring deep customization for specific servers, they can be perfectly replaced by writing independent plugins. Plugins can be rapidly iterated for specific environments without waiting for framework updates, and without affecting the stability of the main framework.

The development of the DMUI series would not be possible without the feedback and suggestions from the community. We always adhere to the principle of being free, and we welcome all developers to build their own plugins based on the DMUI standard to jointly enrich the ecosystem of this series.
