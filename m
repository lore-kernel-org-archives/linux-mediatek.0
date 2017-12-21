From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2] arm: Updates for soc driver for v4.15-next
Date: Thu, 21 Dec 2017 12:48:48 +0100
Message-ID: <5e11ef1f-fe9d-61c6-abe4-44ba4c99e060@gmail.com>
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

Hi Arnd,
Hi Olof,

Please take the following patches into account.

Thanks a lot,
Matthias

---
The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
tags/v4.15-next-soc

for you to fetch changes up to fdac5f4d4857d488fcd77308fec95b44196fdfb1:

  Merge remote-tracking branch 'mainline-kernel/v4.15-next/pdids' into
v4.15-next/soc (2017-12-21 11:49:33 +0100)

----------------------------------------------------------------
- change kconfig entry for armv7 SoCs to be more generic
- add support for mt2701 scpsys driver
  binding documentation
  extend driver to allow the bus protection to overwrite the register

----------------------------------------------------------------
Matthias Brugger (1):
      Merge remote-tracking branch 'mainline-kernel/v4.15-next/pdids' into
v4.15-next/soc

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
