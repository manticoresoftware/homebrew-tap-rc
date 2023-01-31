require "fileutils"

class ManticoreBuddy < Formula
  desc "Manticore Search's sidecar which helps it with various tasks"
  homepage "https://github.com/manticoresoftware/manticoresearch-buddy"
  url "https://github.com/manticoresoftware/manticoresearch-buddy.git", revision: "8cb84c11a328999226ecdd2dbb67ab8633176fa2"
  version "0.3.4-2023013117-8cb84c1"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-buddy.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-buddy-0.3.4-2023013117-8cb84c1"
    sha256 cellar: :any_skip_relocation, monterey: "22f2bc400273b804d61c18a4046f9aec93a0ef3ccd7fd04975f936396978ef28"
    sha256 cellar: :any_skip_relocation, big_sur:  "25b6e93612f884edbdced9a84d0b79eefaa24cea2398ca6e37b6dba154e6f10f"
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
