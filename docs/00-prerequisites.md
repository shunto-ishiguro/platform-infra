# Phase 0: 前提知識・環境構築

## 必要なツール

### 1. Terraform

```bash
# tfenv (Terraform バージョン管理) のインストール
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Terraform のインストール
tfenv install 1.5.7
tfenv use 1.5.7

# 確認
terraform version
```

### 2. AWS CLI

```bash
# インストール
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# 認証設定
aws configure
# AWS Access Key ID: (IAM で発行したキー)
# AWS Secret Access Key: (IAM で発行したシークレット)
# Default region name: ap-northeast-1
# Default output format: json

# 確認
aws sts get-caller-identity
```

### 3. Git / GitHub CLI

```bash
# GitHub CLI
sudo apt install gh  # Ubuntu/Debian
gh auth login
```

## AWS アカウントのセットアップ

### IAM ベストプラクティス

1. **ルートアカウントは使わない** — MFA を有効化して封印する
2. **IAM ユーザーを作成** — 学習用に `AdministratorAccess` を付与 (本番では最小権限)
3. **アクセスキーを発行** — `aws configure` で設定する

### コスト管理

学習中に想定外の課金を防ぐために:

- **Billing アラート** を設定する (例: $5 超過で通知)
- **Free Tier ダッシュボード** を定期的に確認する
- 使い終わったリソースは `terraform destroy` で必ず削除する

```bash
# 作成したリソースの一括削除
terraform destroy
```

## Terraform の State 管理 (後で設定)

学習の初期段階では state をローカルに保存する。Phase 2 以降で S3 + DynamoDB による remote state に移行する。

```hcl
# 最初はこの設定不要 (ローカル state がデフォルト)
# Phase 2 で以下を追加:
terraform {
  backend "s3" {
    bucket         = "platform-infra-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
```

## 前提知識チェックリスト

- [ ] ターミナル操作 (cd, ls, cat, grep など)
- [ ] Git の基本操作 (clone, branch, commit, push, PR)
- [ ] YAML / HCL (JSON ライクな設定ファイル) の読み書き
- [ ] AWS の基本概念 (リージョン, VPC, EC2, IAM)
- [ ] ネットワークの基礎 (IP, サブネット, CIDR, DNS)
