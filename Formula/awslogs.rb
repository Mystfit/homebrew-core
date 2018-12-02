class Awslogs < Formula
  include Language::Python::Virtualenv

  desc "Simple command-line tool to read AWS CloudWatch logs"
  homepage "https://github.com/jorgebastida/awslogs"
  url "https://github.com/jorgebastida/awslogs/archive/0.11.0.tar.gz"
  sha256 "6258a121629cb872ee61fe78bf112753c8782c971524f0943a0e21f74d5e28bd"
  head "https://github.com/jorgebastida/awslogs.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "eba2fcea38465be48ecf8a7ea55fbec72bb8d977ac622a381e995ecad504294b" => :mojave
    sha256 "19126515321a5e97f73caeaffdd01506134516a76d2fab21a87983f6faafedaa" => :high_sierra
    sha256 "82daf95a3047ffcc333773f19ca3596fe83345ee81df056b98c85aaa25d385c5" => :sierra
  end

  depends_on "python"

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/fe/ea/3f0dedaf1b733908a171c2aa24d322ad18c1aee171afff88a7b9e843d845/boto3-1.9.60.tar.gz"
    sha256 "6e9f48f3cd16f4b4e1e2d9c49c0644568294f67cda1a93f84315526cbd7e70ae"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/ec/52/992d721d2dab6e0b6ce1a92b892ca75d48e4200de7adc7af0eb65a3141ae/botocore-1.12.60.tar.gz"
    sha256 "e298eaa3883d5aa62a21e84b68a3b4d47b582fffdb93efefe53144d2ed9a824c"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"
    sha256 "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"
    sha256 "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0/python-dateutil-2.7.5.tar.gz"
    sha256 "88f9287c0174266bb0d8cedd395cfba9c58e87e5ad86b2ce58859bc11be3cf02"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/9a/66/c6a5ae4dbbaf253bd662921b805e4972451a6d214d0dc9fb3300cb642320/s3transfer-0.1.13.tar.gz"
    sha256 "90dc18e028989c609146e241ea153250be451e05ecc0c2832565231dacdf59c1"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz"
    sha256 "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awslogs --version 2>&1")
  end
end
