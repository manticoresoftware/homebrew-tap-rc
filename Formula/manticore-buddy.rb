require "fileutils"

class ManticoreBuddy < Formula
  desc "Manticore Search's sidecar which helps it with various tasks"
  homepage "https://github.com/manticoresoftware/manticoresearch-buddy"
  url "https://github.com/manticoresoftware/manticoresearch-buddy.git", branch: "0.4.2", revision: "36757ee752d6bc4dbbf3edaf3b3555ac57eac526"
  version "0.4.2-2023031314-36757ee"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-buddy.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-buddy-0.4.2-2023031314-36757ee"
    sha256 cellar: :any_skip_relocation, monterey: "98cb9cfe7b824b372fd2600bf71480f3cc31b82f927e849a1a1e51f0ea0c2fa4"
    sha256 cellar: :any_skip_relocation, big_sur:  "643469de80839c5a2b023d2b6241b80df09615c3666a43da9a5a2aa6bb897ae3"
  end

  depends_on "composer" => :build
  depends_on "php" => :build
  depends_on "php" => :test
  depends_on "curl"

  def install
    build_dir = `pwd`.strip + "/build"
    system "git", "clone", "https://github.com/manticoresoftware/phar_builder.git"
    system "./phar_builder/bin/build", "--name=\"Manticore Buddy\"", "--package=manticore-buddy",
"--index=src/main.php"
    dir = share
    mkdir_p "#{dir}/manticore/modules"
    mv "#{build_dir}/manticore-buddy", "#{dir}/manticore/modules/manticore-buddy"
  end

  test do
    dir = share
    File.file? "#{dir}/manticore/modules/manticore-buddy"
  end
end
