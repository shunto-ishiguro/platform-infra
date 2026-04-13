# platform-infra

Terraform + AWS + GitOps を実践的に学ぶためのリポジトリ。

## 目的

- Terraform によるインフラのコード化 (IaC) を習得する
- AWS の主要サービスをコードで構築・管理できるようになる
- GitOps ワークフローでインフラ変更を安全にデプロイする

## リポジトリ構成

```
platform-infra/
│
├── modules/                           # 再利用可能な Terraform モジュール (設計図)
│   ├── network/                       #   VPC, サブネット, セキュリティグループ
│   ├── alb/                           #   ロードバランサー
│   ├── ecs/                           #   コンテナ実行基盤
│   ├── rds/                           #   データベース
│   └── github-oidc/                   #   GitHub Actions の AWS 認証
│
├── envs/                              # 環境ごとの設定 (modules を呼び出す)
│   ├── shared/                        #   Terraform の道具 (S3, DynamoDB) — 最初に1回だけ apply
│   ├── dev/                           #   開発環境 — 最小構成・低コスト
│   ├── stg/                           #   ステージング — 本番前の最終確認
│   └── prod/                          #   本番環境 — 冗長構成・止まらないように
│
├── .github/
│   └── workflows/
│       ├── terraform-plan.yml         #   PR 時: plan を自動実行して結果をコメント
│       └── terraform-apply.yml        #   main マージ時: apply を自動実行
│
├── docs/                              # 学習ドキュメント
│   ├── 00-prerequisites.md            #   前提知識・環境構築
│   ├── 01-terraform-basics.md         #   Terraform 基礎
│   ├── 02-aws-infrastructure.md       #   AWS インフラ設計
│   ├── 03-gitops-workflow.md          #   GitOps ワークフロー
│   └── 04-project-structure.md        #   プロジェクト構成ガイド
│
├── .gitignore                         # Git に含めないファイル (state, .terraform/ など)
└── README.md
```

## 学習ロードマップ

| Phase | テーマ | ドキュメント |
|-------|--------|-------------|
| 0 | 環境構築 | [docs/00-prerequisites.md](docs/00-prerequisites.md) |
| 1 | Terraform 基礎 | [docs/01-terraform-basics.md](docs/01-terraform-basics.md) |
| 2 | AWS インフラ設計 | [docs/02-aws-infrastructure.md](docs/02-aws-infrastructure.md) |
| 3 | GitOps ワークフロー | [docs/03-gitops-workflow.md](docs/03-gitops-workflow.md) |
| 4 | プロジェクト構成 | [docs/04-project-structure.md](docs/04-project-structure.md) |