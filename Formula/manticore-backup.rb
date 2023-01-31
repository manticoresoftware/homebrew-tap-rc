class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup.git", revision: "324cfbcb42e86b51244e69a850e12a46edd37c7c"
  version "0.5.2-2023012611-324cfbc"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-backup.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.5.2-2023012611-324cfbc"
    sha256 cellar: :any_skip_relocation, monterey: "27a6153c220fa0c9b276040b6314feab1165b84f44cfe1d18ccf53ecfd4f5d01"
    sha256 cellar: :any_skip_relocation, big_sur:  "3d49adda419daeecf616a1251feab6da6db76eb842377776dc230c48c7f67dbd"
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
