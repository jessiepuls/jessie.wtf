resource "aws_s3_bucket" "www" {
  bucket = "${var.www_domain_name}"
  acl = "public-read"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.www_domain_name}/*"]
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_acm_certificate" "certificate" {
  domain_name       = "*.${var.root_domain_name}"
  validation_method = "EMAIL"
  subject_alternative_names = ["${var.root_domain_name}"]
}