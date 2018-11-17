class Hfstospell < Formula
  desc "Helsinki Finite-State Technology ospell"
  homepage "https://hfst.github.io/"
  url "https://github.com/hfst/hfst-ospell/releases/download/v0.5.1/hfstospell-0.5.1.tar.gz"
  sha256 "ccf5f3b06bcdc5636365e753b9f7fad9c11dfe483272061700a905b3d65ac750"

  bottle do
    cellar :any
    sha256 "3f05e2bbeee5f4efff3feb68ac32c1238e4cc4e6d2377f594a4fc1b46a46b0d7" => :mojave
    sha256 "276eda6c0865d79d468db9509daeaf537425597ffb88f983b1c0c97313b46b18" => :high_sierra
    sha256 "949b5bcc9566da8dc417cd5c1585790986d066d04fb926d7d38bd05dbed420d2" => :sierra
    sha256 "8db96d894473fa94b81ddcf40365cf4cd215d3aa8e9eab07210c0e4827a833cb" => :el_capitan
  end

  depends_on "pkg-config" => :build
  depends_on "icu4c"
  depends_on "libarchive"
  depends_on "libxml++"

  needs :cxx11

  def install
    ENV.cxx11
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/hfst-ospell", "--version"
  end
end
