From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] arm: Updates of soc drivers for v4.15-next
Date: Wed, 20 Dec 2017 20:16:37 +0100
Message-ID: <7044d4f3-1e0b-3485-0963-170a792ff4f2@gmail.com>
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
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please take the following patches into account.

Thanks,
Matthias

---
The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
tags/v4.15-next-soc

for you to fetch changes up to 579c60686a086f250c82c76778eb1839394e54ef:

  soc: mediatek: add MT2712 scpsys support (2017-12-20 18:30:29 +0100)

----------------------------------------------------------------
- change kconfig entry for armv7 SoCs to be more generic
- add support for mt2701 scpsys driver
  binding documentation
  extend driver to allow the bus protection to overwrite the register

----------------------------------------------------------------
Sean Wang (1):
      ARM: mediatek: use more generic prompts for SoCs with ARMv7

weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (4):
      dt-bindings: soc: add MT2712 power dt-bindings
      soc: mediatek: extend bus protection API
      soc: mediatek: add dependent clock jpgdec/audio for scpsys
      soc: mediatek: add MT2712 scpsys support

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |   3 +
 arch/arm/mach-mediatek/Kconfig                     |   2 +-
 drivers/soc/mediatek/mtk-infracfg.c                |  26 +++-
 drivers/soc/mediatek/mtk-scpsys.c                  | 140 ++++++++++++++++++---
 include/dt-bindings/power/mt2712-power.h           |  26 ++++
 include/linux/soc/mediatek/infracfg.h              |   7 +-
 6 files changed, 181 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/power/mt2712-power.h
