require "fileutils"

class ManticoreBuddy < Formula
  desc "Manticore Search's sidecar which helps it with various tasks"
  homepage "https://github.com/manticoresoftware/manticoresearch-buddy"
  url "https://github.com/manticoresoftware/manticoresearch-buddy/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "f7c7fd7ef80b2883871ba11b858c9bb3a62583c05e04630682719a352bb4a60a"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-buddy-0.1.15"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey: "1d1791b6aae0673ad83d3f529af2996e78e6bcadf2811154ea5ae80c4ebd5b29"
    sha256 cellar: :any_skip_relocation, big_sur:  "3d750d7eea836ba011a193010d5149e60ba8d7198a53400e64afc30793680793"
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
