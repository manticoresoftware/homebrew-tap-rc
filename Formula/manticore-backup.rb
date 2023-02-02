class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup.git", revision: "4a3793286c03860ce1b0c46ebee6c6f58a1948de"
  version "0.5.2-2023020221-4a37932"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-backup.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.5.2-2023020221-4a37932"
    sha256 cellar: :any_skip_relocation, monterey: "c74b951eaaa3985ad83b60348889c14100c3e944c3d78d72879e11cf38b123e7"
    sha256 cellar: :any_skip_relocation, big_sur:  "22bdcb69c1998de8970065a01814fb37d0a064844b7501ed7e0b0b493fd3d7ad"
  end

  depends_on "composer" => :build
  depends_on "php" => :build
  depends_on "php" => :test

  def install
    build_dir = `pwd`.strip + "/build"
    system "./bin/build", "--name=\"Manticore Backup\"", "--package=manticore-backup", "--index=src/main.php"
    bin.install "#{build_dir}/manticore-backup" => "manticore-backup"
  end

  test do
    system "#{bin}/manticore-backup", "--version"
  end
end
