# EKS Admin Group
resource "aws_iam_group" "eks_masters" {
  name = "Masters"
}

resource "aws_iam_group_policy" "masters_policy" {
  name   = "Masters"
  group  = aws_iam_group.eks_masters.name
  policy = data.aws_iam_policy_document.masters_role.json
}

resource "aws_iam_group_membership" "masters_team" {
  name  = "masters-group-membership"
  users = [aws_iam_user.eks_user[1].name, aws_iam_user.eks_user[2].name]
  group = aws_iam_group.eks_masters.name
}

# Admin Role To Be Assumed By Masters
resource "aws_iam_role" "masters" {
  name               = "Masters-eks-Role"
  assume_role_policy = data.aws_iam_policy_document.masters_assume_role.json
}


resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.masters.name
  policy_arn = aws_iam_policy.eks_admin.arn
}

resource "aws_iam_policy" "eks_admin" {
  name   = "eks-masters"
  policy = data.aws_iam_policy_document.masters.json
}
