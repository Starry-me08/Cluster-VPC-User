output "password" {
  value = aws_iam_user_login_profile.EKS_user.*.encrypted_password
  # password | base64 --decode | keybase pgp decrypt
}