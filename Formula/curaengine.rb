class Curaengine < Formula
  desc "C++ 3D printing GCode generator"
  homepage "https://github.com/Ultimaker/CuraEngine"
  url "https://github.com/Ultimaker/CuraEngine/archive/3.5.1.tar.gz"
  sha256 "1edabbc520f2a331394d5db82a951c258da7d8827c0fa9188e77d735250530e8"
  head "https://github.com/Ultimaker/CuraEngine.git"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "f3e4523d845e891ef23e56d95ab48454d22bebcc0f179a0806096009833e6acb" => :mojave
    sha256 "750b6ca6224c47f14cafa72bdca8f204348fdffda46289234b6f1e3c7f8b53ce" => :high_sierra
    sha256 "6319dc4f7e2648f801728e4aaf0aff747ae305ca9f6130181d164f222f40d160" => :sierra
    sha256 "73def7a0bbe0e297fd6490c0b0fd481265814918ffa42bf83febd5f1e68d7149" => :el_capitan
    sha256 "4252263a845ca5fc5631c4211eac9a95ad53e20cc07dfa0ea6422ea83ca178e7" => :yosemite
  end

  depends_on "cmake" => :build
  depends_on "libarcus" => :build
  depends_on "protobuf" => :build

  def install
    mkdir "build" do
      system "cmake", ".."
      system "make"
    end


    # system "make", "VERSION=#{version}"
    # bin.install "build/CuraEngine"
  end

  test do
    (testpath/"t.stl").write <<~EOS
      solid t
        facet normal 0 -1 0
         outer loop
          vertex 0.83404 0 0.694596
          vertex 0.36904 0 1.5
          vertex 1.78814e-006 0 0.75
         endloop
        endfacet
      endsolid Star
    EOS

    system "#{bin}/CuraEngine", "#{testpath}/t.stl"
  end
end
