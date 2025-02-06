# resource "aws_dynamodb_table" "roger-bookinventory" {
#   name           = "roger-bookinventory" #required, this needs to be unique within a region
#   billing_mode   = "PROVISIONED" #optional, default is already provisioned
#   read_capacity  = 5 #optional, default is 5
#   write_capacity = 5 #optional, default is 5
#   hash_key       = "ISBN" #required, forces new resource, attribute to use as hash (partition) key
#   # range_key      = "GameTitle"

#   attribute {  
#     name = "ISBN" #required, name of the attribute
#     type = "S"  #required, {S}tring, {N}umber or {B}inary
#   }

#   attribute {
#     name = "Genre"
#     type = "S"
#   }

  
#   tags = {
#     Name        = "dynamodb-table-1"
#     Environment = "production"
#   }
# }

#CREATE table above first-setup IAM-link EC2 to DynamoDB
resource "aws_dynamodb_table" "roger-bookinventory" {
  name           = var.settings.dynamodb.table_name
  billing_mode   = "PROVISIONED"
  hash_key       = var.settings.dynamodb.hash_key

  attribute {
    name = var.settings.dynamodb.hash_key
    type = "S"
  }

  tags = {
    Name = var.settings.dynamodb.table_name
  }
}