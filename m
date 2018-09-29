From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: arm64 dts updates for v4.20
Date: Sat, 29 Sep 2018 17:20:22 +0200
Message-ID: <5b05e2ed-a909-dbb5-2b95-f1cab0ecc5c8@gmail.com>
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
Cc: Leilk Liu <leilk.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,
Hi Olof,

Please take the following commit into accout for v4.20

Thanks a lot,
Matthias

---

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.19-next-dts64

for you to fetch changes up to 3c2ac5b3ebcd387f5399c7888fae7279a65c606a:

  arm64: dts: Add spi slave dts (2018-09-28 23:05:26 +0200)

----------------------------------------------------------------
mt2712 - add spi slave node

mt7622:
- add timer node
- add CCI node
- add PMU node
- add bluetooth node
- add SPI slave node
- fix reference board (rfb1) memory and sort node alphabetically
- add support for Bananapi-R64

----------------------------------------------------------------
Leilk Liu (1):
      arm64: dts: Add spi slave dts

Ryder Lee (4):
      arm64: dts: mt7622: add timer, CCI-400 and PMU nodes
      arm64: dts: mt7622: add a bluetooth 5 device node
      arm64: dts: mt7622: fix ram size for rfb1
      arm64: dts: mt7622: add bananapi BPI-R64 board

 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |  11 +
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 530 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       | 196 ++++----
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |  62 +++
 5 files changed, 702 insertions(+), 98 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
