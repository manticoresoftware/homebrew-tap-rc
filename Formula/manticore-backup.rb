class ManticoreBackup < Formula
  desc "Official tool for backups of Manticore Search"
  homepage "https://github.com/manticoresoftware/manticoresearch-backup"
  url "https://github.com/manticoresoftware/manticoresearch-backup/archive/refs/tags/v0.2.15.tar.gz"
  sha256 "065c938eaf30a90332b2912c2aea4744c8dc5d5f697dde8ac3f6a8e3da184b00"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-backup-0.2.15"
    sha256 cellar: :any_skip_relocation, monterey: "8ff4c270bc547251029073ca7d589de70bff367e203a502c7cdb89b038371cd4"
    sha256 cellar: :any_skip_relocation, big_sur:  "7398dea4a9bd2082c41dbc0511136ff0413269907f95d38c88c1c4570cfda9b4"
  end

  depends_on "php" => :build
  depends_on "manticoresoftware/manticore/manticore-executor"

  def install
    build_dir = `pwd`.strip + "/build"
    system "./bin/build"
    bin.install "#{build_dir}/manticore-backup" => "manticore-backup"
  end

  test do
    system "#{bin}/manticore-backup", "--version"
  end
end
