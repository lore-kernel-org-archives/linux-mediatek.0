From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] ARM64: dts: Mediatek: mt8173-evb: fix MMC,
 add to USB power domain
Date: Tue, 21 Jul 2015 08:55:25 +0200
Message-ID: <1437461725-12364-1-git-send-email-s.hauer@pengutronix.de>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

The MT8173 E1 chip has a silicon bug which breaks MMC when the USB
power domain is disabled. The E1 chip is only found on the MT8173-evb
board and this board only has the E1 chip, so we can implement this
as a board specific workaround. This patch adds the MMC ports to the
USB power domain to enable the domain whenever MMC is active. Since
people tend to copy-paste add a comment so hopefully people will drop
this line for other boards.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---

This fixes MMC support in conjunction with the SCPSYS power domain driver
currently sitting in Matthias' tree, so this is best fitted in Matthias'
v4.2-next/arm64 branch

 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 459ce6d..1c9dd84 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -317,6 +317,8 @@
 	cap-mmc-highspeed;
 	vmmc-supply = <&mt6397_vemc_3v3_reg>;
 	non-removable;
+	/* Only MT8173 E1 needs USB power domain enabled for MMC */
+	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
 };
 
 &mmc1 {
@@ -331,6 +333,8 @@
 	cd-gpios = <&pio 132 0>;
 	vmmc-supply = <&mt6397_vmch_reg>;
 	vqmmc-supply = <&mt6397_vmc_reg>;
+	/* Only MT8173 E1 needs USB power domain enabled for MMC */
+	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
 };
 
 &pio {
-- 
2.1.4
