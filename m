Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B5EC021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF/xyIBJsITKnnEF4LGKGpnbz+j3jaY/xUkQi/wOWtc=; b=Mx0e7AlywIeS6t7PtuW1CDz7o+
	6/HIj4NkpLCnUVnRAJXoy043FazbW2V1R6HsbgeGpt7xxGZey+jB1P8mzZ4jYNFsGtvxBTv1wqJnP
	JaGMxz42UVsMnt9NqX6hoYw0MjtwixtHTfIx0VKdv2VsumFkAlHmSNL+PG68sqSsvUKp5MUIeiM3q
	+yON3O8gdYD+tiF+PKoeYlA3ZjgyhT4SFPrUrooODsMM7Tt0fy6r0ib8U/wz9VkOYRQVbl0tbaFF+
	6c8QN8thVece0r84QGuuyThy8jYsmOmAeciCrmwSF30HWzCSlSMh0HSwdse1yI0w1DpivjQWNHJOR
	TIzoFeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Vm-00000000TzF-23EV;
	Thu, 20 Feb 2025 11:14:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4RN-00000000Swj-3zPD;
	Thu, 20 Feb 2025 11:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740049800;
	bh=UWiYdpJiJWTrIPlcHGgRIUORgEa3fUZ6eskitJxqZ+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Phtm4uY+5DWEZnSaiyl8WJcqnf9R5dULGvt0nE6OXJx9vsGhtpebVYaDh2hRzWPj8
	 HIzrojSVrv+kJ+ibI4Vo6DzMxSRMT9kQppBYtBIqK38NNaTxc7ffkbDgS3O637Jbw8
	 XXUE651BCEh912Yp/vD9eI0JxKGwzrrvRFS50cKpUm1zxourqWYvuL/YjNw7UNN3mp
	 y95DclHaZKAszyGh3R5zYSXiAVUn3hk0EO0yObf1uokniVp3bmkHxiIs7QW0giT5WI
	 /USdSm8nnK5i5AiuiWhKd42kxQ+0ZalxmyxeUM/Tcwh8vUA9yNH4zKzH++z+6sZHCZ
	 s03wj89AusC/w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8993017E1569;
	Thu, 20 Feb 2025 12:09:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 2/4] arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
Date: Thu, 20 Feb 2025 12:09:46 +0100
Message-ID: <20250220110948.45596-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_031002_333614_7A4AD2C8 
X-CRM114-Status: GOOD (  10.84  )
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

Configure the DSI0 display pipeline and add regulator, pinctrl
and display node to enable the Startek KD070FHFID078 panel found
on the MediaTek Genio 510 and Genio 700 EVKs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8390-genio-common.dtsi     | 145 +++++++++++++++++-
 1 file changed, 137 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 83828baa887b..0191776e037c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -21,6 +21,7 @@
 
 / {
 	aliases {
+		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
@@ -34,6 +35,15 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight_lcm1: backlight-lcm1 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 1023>;
+		default-brightness-level = <576>;
+		num-interpolated-steps = <1023>;
+		power-supply = <&reg_vsys>;
+		pwms = <&disp_pwm1 0 500000>;
+	};
+
 	chosen {
 		stdout-path = "serial0:921600n8";
 	};
@@ -218,6 +228,28 @@ usb_p2_vbus: regulator-9 {
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 	};
+
+	lcm1_iovcc: regulator-vio18-lcm1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vio18_lcm1";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		gpio = <&pio 111 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi0_vreg_en_pins>;
+		vin-supply = <&reg_vsys>;
+	};
+
+	lcm1_vddp: regulator-vsys-lcm1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_lcm1";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&reg_vsys>;
+	};
 };
 
 &adsp {
@@ -230,6 +262,67 @@ &afe {
 	status = "okay";
 };
 
+&disp_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid078", "himax,hx8279";
+		reg = <0>;
+		backlight = <&backlight_lcm1>;
+		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&lcm1_iovcc>;
+		vdd-supply = <&lcm1_vddp>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_default_pins>;
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+};
+
+&disp_pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&disp_pwm1_pins>;
+	status = "okay";
+};
+
+&dither0_in {
+	remote-endpoint = <&postmask0_out>;
+};
+
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&gamma0_out {
+	remote-endpoint = <&postmask0_in>;
+};
+
 &gpu {
 	mali-supply = <&mt6359_vproc2_buck_reg>;
 	status = "okay";
@@ -381,6 +474,10 @@ &mfg1 {
 	domain-supply = <&mt6359_vsram_others_ldo_reg>;
 };
 
+&mipi_tx_config0 {
+	status = "okay";
+};
+
 &mmc0 {
 	status = "okay";
 	pinctrl-names = "default", "state_uhs";
@@ -490,6 +587,10 @@ &mt6359codec {
 	mediatek,mic-type-1 = <3>; /* DCC */
 };
 
+&ovl0_in {
+	remote-endpoint = <&vdosys0_ep_main>;
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins_default>;
@@ -528,6 +629,12 @@ pins-cmd-dat {
 		};
 	};
 
+	disp_pwm1_pins: disp-pwm1-pins {
+		pins-pwm {
+			pinmux = <PINMUX_GPIO30__FUNC_O_DISP_PWM1>;
+		};
+	};
+
 	dptx_pins: dptx-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO46__FUNC_I0_DP_TX_HPD>;
@@ -848,20 +955,22 @@ pins-dat1 {
 		};
 	};
 
-	panel_default_pins: panel-default-pins {
-		pins-dcdc {
-			pinmux = <PINMUX_GPIO45__FUNC_B_GPIO45>;
-			output-low;
-		};
-
-		pins-en {
+	dsi0_vreg_en_pins: dsi0-vreg-en-pins {
+		pins-pwr-en {
 			pinmux = <PINMUX_GPIO111__FUNC_B_GPIO111>;
 			output-low;
 		};
+	};
 
+	panel_default_pins: panel-default-pins {
 		pins-rst {
 			pinmux = <PINMUX_GPIO25__FUNC_B_GPIO25>;
-			output-high;
+			output-low;
+		};
+
+		pins-en {
+			pinmux = <PINMUX_GPIO45__FUNC_B_GPIO45>;
+			output-low;
 		};
 	};
 
@@ -1039,6 +1148,14 @@ power-key {
 	};
 };
 
+&postmask0_in {
+	remote-endpoint = <&gamma0_out>;
+};
+
+&postmask0_out {
+	remote-endpoint = <&dither0_in>;
+};
+
 &scp {
 	memory-region = <&scp_mem>;
 	status = "okay";
@@ -1091,6 +1208,18 @@ &uart2 {
 	status = "okay";
 };
 
+&vdosys0 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys0_ep_main: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&ovl0_in>;
+		};
+	};
+};
+
 &u3phy0 {
 	status = "okay";
 };
-- 
2.48.1


