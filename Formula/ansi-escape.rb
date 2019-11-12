# Copyright (C) 2019  Hsuan-Ting Lu <hsuan.ting.lu.ee05@g2.nctu.edu.tw>
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

class AnsiEscape < Formula
  AESC_VERSION = "1.1.2".freeze
  desc "ANSI escape codes wrapped in C++ string streams"
  homepage "https://hsuantinglu.github.io/ansi-escape/"
  head "https://github.com/hsuantinglu/ansi-escape.git"

  stable do
    version "#{AESC_VERSION}"
    url "https://github.com/hsuantinglu/ansi-escape/archive/v#{AESC_VERSION}.tar.gz"
    sha256 "a3b189b9353eecd2da6623d309e31fd4ecefae9cf101d239117f5d0bb583721c"

    # patch do
    #   url ""
    #   sha256 ""
    # end
  end

  bottle do
    root_url "https://github.com/HsuanTingLu/ansi-escape/releases/download/v#{AESC_VERSION}/ansi-escape--#{AESC_VERSION}"
    cellar :any
    sha256 "519cc3afb6c1c56110f69595b528e715eea2fcffa25355c3c111a26f63e2eb81" => :catalina
  end

  depends_on "cmake" => :build

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
    ohai "Setting up ansi-escape repository in " + testpath
    ohai "There's no test for this repo, for now."
  end
end
