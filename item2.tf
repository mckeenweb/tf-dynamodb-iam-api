resource "aws_dynamodb_table_item" "item2" {
  depends_on = [aws_dynamodb_table.basic-dynamodb-table]
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  hash_key = aws_dynamodb_table.basic-dynamodb-table.hash_key
  
  #required, => JSON representation of a map of attribute name/value pair, one for each attribute
  item = jsonencode({
    "ISBN": {"S": "002"},
    "Genre": {"S": "BaseBall"},
    "Year":{"N": "8"}
  })
}
  
