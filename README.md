#Creating the Key Pair
We will be creating a new key pair in our terraform directory. Run the following command:
"
ssh-keygen -t rsa -b 4096 -m pem -f roger_kp && openssl rsa -in roger_kp -outform pem && chmod 400 roger_kp.pem
"

updated:
ssh-keygen -t rsa -b 4096 -m pem -f roger_kp.pem && chmod 400 roger_kp.pem


#How to manage DynamoDB tables in terraform?
https://spacelift.io/blog/terraform-dynamodb

To change your setup from MySQL RDS to DynamoDB, you need to make significant changes because DynamoDB is a NoSQL database service and does not use the aws_db_instance resource. DynamoDB is a fully managed, serverless database, and it does not require provisioning instances, storage, or engine configurations like RDS.

To allow your EC2 instance to interact with DynamoDB, you need to create an IAM role with the necessary permissions and attach it to the EC2 instance.