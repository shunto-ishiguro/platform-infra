output "tfstate_bucket" {
  value       = aws_s3_bucket.tfstate.bucket
  description = "Terraform state を保存する S3 バケット名"
}

output "tflock_table" {
  value       = aws_dynamodb_table.tflock.name
  description = "Terraform state ロック用の DynamoDB テーブル名"
}
