# 贡献指南

> 📢 **在提 Issue / PR 之前，请先阅读本指南。**
> 看完能帮你少走弯路，也能让维护者更快回应。

---

## ⚠️ 重要：本仓库是 Fork

本仓库 [`ethanliu011/speaking-practice-hub`](https://github.com/ethanliu011/speaking-practice-hub) 是对
[**jialuhu06/speaking-practice-hub**](https://github.com/jialuhu06/speaking-practice-hub)（原作者：**陆加**，MIT 协议）的 **个人 fork**，用于我（@ethanliu011）自己的学习与功能迭代。

为避免给原作者带来不必要的打扰，请按下方规则选择合适的位置提交反馈：

| 你想反馈的内容 | 提交到 |
|---|---|
| **本 fork 独有的功能 / 优化**（详见 [README · 本版相对上游的增强](README.md#-本版相对上游的增强)）<br>例如：IndexedDB 持久化、多模块独立绑定、Part 3 题库补全等 | ✅ **本仓库的 Issues / PR**（`ethanliu011/speaking-practice-hub`） |
| **上游就有的功能 bug / 体验问题**<br>例如：四维评分逻辑、Story Bank 复用架构、逐句纠错渲染等 | ⬆️ **请优先去上游提交**：`jialuhu06/speaking-practice-hub` 的 Issues |
| **不确定归属** | 先在本仓库开 Issue 描述，维护者会判断并转上游（如有需要） |

> 💡 **判断小技巧**：把仓库 `git fetch upstream` 拉取上游最新代码后，**如果问题依然存在**，大概率是上游 bug，请去上游反馈；如果只在 fork 独有的代码里出现，就提在这里。

---

## 🐛 报告 Bug

提交 Issue 前请确认：

- [ ] 已搜索 [现有 Issues](https://github.com/ethanliu011/speaking-practice-hub/issues)，没有重复
- [ ] 已尝试用最新版本复现（`git pull` 到 main 分支）
- [ ] 已确认是 **本 fork 独有功能** 的问题（参考上方判断表）

请在 Issue 中提供：

1. **环境信息**
   - 操作系统（Windows / macOS / Linux + 版本）
   - 浏览器（必须是 **Chrome ≥ 86** 或 **Edge ≥ 86**，其他内核不支持）
   - 是通过 `start.bat` / 手动起服务 / `file://` 哪种方式打开
2. **复现步骤**（尽量详细）
3. **预期行为** vs **实际行为**
4. **截图 / 录屏**（如有）
5. **控制台错误**（F12 → Console 面板里的红色报错文字）

---

## 💡 提议新功能

欢迎！请在开 Issue 前简单回答：

1. **要解决什么问题？**（描述你目前的使用痛点）
2. **希望的交互方式？**（草图 / 文字描述均可）
3. **是否愿意自己实现并提 PR？**

如果是**上游已有功能**的延伸，强烈建议先去上游讨论；只在确认是 fork 独有场景时再在本仓库提。

---

## 🔧 提交 Pull Request

### 分支规范

- 从 `main` 切新分支，命名：`feat/xxx` / `fix/xxx` / `docs/xxx` / `chore/xxx`
- 例：`feat/idb-encrypt` / `fix/part3-render-empty`

### Commit 信息

参考上游风格，使用清晰的中文或英文祈使句：

```text
feat: Part 3 题库补全至 8 个抽象话题 / 32 题
fix: 切换模块时不再清空工作区绑定
docs: README 新增 Fork & Credits 章节
```

### PR 描述模板

请在 PR 里说明：

```markdown
### 改动类型
- [ ] Bug 修复
- [ ] 新功能
- [ ] 文档 / 注释
- [ ] 重构 / 性能优化
- [ ] 仅本 fork 独有（不影响上游同步）

### 改动说明
<!-- 描述你做了什么、为什么这么做 -->

### 关联 Issue
<!-- 如有关联，填写 #编号；无则写 "无" -->

### 截图 / 录屏
<!-- UI 改动必须附前后对比 -->

### 自测情况
<!-- 在哪些环境 / 浏览器下验证过 -->
```

### 同步上游（可选但推荐）

本仓库会定期 `merge` 上游更新。提 PR 前请：

```bash
git fetch upstream
git merge upstream/main --no-ff
# 解决冲突（如果有）后推送
git push origin feat/your-branch
```

---

## 📜 许可证

本仓库基于上游 **MIT 协议** 派生。任何贡献都默认遵循同样的 MIT 协议：你会保留版权，但授予他人与上游相同的自由使用权利。

提交 PR 即表示你同意这一点。

---

## 🙏 致谢

- 原作者 [陆加](https://xhslink.cn/m/37RJ69pkm5e) 设计并开发了整个项目
- 所有 [Contributors](https://github.com/ethanliu011/speaking-practice-hub/graphs/contributors)

感谢你的贡献！
