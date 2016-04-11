From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 1/2] mtd: mediatek: device tree docs for MTK Smart Device
 Gen1 NAND
Date: Mon, 11 Apr 2016 12:56:11 -0400
Message-ID: <1460393772-26910-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This patch adds documentation support for Smart Device Gen1 type of
NAND controllers.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/mtk-nand.txt | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
new file mode 100644
index 0000000..ca3cc95
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
@@ -0,0 +1,145 @@
+MTK SoCs NAND FLASH controller (NFC) DT binding
+
+This file documents the device tree bindings for MTK SoCs NAND controllers.
+The functional split of the controller requires two drivers to operate:
+the nand controller interface driver and the ECC engine driver.
+
+The hardware description for both devices must be captured as device
+tree nodes.
+
+1) NFC NAND Controller Interface (NFI):
+=======================================
+
+The first part of NFC is NAND Controller Interface (NFI) HW.
+Required NFI properties:
+- compatible:			Should be "mediatek,mtxxxx-nfc".
+- reg:				Base physical address and size of NFI.
+- interrupts:			Interrupts of NFI.
+- clocks:			NFI required clocks.
+- clock-names:			NFI clocks internal name.
+- status:			Disabled default. Then set "okay" by platform.
+- ecc-engine:			Required ECC Engine node.
+- #address-cells:		NAND chip index, should be 1.
+- #size-cells:			Should be 0.
+
+Example:
+
+	nandc: nfi@1100d000 {
+		compatible = "mediatek,mt2701-nfc";
+		reg = <0 0x1100d000 0 0x1000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI>,
+			 <&pericfg CLK_PERI_NFI_PAD>;
+		clock-names = "nfi_clk", "pad_clk";
+		status = "disabled";
+		ecc-engine = <&bch>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+        };
+
+Platform related properties, should be set in {platform_name}.dts:
+- children nodes:	NAND chips.
+
+Children nodes properties:
+- reg:			Chip Select Signal, default 0.
+			Set as reg = <0>, <1> when need 2 CS.
+- spare_per_sector:	Spare size of each sector.
+- nand-on-flash-bbt:	Store BBT on NAND Flash.
+- nand-ecc-mode:	NAND ecc mode (check driver for supported modes)
+- nand-ecc-strength:	Number of bits to correct per ECC step.
+- nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
+
+Optional:
+- vmch-supply:		NAND power supply.
+- pinctrl-names:	Default NAND pin GPIO setting name.
+- pinctrl-0:		GPIO setting node.
+
+Example:
+	&pio {
+		nand_pins_default: nanddefault {
+			pins_dat {
+				pinmux = <MT2701_PIN_111_MSDC0_DAT7__FUNC_NLD7>,
+					 <MT2701_PIN_112_MSDC0_DAT6__FUNC_NLD6>,
+					 <MT2701_PIN_114_MSDC0_DAT4__FUNC_NLD4>,
+					 <MT2701_PIN_118_MSDC0_DAT3__FUNC_NLD3>,
+					 <MT2701_PIN_121_MSDC0_DAT0__FUNC_NLD0>,
+					 <MT2701_PIN_120_MSDC0_DAT1__FUNC_NLD1>,
+					 <MT2701_PIN_113_MSDC0_DAT5__FUNC_NLD5>,
+					 <MT2701_PIN_115_MSDC0_RSTB__FUNC_NLD8>,
+					 <MT2701_PIN_119_MSDC0_DAT2__FUNC_NLD2>;
+				input-enable;
+				drive-strength = <MTK_DRIVE_8mA>;
+				bias-pull-up;
+			};
+
+			pins_we {
+				pinmux = <MT2701_PIN_117_MSDC0_CLK__FUNC_NWEB>;
+				drive-strength = <MTK_DRIVE_8mA>;
+				bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
+			};
+
+			pins_ale {
+				pinmux = <MT2701_PIN_116_MSDC0_CMD__FUNC_NALE>;
+				drive-strength = <MTK_DRIVE_8mA>;
+				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			};
+		};
+	};
+
+	&nandc {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&nand_pins_default>;
+		nand@0 {
+			reg = <0>;
+			spare_per_sector = <56>;
+			nand-on-flash-bbt;
+			nand-ecc-mode = "hw";
+			nand-ecc-strength = <24>;
+			nand-ecc-step-size = <1024>;
+		};
+	};
+
+NAND chip optional subnodes:
+- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	nand@0 {
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			preloader@0 {
+				label = "pl";
+				read-only;
+				reg = <0x00000000 0x00400000>;
+			};
+			android@0x00400000 {
+				label = "android";
+				reg = <0x00400000 0x12c00000>;
+			};
+		};
+	};
+
+2) ECC Engine:
+==============
+
+Required BCH properties:
+- compatible:	Should be "mediatek,mtxxxx-ecc".
+- reg:		Base physical address and size of ECC.
+- interrupts:	Interrupts of ECC.
+- clocks:	ECC required clocks.
+- clock-names:	ECC clocks internal name.
+- status:	Disabled default. Then set "okay" by platform.
+
+Example:
+
+	bch: ecc@1100e000 {
+		compatible = "mediatek,mt2701-ecc";
+		reg = <0 0x1100e000 0 0x1000>;
+		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI_ECC>;
+		clock-names = "nfiecc_clk";
+		status = "disabled";
+	};
-- 
2.5.0
