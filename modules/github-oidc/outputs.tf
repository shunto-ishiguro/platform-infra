output "role_arn" {
  value       = aws_iam_role.github_actions.arn
  description = "GitHub Actions 用 IAM ロールの ARN"
}
