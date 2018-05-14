From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: dts64 updates for v4.18
Date: Mon, 14 May 2018 13:28:16 +0200
Message-ID: <e36e9a49-4913-25a8-16a9-31c1fbbfddc9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi you two,

Please take into account the following commit to 64-bit DTS.

Thanks a lot,
Matthias

---

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.17-next-dts64

for you to fetch changes up to f1e0d0d8cf454202d21140aace184cc5512a9fdd:

  arm64: dts: mt7622: add audio related device nodes (2018-05-11 18:42:20 +0200)

----------------------------------------------------------------
- add clock and pinctrl nodes for mt2712e
- add High-Speed DMA and audio nodes for mt7622

----------------------------------------------------------------
Ryder Lee (1):
      arm64: dts: mt7622: add audio related device nodes

Sean Wang (1):
      arm64: dts: mt7622: add High-Speed DMA device nodes

Zhiyong Tao (2):
      arm64: dts: mt2712: add pintcrl file
      arm64: dts: mt2712: add pintcrl device node.

weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (1):
      arm64: dts: add clock device nodes of MT2712

 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h | 1123 +++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   46 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   11 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   99 +++
 4 files changed, 1277 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
