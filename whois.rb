require 'formula'

class Whois < Formula
  homepage 'http://packages.debian.org/sid/whois'
  url 'http://ftp.us.debian.org/debian/pool/main/w/whois/whois_5.1.3.tar.xz'
  sha1 'b730d36359b1d7d0767414da45c2e437697949f0'

  depends_on 'xz' => :build

  def install
    system "make HAVE_ICONV=1 whois_LDADD+=-liconv whois"
    bin.install "whois"
    man1.install "whois.1"
  end

  def caveats; <<-EOS.undent
    Debian whois has been installed as `whois` and may shadow the
    system binary of the same name.
    EOS
  end

  test do
    system "#{bin}/whois"
  end
end
