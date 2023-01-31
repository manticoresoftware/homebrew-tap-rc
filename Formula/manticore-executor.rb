class ManticoreExecutor < Formula
  desc "Custom built PHP to run misc scripts of Manticore"
  homepage "https://github.com/manticoresoftware/executor"
  url "https://github.com/manticoresoftware/executor/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "6b0ebacac885b8fbde5910454bf9f810e92b0a5d31906d36ed3af3ca0cecd49b"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-executor-0.6.2"
    sha256 monterey: "8a2b50bd875edd0725f40920c5d783d9855ecfdcbc3ab0c1d08ffa55a463ca44"
    sha256 big_sur:  "7dc60ce8c19631bb7541ba1031fba12e797aade465ec1de5bf88d511fa3562a5"
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
