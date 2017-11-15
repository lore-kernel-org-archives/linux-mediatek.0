From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 15/16] arm64: dts: mt8173: add GPU device
Date: Wed, 15 Nov 2017 16:24:22 +0100
Message-ID: <1510759463-30201-16-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index f454efa33..43775a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -279,6 +279,11 @@
 					cooling-device = <&cpu2 0 0>;
 					contribution = <1024>;
 				};
+				map@2 {
+					trip = <&target>;
+					cooling-device = <&gpu 0 0>;
+					contribution = <2048>;
+				};
 			};
 		};
 	};
@@ -884,6 +889,42 @@
 			};
 		};
 
+		mfgsys: mfgsys@13fff000 {
+			compatible = "mediatek,mt8173-mfgsys", "syscon";
+			reg = <0 0x13fff000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		gpu: mfgsys-gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu";
+			reg = <0 0x13000000 0 0xffff>, <0 0x13fff000 0 0x1000>;
+			power-domains =	<&scpsys MT8173_POWER_DOMAIN_MFG_ASYNC>,
+					<&scpsys MT8173_POWER_DOMAIN_MFG_2D>,
+					<&scpsys MT8173_POWER_DOMAIN_MFG>;
+			clocks = <&apmixedsys CLK_APMIXED_MMPLL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_AXI_SEL>,
+				 <&topckgen CLK_TOP_MEM_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&topckgen CLK_TOP_MMPLL>,
+				 <&clk26m>;
+			clock-names = "mmpll_clk",
+				      "mfg_mem_in_sel",
+				      "mfg_axi_in_sel",
+				      "top_axi",
+				      "top_mem",
+				      "top_mfg",
+				      "top_mmpll",
+				      "clk26m";
+			interrupts = <0 217 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "RGX";
+			status = "disabled";
+			#cooling-cells = <2>;
+			#cooling-min-level = <0>;
+			#cooling-max-level = <3>;
+		};
+
 		mmsys: clock-controller@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.7.4
