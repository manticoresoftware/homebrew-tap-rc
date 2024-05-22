require 'hardware'
require "fileutils"

class ManticoreExecutor < Formula
  desc "Custom built PHP to run misc scripts of Manticore"
  homepage "https://github.com/manticoresoftware/executor"
  license "PHP-3.01"

  arch = Hardware::CPU.arch

  if arch.to_s == "x86_64" || arch.to_s == "amd64"
    version "1.1.6-24052206-c55bc2b"
    url "https://repo.manticoresearch.com/repository/manticoresearch_macos/release_candidate/manticore-executor_#{version}_macos_amd64.tar.gz"
    sha256 "db3822fcfccbdcda847e6a234b2ada0df83c23745bbbfe4e9522430e5a6246fe"
  else
    version "1.1.6-24052206-c55bc2b"
    url "https://repo.manticoresearch.com/repository/manticoresearch_macos/release_candidate/manticore-executor_#{version}_macos_arm64.tar.gz"
    sha256 "95dfe513e0f33743cea639ad1490cd0ea747ad298010fad24e9f7b38ee371073"
  end

  depends_on "openssl"
  depends_on "zstd"

  def install
    bin.install "manticore-executor" => "manticore-executor"
  end

  test do
    system "#{bin}/manticore-executor", "--version"
  end
end
