# Codex 脚本合集

这个仓库用于管理与 OpenAI 文档相关的本地脚本工具，包含批量下载 Markdown 文档以及将 Markdown 批量转换为 PDF 的脚本。

## 主要脚本

- `download-md.sh`：下载指定的 OpenAI Docs Markdown 文件到 `openai-docs/` 目录。
- `md-to-pdf.sh`：将某个目录下的所有 `.md` 文件批量转换为 `.pdf`。

## 使用示例

下载 Markdown：

```bash
./download-md.sh https://platform.openai.com/docs/your-file.md
```

批量转换为 PDF（使用 Prince 作为 PDF 引擎）：

```bash
./md-to-pdf.sh path/to/mds path/to/pdfs
```

## 依赖

- `download-md.sh` 依赖：`curl`
- `md-to-pdf.sh` 依赖：`pandoc`、`prince`
