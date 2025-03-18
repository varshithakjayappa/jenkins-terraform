resource "aws_lb" "main" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = var.ec2_sg_ssh_http
  subnets            = var.subnets_ids
  
  tags = {
    Name = "${var.project_name}-alb"
    Environment = var.environment
  }
}


resource "aws_lb_target_group" "main" {
  name     = "${var.project_name}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/health"
    port = 5000
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"
  }
}

resource "aws_lb_target_group_attachment" "main_target_group_attachment" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.ec2_instance_id
  port             = 5000
}

resource "aws_lb_listener" "main_listener" {
  load_balancer_arn = aws_lb.main.arn
  port              = 5000
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}