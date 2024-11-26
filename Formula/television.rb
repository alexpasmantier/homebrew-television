class Television < Formula
  desc "General purpose fuzzy finder TUI"
  homepage "https://github.com/alexpasmantier/television"
  url "https://github.com/alexpasmantier/television/archive/refs/tags/0.5.3.tar.gz"
  sha256 "2010564e2afcf6874f410faab6c235fe99943c35a944acbfe7fb9d9a3680d406"
  license "MIT"
  head "https://github.com/alexpasmantier/television.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tv -V")

    pid = spawn bin/"tv", [:out, :err] => "#{testpath}/output"
    sleep 10

    output = File.read("#{testpath}/output").gsub(/\e\[[\d;]*m/, "")
    assert_match "current channel", output
  ensure
    Process.kill("TERM", pid)
    Process.wait(pid)
  end
end
