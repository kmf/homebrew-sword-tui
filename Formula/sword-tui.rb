class SwordTui < Formula
  desc "Terminal-based Bible application built with Go"
  homepage "https://github.com/kmf/sword-tui"
  url "https://github.com/kmf/sword-tui/archive/refs/tags/v1.11.0.tar.gz"
  sha256 "4fb8c1ea6c345d97238f1e1ac1dabad6fbb77054e88eebc46f654b142c48767c"
  license "GPL-2.0-or-later"
  head "https://github.com/kmf/sword-tui.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/kmf/sword-tui/internal/version.BuildNumber=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/sword-tui"
  end

  test do
    # Test that the binary was installed and can run
    assert_match version.to_s, shell_output("#{bin}/sword-tui --version")
  end
end
