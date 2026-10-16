# 🌿 Speaking Practice Hub

> 一站式 AI 英语口语练习与复盘工作站 | 整合日常口语与雅思口语，打造个人实战口语闭环。

![License](https://img.shields.io/badge/license-MIT-green.svg)
![React](https://img.shields.io/badge/React-18.x-blue.svg)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.x-38bdf8.svg)
![Fork](https://img.shields.io/badge/fork%20of-jialuhu06%2Fspeaking--practice--hub-blueviolet.svg)

---

## 🔀 Fork & Credits

> 本项目 fork 自 [**jialuhu06/speaking-practice-hub**](https://github.com/jialuhu06/speaking-practice-hub)（原作者：**陆加**，MIT 协议）。
> 在其基础上做了一系列功能增强与问题修复，详细内容见下方「[🆕 本版相对上游的增强](#-本版相对上游的增强)」。
> 原项目 `LICENSE` 文件完整保留；本仓库另附本版维护者对新增 / 修改部分的署名。

| 角色 | 链接 |
|---|---|
| **Upstream** | <https://github.com/jialuhu06/speaking-practice-hub> |
| **This fork** | <https://github.com/ethanliu011/speaking-practice-hub> |
| **License** | MIT（保留原作者署名） |

如果你觉得本项目有用，欢迎给 **上游项目** 也点一个 ⭐ — 它是这一切的起点。

---

## 👤 关于作者

* **原作者**：**陆加**
  * **小红书主页**：[点击关注我的小红书](https://xhslink.cn/m/37RJ69pkm5e) *(主页持续分享英语口语备考、AI 效率工具及个人成长干货)*
  * **上游项目**：[jialuhu06/speaking-practice-hub](https://github.com/jialuhu06/speaking-practice-hub)
* **本仓库维护者 / Fork 作者**：**ethanliu011**
  * 在上游基础上做了一系列功能增强与问题修复，详见下文「🆕 本版相对上游的增强」一节
  * Bug 反馈 / 建议：欢迎在仓库 [Issues](https://github.com/ethanliu011/speaking-practice-hub/issues) 提交
---

## 💡 项目简介

**Speaking Practice Hub** 是我结合自身英语学习与雅思备考需求打造的本地化口语学习助手。配合 ChatGPT / Gemini 等 AI 语言模型，实现从 **“输入积攒 -> 模拟输出 -> 深度复盘”** 的全流程管理，所有数据保存本地文件夹，对话隐私 100% 自控。

---

## 🚀 快速启动（重要）

> ⚠️ **不要直接双击 `SpeakingHub.html`！**
> 浏览器出于安全限制，禁止 `file://` 协议下的页面读取本地文件夹，直接双击打开将无法「绑定工作区」。

**方式一（推荐）：双击 `start.bat`**
脚本会自动检测 Python 或 Node.js 并启动本地服务，然后自动打开浏览器。

**方式二：手动启动**
在项目根目录执行任意一条命令，再访问 <http://127.0.0.1:8000/SpeakingHub.html>

```bash
python -m http.server 8000      # 有 Python
npx serve -l 8000               # 有 Node.js
```

> 需使用 **Chrome / Edge**（File System Access API 目前仅 Chromium 系支持）。
> 页面顶部会在环境不支持时显示黄色提示条。

---

## 🆕 本版相对上游的增强

> 本节列出本 fork 相对 [jialuhu06/speaking-practice-hub](https://github.com/jialuhu06/speaking-practice-hub) 的所有新增功能与问题修复。

### ✨ 新增功能

1. **一键启动脚本 `start.bat`（Windows）**
   - 双击即用，自动按优先级探测 Python → `py` → Node.js 并启动本地静态服务
   - 自动打开浏览器（`http://127.0.0.1:8000/SpeakingHub.html`）
   - 已修复上游「双击一闪而过」问题：换行符改为 CRLF、删除 `chcp 65001`、将跨行 `if (...)` 块改为平铺 `goto` 标签、纯 ASCII 编码
   - 服务绑定 `127.0.0.1` 避免 Windows 上 `localhost` → `::1` 解析失败

2. **`file://` 协议下的环境自检与引导**
   - 新增 `ENV_UNSUPPORTED` 常量，自动检测 `file://` 协议 或 不存在 `window.showDirectoryPicker`
   - 命中时：顶部显示**黄色提示条** + 空状态文案自动改成启动指引 + 「绑定工作区」点击直接弹 alert
   - 让「为什么双击没反应」从此有明确反馈

3. **雅思 Part 3 完整题库（从 0 到 32 题）**
   - 上游 `AnswerBank.json` 的 `part3` 字段为空数组 `[]`，本版补全为 **8 个抽象话题 / 32 题**
   - 话题与上游 Part 2 的 10 个故事线对齐（Friendship / Fame / Work / Travel / Technology / Environment / Education / Creativity），方便串练
   - 每题沿用上游 `question / answer_text / chinese_translation / key_vocabulary` 结构，可直接复用上游的高亮、词卡组件
   - 配套完善 `renderPart3()`、Part 3 工具栏（网格/列表、展开全部）、`ExpandablePromptCard` 的 Part 3 注入器

4. **多模块独立绑定**
   - 上游为全局单一 `workspaceHandle`，且切换模块时 `setWorkspaceHandle(null)` 会清空绑定
   - 本版改为按模块各自持有 `FileSystemHandle`，切换模块**互不失效**，可同时绑 `Daily/` 和 `IELTS/`
   - 模块标签上加**小圆点**指示各自绑定状态
   - header chip 显式标注「📂 日常口语 · Daily」
   - 新增**「解绑」按钮**，独立重绑不影响另一模块

5. **IndexedDB 持久化工作区（核心体验提升）**
   - 上游绑定存在内存里，刷新页面就丢失，本版写入 IndexedDB
   - 启动时**自动恢复**两个模块的绑定与数据，无需重复选择
   - 权限失效 / 文件被删时自动清理过期记录
   - 解绑时同步清库
   - 利用 `FileSystemHandle` 结构化克隆特性，浏览器一般直接返回 `queryPermission === 'granted'`，无需用户再次确认

### 🐛 优化与问题修复

- **日历月份从写死改为动态生成**：上游 `generateMonthOptions()` 硬编码 `2026-08 ~ 2027-12`，超出区间无法显示；本版按 `practiceData` 日期键 + 当月动态推导，新增 `monthPinned` 防止用户手动切月后被 `selectedDate` 自动拉回
- **雅思输入区宽度对齐**：上游用 `max-w-6xl`（1152px）比标题栏（`max-w-7xl`，1280px）窄 128px；本版改为 `max-w-7xl` 与容器同宽
- **URL 统一改为 `127.0.0.1`**：上游文案与 `start.bat` 用 `localhost`，Windows 可能优先解析到 `::1` 导致连不上；本版全部统一为 `http://127.0.0.1:8000/SpeakingHub.html`
- **README 增加 🚀 快速启动章节**：上游写「双击直接在浏览器中运行」是错的；本版明确说明必须用本地服务，并解释原因
- **目录结构注释更新**：补全 `start.bat`、调整子目录注释、补充题库规模信息

### 🧱 仍待你来做 / Future Ideas

下面这几条本版没动，但 fork 之后可以继续做：

- 数据导出 / 备份（备份整套 `Daily/data/` 与 `IELTS/data/`）
- 多设备 / 多 Profile 支持（现在每浏览器一份绑定，换设备要重选）
- 成绩趋势图（现在只有单次分数 + 雷达，没有时间序列）
- 内置 PWA 离线支持（配合 `manifest.json` + Service Worker，可像 App 一样安装）

---

## ✨ 核心功能架构

### 🌿 1. 日常口语模块 (Daily Speaking)

我日常用 AI 练口语时最大的问题是打开语音对话框也不知道聊什么，没有特定的话题；自己在表达的时候总是在用英语去翻译自己脑袋里的中文，不知道英语母语者会怎么说。AI 给出的改进意见经常也是看完就过，既缺乏维度的定量追踪，也无法直观看到自己的原始表达与 Native 地道表达的清晰对比。

所以在“日常口语”模块设置了两大功能：

* **提示词中心**：提前预设好了不同场景的prompt，一键复制并可直连ChatGPT。而且每一个prompt规定了底层规则，比如我卡壳的时候要主动引导、绝对不实时打断纠错、ChatGPT每次回答不超过 3 句，把主动权完全还给我，逼我自己多开口。
* **复盘看板**：
* 1. 自动呈现可视化打卡日历记录练习频次，并从 Overall Score、流利度、语法及词汇四大维度对每次练习进行定量评估。
  2. 逐句深度剖析：划线高亮纠错对比。点击展开词卡，不仅告诉我哪里有语法漏洞，还会直接展示“英语母语者在这个场景下会怎么遣词造句”，怎么讲得更地道；

**💡 日常口语模板：从 0 到 1 实操全流程示范**

1. **挑选场景与复制 Prompt**：打开 `SpeakingHub.html`，在日常口语模块的“提示词中心”挑选适合今天的练习场景，点击“复制”，网页会自动跳转到 ChatGPT / AI 对话框。
2. **进行 AI 模拟练习**：把复制好的 Prompt 粘贴给 AI，按照设定好的角色与场景进行 10-15 分钟的口语模拟交互或语音对话。
3. **获取与保存复盘数据**：对话结束后，发送系统复盘指令，让 AI 将本次诊断结果直接输出为 JSON 格式，并保存至本地 `Daily/data/` 目录下。
4. **刷新看板与深度学习**：回到网页点击右上角“刷新”，即可在看板中查阅本次打卡记录、四维能力雷达以及每一句 Native 地道表达式替换。

---

### 🎓 2. 雅思口语模块 (IELTS Speaking)

之前雅思口语备考最烦的就是要准备的部分太多：准备题库答案、背题、查替换、语音模考、复盘整理，频繁开一大堆软件，专注力全被打碎了，巨容易走神。跟AI语音模考的时候，Prompt 也总是调不好，AI 总是废话连篇、跑题甚至乱编题目。原来我也经常是练完就算了，根本不知道问题出在哪。

所以把整个雅思口语备考做成了一站式练习中心：

* **输入语料库 (AnswerBank)**：整合 Part 1 & Part 3视图筛选与高分词汇卡片；Part 2 独创“故事复用 (Story Bank)”架构，支持左右分栏将一个核心故事精准对标多道 Cue Card 题卡。
* **动态 Output 注入器 (Dynamic Output)**：支持在生成模拟考官 Prompt 时自主勾选当天想测验的 Part 1/2/3 话题，系统自动组装定制化指令并注入对应题卡。
* **雅思四维诊断 (IELTS Assessment)**：完全参照雅思官方评分标准，从流利度与连贯性、词汇丰富度、语法多样性及准确性进行精细化评分与提分指导。

---

## 📁 项目目录结构

```text
speaking-practice-hub/
├── start.bat                # 🚀 本地服务启动脚本（Windows，双击运行）
├── SpeakingHub.html         # 核心应用主页面（单文件 React 应用）
├── README.md               # 项目说明文档
├── LICENSE                 # 开源协议文件
│
├── Daily/                  # 🌿 日常英语口语模块
│   ├── prompts.json        # 日常口语 Prompt 场景配置文件
│   └── data/               # 日常口语练习复盘 JSON 存储目录（YYYY-MM-DD.json）
│
└── IELTS/                  # 🎓 雅思口语训练模块
    ├── ielts_prompts.json  # 雅思动态注入 Prompt 配置文件
    ├── AnswerBank.json     # 雅思 Part 1 / Part 2 / Part 3 题库与高分范文
    └── data/               # 雅思口语练习复盘 JSON 存储目录（YYYY-MM-DD.json）

**题库规模**：Part 1 — 27 个话题 ｜ Part 2 — 10 个故事（可复用套用多张 Cue Card）｜ Part 3 — 8 个抽象话题 / 32 题
