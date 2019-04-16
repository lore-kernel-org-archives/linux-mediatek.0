From: <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] arm64: dts: mt8183: add efuse and Mediatek Chip id node
 to read
Date: Tue, 16 Apr 2019 16:19:21 +0800
Message-ID: <20190416081922.21711-4-michael.mei@mediatek.com>
References: <20190416081922.21711-1-michael.mei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190416081922.21711-1-michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: orz811017-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

support for reading chip ID and efuse

Signed-off-by: Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
This patch is based on v5.1-rc1 and these patches:

https://patchwork.kernel.org/patch/10856987/
https://patchwork.kernel.org/patch/10839021/
https://patchwork.kernel.org/patch/10879015/
https://patchwork.kernel.org/patch/10878999/
https://patchwork.kernel.org/patch/10858941/
https://patchwork.kernel.org/patch/10846685/
https://patchwork.kernel.org/patch/10893519
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index b36e37fcdfe3..405cd7e2ca4b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -148,6 +148,15 @@
 		compatible = "simple-bus";
 		ranges;
 
+		soc_data: soc_data@08000000 {
+			compatible = "mediatek,mt8183-efuse",
+				     "mediatek,efuse";
+			reg = <0 0x08000000 0 0x0010>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <4>;
@@ -353,6 +362,12 @@
 			status = "disabled";
 		};
 
+		efuse: efuse@11f10000 {
+			compatible = "mediatek,mt8183-efuse",
+				     "mediatek,efuse";
+			reg = <0 0x11f10000 0 0x1000>;
+		};
+
 		mfgcfg: syscon@13000000 {
 			compatible = "mediatek,mt8183-mfgcfg", "syscon";
 			reg = <0 0x13000000 0 0x1000>;
-- 
2.18.0
