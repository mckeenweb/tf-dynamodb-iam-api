resource "aws_dynamodb_table_item" "item2" {
  depends_on = [aws_dynamodb_table.roger-bookinventory]
  table_name = aws_dynamodb_table.roger-bookinventory.name
  hash_key = aws_dynamodb_table.roger-bookinventory.hash_key
  
   
item =<<ITEM
  {
    "ISBN": {"S": "002"},
    "Genre": {"S": "BaseBall"},
    "Year":{"N": "8"}
  }
  ITEM
}