class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup.git", revision: "2745fad0f88bac936bcb261b02074b2f925c59d3"
  version "0.5.2-2023020213-2745fad"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-backup.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.5.2-2023020213-2745fad"
    sha256 cellar: :any_skip_relocation, monterey: "47d31ca22f001c9640975e995ab79c818c65f956e8231833688ceeb6658f596e"
    sha256 cellar: :any_skip_relocation, big_sur:  "b1597a900a9b96e65d9f6da3ee214957e2f9c0ff8b5311a6e781365b77824dd5"
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
