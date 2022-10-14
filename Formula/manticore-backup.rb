class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup/archive/refs/tags/v0.2.19.tar.gz"
  sha256 "cf8686374018437381e352425db4a78c8ecfc467fbc4144dda743e260b54ba6e"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.2.19"
    sha256 cellar: :any_skip_relocation, monterey: "9272dd256b016e957d19ea7eca73bf1e7c6a6dac4da509ac6ee7ace23c574a20"
    sha256 cellar: :any_skip_relocation, big_sur:  "692bf7bbb471c1fd7ec90781d68f48a31d5753ceefbd64da580beda39117b715"
  end

  depends_on "php" => :build
  depends_on "php" => :test

  def install
    build_dir = `pwd`.strip + "/build"
    system "./bin/build"
    bin.install "#{build_dir}/manticore-backup" => "manticore-backup"
  end

  test do
    system "#{bin}/manticore-backup", "--version"
  end
end
