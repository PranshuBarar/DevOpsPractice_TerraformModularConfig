resource "aws_eip" "elastic_ip" {
	count = var.num_elastic_ips

	tags = {
   		Name = "elastic_ip${count.index + 1}"
  	}
}