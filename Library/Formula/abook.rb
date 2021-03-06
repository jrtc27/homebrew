class Abook < Formula
  desc "Address book with mutt support"
  homepage "http://abook.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/abook/abook/0.5.6/abook-0.5.6.tar.gz"
  sha256 "0646f6311a94ad3341812a4de12a5a940a7a44d5cb6e9da5b0930aae9f44756e"
  head "git://git.code.sf.net/p/abook/git"

  bottle do
    sha256 "3aeddea7c0bb71c664a2df2d8974df26d156f25f5a2ff993060396f0af22b574" => :yosemite
    sha256 "87ee3c353da4421ac95d43dcf6581a8ee60f9c8b6c2a1821b498dabbab60942e" => :mavericks
    sha256 "882983ecabf61b120b50eb313c698bc85806d95dd8712375f64decd2f2ebce59" => :mountain_lion
  end

  devel do
    url "http://abook.sourceforge.net/devel/abook-0.6.0pre2.tar.gz"
    sha256 "59d444504109dd96816e003b3023175981ae179af479349c34fa70bc12f6d385"
    version "0.6.0pre2"

    # Remove `inline` from function implementation for clang compatibility
    patch :DATA
  end

  depends_on "readline"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{bin}/abook", "--formats"
  end
end

__END__
diff --git a/database.c b/database.c
index 7c47ab6..53bdb9f 100644
--- a/database.c
+++ b/database.c
@@ -762,7 +762,7 @@ item_duplicate(list_item dest, list_item src)
  */
 
 /* quick lookup by "standard" field number */
-inline int
+int
 field_id(int i)
 {
 	assert((i >= 0) && (i < ITEM_FIELDS));
