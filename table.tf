resource "aws_dynamodb_table" "roger-bookinventory" {
  name           = "roger-bookinventory" #required, this needs to be unique within a region
  billing_mode   = "PROVISIONED" #optional, default is already provisioned
  read_capacity  = 5 #optional, default is 5
  write_capacity = 5 #optional, default is 5
  hash_key       = "ISBN" #required, forces new resource, attribute to use as hash (partition) key
  # range_key      = "GameTitle"

  attribute {  
    name = "ISBN" #required, name of the attribute
    type = "S"  #required, {S}tring, {N}umber or {B}inary
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  # attribute {
  #   name = "TopScore"
  #   type = "N"
  # }

  # ttl {
  #   attribute_name = "TimeToExist"
  #   enabled        = true
  # }

  # global_secondary_index {
  #   name               = "GameTitleIndex"
  #   hash_key           = "GameTitle"
  #   range_key          = "TopScore"
  #   write_capacity     = 10
  #   read_capacity      = 10
  #   projection_type    = "INCLUDE"
  #   non_key_attributes = ["UserId"]
  # }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}