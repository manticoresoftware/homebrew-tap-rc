class ManticoreColumnarLib < Formula
  desc "Column-oriented storage library"
  homepage "https://github.com/manticoresoftware/columnar/"
  url "https://github.com/manticoresoftware/columnar/archive/1.16.1.tar.gz"
  sha256 "b873aa42be1bd44037c1b2d94ba8dc75c27904012feae105d521d222caa465a6"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/manticoresoftware/homebrew-manticore/releases/download/manticore-columnar-lib-1.16.1"
    sha256 cellar: :any_skip_relocation, monterey: "f742e1d2ad34656f1dd71cb320894a3ad99deba462c8089ee89d174ece1bd5f7"
    sha256 cellar: :any_skip_relocation, big_sur:  "44a0a4dc86cdaee6ee5a8441cb2afb9e809a7262141faf4720223883f42730e7"
    sha256 cellar: :any_skip_relocation, catalina: "e26b64d3868b8f89d968f5344066646bbd5911b3de73a4bf30e424103c003bc2"
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
