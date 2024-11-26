class Television < Formula
  desc "Blazingly fast general purpose fuzzy finder for your terminal written in Rust"
  homepage "https://crates.io/crates/television"
  url "https://github.com/alexpasmantier/television/archive/refs/tags/0.5.3.tar.gz"
  sha256 "2010564e2afcf6874f410faab6c235fe99943c35a944acbfe7fb9d9a3680d406"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tv --version")
  end
end
