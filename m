From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL REQUEST] ARM: mediatek: dts updates for v4.3
Date: Tue, 28 Jul 2015 14:08:02 +0200
Message-ID: <CABuKBeJxTrQQ0jUkjr22pJ5o=60Rw+7Z0qOkYefdS1tCMAeBrA@mail.gmail.com>
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
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Cheng Mars <Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please take the following changes into account.

Thanks,
Matthias

---

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.2-next-dts

for you to fetch changes up to 7d4938c14d239768a2e0bdd94457f405e6d35555:

  ARM: dts: mediatek: add mt6580 basic support (2015-07-18 00:22:42 +0200)

----------------------------------------------------------------
- ARM: dts: mediatek: add mt6580 basic support
- Document: DT: Add bindings for mediatek MT6580 SoC Platform
- ARM: dts: mediatek mt8135: Use real UART clocks
- ARM: dts: mt8135-evbp1: Add PMIC support
- ARM: dts: mt8135: Add pmic wrapper nodes
- ARM: dts: mediatek: Enable clock support for Mediatek MT8135.

----------------------------------------------------------------
James Liao (1):
      ARM: dts: mediatek: Enable clock support for Mediatek MT8135.

Mars Cheng (2):
      Document: DT: Add bindings for mediatek MT6580 SoC Platform
      ARM: dts: mediatek: add mt6580 basic support

Sascha Hauer (3):
      ARM: dts: mt8135: Add pmic wrapper nodes
      ARM: dts: mt8135-evbp1: Add PMIC support
      ARM: dts: mediatek mt8135: Use real UART clocks

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 .../bindings/arm/mediatek/mediatek,sysirq.txt      |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   3 +-
 .../bindings/timer/mediatek,mtk-timer.txt          |   6 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/mt6580-evbp1.dts                 |  38 ++++
 arch/arm/boot/dts/mt6580.dtsi                      | 116 +++++++++++++
 arch/arm/boot/dts/mt8135-evbp1.dts                 | 193 +++++++++++++++++++++
 arch/arm/boot/dts/mt8135.dtsi                      |  58 ++++++-
 9 files changed, 411 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
 create mode 100644 arch/arm/boot/dts/mt6580.dtsi
