Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E92C47DA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+sHRA/CQ30vrfTV1PsgecbYDFUDnAzvfSGuMILpWE0=; b=lX7FLa2bTswbJnca1zynNJ3ABQ
	2XQH7Yy8RVrjYGHn/nucn7hEY6hVEuVDbszODQe4mMrv61gBtUzsJ3nwGdEkbFBGH2GIrYR4Eg+nP
	9HiYlBDEoGf9QIdyDo+2zZvN6eUtWGv+NuJ8+/3iD1Kthaj+8KjCkpNjtPojHkYan+a6ngzTBTaww
	zS2d+vF/ZxUKWlNsH0GS9womdSKoqsnyEg0y6Mf0sofoCjByZoOjTGOA7udEvvWee/coBLjMACYQF
	P6ISG0H7BwQVcy9AqyK4gLaWz1v9Z9R9dDfX+e6T5d+W1m2McDfNjJTcPnoOca7pCyTAmHJDpIxx8
	4pLVCj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7u-002NJU-1p;
	Fri, 12 Jan 2024 09:46:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7h-002N7d-04;
	Fri, 12 Jan 2024 09:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052803;
	bh=vVV7secnJj63oz5uInWOkRetftEKYjRoVqiH5bnBvmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzQERIlOBwgJa7CAAHFtx6d0Ks7iziy2V44abe4pc5HlNc01vAA8EKk1AJQRIUyJz
	 ZXA4IOrZxwFvxH8Uy154FDyA+ujQRc0Ez6RvbDI7LvMHRALHo9fpiTColgBDmFRFZz
	 wY4yONFYvn9huTwS2RPQYq2y/gCyoV8Oad85xE80V57dqwiDZQg4VpEmAV70jjWGTf
	 6sGGRnvnOCKgZFZP3QO7FcbL3rhILa6ubNnwNyQlQhijcLye5R6jq+KXWX83EDbpzM
	 fGlBWkXv2h+10cVsh2ZvuJo9u/jkmEiWGgEfWNcr19KyDuTAibTMbQuqM7UqbaTuuE
	 hCXZr4AwbJpYQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C519E3782021;
	Fri, 12 Jan 2024 09:46:42 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 05/15] arm64: dts: mediatek: radxa-nio-12l: Configure board regulators
Date: Fri, 12 Jan 2024 10:46:22 +0100
Message-ID: <20240112094632.66310-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014645_197564_5651D0A7 
X-CRM114-Status: GOOD (  10.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the entire power tree, which also includes all of the voltage
regulators found on all of the PMICs and fixed vregs on this board.
While at it, also add the two MT6315 PMICs over SPMI, providing
CPU-Big and GPU power rails.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 228 ++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 281847b8f022..0daf27410311 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -8,8 +8,12 @@
  */
 
 #include "mt8195.dtsi"
+#include "mt6359.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	model = "Radxa NIO 12L";
@@ -36,6 +40,48 @@ memory@40000000 {
 		reg = <0 0x40000000 0x1 0x0>;
 	};
 
+	wifi_vreg: regulator-wifi-3v3-en {
+		compatible = "regulator-fixed";
+		regulator-name = "wifi_3v3_en";
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pio 67 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_vreg_pins>;
+		vin-supply = <&vsys>;
+	};
+
+	/* system wide switching 5.0V power rail */
+	vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_vsys>;
+	};
+
+	vsys_buck: regulator-vsys-buck {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_buck";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_vsys>;
+	};
+
+	/* Rail from power-only "TYPE C DC" port */
+	vcc5v0_vsys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -118,9 +164,138 @@ mt6360: pmic@34 {
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		pinctrl-0 = <&mt6360_pins>;
+
+		regulator {
+			compatible = "mediatek,mt6360-regulator";
+			LDO_VIN1-supply = <&vsys_buck>;
+			LDO_VIN3-supply = <&mt6360_buck2>;
+
+			mt6360_buck1: buck1 {
+				regulator-name = "emi_vdd2";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP
+							   MT6360_OPMODE_ULP>;
+				regulator-always-on;
+			};
+
+			mt6360_buck2: buck2 {
+				regulator-name = "emi_vddq";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP
+							   MT6360_OPMODE_ULP>;
+				regulator-always-on;
+			};
+
+			mt6360_ldo1: ldo1 {
+				regulator-name = "ext_lcd_3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+				regulator-always-on;
+			};
+
+			mt6360_ldo2: ldo2 {
+				regulator-name = "panel1_p1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo3: ldo3 {
+				regulator-name = "vmc_pmu";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo5: ldo5 {
+				regulator-name = "vmch_pmu";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+				regulator-always-on;
+			};
+
+			mt6360_ldo6: ldo6 {
+				regulator-name = "mt6360_ldo6"; /* Test point */
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo7: ldo7 {
+				regulator-name = "emi_vmddr_en";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+				regulator-always-on;
+			};
+		};
 	};
 };
 
+&mt6359_vaud18_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vbbck_ldo_reg {
+	regulator-always-on;
+};
+
+/* For USB Hub */
+&mt6359_vcamio_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vcn33_2_bt_ldo_reg {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&mt6359_vcore_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vgpu11_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vproc1_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vproc2_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vpu_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vrf12_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vsram_md_ldo_reg {
+	regulator-always-on;
+};
+
+/* for GPU SRAM */
+&mt6359_vsram_others_ldo_reg {
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <750000>;
+};
+
 &pio {
 	i2c2_pins: i2c2-pins {
 		pins-bus {
@@ -164,6 +339,59 @@ pins-bus {
 				 <PINMUX_GPIO99__FUNC_URXD0>;
 		};
 	};
+
+	wifi_vreg_pins: wifi-vreg-pins {
+		pins-wifi-pmu-en {
+			pinmux = <PINMUX_GPIO65__FUNC_GPIO65>;
+			output-high;
+		};
+
+		pins-wifi-vreg-en {
+			pinmux = <PINMUX_GPIO67__FUNC_GPIO67>;
+		};
+	};
+};
+
+&pmic {
+	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spmi {
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	mt6315_6: pmic@6 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		regulators {
+			mt6315_6_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vbcpu";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	mt6315_7: pmic@7 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x7 SPMI_USID>;
+
+		regulators {
+			mt6315_7_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vgpu";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+		};
+	};
 };
 
 &uart0 {
-- 
2.43.0


