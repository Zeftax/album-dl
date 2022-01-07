pkgname="album-dl"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="Downloads a playlist using yt-dlk as mp3s and sets some metadata tags for the whole album"
arch=("x86_64")
depends=("yt-dlp" "ffmpeg")
license=("GPLv2")
source=("album-dl.sh")
sha512sums=("SKIP")
package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/album-dl.sh" "${pkgdir}/usr/bin/album-dl"
  chmod +x "${pkgdir}/usr/bin/album-dl"
}
