#!/bin/bash

# 脚本功能：格式化指定目录下的所有 Markdown 文件，并自动将改动推送到 Git 仓库。

# -----------------
# --- 安全设置 ---
# -----------------
# set -e: 如果任何命令失败（返回非零退出码），则立即退出脚本。
# 这可以防止在格式化失败后，脚本仍然继续执行 git 命令。
set -e

# -----------------
# --- 变量定义与检查 ---
# -----------------
# 检查是否提供了目录参数
if [ -z "$1" ]; then
  echo "❌ 错误：请提供一个目标目录作为参数。"
  echo "用法: $0 <目录路径>"
  exit 1
fi

TARGET_DIR="$1"

# 检查提供的路径是否是一个真实存在的目录
if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ 错误：目录 '$TARGET_DIR' 不存在。"
  exit 1
fi

# -----------------
# --- 核心逻辑 ---
# -----------------

# 1. 格式化 Markdown 文件
echo "🚀 步骤 1/4: 正在使用 Prettier 格式化 '$TARGET_DIR' 目录下的所有 Markdown 文件..."
# 使用 npx 执行 prettier，--write 表示直接修改文件
# "$TARGET_DIR/**/*.md" 是一个 glob 模式，匹配目标目录及其所有子目录下的 .md 文件
npx prettier --write "$TARGET_DIR/**/*.md"
echo "✅ 格式化完成。"
echo

# 2. 将改动添加到 Git 暂存区
echo "🚀 步骤 2/4: 正在执行 'git add .'"
git add .
echo "✅ 文件已添加到暂存区。"
echo

# 3. 检查是否有文件变动需要提交
# 如果 git diff-index --quiet HEAD -- 命令成功执行（没有差异），则说明工作区是干净的
if git diff-index --quiet HEAD --; then
  echo "✨ 工作区没有检测到文件变动，无需提交。脚本执行完毕。"
  exit 0
fi

# 4. 提交改动
echo "🚀 步骤 3/4: 正在提交改动..."
# 获取当前日期，格式为 YYYY-MM-DD
COMMIT_DATE=$(date +'%Y-%m-%d')
# 创建提交信息
COMMIT_MESSAGE="docs: 格式化 Markdown 文件于 $COMMIT_DATE"

git commit -m "$COMMIT_MESSAGE"
echo "✅ 提交成功，信息为: '$COMMIT_MESSAGE'"
echo

# 5. 推送到远程仓库
echo "🚀 步骤 4/4: 正在推送到远程仓库..."
git push
echo "✅ 推送成功！"
echo

# -----------------
# --- 完成 ---
# -----------------
echo "🎉 所有操作均已成功完成！"
