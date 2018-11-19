class AwsSdkCpp < Formula
  desc "AWS SDK for C++"
  homepage "https://github.com/aws/aws-sdk-cpp"
  # aws-sdk-cpp should only be updated every 10 releases on multiples of 10
  url "https://github.com/aws/aws-sdk-cpp/archive/1.7.0.tar.gz"
  sha256 "f8c02eb19be17f7df37b51c3399793b00521ffd56fe3165fa258ae8c94057857"
  head "https://github.com/aws/aws-sdk-cpp.git"

  bottle do
    cellar :any
    sha256 "2b2acb68e8f2da512c383f961c5ebd6cbf2a66aaf39f586450d32269f1a4dcf6" => :mojave
    sha256 "7ac1532c66592ee534bff8bd7f54c79a9ea3caf5277453798c9907f396a1c475" => :high_sierra
    sha256 "01ad899f04bfa8bcff2c3f4067fa238879a284e5c671c42156e510881bc4d5fd" => :sierra
  end

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end

    lib.install Dir[lib/"mac/Release/*"].select { |f| File.file? f }
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <aws/core/Version.h>
      #include <iostream>

      int main() {
          std::cout << Aws::Version::GetVersionString() << std::endl;
          return 0;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cpp", "-L#{lib}", "-laws-cpp-sdk-core",
           "-o", "test"
    system "./test"
  end
end
