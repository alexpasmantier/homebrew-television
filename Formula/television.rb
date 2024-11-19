class Television < Formula
  desc "The revolution will (not) be televised"
  homepage "https://crates.io/crates/television"
  url "https://github.com/alexpasmantier/television/archive/refs/tags/0.5.0.tar.gz"
  sha256 "7f77ebb2f5bb7d49092373f652070ff4c9b63f389b512f3a60b0d0e27fb42fa1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tv --version")
  end
end
