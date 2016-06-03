From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v15] arm64: dts: mt8173: Add display subsystem related nodes
Date: Fri,  3 Jun 2016 16:59:29 +0200
Message-ID: <1464965969-5243-1-git-send-email-p.zabel@pengutronix.de>
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
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This patch adds the device nodes for the DISP function blocks
comprising the display subsystem.

Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since v14:
 - Rebased onto v4.7-rc1
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 223 +++++++++++++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 05f89c4..78529e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -26,6 +26,23 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl0 = &ovl0;
+		ovl1 = &ovl1;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		rdma2 = &rdma2;
+		wdma0 = &wdma0;
+		wdma1 = &wdma1;
+		color0 = &color0;
+		color1 = &color1;
+		split0 = &split0;
+		split1 = &split1;
+		dpi0 = &dpi0;
+		dsi0 = &dsi0;
+		dsi1 = &dsi1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -343,6 +360,26 @@
 			#clock-cells = <1>;
 		};
 
+		mipi_tx0: mipi-dphy@10215000 {
+			compatible = "mediatek,mt8173-mipi-tx";
+			reg = <0 0x10215000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		mipi_tx1: mipi-dphy@10216000 {
+			compatible = "mediatek,mt8173-mipi-tx";
+			reg = <0 0x10216000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx1_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@10220000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -652,9 +689,181 @@
 		mmsys: clock-controller@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			#clock-cells = <1>;
 		};
 
+		ovl0: ovl@1400c000 {
+			compatible = "mediatek,mt8173-disp-ovl";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl1: ovl@1400d000 {
+			compatible = "mediatek,mt8173-disp-ovl";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1>;
+			iommus = <&iommu M4U_PORT_DISP_OVL1>;
+			mediatek,larb = <&larb4>;
+		};
+
+		rdma0: rdma@1400e000 {
+			compatible = "mediatek,mt8173-disp-rdma";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		rdma1: rdma@1400f000 {
+			compatible = "mediatek,mt8173-disp-rdma";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,larb = <&larb4>;
+		};
+
+		rdma2: rdma@14010000 {
+			compatible = "mediatek,mt8173-disp-rdma";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
+			mediatek,larb = <&larb4>;
+		};
+
+		wdma0: wdma@14011000 {
+			compatible = "mediatek,mt8173-disp-wdma";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		wdma1: wdma@14012000 {
+			compatible = "mediatek,mt8173-disp-wdma";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
+			mediatek,larb = <&larb4>;
+		};
+
+		color0: color@14013000 {
+			compatible = "mediatek,mt8173-disp-color";
+			reg = <0 0x14013000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+		};
+
+		color1: color@14014000 {
+			compatible = "mediatek,mt8173-disp-color";
+			reg = <0 0x14014000 0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
+		};
+
+		aal@14015000 {
+			compatible = "mediatek,mt8173-disp-aal";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+		};
+
+		gamma@14016000 {
+			compatible = "mediatek,mt8173-disp-gamma";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+		};
+
+		merge@14017000 {
+			compatible = "mediatek,mt8173-disp-merge";
+			reg = <0 0x14017000 0 0x1000>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_MERGE>;
+		};
+
+		split0: split@14018000 {
+			compatible = "mediatek,mt8173-disp-split";
+			reg = <0 0x14018000 0 0x1000>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+		};
+
+		split1: split@14019000 {
+			compatible = "mediatek,mt8173-disp-split";
+			reg = <0 0x14019000 0 0x1000>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_SPLIT1>;
+		};
+
+		ufoe@1401a000 {
+			compatible = "mediatek,mt8173-disp-ufoe";
+			reg = <0 0x1401a000 0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_UFOE>;
+		};
+
+		dsi0: dsi@1401b000 {
+			compatible = "mediatek,mt8173-dsi";
+			reg = <0 0x1401b000 0 0x1000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI0_ENGINE>,
+				 <&mmsys CLK_MM_DSI0_DIGITAL>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		dsi1: dsi@1401c000 {
+			compatible = "mediatek,mt8173-dsi";
+			reg = <0 0x1401c000 0 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI1_ENGINE>,
+				 <&mmsys CLK_MM_DSI1_DIGITAL>,
+				 <&mipi_tx1>;
+			clock-names = "engine", "digital", "hs";
+			phy = <&mipi_tx1>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		dpi0: dpi@1401d000 {
+			compatible = "mediatek,mt8173-dpi";
+			reg = <0 0x1401d000 0 0x1000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DPI_PIXEL>,
+				 <&mmsys CLK_MM_DPI_ENGINE>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+			status = "disabled";
+		};
+
 		pwm0: pwm@1401e000 {
 			compatible = "mediatek,mt8173-disp-pwm",
 				     "mediatek,mt6595-disp-pwm";
@@ -677,6 +886,14 @@
 			status = "disabled";
 		};
 
+		mutex: mutex@14020000 {
+			compatible = "mediatek,mt8173-disp-mutex";
+			reg = <0 0x14020000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MUTEX_32K>;
+		};
+
 		larb0: larb@14021000 {
 			compatible = "mediatek,mt8173-smi-larb";
 			reg = <0 0x14021000 0 0x1000>;
@@ -696,6 +913,12 @@
 			clock-names = "apb", "smi";
 		};
 
+		od@14023000 {
+			compatible = "mediatek,mt8173-disp-od";
+			reg = <0 0x14023000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OD>;
+		};
+
 		larb4: larb@14027000 {
 			compatible = "mediatek,mt8173-smi-larb";
 			reg = <0 0x14027000 0 0x1000>;
-- 
2.8.1
