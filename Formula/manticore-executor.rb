class ManticoreExecutor < Formula
  desc "Custom built PHP to run misc scripts of Manticore"
  homepage "https://github.com/manticoresoftware/executor"
  url "https://github.com/manticoresoftware/executor.git", revision: "d95e43eb808a99e4da530ee95861ed18e6ba03b5"
  version "0.6.2-2023020711-d95e43e"
  license "GPL-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/executor.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-executor-0.6.2-2023020711-d95e43e"
    sha256 arm64_ventura: "dc36898275ae685a96459e2a544b0ea9bb3d7c9884ebb1fcbc1022e91aeb37b6"
    sha256 monterey:      "514924bf39e88751f4542599f1f1f17ab109728b6c0129b8aefc793a7f754a23"
    sha256 big_sur:       "d8afb8258aa4569cbe228198ad88a9c35c134d6f2ec5cbfdf5b1ffa7e1e2e110"
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
