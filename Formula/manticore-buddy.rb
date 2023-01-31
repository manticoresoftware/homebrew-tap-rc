require "fileutils"

class ManticoreBuddy < Formula
  desc "Manticore Search's sidecar which helps it with various tasks"
  homepage "https://github.com/manticoresoftware/manticoresearch-buddy"
  url "https://github.com/manticoresoftware/manticoresearch-buddy.git", branch: "0.3.4", revision: "2e1c62374aca30b703c73dc75bc63c737b94f779"
  version "0.3.4-2023013121-2e1c623"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-buddy.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-buddy-0.3.4-2023013121-2e1c623"
    sha256 cellar: :any_skip_relocation, monterey: "909b5219b8e06d892543a1643ca51e948fe30a811532ac1756aa10fe0509e72b"
    sha256 cellar: :any_skip_relocation, big_sur:  "b281b73db5fa7f1a4f382124a3b747f085948fead161528a7f54d7604de3de43"
  end

  depends_on "composer" => :build
  depends_on "php" => :build
  depends_on "php" => :test
  depends_on "curl"

  def install
    build_dir = `pwd`.strip + "/build"
    system "./bin/build", "--name=\"Manticore Buddy\"", "--package=manticore-buddy", "--index=src/main.php"
    dir = share
    mkdir_p "#{dir}/manticore/modules"
    mv "#{build_dir}/manticore-buddy", "#{dir}/manticore/modules/manticore-buddy"
  end

  test do
    dir = share
    File.file? "#{dir}/manticore/modules/manticore-buddy"
  end
end
