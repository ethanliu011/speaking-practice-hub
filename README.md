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


| 角色 | 链接 |
|---|---|
| **Upstream** | <https://github.com/jialuhu06/speaking-practice-hub> |
| **This fork** | <https://github.com/ethanliu011/speaking-practice-hub> |

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

**方式一（推荐）：双击启动脚本**

| 系统 | 操作 |
|---|---|
| **Windows** | 双击 `start.bat` |
| **macOS / Linux** | 终端执行 `./start.sh`（首次需 `chmod +x start.sh`） |

脚本会**自动探测本机已有的运行环境**，找到哪个用哪个，**通常不需要你额外安装任何东西**：

| 优先级 | 运行时 | 通常在哪 |
|---|---|---|
| 1 | `python3` | Linux 基本自带；macOS 装过 Xcode 命令行工具就有 |
| 2 | `python` | 老版 macOS / Windows |
| 3 | `node` | 开发者的机器上一般都有 |
| 4 | `ruby` | **macOS 系统自带**（兜底） |

- **Windows**：即使 Python / Node.js 都没装，也会自动改用 Windows 自带的 PowerShell 运行，**完全免安装**。
- **macOS**：即使没装 Python / Node.js，通常也能靠系统自带的 Ruby 启动，**无需预先安装**。
- **Linux**：一般自带 `python3`，直接可用。

只有在以上全都找不到时，脚本才会提示你安装其中一个（会给出对应系统的安装命令）。

**方式二：手动启动**
在项目根目录执行任意一条命令，再访问 <http://127.0.0.1:8000/SpeakingHub.html>

```bash
python3 -m http.server 8000      # macOS / Linux
python  -m http.server 8000      # Windows
npx serve -l 8000                # 任意（需 Node.js）
```

> 需使用 **Chrome / Edge**（浏览器本地文件夹读取能力目前仅 Chromium 系支持）。
> macOS 同样支持 Chrome / Edge，Safari 暂不支持。
> 页面顶部会在环境不支持时显示黄色提示条。

---

## 🆕 本版相对上游的增强

> 本节列出本 fork 相对 [jialuhu06/speaking-practice-hub](https://github.com/jialuhu06/speaking-practice-hub) 在使用体验上的主要改进。

### ✨ 新增功能

1. **一键启动，开箱即用**
   新增 `start.bat`（Windows）与 `start.sh`（macOS / Linux）启动脚本，双击即可自动打开应用，**无需手动敲命令或配置环境**。脚本会依次探测本机的 Python / Node.js / Ruby 等已有环境，找到哪个用哪个；Windows 还能进一步回退到系统自带的 PowerShell，Mac 也能依靠系统自带的 Ruby——**绝大多数情况下一个软件都不用装**。

2. **用错方式打开时，会明确告诉你原因**
   直接双击 `SpeakingHub.html` 时，原版会毫无反应、让人一头雾水。本版会自动检测并在页面顶部弹出**醒目的提示条**，说明原因并给出具体的解决步骤，点「绑定工作区」也会直接弹窗指引。

3. **雅思 Part 3 完整题库**
   上游的 Part 3 题库为空。本版补全了 **8 个抽象话题、共 32 道高频题**，每道题都配有：

   * 考官视角的提问
   * 高分范文
   * 全文中文对照翻译
   * 可点击展开的高分词汇卡片

   话题设计**与 Part 2 的 10 个核心故事相互呼应**（友谊、名人、工作、旅行、科技、环境、教育、创意），让你能用同一套素材串起三个 Part，**大幅减少备考准备量**。

4. **「日常口语」与「雅思口语」可同时独立绑定**
   上游在切换模块时会清空文件夹绑定，来回切换就要反复重新选择。本版让**两个模块各自记住自己的文件夹**，互不干扰，来回切换不再失效，也不用重复选择。

5. **关掉浏览器再打开，绑定依然在**
   上游的绑定只存在内存里，刷新或重开页面就丢失。本版会**自动记住你选过的文件夹**，下次打开直接恢复，不用再选一次。想换文件夹时可随时点「解绑」。

### 🐛 优化与体验修复

- **打卡日历自动跟到最新月份**：原版日历的月份范围是写死的，超出这个范围的练习记录不会显示。本版改为**自动跟随你的练习记录**，练到哪个月就显示哪个月；手动切换月份后也不会被自动跳回。
- **练习区排版与标题栏对齐**：雅思练习区的内容区域比顶部标题栏窄了一截，已调整为同宽，视觉更整齐。
- **打开地址更可靠**：统一改用 `127.0.0.1` 形式的访问地址，避免部分电脑上原本的写法会解析失败、导致页面打不开。
- **说明书更准确**：修正了原版 README 中「双击直接在浏览器中运行」的错误指引，并补充解释了原因与正确做法。
- **项目结构说明补全**：补充新增文件的说明，并标注了题库规模。

### 🧱 后续可做 / Future Ideas

下面这几条本版没动，留作后续迭代方向：

- 练习数据一键导出 / 备份（打包 `Daily/data/` 与 `IELTS/data/`）
- 多设备 / 多账号同步（目前绑定是每浏览器一份，换设备需重选）
- 成绩趋势曲线（目前只有单次得分 + 雷达图，缺少时间序列）
- 离线应用支持（做成 PWA，可像 App 一样安装使用）

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
├── start.bat                # 🚀 启动脚本（Windows，双击运行）
├── start.sh                 # 🚀 启动脚本（macOS / Linux）
├── server.ps1               # Windows 零依赖兜底服务（无 Python/Node 时使用）
├── SpeakingHub.html         # 核心应用主页面（单文件 React 应用）
├── README.md               # 项目说明文档
├── CONTRIBUTING.md         # 贡献指南
├── LICENSE                 # 开源协议文件（保留原作者署名）
├── .gitignore              # 默认排除个人练习数据
│
├── .github/
│   └── PULL_REQUEST_TEMPLATE.md
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
