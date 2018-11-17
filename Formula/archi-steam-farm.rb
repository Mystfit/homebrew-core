class ArchiSteamFarm < Formula
  desc "ASF is a C# application that allows you to farm steam cards"
  homepage "https://github.com/JustArchi/ArchiSteamFarm"
  url "https://github.com/JustArchi/ArchiSteamFarm/releases/download/2.3.2.4/ASF.zip"
  sha256 "dd537e275c032f03e555ad8d4cefe8c2f39f294bf06d8454c139ec4ed82fb304"

  bottle :unneeded

  depends_on "mono"

  def install
    libexec.install "ASF.exe"
    (bin/"asf").write <<~EOS
      #!/bin/bash
      mono #{libexec}/ASF.exe "$@"
    EOS

    etc.install "config" => "asf"
    libexec.install_symlink etc/"asf" => "config"
  end

  def caveats; <<~EOS
    Config: #{etc}/asf/
  EOS
  end

  test do
    assert_match "ASF V#{version}", shell_output("#{bin}/asf --client")
  end
end
