From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2] arm64: Updates of aarch64 DTS for v4.15-next
Date: Thu, 21 Dec 2017 12:47:08 +0100
Message-ID: <9bcf1c0b-b60a-fff1-d259-02d791bf561b@gmail.com>
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
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew-sh Cheng <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Anrd, hi Olof,

Please have a look on the following patches.

Thanks a lot,
Matthias

---
The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
tags/v4.15-next-dts64

for you to fetch changes up to ca977a4cae1655d0dac37a9d85455a3a3afe55eb:

  arm64: dts: Add power controller device node of MT2712 (2017-12-21 11:35:18 +0100)

----------------------------------------------------------------
- mt8173 add cpufreq related nodes
  supply nodes
  frequency/voltage operation table

- mt2712 add cpufreq related nodes
  fixed regulator
  supply nodes
  frequency/voltage operation table
- mt2712 add clock contoller nodes
- mt2712 add scpsys node

----------------------------------------------------------------
Andrew-sh Cheng (2):
      arm64: dts: mediatek: add mt8173 cpufreq related device nodes
      arm64: dts: mediatek: add mt2712 cpufreq related device nodes

Matthias Brugger (1):
      Merge remote-tracking branch 'mainline-kernel/v4.15-next/pdids' into
v4.15-next/dts64

weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (3):
      dt-bindings: soc: add MT2712 power dt-bindings
      arm64: dts: mt2712: Add clock controller device nodes
      arm64: dts: Add power controller device node of MT2712

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |   3 +
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |  27 +++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          | 188 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |  18 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  90 ++++++++++
 include/dt-bindings/power/mt2712-power.h           |  26 +++
 6 files changed, 352 insertions(+)
 create mode 100644 include/dt-bindings/power/mt2712-power.h
