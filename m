Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D167AC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3rrzMFH7/tUDR59ER9pzhIjgnuVdeWlWUoKlSRLdzM=; b=2QC05ivGE190QEbM3E4y3jm59+
	l9OtRaPb6hooU0KAAPFE/L0nOJozufkfRYCLLBT9D+MHF7Awcri92h1Hgpr+9P2LQMKlQLBdluSI/
	DKq2jgXTLF9+alWkpTfaghtiYThmae1dV/CXyQGsmPiQ9enCZ6225u0p8vEMWrnXIsBo2MGXgrpMz
	qO5EMbM2KClBrEquskg+0iwbm2CqVMwjOi3OEu9Yl5+Qh3D/ImI2oBi21SGdP1CG/CTFqkFF7huvA
	+D7nzjtNmupfN33DtZJ54L7893N5B+JO2sJ74hDFPPh4DjwLbYOzo6DEhDC3+7hw6z8X0a0iv8Sa0
	SZNprD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWbE-007Hqb-KE; Thu, 21 Jul 2022 13:52:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWRo-007CKO-Vm; Thu, 21 Jul 2022 13:42:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B9546601AA9;
	Thu, 21 Jul 2022 14:42:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658410953;
	bh=iCe3nCCYP+CXI4lEolJz5G4aPJpz8Pwnh2r8Gx2Y2to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kvdipG7Z82dZH4MIB+y1Wp2W1XRbve5/yn0e4BdYOopiK6MV0Wji3WZsq2twmuZY9
	 WXjHIUwsvYqBmS3jMKBsCTMWnL23keX+8/amwEzogQ6nNU7o0GizYXTeuhHqWE0u/j
	 GOzU2eTWR2asG2urNsY+Gnc8WFjUFg1c5n8dWq2W2C36rw+3fT+1wE10rdRzyhk8uh
	 PvJNNzivXRqkR4ODTtSQsvv0+eloOJN4rYDNYXxcanm3I6WRtFBNTwNuN/jHJymOPW
	 3X/UvG2R5CRAUra5+q7g9UbJ26EZr6rnKgfhFXieid2Et3S22Ypu2l8VwaVd1SkxXO
	 z+g8hdvVcPSWQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/8] arm64: dts: mediatek: cherry: Wire up the ChromeOS EC and GSC
Date: Thu, 21 Jul 2022 15:42:22 +0200
Message-Id: <20220721134228.310178-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
References: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_064237_245467_129F50B2 
X-CRM114-Status: GOOD (  10.74  )
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

Wire up the ChromeOS Embedded Controller on SPI0 and its communication
channel via SCP RPMSG along with all of the offered functionality,
including Keyboard, Smart Battery Metrics (SBS), PWM controller, I2C
tunnel, regulators and Type-C connector management.

While at it, also add support for the Cr50 Google Security Chip (GSC)
found on this platform on I2C3 to support TPM and also use it as an
entropy source for the kernel.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index feebbe367e93..87ac2b4f9814 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -149,6 +149,14 @@ &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
+
+	cr50@50 {
+		compatible = "google,cr50";
+		reg = <0x50>;
+		interrupts-extended = <&pio 88 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cr50_int>;
+	};
 };
 
 &i2c4 {
@@ -426,6 +434,21 @@ &pio {
 		"AP_SPI_FLASH_MOSI",
 		"AP_SPI_FLASH_MISO";
 
+	cr50_int: cr50-irq-default-pins {
+		pins-gsc-ap-int-odl {
+			pinmux = <PINMUX_GPIO88__FUNC_GPIO88>;
+			input-enable;
+		};
+	};
+
+	cros_ec_int: cros-ec-irq-default-pins {
+		pins-ec-ap-int-odl {
+			pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
+		};
+	};
+
 	i2c0_pins: i2c0-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
@@ -669,6 +692,11 @@ &scp {
 	memory-region = <&scp_mem>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
+
+	cros-ec-rpmsg {
+		compatible = "google,cros-ec-rpmsg";
+		mediatek,rpmsg-name = "cros-ec-rpmsg";
+	};
 };
 
 &spi0 {
@@ -677,6 +705,68 @@ &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
 	mediatek,pad-select = <0>;
+
+	cros_ec: ec@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		interrupts-extended = <&pio 4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cros_ec_int>;
+		spi-max-frequency = <3000000>;
+
+		cros_ec_pwm: ec-pwm {
+			compatible = "google,cros-ec-pwm";
+			#pwm-cells = <1>;
+		};
+
+		i2c_tunnel: i2c-tunnel {
+			compatible = "google,cros-ec-i2c-tunnel";
+			google,remote-bus = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mt_pmic_vmc_ldo_reg: regulator@0 {
+			compatible = "google,cros-ec-regulator";
+			reg = <0>;
+			regulator-name = "mt_pmic_vmc_ldo";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		mt_pmic_vmch_ldo_reg: regulator@1 {
+			compatible = "google,cros-ec-regulator";
+			reg = <1>;
+			regulator-name = "mt_pmic_vmch_ldo";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		typec {
+			compatible = "google,cros-ec-typec";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_c0: connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+
+			usb_c1: connector@1 {
+				compatible = "usb-c-connector";
+				reg = <1>;
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+		};
+	};
 };
 
 &u3phy0 {
@@ -728,3 +818,6 @@ &xhci3 {
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
 };
+
+#include <arm/cros-ec-keyboard.dtsi>
+#include <arm/cros-ec-sbs.dtsi>
-- 
2.35.1


