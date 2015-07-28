From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: arm64 updates for v4.3
Date: Tue, 28 Jul 2015 14:24:29 +0200
Message-ID: <CABuKBeJTfRnJ_+5rLZw3-SWgXpfv+3+UR2jOBhADTbi1Sz1Axg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Koro Chen <koro.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Cheng Mars <Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please take the following changes into account.
In the last mail I screwed up the subject, these patches are naturally for v4.3.

Thanks,
Matthias

---

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.2-next-arm64

for you to fetch changes up to e26945245e414eff42ee1ffeaedf198911bf1d77:

  arm64: dts: mediatek: add mt6795 support (2015-07-23 19:55:55 +0200)

----------------------------------------------------------------
- arm64: dts: mediatek: add mt6795 support
- Document: DT: Add bindings for mediatek MT6795 SoC Platform
- arm64: dts: mediatek: Add MT8173 MMC dts
- arm64: dts: mt8173: Add afe device node
- arm64: dts: mt8173-evb: Add PMIC support
- dts: mt8173-evb: Add da9211 to i2c1
- ARM: dts: mt8173: support arm64 cpuidle-dt
- ARM64: MediaTek MT8173: Add SCPSYS device node
- arm64: dts: mt8173: Add I2C device node
- arm64: dts: mt8173: Add watchdog device node
- arm64: dts: mt8173: Add PMIC wrapper device node
- arm64: dts: mt8173: Use real clock for UARTs
- arm64: dts: mt8173: Add clock controller device nodes

----------------------------------------------------------------
Eddie Huang (4):
      arm64: dts: mt8173: Add watchdog device node
      arm64: dts: mt8173: Add I2C device node
      arm64: dts: mt8173-evb: Add PMIC support
      arm64: dts: mediatek: Add MT8173 MMC dts

Henry Chen (1):
      dts: mt8173-evb: Add da9211 to i2c1

Howard Chen (1):
      ARM: dts: mt8173: support arm64 cpuidle-dt

Koro Chen (1):
      arm64: dts: mt8173: Add afe device node

Mars Cheng (2):
      Document: DT: Add bindings for mediatek MT6795 SoC Platform
      arm64: dts: mediatek: add mt6795 support

Sascha Hauer (4):
      arm64: dts: mt8173: Add clock controller device nodes
      arm64: dts: mt8173: Use real clock for UARTs
      arm64: dts: mt8173: Add PMIC wrapper device node
      ARM64: MediaTek MT8173: Add SCPSYS device node

 Documentation/devicetree/bindings/arm/mediatek.txt |   9 +-
 .../bindings/arm/mediatek/mediatek,sysirq.txt      |   3 +-
 .../devicetree/bindings/serial/mtk-uart.txt        |   5 +-
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt6795-evb.dts        |  41 +++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 162 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        | 353 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 327 ++++++++++++++++++-
 8 files changed, 883 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795.dtsi
