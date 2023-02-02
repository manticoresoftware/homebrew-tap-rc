require "fileutils"

class ManticoreBuddy < Formula
  desc "Manticore Search's sidecar which helps it with various tasks"
  homepage "https://github.com/manticoresoftware/manticoresearch-buddy"
  url "https://github.com/manticoresoftware/manticoresearch-buddy.git", branch: "0.3.4", revision: "804832e779a5adfe180137c59bde207fc4f77f80"
  version "0.3.4-2023020216-804832e"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-buddy.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-buddy-0.3.4-2023020216-804832e"
    sha256 cellar: :any_skip_relocation, monterey: "ecfb3737e9ab7f3df7bc7a486d03e881d1a00031f0be65ff987ee81bd6110758"
    sha256 cellar: :any_skip_relocation, big_sur:  "a504aa839d1c7f01e5880c70d7eee72659480d163496fca28c323dd8eb0870b6"
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
