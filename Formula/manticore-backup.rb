class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup.git", revision: "4a3793286c03860ce1b0c46ebee6c6f58a1948de"
  version "0.5.3-2023020315-4a37932"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-backup.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.5.3-2023020315-4a37932"
    sha256 cellar: :any_skip_relocation, monterey: "e3ce54fa79298143fbc8d90ad448aa87348bf074ba238ac995e1829db7a8020e"
    sha256 cellar: :any_skip_relocation, big_sur:  "99174f3aa63587302cc64f07c0d0566ca6744fdb9f0760f4a17c88bdd9e536e7"
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
    File.file? "#{bin}/manticore-backup"
  end
end
