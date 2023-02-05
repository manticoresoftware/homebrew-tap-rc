class ManticoreColumnarLib < Formula
  desc "Manticore Columnar Library"
  homepage "https://github.com/manticoresoftware/columnar/"
  url "https://github.com/manticoresoftware/columnar.git", revision: "f6df240c690f759f14ffb1c49c401f2b07d4bedf"
  version "2.0.1-2023013023-f6df240"
  license "Apache-2.0"
  version_scheme 1
  head "https://github.com/manticoresoftware/columnar.git"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-columnar-lib-2.0.1-2023013023-f6df240"
    sha256 cellar: :any_skip_relocation, monterey: "90cae17bae748fcc24e802cb00418c53734c02ea0fa997e0a7e47a3ef6cf377d"
    sha256 cellar: :any_skip_relocation, big_sur:  "cb4f1df6a5666fb2921ca4bfb8fc3537ae7a7a0472faa1bee8fbe019c2c6e111"
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
