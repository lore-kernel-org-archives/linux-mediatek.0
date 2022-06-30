Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07871C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeEtVGru+oCixivJQ3DUF1ie0h/2qhrDPIpsYCRFUzw=; b=aEBb/poG/f/NX4WHxvWrGXPYLM
	a0ItZMT5PeT3Bx8pxyeMaMunHoJObNoPvEp08IxTvvlyHaAVPWwAfKIpAD1SB3zArlw3uhwMn5aYI
	eWVdOTYqWe3RbcmBKq2L4Xf9PhIXCmrnz9IIFJpp9Bsm74CdHhw50j5zUpnxB9bl9YOxWWIXvoQVa
	gOfNrrv+8onsB3pPS/tUlMgCe6H3F+A5NGlLa/0Af8Lw8RLehNBNCUCnTUsvlWU1LKNUqQNNXUMst
	d5wZmA3s5YVfgv6OmDs/yEvEzwfu8IylESXyE9zXI0+9jvlqiu3adPAfTAAh8A0D8CFZ9tAGf5LPn
	jQsnlQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wEl-000Kk9-Vs; Thu, 30 Jun 2022 15:37:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAd-000IXv-Ma; Thu, 30 Jun 2022 15:33:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B81E16601973;
	Thu, 30 Jun 2022 16:33:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603210;
	bh=Yu1ylTS6SF8MH4BwKjAHfrYNfUvsmb2vIoFkPyc5v00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U3Wu68ITixchJo0cENfYR9UeUrhxotEz0FR5oaFMPze40emxZOFfYB1OTVNXfNqEo
	 7mp54uiTKLrRVWcLPbNM77ZKn4wpkUusSMZc46cZLPpHm8krJgl7pLXMg99kdd2sC0
	 yhk/aaqDlsz/8D/t4hIwc7yhw4/zZItLMF26RYz3QzDH4f1lxd8JR9DkHJQp5drxaL
	 7ZD3rfIV42KWj/XsAcewUOs76yMPH+IZpk3t3RZFbexmdd+Lk9zR5QnIGTUpFJlADJ
	 bw4yizKFg3vLrVOOZbiWmmZyojwfiMeEFCYn+G9VXKH06QKckpT9TlongdQy4Wbl+k
	 eyPU7RpymvwEw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 07/11] arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
Date: Thu, 30 Jun 2022 17:33:12 +0200
Message-Id: <20220630153316.308767-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083332_080884_ED586DAF 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

This platform uses eight I2C controllers and one SPI controller:
in preparation for enabling devices attached to these controllers,
add basic configuration to enable the busses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2f70341bba91..23a86d07274c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -9,6 +9,13 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c7 = &i2c7;
 		mmc0 = &mmc0;
 		serial0 = &uart0;
 	};
@@ -88,6 +95,65 @@ ppvar_sys: regulator-ppvar-sys {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pin>;
+};
+
+&i2c1 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	i2c-scl-internal-delay-ns = <12500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pin>;
+};
+
+&i2c2 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pin>;
+};
+
+&i2c3 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pin>;
+};
+
+&i2c4 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pin>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pin>;
+};
+
+&i2c7 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c7_pin>;
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -300,6 +366,68 @@ &pio {
 		"AP_SPI_FLASH_MOSI",
 		"AP_SPI_FLASH_MISO";
 
+	i2c0_pin: i2c0-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
+				 <PINMUX_GPIO9__FUNC_SCL0>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c1_pin: i2c1-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO10__FUNC_SDA1>,
+				 <PINMUX_GPIO11__FUNC_SCL1>;
+			bias-pull-up = <1000>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c2_pin: i2c2-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
+				 <PINMUX_GPIO13__FUNC_SCL2>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c3_pin: i2c3-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
+				 <PINMUX_GPIO15__FUNC_SCL3>;
+			bias-pull-up = <1000>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c4_pin: i2c4-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
+				 <PINMUX_GPIO17__FUNC_SCL4>;
+			bias-pull-up = <1000>;
+			drive-strength = <MTK_DRIVE_4mA>;
+		};
+	};
+
+	i2c5_pin: i2c5-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO29__FUNC_SCL5>,
+				 <PINMUX_GPIO30__FUNC_SDA5>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c7_pin: i2c7-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO27__FUNC_SCL7>,
+				 <PINMUX_GPIO28__FUNC_SDA7>;
+			bias-disable;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -407,12 +535,34 @@ pins-low-power-pupd {
 			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
 		};
 	};
+
+	spi0_pins: spi0-default-pins {
+		pins-cs-mosi-clk {
+			pinmux = <PINMUX_GPIO132__FUNC_SPIM0_CSB>,
+				 <PINMUX_GPIO134__FUNC_SPIM0_MO>,
+				 <PINMUX_GPIO133__FUNC_SPIM0_CLK>;
+			bias-disable;
+		};
+
+		pins-miso {
+			pinmux = <PINMUX_GPIO135__FUNC_SPIM0_MI>;
+			bias-pull-down;
+		};
+	};
 };
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&spi0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	mediatek,pad-select = <0>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.35.1


