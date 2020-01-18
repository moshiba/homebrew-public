# Copyright (C) 2019  Hsuan-Ting Lu <hsuan.ting.lu.ee05@g2.nctu.edu.tw>
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

class Pbar < Formula
  PBAR_VERSION = "1.4.0".freeze
  desc "Low overhead C++ progress bar"
  homepage "https://hsuantinglu.github.io/pbar/index.html"
  url "https://github.com/hsuantinglu/pbar/archive/v#{PBAR_VERSION}.tar.gz"
  sha256 "daa9ae67368a8d846730e0d547df0ec58795cb8603f8800b61ef440a1ddf978a"
  head "https://github.com/hsuantinglu/pbar.git", :branch => "develop"

  # bottle do
  #   root_url "https://github.com/HsuanTingLu/pbar/releases/download/v#{PBAR_VERSION}"
  #   cellar :any
  #   sha256 "e4a86452998fb73f8c6c6c5c16c4c84b66badd2f9687d076490a0c7a4bc9badf" => :catalina
  # end

  depends_on "cmake" => :build
  depends_on "ansi-escape"

  def install
    mkdir "_build" do
      args = std_cmake_args + %w[
        -DRELEASE=ON
      ]

      system "cmake", "..", *args, "-DBUILD_SHARED_LIBS=ON"
      system "make"
      system "make", "install"

      # TODO: build a static library too
    end
  end

  # def post_install
  # end

  test do
    ohai "Setting up pbar repository in " + testpath
    opoo "There's no test for this repo, for now."
  end
end
