resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.eks_cluster.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true


  tags = {
    Environment = "production"
  }

}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id
}


