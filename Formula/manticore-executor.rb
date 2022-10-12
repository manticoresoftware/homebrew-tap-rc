class ManticoreExecutor < Formula
  desc "Custom built PHP to run misc scripts of Manticore"
  homepage "https://github.com/manticoresoftware/executor"
  url "https://github.com/manticoresoftware/executor/archive/refs/tags/v0.2.15.tar.gz"
  sha256 "13dbe6638694eedab3ebd319514917cf0a2ef4724661aa5f45278cce17218dfa"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-executor-0.2.15"
    sha256 monterey: "21fea73f51a2330d6856862bbc8c2283257e7bf754a9ee82ebf480d24f4d8d06"
    sha256 big_sur:  "8a56d454b61924bf340b45ff1b70920430d0fb21597276262e3459ff5aa5afcb"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "curl" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "re2c" => :build
  depends_on "zstd"

  def install
    php_version = "8.1.11"
    php_dir = `pwd`.strip + "/php-src-php-#{php_version}"
    system "./build-osx", php_version, "1"
    bin.install "#{php_dir}/dist/bin/php" => "manticore-executor"
  end

  test do
    system "#{bin}/manticore-executor", "--version"
  end
end
