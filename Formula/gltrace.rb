class Gltrace < Formula
  desc "Terminal-first GitLab pipeline log explorer"
  homepage "https://github.com/glsuite/gltrace"
  url "https://github.com/glsuite/gltrace/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "db919e5f45d21e65d3cd30cb2a05413b8d693f44b410da375916b39a32b8cacf"
  license "MIT"
  head "https://github.com/glsuite/gltrace.git", branch: "main"

  depends_on "bash"
  depends_on "jq"

  def install
    inreplace "gltrace", %r{^#!/usr/bin/env bash}, "#!#{Formula["bash"].opt_bin}/bash"
    bin.install "gltrace"
  end

  test do
    assert_match "gltrace #{version}", shell_output("#{bin}/gltrace --version")
    assert_match "Usage", shell_output("#{bin}/gltrace --help")
  end
end
