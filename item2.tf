resource "aws_dynamodb_table_item" "item2" {
  #insertion of this item into the student table depends entirely on the table being created
  #in other words, the table must be created first
  depends_on = [aws_dynamodb_table.basic-dynamodb-table]
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  #(required) hash key is used for the lookups and id of the item
  hash_key = aws_dynamodb_table.basic-dynamodb-table.hash_key
  
  #required, => JSON representation of a map of attribute name/value pair, one for each attribute
  item =<<ITEM
  {
    "UserId": {"S": "002"},
    "GameTitle": {"S": "BaseBall"},
    "TopScore":{"N": "8"}
  }
  ITEM
}
  
