Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B10C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4F4I1niwuuGiy9vrJbUjT9i5h+icc9gwlAMQ/l05+c=; b=lQALuKt1IwBYEK
	SYzt5zwBCPvxe2Js+J0PrPKHMrg3Kg8ZpDmI/oXOr/Zb44LutCDjIwbIpTMkx0sYW0PsSHU/9ybqY
	t6WcAUFiT5j5WToWgn0l0JrPKrWjCXtB0xaZrYHlF2QaUpFxUn0EpCvMHbMvtig94tlZgFmellcU8
	Ph+GCL72tp8bmOvAfQJH51hJsoxnZIU1hZXl51kPHGFFK9Llp75PTdftQsUiUA1NRoebs3ry9dhtU
	aGREy0SGf222ABArpBdGTw9C9lzabSzb6IdTzb7FeG/TEYwj6XMIPAd4rsWMN+tQ3f4kpdEHzJTEh
	fnyKGOQ+WwjZibanyAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesb7-000000077Hv-0WdN;
	Thu, 24 Jul 2025 09:50:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVL-00000006tzP-2RDU;
	Thu, 24 Jul 2025 08:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346442;
	bh=QvtX3tiJFOYUG861Cv5j7NgxDHzKzYZ7Z7s6cgpc96c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M8EoBdIUYqrfo7xyDRMBUTSoWwrpaJ0qXStYlLHeEQAQPYmSlgQXVS4qASQMI65Eh
	 oK72gJosli1LqY3trS/gr3BYIJy3xNsOxLPuOdioAANj9Ej0OoDOqoP8Euh956qbYu
	 iTv1yaJUiJ0+V8SAyKY/ElZV94O1Z1IbPYmpF9lzVENTPQ2PIFl9BNQdwb2GA6/8TI
	 tEGo1Hfg7fdQoRNQHnjtxCg9zTFqOnQenESYG9vPJUylkIeOjVGw9cb80YKA4wPs9Z
	 xZdWQHPxjh4Mqc7BZP/neiZh7dB0zfFIZyI8flpxnuf6CfNlIIx4/O8MdJ/aZfaCKM
	 648nnNs3t0KMA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA2E117E11EE;
	Thu, 24 Jul 2025 10:40:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 29/38] arm64: dts: mediatek: mt8183: Fix pinctrl node names
Date: Thu, 24 Jul 2025 10:39:05 +0200
Message-ID: <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014043_911827_83923952 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the pinctrl node names to adhere to the bindings, as the main
pin node is supposed to be named like "uart0-pins" and the pinmux
node named like "pins-bus".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mt8183-kukui-audio-da7219.dtsi   |  4 +-
 .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |  2 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 22 +++---
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 16 ++--
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 12 +--
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 12 +--
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 78 +++++++++----------
 7 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
