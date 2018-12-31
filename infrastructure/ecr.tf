resource "aws_ecr_repository" "environments" {
  name = "jessie-wtf"
}

resource "aws_ecr_repository_policy" "environments" {
  repository = "${aws_ecr_repository.environments.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CodeBuildAccess",
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability"
      ]
    }
  ]
}
EOF
}

output "repository_url" {
  value = "${aws_ecr_repository.environments.repository_url}"
}