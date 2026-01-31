# dotfiles

chezmoi を使用した dotfiles 管理リポジトリ

## セットアップ

このリポジトリを使用して dotfiles を管理するには、以下の手順を実行します:

```bash
# chezmoi のインストール(Homebrew の場合)
brew install chezmoi

# このリポジトリをクローン
git clone https://github.com/MITSUBOSHI/dotfiles.git ~/ghq/github.com/MITSUBOSHI/dotfiles

# chezmoi のソースディレクトリとしてシンボリックリンクを作成
rm -rf ~/.local/share/chezmoi
ln -s ~/ghq/github.com/MITSUBOSHI/dotfiles ~/.local/share/chezmoi

# dotfiles を適用
chezmoi apply
```

## 管理されているファイル

- `dot.zsh/`: zsh 設定ファイル群
  - `.zshrc`: メイン設定ファイル
  - `conf.d/`: 各種設定ファイル
  - `extra/`: カスタムスクリプト
  - `platforms/`: プラットフォーム固有の設定
  - `submodules/`: zsh プラグイン

## ファイルの追加

新しいファイルを chezmoi で管理するには:

```bash
chezmoi add ~/.zshrc
chezmoi add -r ~/dot.zsh
```

## 変更の適用

```bash
# 変更を確認
chezmoi diff

# 変更を適用
chezmoi apply

# ソースディレクトリで編集
chezmoi edit ~/.zshrc
```

## Git への反映

```bash
cd ~/.local/share/chezmoi
git add .
git commit -m "Update dotfiles"
git push
```
