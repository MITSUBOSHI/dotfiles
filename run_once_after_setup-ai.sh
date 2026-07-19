#!/bin/bash
# AI 設定リポジトリ(Claude Code / Codex 共通)の clone とセットアップ
set -eu

if [ ! -d "$HOME/ai" ]; then
  if command -v gh >/dev/null 2>&1; then
    gh repo clone MITSUBOSHI/ai "$HOME/ai"
  else
    git clone git@github.com:MITSUBOSHI/ai.git "$HOME/ai"
  fi
fi

"$HOME/ai/install.sh"
