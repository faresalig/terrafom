resource "aws_security_group" "deve-sg" {
  name        = "deve-sg"
  description = "deve-sg"


  tags = {
    Name = "deve-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshfrommyip" {
  security_group_id = aws_security_group.deve-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allo-http" {
  security_group_id = aws_security_group.deve-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allowalloutboundipv4" {
  security_group_id = aws_security_group.deve-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.deve-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}