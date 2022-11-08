## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.38.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_target_group_attachment.web_tg_attachment](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/alb_target_group_attachment) | resource |
| [aws_eip.web_eip](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/eip) | resource |
| [aws_eip_association.web_eip_association](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/eip_association) | resource |
| [aws_instance.web_instance](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/instance) | resource |
| [aws_internet_gateway.web_igw](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/internet_gateway) | resource |
| [aws_key_pair.web_key_pair](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/key_pair) | resource |
| [aws_lb.web_lb](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/lb) | resource |
| [aws_lb_listener.web_listener](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.web_tg](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/lb_target_group) | resource |
| [aws_route.web_route](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/route) | resource |
| [aws_route_table.web_rt](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/route_table) | resource |
| [aws_route_table_association.web_rt_association](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/route_table_association) | resource |
| [aws_security_group.web_sg](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/security_group) | resource |
| [aws_subnet.web_subnet](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/subnet) | resource |
| [aws_vpc.web_vpc](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/resources/vpc) | resource |
| [local_file.web_ssh_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.web_key_pair](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/data-sources/ami) | data source |
| [aws_availability_zones.azs](https://registry.terraform.io/providers/hashicorp/aws/4.38.0/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Ingress rules | `list(map(any))` | <pre>[<br>  {<br>    "description": "Ingress rules for port 443",<br>    "name": "HTTPS",<br>    "port": 443<br>  },<br>  {<br>    "description": "Ingress rules for port 80",<br>    "name": "HTTP",<br>    "port": 80<br>  },<br>  {<br>    "description": "Ingress rules for port 22",<br>    "name": "SSH",<br>    "port": 22<br>  }<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to create an instance | `string` | `"t2.micro"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR range | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_id"></a> [alb\_id](#output\_alb\_id) | n/a |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
