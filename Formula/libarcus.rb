class Libarcus < Formula
  desc "Communication library for Ultimaker software"
  homepage "https://github.com/Ultimaker/libArcus"
  url "https://github.com/Ultimaker/libArcus/archive/3.5.1.tar.gz"
  sha256 "f4e26b8d72e343d6344d8b8276047dc0170c75af801ed0def31f04bc05703a4a"
  head "https://github.com/Ultimaker/libArcus.git"

  depends_on "cmake" => :build
  depends_on "protobuf" => :build
  depends_on "python" => :build

  def install
    args = [
      "-DCMAKE_INSTALL_PREFIX=#{prefix}",
      "-DBUILD_PYTHON=OFF",
    ]

    mkdir "build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end
  end

  test do
  end
end
