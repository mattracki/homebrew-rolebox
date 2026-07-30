class Rolebox < Formula
  desc "Asdf-style profile manager for AI coding agents"
  homepage "https://github.com/mattracki/rolebox"
  url "https://github.com/mattracki/rolebox/releases/download/v0.1.0/rolebox-0.1.0.tar.gz"
  sha256 "fccdbf72a8e2eaa6da68c9f8383eb16a7fdc37ec0aa380c720f60c43c657c1e0"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "cli/rolebox.cjs" => "rolebox"
    bin.write_exec_script libexec/"rolebox"
    bin.install_symlink bin/"rolebox" => "rb"
  end

  def caveats
    <<~EOS
      Enable transparent Codex and Claude shims in zsh:

        echo 'eval "$(rolebox shell-init zsh)"' >> ~/.zshrc

      Then choose a default profile:

        rolebox add work
        rolebox global work
    EOS
  end

  test do
    ENV["ROLEBOX_HOME"] = testpath/"config"
    assert_match "Personal", shell_output("#{bin}/rolebox list")
    assert_match "Created context: Work", shell_output("#{bin}/rolebox add Work")
    assert_match "Active context: Work", shell_output("#{bin}/rolebox global work")
    assert_match "Work (work)", shell_output("#{bin}/rolebox current")
  end
end
