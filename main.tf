provider "aws"{}

variable cidr_blocks{}
variable avail_zone{}

resource "aws_vpc" "myapp-vpc"{
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
        Name: var.cidr_blocks[0].name
    }
}

resource "aws_subnet" "dev-subnet-1"{
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.cidr_blocks[1].cidr_block 
    availability_zone = var.avail_zone
    tags = {
        Name: var.cidr_blocks[1].name
    } 
}

