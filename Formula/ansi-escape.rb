# Copyright (C) 2019  Hsuan-Ting Lu <hsuan.ting.lu.ee05@g2.nctu.edu.tw>
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

class AnsiEscape < Formula
  AESC_VERSION = "1.4.0".freeze
  desc "ANSI escape sequences wrapped in C++ string streams"
  homepage "https://hsuantinglu.github.io/ansi-escape/"
  url "https://github.com/hsuantinglu/ansi-escape/archive/v#{AESC_VERSION}.tar.gz"
  sha256 "1560c3b9f2a412fdc225eb986876216aa5d10899d9cb3376f891a20b4712c739"
  license "MIT"
  head "https://github.com/hsuantinglu/ansi-escape.git", branch: "develop"

  # bottle do
  #   root_url "https://github.com/HsuanTingLu/ansi-escape/releases/download/v#{AESC_VERSION}"
  #   cellar :any
  #   sha256 "e4a86452998fb73f8c6c6c5c16c4c84b66badd2f9687d076490a0c7a4bc9badf" => :catalina
  # end

  option "with-static-lib", "Build as a static library."
  depends_on "cmake" => [:build, :test]

  def install
    mkdir "build" do
      args = std_cmake_args + %w[
        -DCMAKE_BUILD_TYPE=Release
      ]

      if build.with? "static-lib"
        ohai "Build AESC as a static library"
        system "cmake", "..", *args, "-DBUILD_SHARED_LIBS=OFF"
      else
        system "cmake", "..", *args, "-DBUILD_SHARED_LIBS=ON"
      end
      system "make"
      system "make", "install"
    end
  end

  # def post_install
  # end

  test do
    ohai "Setting up ansi-escape repository in #{testpath}"
    opoo "There's no test for this repo, for now."
  end
end
