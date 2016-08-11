From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v17 1/2] arm64: dts: mt8173: Add HDMI related nodes
Date: Thu, 11 Aug 2016 11:59:59 +0200
Message-ID: <1470909600-7177-1-git-send-email-p.zabel@pengutronix.de>
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

This patch adds the device nodes for the HDMI encoder, HDMI PHY,
and HDMI CEC modules.

Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
This patch didn't make it into v4.8-rc1.

Changes since v16:
 - Rebased onto v4.8-rc1
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 77 ++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 10f638f..1c71e25 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -254,6 +254,16 @@
 				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 
+			hdmi_pin: xxx {
+
+				/*hdmi htplg pin*/
+				pins1 {
+					pinmux = <MT8173_PIN_21_HTPLG__FUNC_HTPLG>;
+					input-enable;
+					bias-pull-down;
+				};
+			};
+
 			i2c0_pins_a: i2c0 {
 				pins1 {
 					pinmux = <MT8173_PIN_45_SDA0__FUNC_SDA0>,
@@ -341,6 +351,14 @@
 			clock-names = "spi", "wrap";
 		};
 
+		cec: cec@10013000 {
+			compatible = "mediatek,mt8173-cec";
+			reg = <0 0x10013000 0 0xbc>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_CEC>;
+			status = "disabled";
+		};
+
 		vpu: vpu@10020000 {
 			compatible = "mediatek,mt8173-vpu";
 			reg = <0 0x10020000 0 0x30000>,
@@ -383,6 +401,19 @@
 			#clock-cells = <1>;
 		};
 
+		hdmi_phy: hdmi-phy@10209100 {
+			compatible = "mediatek,mt8173-hdmi-phy";
+			reg = <0 0x10209100 0 0x24>;
+			clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+			clock-names = "pll_ref";
+			clock-output-names = "hdmitx_dig_cts";
+			mediatek,ibias = <0xa>;
+			mediatek,ibias_up = <0x1c>;
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		mipi_tx0: mipi-dphy@10215000 {
 			compatible = "mediatek,mt8173-mipi-tx";
 			reg = <0 0x10215000 0 0x1000>;
@@ -577,6 +608,14 @@
 			status = "disabled";
 		};
 
+		hdmiddc0: i2c@11012000 {
+			compatible = "mediatek,mt8173-hdmi-ddc";
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+			reg = <0 0x11012000 0 0x1C>;
+			clocks = <&pericfg CLK_PERI_I2C5>;
+			clock-names = "ddc-i2c";
+		};
+
 		i2c6: i2c@11013000 {
 			compatible = "mediatek,mt8173-i2c";
 			reg = <0 0x11013000 0 0x70>,
@@ -885,6 +924,12 @@
 				 <&apmixedsys CLK_APMIXED_TVDPLL>;
 			clock-names = "pixel", "engine", "pll";
 			status = "disabled";
+
+			port {
+				dpi0_out: endpoint {
+					remote-endpoint = <&hdmi0_in>;
+				};
+			};
 		};
 
 		pwm0: pwm@1401e000 {
@@ -942,6 +987,38 @@
 			clocks = <&mmsys CLK_MM_DISP_OD>;
 		};
 
+		hdmi0: hdmi@14025000 {
+			compatible = "mediatek,mt8173-hdmi";
+			reg = <0 0x14025000 0 0x400>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
+				 <&mmsys CLK_MM_HDMI_PLLCK>,
+				 <&mmsys CLK_MM_HDMI_AUDIO>,
+				 <&mmsys CLK_MM_HDMI_SPDIF>;
+			clock-names = "pixel", "pll", "bclk", "spdif";
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdmi_pin>;
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi";
+			mediatek,syscon-hdmi = <&mmsys 0x900>;
+			assigned-clocks = <&topckgen CLK_TOP_HDMI_SEL>;
+			assigned-clock-parents = <&hdmi_phy>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					hdmi0_in: endpoint {
+						remote-endpoint = <&dpi0_out>;
+					};
+				};
+			};
+		};
+
 		larb4: larb@14027000 {
 			compatible = "mediatek,mt8173-smi-larb";
 			reg = <0 0x14027000 0 0x1000>;
-- 
2.8.1
