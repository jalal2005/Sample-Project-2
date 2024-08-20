data "template_file" "s3_policy" {
  template = file(var.s3_policy_json_path)
  
  vars = {
    bucket_name = aws_s3_bucket.user-bucket-1.id
  }
}

resource "aws_iam_role" "s3_access_role" {
  name = "s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "s3_access_policy" {
  name   = "s3-access-policy"
  role   = aws_iam_role.s3_access_role.id
  policy = data.template_file.s3_policy.rendered
}

resource "aws_iam_instance_profile" "s3_access_instance_profile" {
  name = "s3-access-instance-profile"
  role = aws_iam_role.s3_access_role.name
}

output "ec2_role_name" {
  value = aws_iam_role.s3_access_role.name
}
