class GemCompletion < Formula
  desc "Bash completion for gem"
  homepage "https://github.com/mernen/completion-ruby"
  url "https://github.com/mernen/completion-ruby.git",
    :revision => "710d0699ee710e181da90c4f3af8b39e4b5c81de"
  version "20170723"
  head "https://github.com/mernen/completion-ruby.git"

  bottle :unneeded

  depends_on "bash-completion"

  def install
    bash_completion.install "completion-gem" => "gem"
  end

  test do
    assert_match "-F __gem",
      shell_output("source #{bash_completion}/gem && complete -p gem")
  end
end
