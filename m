Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWS5eZWpjliOpbSnDfR9uAt36Ko0KGLk0uSYSLhKbwQ=; b=ik0HmCFYizwyx4DLvpI4kPCmGD
	Jdrm71vZEspiSv4K7ktaqCjI4nHRWoXBeTI25ptkpjXGtTFO9WTmk605uf2zmlqChVbm33lJXhkAz
	7HzIhTYFmL1yX9XWb7aUCHiixlyNjYRwDylMywC1j49FyuDOMiZryX99kT4rJNBHrPy/BOvVv9SOM
	fUgf/mXAdIuChtDG7LrhT25M0kwRowdXZ7s2IvZA2SWu2az3mNSAnCyJ4Ffsy4jjC1gZe0pVMygiP
	fAQlpa5OZdU45dHqrWjcd1m/KICVjSqGv8K/fGJvXXY2ASptB8RzcY9c0fNHeeTXz6sC+5wtjJoAb
	qXt5Hzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J6s-006qwN-6e; Mon, 04 Jul 2022 10:15:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5E-006pfn-Ha; Mon, 04 Jul 2022 10:13:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79F60660198D;
	Mon,  4 Jul 2022 11:13:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929615;
	bh=FHgSrJU3WzqM39AkIrMiTStk5IDquSuk3dITN0i8HE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZI0Y2gmu5P3Eq2L8o5RGwZqqX1pUhxTKWLVllEIFsDD9807bWlhEU4XztQ2bsVKw
	 u4n8wodV9IDbeft3QFkRcM1uUEOSmVf4IczSVty0AM6twl+0AprAeKZVaCD3en7w3k
	 u7qXUjBM657dQXvXrinFwiqaT3gwj0PAj0r1mRTjR3o2pQFGVH4him1o4ZIaikXhSj
	 G6ABGEStkczi5SbGnMx8g0PGWxU9EyFU1lAdenuVwThLlrKNF6pGL6+NcEDQZSSTIc
	 Q0yhj7vgRArqGjy372fOeNJ2oJv3HFr1uTw7fTFagSvFxYZ3+AVwJ6h3+HdT+Mb11O
	 mP5iJJHTRzYVA==
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
Subject: [PATCH v2 07/11] arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
Date: Mon,  4 Jul 2022 12:13:17 +0200
Message-Id: <20220704101321.44835-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031336_905401_93DF137C 
X-CRM114-Status: GOOD (  10.18  )
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
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f00565466328..20a4a3a32ab9 100644
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
@@ -90,6 +97,63 @@ ppvar_sys: regulator-ppvar-sys {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+};
+
+&i2c1 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	i2c-scl-internal-delay-ns = <12500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+};
+
+&i2c2 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+};
+
+&i2c3 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&i2c4 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+};
+
+&i2c7 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c7_pins>;
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -302,6 +366,68 @@ &pio {
 		"AP_SPI_FLASH_MOSI",
 		"AP_SPI_FLASH_MISO";
 
+	i2c0_pins: i2c0-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
+				 <PINMUX_GPIO9__FUNC_SCL0>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c1_pins: i2c1-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO10__FUNC_SDA1>,
+				 <PINMUX_GPIO11__FUNC_SCL1>;
+			bias-pull-up = <1000>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c2_pins: i2c2-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
+				 <PINMUX_GPIO13__FUNC_SCL2>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c3_pins: i2c3-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
+				 <PINMUX_GPIO15__FUNC_SCL3>;
+			bias-pull-up = <1000>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c4_pins: i2c4-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
+				 <PINMUX_GPIO17__FUNC_SCL4>;
+			bias-pull-up = <1000>;
+			drive-strength = <4>;
+		};
+	};
+
+	i2c5_pins: i2c5-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO29__FUNC_SCL5>,
+				 <PINMUX_GPIO30__FUNC_SDA5>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c7_pins: i2c7-default-pins {
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
@@ -409,12 +535,34 @@ pins-low-power-pupd {
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


