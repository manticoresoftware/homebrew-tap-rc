class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "9b76ab28c199f1b6cbc6981267426a129b0f4b602d58ae30ec7bc0b636506a82"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.4.1"
    sha256 cellar: :any_skip_relocation, monterey: "98ba472473e53a2d1cab891b9acc02e5d6163ac21bde9b836ec9784711f729c6"
    sha256 cellar: :any_skip_relocation, big_sur:  "7bc00e21a9ce61dc38f20bdb950cbe07946b402ca413236731740903f292f622"
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
