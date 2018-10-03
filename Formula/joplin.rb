require "language/node"

class Joplin < Formula
  desc "Note taking and to-do application with synchronisation capabilities"
  homepage "https://joplin.cozic.net/"
  url "https://registry.npmjs.org/joplin/-/joplin-1.0.116.tgz"
  sha256 "ddb4cd6246c5396064506cc23ab5773ec6d8c6075bba3ff338f68797ea2665e6"

  bottle do
    sha256 "94b25d9f34bd106a8948ec82a76ea5d28b7fb9c4bb815c146d8ae7706acf355a" => :mojave
    sha256 "226018701211059f6d731f4ca527025d1db85c70c93ba3c071a4bc4ba5a189b3" => :high_sierra
    sha256 "ae15de530fbd22453643693ce562d1af2c87e7bbb7a197515066afc22601eb53" => :sierra
    sha256 "31dc475569b7560849bc43456a17c7154f27d75d5d5488528acea80b3ea9c0f1" => :el_capitan
  end

  depends_on "python@2" => :build
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"joplin", "config", "editor", "subl"
    assert_match "editor = subl", shell_output("#{bin}/joplin config")
  end
end
