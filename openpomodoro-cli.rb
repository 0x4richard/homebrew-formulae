class OpenpomodoroCli < Formula
  desc "A command-line Pomodoro tracker which uses the Open Pomodoro Format"
  homepage ""
  url "https://github.com/open-pomodoro/openpomodoro-cli/releases/download/v0.3.0/openpomodoro-cli_0.3.0_darwin_amd64.tar.gz"
  sha256 "9be3b538d54a7828c8f99aa214414f4e6e178e46d4707c6bbdfa421c07bfc161"
  license "MIT"

  depends_on "cmake"
  depends_on "git"
  depends_on "go"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "go" "get" "-u" "github.com/open-pomodoro/openpomodoro-cli/cmd/pomodoro"
    bin.install "openpomodoroCli"
  end

  test do
    system "{bin}/pomodoro" "status" 
  end
end