index 586eee79c73c..f69ffcb9792a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
@@ -39,8 +39,8 @@ da7219_aad {
 };
 
 &pio {
-	da7219_pins: da7219_pins {
-		pins1 {
+	da7219_pins: da7219-pins {
+		pins-intn {
 			pinmux = <PINMUX_GPIO165__FUNC_GPIO165>;
 			input-enable;
 			bias-pull-up;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
index 548e22c194a2..c4aedf8cbfcd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
@@ -17,7 +17,7 @@ ts3a227e: ts3a227e@3b {
 };
 
 &pio {
-	ts3a227e_pins: ts3a227e_pins {
+	ts3a227e_pins: ts3a227e-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO157__FUNC_GPIO157>;
 			input-enable;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 80888bd4ad82..f2afca63c75a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -395,14 +395,14 @@ &pio {
 		"",
 		"";
 
-	pp1000_mipibrdg_en: pp1000-mipibrdg-en {
+	pp1000_mipibrdg_en: pp1000-mipibrdg-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
 			output-low;
 		};
 	};
 
-	pp1800_mipibrdg_en: pp1800-mipibrdg-en {
+	pp1800_mipibrdg_en: pp1800-mipibrdg-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
 			output-low;
@@ -410,20 +410,20 @@ pins1 {
 	};
 
 	pp3300_panel_pins: pp3300-panel-pins {
-		panel_3v3_enable: panel-3v3-enable {
+		panel_3v3_enable: pins-panel-en {
 			pinmux = <PINMUX_GPIO35__FUNC_GPIO35>;
 			output-low;
 		};
 	};
 
-	ppvarp_lcd_en: ppvarp-lcd-en {
+	ppvarp_lcd_en: ppvarp-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
 			output-low;
 		};
 	};
 
-	ppvarn_lcd_en: ppvarn-lcd-en {
+	ppvarn_lcd_en: ppvarn-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
 			output-low;
@@ -444,27 +444,27 @@ pins2 {
 	};
 
 	touchscreen_pins: touchscreen-pins {
-		touch-int-odl {
+		pins-intn {
 			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
 			input-enable;
 			bias-pull-up;
 		};
 
-		touch-rst-l {
+		pins-rst {
 			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
 			output-high;
 		};
 	};
 
 	trackpad_pins: trackpad-pins {
-		trackpad-int {
+		pins-intn {
 			pinmux = <PINMUX_GPIO7__FUNC_GPIO7>;
 			input-enable;
 			bias-disable; /* pulled externally */
 		};
 	};
 
-	pp3300_mipibrdg_en: pp3300-mipibrdg-en {
+	pp3300_mipibrdg_en: pp3300-mipibrdg-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO37__FUNC_GPIO37>;
 			output-low;
@@ -472,13 +472,13 @@ pins1 {
 	};
 
 	volume_button_pins: volume-button-pins {
-		voldn-btn-odl {
+		pins-voldn {
 			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
 			input-enable;
 			bias-pull-up;
 		};
 
-		volup-btn-odl {
+		pins-volup {
 			pinmux = <PINMUX_GPIO5__FUNC_GPIO5>;
 			input-enable;
 			bias-pull-up;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index ff02f63bac29..472d4987615a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -304,35 +304,35 @@ &pio {
 		"",
 		"";
 
-	ppvarp_lcd_en: ppvarp-lcd-en {
+	ppvarp_lcd_en: ppvarp-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
 			output-low;
 		};
 	};
 
-	ppvarn_lcd_en: ppvarn-lcd-en {
+	ppvarn_lcd_en: ppvarn-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
 			output-low;
 		};
 	};
 
-	pp1800_lcd_en: pp1800-lcd-en {
+	pp1800_lcd_en: pp1800-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
 			output-low;
 		};
 	};
 
-	open_touch: open_touch {
-		irq_pin {
+	open_touch: opentouch-pins {
+		pins-intn {
 			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
 			input-enable;
 			bias-pull-up;
 		};
 
-		rst_pin {
+		pins-rst {
 			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
 
 			/*
@@ -349,8 +349,8 @@ rst_pin {
 		};
 	};
 
-	pen_eject: peneject {
-		pen_eject {
+	pen_eject: pen-pins {
+		pins-eject {
 			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
 			input-enable;
 			/* External pull-up. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index da6e767b4cee..1b21e3958061 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -292,35 +292,35 @@ &pio {
 		"",
 		"";
 
-	ppvarp_lcd_en: ppvarp-lcd-en {
+	ppvarp_lcd_en: ppvarp-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
 			output-low;
 		};
 	};
 
-	ppvarn_lcd_en: ppvarn-lcd-en {
+	ppvarn_lcd_en: ppvarn-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
 			output-low;
 		};
 	};
 
-	pp1800_lcd_en: pp1800-lcd-en {
+	pp1800_lcd_en: pp1800-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
 			output-low;
 		};
 	};
 
-	touch_default: touchdefault {
-		pin_irq {
+	touch_default: touch-pins {
+		pins-intn {
 			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
 			input-enable;
 			bias-pull-up;
 		};
 
-		touch_pin_reset: pin_reset {
+		touch_pin_reset: pins-rst {
 			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
 
 			/*
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index 8b56b8564ed7..a85c73b43195 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -296,35 +296,35 @@ &pio {
 		"",
 		"";
 
-	ppvarp_lcd_en: ppvarp-lcd-en {
+	ppvarp_lcd_en: ppvarp-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
 			output-low;
 		};
 	};
 
-	ppvarn_lcd_en: ppvarn-lcd-en {
+	ppvarn_lcd_en: ppvarn-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
 			output-low;
 		};
 	};
 
-	pp1800_lcd_en: pp1800-lcd-en {
+	pp1800_lcd_en: pp1800-lcd-en-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
 			output-low;
 		};
 	};
 
-	open_touch: open_touch {
-		irq_pin {
+	open_touch: opentouch-pins {
+		pins-intn {
 			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
 			input-enable;
 			bias-pull-up;
 		};
 
-		rst_pin {
+		pins-rst {
 			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
 
 			/*
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 400c61d11035..8f3a0e85b4ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -435,7 +435,7 @@ &mt6358_vsram_gpu_reg {
 };
 
 &pio {
-	aud_pins_default: audiopins {
+	aud_pins_default: audio-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO97__FUNC_I2S2_MCK>,
 				<PINMUX_GPIO98__FUNC_I2S2_BCK>,
@@ -457,7 +457,7 @@ pins-bus {
 		};
 	};
 
-	aud_pins_tdm_out_on: audiotdmouton {
+	aud_pins_tdm_out_on: audio-tdmout-on-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO169__FUNC_TDM_BCK_2ND>,
 				<PINMUX_GPIO170__FUNC_TDM_LRCK_2ND>,
@@ -469,7 +469,7 @@ pins-bus {
 		};
 	};
 
-	aud_pins_tdm_out_off: audiotdmoutoff {
+	aud_pins_tdm_out_off: audio-tdmout-off-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO169__FUNC_GPIO169>,
 				<PINMUX_GPIO170__FUNC_GPIO170>,
@@ -490,22 +490,22 @@ pins-bt-en {
 		};
 	};
 
-	ec_ap_int_odl: ec-ap-int-odl {
-		pins1 {
+	ec_ap_int_odl: ec-ap-int-odl-pins {
+		pins-intn {
 			pinmux = <PINMUX_GPIO151__FUNC_GPIO151>;
 			input-enable;
 			bias-pull-up;
 		};
 	};
 
-	h1_int_od_l: h1-int-od-l {
-		pins1 {
+	h1_int_od_l: h1-int-od-l-pins {
+		pins-intn {
 			pinmux = <PINMUX_GPIO153__FUNC_GPIO153>;
 			input-enable;
 		};
 	};
 
-	i2c0_pins: i2c0 {
+	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
@@ -513,7 +513,7 @@ pins-bus {
 		};
 	};
 
-	i2c1_pins: i2c1 {
+	i2c1_pins: i2c1-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
@@ -521,7 +521,7 @@ pins-bus {
 		};
 	};
 
-	i2c2_pins: i2c2 {
+	i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
@@ -529,7 +529,7 @@ pins-bus {
 		};
 	};
 
-	i2c3_pins: i2c3 {
+	i2c3_pins: i2c3-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
@@ -537,7 +537,7 @@ pins-bus {
 		};
 	};
 
-	i2c4_pins: i2c4 {
+	i2c4_pins: i2c4-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
@@ -545,7 +545,7 @@ pins-bus {
 		};
 	};
 
-	i2c5_pins: i2c5 {
+	i2c5_pins: i2c5-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
@@ -553,7 +553,7 @@ pins-bus {
 		};
 	};
 
-	i2c6_pins: i2c6 {
+	i2c6_pins: i2c6-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO11__FUNC_SCL6>,
 				 <PINMUX_GPIO12__FUNC_SDA6>;
@@ -561,7 +561,7 @@ pins-bus {
 		};
 	};
 
-	mmc0_pins_default: mmc0-pins-default {
+	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
 				 <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
@@ -625,7 +625,7 @@ pins-rst {
 		};
 	};
 
-	mmc1_pins_default: mmc1-pins-default {
+	mmc1_pins_default: mmc1-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
 				 <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
@@ -643,7 +643,7 @@ pins-clk {
 		};
 	};
 
-	mmc1_pins_uhs: mmc1-pins-uhs {
+	mmc1_pins_uhs: mmc1-uhs-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
 				 <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
@@ -663,15 +663,15 @@ pins-clk {
 		};
 	};
 
-	panel_pins_default: panel-pins-default {
-		panel-reset {
+	panel_pins_default: panel-pins {
+		pins-panel-reset {
 			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
 			output-low;
 			bias-pull-up;
 		};
 	};
 
-	pwm0_pin_default: pwm0-pin-default {
+	pwm0_pin_default: pwm0-pins {
 		pins1 {
 			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
 			output-high;
@@ -682,15 +682,15 @@ pins2 {
 		};
 	};
 
-	scp_pins: scp {
+	scp_pins: scp-pins {
 		pins-scp-uart {
 			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
 				 <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
 		};
 	};
 
-	spi0_pins: spi0 {
-		pins-spi {
+	spi0_pins: spi0-pins {
+		pins-bus {
 			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
 				 <PINMUX_GPIO86__FUNC_GPIO86>,
 				 <PINMUX_GPIO87__FUNC_SPI0_MO>,
@@ -699,8 +699,8 @@ pins-spi {
 		};
 	};
 
-	spi1_pins: spi1 {
-		pins-spi {
+	spi1_pins: spi1-pins {
+		pins-bus {
 			pinmux = <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
 				 <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
 				 <PINMUX_GPIO163__FUNC_SPI1_A_MO>,
@@ -709,21 +709,21 @@ pins-spi {
 		};
 	};
 
-	spi2_pins: spi2 {
-		pins-spi {
+	spi2_pins: spi2-pins {
+		pins-bus {
 			pinmux = <PINMUX_GPIO0__FUNC_SPI2_CSB>,
 				 <PINMUX_GPIO1__FUNC_SPI2_MO>,
 				 <PINMUX_GPIO2__FUNC_SPI2_CLK>;
 			bias-disable;
 		};
-		pins-spi-mi {
+		pins-miso {
 			pinmux = <PINMUX_GPIO94__FUNC_SPI2_MI>;
 			mediatek,pull-down-adv = <00>;
 		};
 	};
 
-	spi3_pins: spi3 {
-		pins-spi {
+	spi3_pins: spi3-pins {
+		pins-bus {
 			pinmux = <PINMUX_GPIO21__FUNC_SPI3_MI>,
 				 <PINMUX_GPIO22__FUNC_SPI3_CSB>,
 				 <PINMUX_GPIO23__FUNC_SPI3_MO>,
@@ -732,8 +732,8 @@ pins-spi {
 		};
 	};
 
-	spi4_pins: spi4 {
-		pins-spi {
+	spi4_pins: spi4-pins {
+		pins-bus {
 			pinmux = <PINMUX_GPIO17__FUNC_SPI4_MI>,
 				 <PINMUX_GPIO18__FUNC_SPI4_CSB>,
 				 <PINMUX_GPIO19__FUNC_SPI4_MO>,
@@ -742,8 +742,8 @@ pins-spi {
 		};
 	};
 
-	spi5_pins: spi5 {
-		pins-spi {
+	spi5_pins: spi5-pins {
+		pins-bus {
 			pinmux = <PINMUX_GPIO13__FUNC_SPI5_MI>,
 				 <PINMUX_GPIO14__FUNC_SPI5_CSB>,
 				 <PINMUX_GPIO15__FUNC_SPI5_MO>,
@@ -752,7 +752,7 @@ pins-spi {
 		};
 	};
 
-	uart0_pins_default: uart0-pins-default {
+	uart0_pins_default: uart0-pins {
 		pins-rx {
 			pinmux = <PINMUX_GPIO95__FUNC_URXD0>;
 			input-enable;
@@ -763,7 +763,7 @@ pins-tx {
 		};
 	};
 
-	uart1_pins_default: uart1-pins-default {
+	uart1_pins_default: uart1-pins {
 		pins-rx {
 			pinmux = <PINMUX_GPIO121__FUNC_URXD1>;
 			input-enable;
@@ -781,7 +781,7 @@ pins-cts {
 		};
 	};
 
-	uart1_pins_sleep: uart1-pins-sleep {
+	uart1_pins_sleep: uart1-sleep-pins {
 		pins-rx {
 			pinmux = <PINMUX_GPIO121__FUNC_GPIO121>;
 			input-enable;
@@ -799,14 +799,14 @@ pins-cts {
 		};
 	};
 
-	wifi_pins_pwrseq: wifi-pins-pwrseq {
+	wifi_pins_pwrseq: wifi-pwr-pins {
 		pins-wifi-enable {
 			pinmux = <PINMUX_GPIO119__FUNC_GPIO119>;
 			output-low;
 		};
 	};
 
-	wifi_pins_wakeup: wifi-pins-wakeup {
+	wifi_pins_wakeup: wifi-wake-pins {
 		pins-wifi-wakeup {
 			pinmux = <PINMUX_GPIO113__FUNC_GPIO113>;
 			input-enable;
-- 
2.50.1


