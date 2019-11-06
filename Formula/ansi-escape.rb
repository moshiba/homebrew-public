# Copyright (C) 2019  Hsuan-Ting Lu <hsuan.ting.lu.ee05@g2.nctu.edu.tw>
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

class AnsiEscape < Formula
  ANSIESCAPE_VERSION = "1.0.0".freeze
  desc "ANSI escape codes wrapped in C++ string streams"
  homepage "https://hsuantinglu.github.io/ansi-escape/"
  url "https://github.com/hsuantinglu/ansi-escape/archive/v#{ANSIESCAPE_VERSION}.tar.gz"
  sha256 "2f92ee01d8266ca8b1dc6e3d5a19acfc47cf80a4a900b692c577ba6ee2e46b63"
  head "https://github.com/hsuantinglu/ansi-escape.git"

  depends_on "cmake" => :build

  def install
    ohai "Building ansi-escape"
    system "cmake", ".", *std_cmake_args
    # Mark the config as successful.
    touch "successful-cmake"
    system "make", "install"
  end

  test do
    ohai "Setting up ansi-escape repository in " + testpath
    ohai "There's no test for this repo, for now."
    system "false"
    ohai "Test complete."
  end
end
