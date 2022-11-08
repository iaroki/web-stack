resource "aws_lb_target_group" "web_tg" {
  name        = "web-target-group"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.web_vpc.id
}

resource "aws_alb_target_group_attachment" "web_tg_attachment" {
  count            = length(aws_instance.web_instance.*.id) == 2 ? 2 : 0
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = element(aws_instance.web_instance.*.id, count.index)
}

resource "aws_lb" "web_lb" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id, ]
  subnets            = aws_subnet.web_subnet.*.id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
