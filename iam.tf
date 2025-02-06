#IAM policy that allows access to dynamoDB
resource "aws_iam_policy" "dynamodb_access_policy" {
  name        = "dynamodb-access-policy"
  description = "Policy to allow access to DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Resource = aws_dynamodb_table.roger-bookinventory.arn
      }
    ]
  })
}

#IAM role created attach to dynamoDB policy
resource "aws_iam_role" "ec2_dynamodb_roger_role" {
  name = "ec2-dynamodb-roger_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_dynamodb_policy" {
  role       = aws_iam_role.ec2_dynamodb_roger_role.name
  policy_arn = aws_iam_policy.dynamodb_access_policy.arn
} 

#attach IAM role to EC2 instance
resource "aws_iam_instance_profile" "ec2_dynamodb_profile" {
  name = "ec2-dynamodb-profile"
  role = aws_iam_role.ec2_dynamodb_roger_role.name
}

resource "aws_instance" "web_app" {
  count         = var.settings.web_app.count
  instance_type = var.settings.web_app.instance_type
  ami           = data.aws_ami.amazon_linux.id #point to main.tf
  iam_instance_profile = aws_iam_instance_profile.ec2_dynamodb_profile.name

  tags = {
    Name = "web-app-instance"
  }
}