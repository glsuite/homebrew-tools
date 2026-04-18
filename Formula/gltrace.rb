class Gltrace < Formula
  desc "Terminal-first GitLab pipeline log explorer"
  homepage "https://github.com/glsuite/gltrace"
  url "https://github.com/glsuite/gltrace/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "974a74607c9a052a76da038c85eccd7f3f16514ce02ee719bbd0f2b7ff02e225"
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
