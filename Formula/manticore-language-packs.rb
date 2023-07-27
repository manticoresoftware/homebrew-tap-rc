class ManticoreLanguagePacks < Formula
  desc "Download and install Manticore morphology packs"
  homepage "https://manticoresearch.com/"
  url "https://manticoresearch.com"
  version "0.9.9"

  def install
    (share/"manticore").mkpath

    langs = %w[de en ru]
    langs.each do |lang|
      system "curl -sSL https://repo.manticoresearch.com/repository/morphology/#{lang}.pak.tgz | tar xvzf - -C #{share/"manticore"}"
    end
  end
end