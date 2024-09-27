resource "aws_s3_bucket" "example" {
  bucket = "exemplo-fulano"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Teste       = "Real"
  }
}
