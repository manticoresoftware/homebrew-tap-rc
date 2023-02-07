class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup.git", branch: "0.5.2", revision: "4a3793286c03860ce1b0c46ebee6c6f58a1948de"
  version "0.5.2-2023020711-4a37932"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/manticoresearch-backup.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.5.2-2023020711-4a37932"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "dde9d53b903ca99f8b7e09191404a54126096a5681ceb646d0bc5d397a18b4e9"
    sha256 cellar: :any_skip_relocation, monterey:      "be6e2a7e6e73411a1fc461da37fb55e0681589435dde056ef3ae42ab96b75da9"
    sha256 cellar: :any_skip_relocation, big_sur:       "5309309018cfdba911ef20aa4fdfac018ca7a9ec03e94aa3b87ddaf5f8107648"
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
