From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: dts updates for v4.6
Date: Mon, 22 Feb 2016 13:47:24 +0100
Message-ID: <CABuKBe+vk0E6-8ni5bHtyn6X3EbLoOxfjw0zqPRE_tLdp0AAXQ@mail.gmail.com>
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
Cc: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Louis Yu <louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please pull the following patches.

Thanks,
Matthias

---

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.5-next-dts

for you to fetch changes up to 8ba671efdbe5be3e5d691a8b7f77b0d68459b874:

  arm: dts: Add pinctrl/GPIO/EINT node for mt2701 (2016-02-11 11:39:56 +0100)

----------------------------------------------------------------
Add support for mt7623 SoC.
Enable SMP support for mt7623.
Enable SMP support for mt2701
Add pinctrl for mt2701

----------------------------------------------------------------
Biao Huang (1):
      arm: dts: Add pinctrl/GPIO/EINT node for mt2701

John Crispin (3):
      Document: DT: Add bindings for mediatek MT7623 SoC Platform
      ARM: dts: mediatek: add MT7623 basic support
      ARM: dts: mt7623: enable SMP bringup

Louis Yu (1):
      ARM: dts: mt2701: enable basic SMP bringup for mt2701

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt          |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/mt2701.dtsi                      |  31 +++++
 arch/arm/boot/dts/mt7623-evb.dts                   |  33 +++++
 arch/arm/boot/dts/mt7623.dtsi                      | 147 +++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 9 files changed, 223 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt7623-evb.dts
 create mode 100644 arch/arm/boot/dts/mt7623.dtsi
