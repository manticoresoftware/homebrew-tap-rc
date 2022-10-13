class ManticoreColumnarLib < Formula
  desc "Column-oriented storage library"
  homepage "https://github.com/manticoresoftware/columnar/"
  url "https://github.com/manticoresoftware/columnar/archive/1.15.5.tar.gz"
  sha256 "5263a6c172eda56ad5aa3ae748c61c6b3fd7a8f82dab36357200a23bcf0840dd"
  license "Apache-2.0"

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
end
