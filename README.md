# 🌿 Speaking Practice Hub

> 一站式 AI 英语口语练习与复盘工作站 | 包含“日常口语”与“雅思口语”两大模块。

![License](https://img.shields.io/badge/license-MIT-green.svg)
![React](https://img.shields.io/badge/React-18.x-blue.svg)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.x-38bdf8.svg)

---

## 💡 项目简介

**Speaking Practice Hub** 是一款基于前端极简架构打造的本地化口语学习助手。无需复杂的后端部署，纯前端即可运行。配合 ChatGPT / Claude 等 AI 语言模型，帮助学习者实现从 **“输入蓄能 -> 模拟输出 -> 深度复盘”** 的全流程管理。

系统完全基于浏览器的 **File System Access API** 构建，你的所有练习复盘数据均存储在本地文件夹中，隐私安全 100% 可控。

---

## ✨ 核心功能架构

项目分为 **日常口语 (Daily Speaking)** 与 **雅思口语 (IELTS Speaking)** 两大核心模块：

### 1. 🌿 日常口语模块 (Daily Speaking)
* **提示词中心 (Prompt Hub)**
  * **System Tools**：预置系统级分析提示词，一键复制并直接跳转 ChatGPT。
  * **Scenarios Hub**：丰富场景化口语 Prompt 库，点击即用。
* **复盘看板 (Practice Dashboard)**
  * **日历打卡跟踪**：可视化月度打卡日历，清晰记录练习频次。
  * **多维能力评分**：维度化展示 Overall Score、流利度、语法及词汇指标。
  * **智能复盘明细**：
    * **原文版**：提供全文本还原与语法/表达高亮弹窗（显示错误修正与 Native 升级）。
    * **提炼版**：卡片式收录“原始表达 (MY SAY) vs 修正表达 (FIXED)”及深度语法解析。

---

### 🎓 雅思口语模块 (IELTS Speaking)
* **输入练习 (AnswerBank 语料库)**
  * **Part 1 多题并行**：支持网格/列表双视图、分类筛选、折叠管理，范文内嵌高分词汇卡片与中文翻译。
  * **Part 2 故事库复用 (Story Bank)**：支持“一套故事覆盖多道考题”，左右分栏对照故事原文本与对应 Cue Cards 题卡。
  * **Part 3 题库演练**：针对性抽象思维与逻辑延伸训练。
* **输出练习 (Dynamic Output)**
  * **动态 Prompt 注入器**：可在生成口语模拟 Prompt 时，自主勾选需要测验的 Part 1/2/3 话题，系统自动组装并注入相关题卡。
  * **雅思专属复盘**：针对雅思四项评分标准进行针对性指导与复盘。

---

## 📁 目录结构

```text
新建本地文件夹/
├── SpeakingHub.html
├── README.md
├── LICENSE
├── Daily/
│   ├── prompts.json
│   └── data/
│       └── .gitkeep (或任意json文件，空文件夹GitHub不会展示)
└── IELTS/
    ├── ielts_prompts.json
    └── AnswerBank.json