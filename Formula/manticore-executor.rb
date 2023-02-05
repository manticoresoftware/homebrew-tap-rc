class ManticoreExecutor < Formula
  desc "Custom built PHP to run misc scripts of Manticore"
  homepage "https://github.com/manticoresoftware/executor"
  url "https://github.com/manticoresoftware/executor.git", revision: "d95e43eb808a99e4da530ee95861ed18e6ba03b5"
  version "0.6.3-2023012313-d95e43e"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/executor.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-executor-0.6.3-2023012313-d95e43e"
    sha256 monterey: "20ccd9fa327f6fc0bad621685dbc682a24f6222eb297c846ad9e610e7acd0047"
    sha256 big_sur:  "6313d4cc94f8246142d8ba5dc7c4c152e8648b0190d57572a0271408e34ce06d"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "curl" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "re2c" => :build
  depends_on "openssl"
  depends_on "zstd"

  def install
    php_version = "8.2.1"
    php_dir = `pwd`.strip + "/build"
    system "./build-osx", php_version, "1"
    bin.install "#{php_dir}/dist/bin/php" => "manticore-executor"
  end

  test do
    system "#{bin}/manticore-executor", "--version"
  end
end
