require "fileutils"

class ManticoreBuddy < Formula
  desc "Manticore Search's sidecar which helps it with various tasks"
  homepage "https://github.com/manticoresoftware/manticoresearch-buddy"
  url "https://github.com/manticoresoftware/manticoresearch-buddy.git", revision: "3db8cfb80855bcc939315db2e415836b18bcf999"
  version "0.3.5-2023020315-3db8cfb"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-buddy.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-buddy-0.3.5-2023020315-3db8cfb"
    sha256 cellar: :any_skip_relocation, monterey: "1a26d87cc2fc62ad5eddbe13cb0db68ad5802bbc4f8c4cfa6a2bfe7119ed5e43"
    sha256 cellar: :any_skip_relocation, big_sur:  "8fb9c016af684082e0abfae1fc294307b29c434537276205d0e5e78bad9c1277"
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
