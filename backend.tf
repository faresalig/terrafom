terraform {
  backend "s3" {
    bucket = "terafform23452"
    key    = "terafform/backend"
    region = "us-east-1"
  }
}