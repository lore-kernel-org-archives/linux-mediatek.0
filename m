From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ARM: mediatek: dts 64 bit updates for v4.8
Date: Sun, 3 Jul 2016 08:47:19 +0200
Message-ID: <8e60cf93-062d-368a-f2e0-58c747bb34ca@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
Cc: CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please merge the following updates for arm64 device tree branch.

Thanks,
Matthias

---

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

   https://github.com/mbgg/linux-mediatek.git tags/v4.7-next-dts

for you to fetch changes up to aea1c315b6395920bbeb69804e0355e57c67e086:

   arm64: dts: mediatek: add mt6755 support (2016-07-03 07:57:21 +0200)

----------------------------------------------------------------
- Add nodes for the DISP function ports
- Add dt-bindings for mt6755
- Add basic support for mt6755 SoC

----------------------------------------------------------------
CK Hu (1):
       arm64: dts: mt8173: Add display subsystem related nodes

Mars Cheng (2):
       Document: DT: Add bindings for mediatek MT6755 SoC Platform
       arm64: dts: mediatek: add mt6755 support

  Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
  .../interrupt-controller/mediatek,sysirq.txt       |   1 +
  .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
  arch/arm64/boot/dts/mediatek/mt6755-evb.dts        |  38 ++++
  arch/arm64/boot/dts/mediatek/mt6755.dtsi           | 145 ++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 223 
+++++++++++++++++++++
  7 files changed, 413 insertions(+)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi
