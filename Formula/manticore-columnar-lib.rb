class ManticoreColumnarLib < Formula
  desc "Manticore Columnar Library"
  homepage "https://github.com/manticoresoftware/columnar/"
  url "https://github.com/manticoresoftware/columnar.git", branch: "columnar-2.0.4", revision: "5a49bd7f07b7123edb5bc34503db80a870183de6"
  version "2.0.4-2023030613-5a49bd7"
  license "Apache-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/columnar.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-columnar-lib-2.0.4-2023030613-5a49bd7"
    sha256 cellar: :any_skip_relocation, monterey: "cfe8583ab47745d9f8f74e9119e43790698f275386b89b822649de275c9d8ec0"
    sha256 cellar: :any_skip_relocation, big_sur:  "d89cd8350dc856f37bf159f8e981f7d78886e772d27b4f61417dcf59fe0af158"
  end

  depends_on "boost" => :build
  depends_on "cmake" => :build

  def install
    args = %W[
      -DCMAKE_INSTALL_LOCALSTATEDIR=#{var}
      -DDISTR_BUILD=macos
    ]

    mkdir "build" do
      system "cmake", "..", *std_cmake_args, *args
      system "make", "install"
    end
  end
  test do
    dir = share
    output = shell_output("file #{dir}/manticore/modules/lib_manticore_columnar.so")
    assert_match "64-bit", output
  end
end
