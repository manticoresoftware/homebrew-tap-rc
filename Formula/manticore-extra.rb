require "digest"

class ManticoreExtra < Formula
  desc "Meta package that includes executor and columnar lib"
  homepage "https://manticoresearch.com"
  url "file://" + File.expand_path(__FILE__)
  version "0.6.2-2023020711-d95e43e" # Must be same as executor
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version_scheme 1

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-extra-0.6.2-2023020711-d95e43e"
    sha256 cellar: :any_skip_relocation, monterey: "fa81e0effb763fb574c09e3d01ba75b478698eef6e2b5f41eba824ec097672b2"
    sha256 cellar: :any_skip_relocation, big_sur:  "02da22f79505cea4cd1bd155aba5a86544695ad458b6cc322e1fea8ebbc63c57"
  end

  depends_on "manticoresoftware/manticore/manticore-columnar-lib"
  depends_on "manticoresoftware/manticore/manticore-executor"

  def install
    File.open("manticore-extra", "w") do |file|
      file.write "#!/bin/sh\n"
      deps.each do |dep|
        f = dep.to_formula
        file.write "echo " + [f.full_name, f.version, f.prefix].join("\t") + "\n"
      end
    end

    bin.install "manticore-extra"
  end

  test do
    system "#{bin}/manticore-extra"
  end
end
