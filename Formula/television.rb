class Television < Formula
  desc "Blazingly fast general purpose fuzzy finder for your terminal written in Rust"
  homepage "https://crates.io/crates/television"
  url "https://github.com/alexpasmantier/television/archive/refs/tags/0.5.2.tar.gz"
  sha256 "bec76b1de37759cdcecbc30251c7717ea77debb771cecc63b6ffff15884177d1"
  license "MIT"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a72c29f504a8fa91eedaeef12af0ee3c5afdbe72efb3150cf759ecde740b25f3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tv --version")
  end
end
