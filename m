Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 21:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUWZkIjHsVzpjSsIB7BiEAj0/5Ywi+KBgkMWDL5CTDQ=; b=M9vhTmqnYbX5/6KcFxtfqZ0N0+
	AvoxCH2A98HJa+XbTmIfI7cjo7Es55BWUS6hv70FS8uJF1wuUxoicTai1pA9r3wXIfqdTxPj8WHdL
	tespVSKyJq7GHCdFLNqMsZDcGXrtdQyoEckkB5SlqbnlctTBzAN2FJuUULWrPwqrhQeU+CTSltKZT
	D6JiTujFWYs8d9N56POYlpY7EYTlA8FQRAZrtEHh+0tsP3Pn4LvL/E2LoF6kEuC1RSOsa0uXkWY8k
	PKmBdmFFDODAL0LF+SjNu/pgPyNM3BweDO7WM1GF6sDeuAKiCM/FaG1EhJRKz4sxVE/cCKOHQPB/C
	R7KZQZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYOG-005Mth-Le; Thu, 06 Oct 2022 21:26:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYNA-005MKr-OO; Thu, 06 Oct 2022 21:25:43 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F9FE660231D;
	Thu,  6 Oct 2022 22:25:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665091539;
	bh=lp5EA9zGiSNS2l0ttqeR42/SM/7JzB0RtZb7ngSR3KM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFOFOc86o7i+cXXHR1jvnkT4TxuB4o7GvpiUQj01jEDCdjdwWWU3VVbKm3keuKMoD
	 itRayMm8vpl/kVlLPpfmItqNeEB4Q+TQUGrloK7bOI2jEcH66s9QJ9mq6wPPZMsyGo
	 H8M22+NK1x0VUrtqPASPc1V81mWpdgllTshwuQ83n2M8fSvwSW2h1JRNcjuAiyMSMZ
	 iWY/TD4Aowe8IVthAwJxIcbKXm4CiPsRnG7cYdnmLbL3qa6utqwFaDLuOx3rD1W/Sj
	 bUTpXzeufkhN+k/aKct2WaOt8g20/+9+1ROvRglEIWB3Is5ye8YMjXOtFYm/PU+v++
	 f5FFH6lZc9s9Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/5] arm64: dts: mediatek: asurada: Enable audio support
Date: Thu,  6 Oct 2022 17:25:27 -0400
Message-Id: <20221006212528.103790-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006212528.103790-1-nfraprado@collabora.com>
References: <20221006212528.103790-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_142541_085103_0804A880 
X-CRM114-Status: GOOD (  11.63  )
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

Enable audio support for the Asurada platform. This consists of the
machine sound card, the rt1015p codec for the speakers, the rt5682 codec
for the headset, and the dmic codec for the internal microphone.

HDMI audio support is left out for now since the DisplayPort chip
required isn't enabled yet.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added this commit

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 282 ++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index ace44827de17..dac2d4f5e670 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -33,6 +33,12 @@ backlight_lcd0: backlight-lcd0 {
 		default-brightness-level = <576>;
 	};
 
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		wakeup-delay-ms = <50>;
+	};
+
 	pp1000_dpbrdg: regulator-1v0-dpbrdg {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1000_dpbrdg";
@@ -196,6 +202,79 @@ wifi_restricted_dma_region: wifi@c0000000 {
 			reg = <0 0xc0000000 0 0x4000000>;
 		};
 	};
+
+	rt1015p: rt1015p {
+		compatible = "realtek,rt1015p";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt1015p_pins>;
+		sdb-gpios = <&pio 147 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+	};
+
+	sound: mt8192-sound {
+		compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682";
+		mediatek,platform = <&afe>;
+		pinctrl-names = "aud_clk_mosi_off",
+				"aud_clk_mosi_on",
+				"aud_dat_mosi_off",
+				"aud_dat_mosi_on",
+				"aud_dat_miso_off",
+				"aud_dat_miso_on",
+				"vow_dat_miso_off",
+				"vow_dat_miso_on",
+				"vow_clk_miso_off",
+				"vow_clk_miso_on",
+				"aud_nle_mosi_off",
+				"aud_nle_mosi_on",
+				"aud_dat_miso2_off",
+				"aud_dat_miso2_on",
+				"aud_gpio_i2s3_off",
+				"aud_gpio_i2s3_on",
+				"aud_gpio_i2s8_off",
+				"aud_gpio_i2s8_on",
+				"aud_gpio_i2s9_off",
+				"aud_gpio_i2s9_on",
+				"aud_dat_mosi_ch34_off",
+				"aud_dat_mosi_ch34_on",
+				"aud_dat_miso_ch34_off",
+				"aud_dat_miso_ch34_on",
+				"aud_gpio_tdm_off",
+				"aud_gpio_tdm_on";
+		pinctrl-0 = <&aud_clk_mosi_off_pins>;
+		pinctrl-1 = <&aud_clk_mosi_on_pins>;
+		pinctrl-2 = <&aud_dat_mosi_off_pins>;
+		pinctrl-3 = <&aud_dat_mosi_on_pins>;
+		pinctrl-4 = <&aud_dat_miso_off_pins>;
+		pinctrl-5 = <&aud_dat_miso_on_pins>;
+		pinctrl-6 = <&vow_dat_miso_off_pins>;
+		pinctrl-7 = <&vow_dat_miso_on_pins>;
+		pinctrl-8 = <&vow_clk_miso_off_pins>;
+		pinctrl-9 = <&vow_clk_miso_on_pins>;
+		pinctrl-10 = <&aud_nle_mosi_off_pins>;
+		pinctrl-11 = <&aud_nle_mosi_on_pins>;
+		pinctrl-12 = <&aud_dat_miso2_off_pins>;
+		pinctrl-13 = <&aud_dat_miso2_on_pins>;
+		pinctrl-14 = <&aud_gpio_i2s3_off_pins>;
+		pinctrl-15 = <&aud_gpio_i2s3_on_pins>;
+		pinctrl-16 = <&aud_gpio_i2s8_off_pins>;
+		pinctrl-17 = <&aud_gpio_i2s8_on_pins>;
+		pinctrl-18 = <&aud_gpio_i2s9_off_pins>;
+		pinctrl-19 = <&aud_gpio_i2s9_on_pins>;
+		pinctrl-20 = <&aud_dat_mosi_ch34_off_pins>;
+		pinctrl-21 = <&aud_dat_mosi_ch34_on_pins>;
+		pinctrl-22 = <&aud_dat_miso_ch34_off_pins>;
+		pinctrl-23 = <&aud_dat_miso_ch34_on_pins>;
+		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
+		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
+
+		headset-codec {
+		    sound-dai = <&rt5682>;
+		};
+
+		speaker-codecs {
+		    sound-dai = <&rt1015p>;
+		};
+	};
 };
 
 &dsi0 {
@@ -227,6 +306,19 @@ &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
+
+	rt5682: rt5682@1a {
+		compatible = "realtek,rt5682i";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 18 IRQ_TYPE_LEVEL_LOW>;
+		realtek,jd-src = <1>;
+		realtek,btndet-delay = <16>;
+		#sound-dai-cells = <0>;
+
+		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		MICVDD-supply = <&pp3300_g>;
+		VBAT-supply = <&pp3300_ldo_z>;
+	};
 };
 
 &i2c2 {
@@ -660,6 +752,165 @@ pins-in {
 		};
 	};
 
+	aud_clk_mosi_off_pins: aud-clk-mosi-off-pins {
+		pins-mosi-off {
+			pinmux = <PINMUX_GPIO214__FUNC_GPIO214>,
+				 <PINMUX_GPIO215__FUNC_GPIO215>;
+		};
+	};
+
+	aud_clk_mosi_on_pins: aud-clk-mosi-on-pins {
+		pins-mosi-on {
+			pinmux = <PINMUX_GPIO214__FUNC_AUD_CLK_MOSI>,
+				 <PINMUX_GPIO215__FUNC_AUD_SYNC_MOSI>;
+			drive-strength = <10>;
+		};
+	};
+
+	aud_dat_miso_ch34_off_pins: aud-dat-miso-ch34-off-pins {
+		pins-miso-off {
+			pinmux = <PINMUX_GPIO199__FUNC_GPIO199>;
+		};
+	};
+
+	aud_dat_miso_ch34_on_pins: aud-dat-miso-ch34-on-pins {
+		pins-miso-on {
+			pinmux = <PINMUX_GPIO199__FUNC_AUD_DAT_MISO2>;
+		};
+	};
+
+	aud_dat_miso_off_pins: aud-dat-miso-off-pins {
+		pins-miso-off {
+			pinmux = <PINMUX_GPIO218__FUNC_GPIO218>,
+				 <PINMUX_GPIO219__FUNC_GPIO219>;
+		};
+	};
+
+	aud_dat_miso_on_pins: aud-dat-miso-on-pins {
+		pins-miso-on {
+			pinmux = <PINMUX_GPIO218__FUNC_AUD_DAT_MISO0>,
+				 <PINMUX_GPIO219__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <10>;
+		};
+	};
+
+	aud_dat_miso2_off_pins: aud-dat-miso2-off-pins {
+		pins-miso-off {
+			pinmux = <PINMUX_GPIO199__FUNC_GPIO199>;
+		};
+	};
+
+	aud_dat_miso2_on_pins: aud-dat-miso2-on-pins {
+		pins-miso-on {
+			pinmux = <PINMUX_GPIO199__FUNC_AUD_DAT_MISO2>;
+		};
+	};
+
+	aud_dat_mosi_ch34_off_pins: aud-dat-mosi-ch34-off-pins {
+		pins-mosi-off {
+			pinmux = <PINMUX_GPIO196__FUNC_GPIO196>;
+		};
+	};
+
+	aud_dat_mosi_ch34_on_pins: aud-dat-mosi-ch34-on-pins {
+		pins-mosi-on {
+			pinmux = <PINMUX_GPIO196__FUNC_AUD_DAT_MOSI2>;
+		};
+	};
+
+	aud_dat_mosi_off_pins: aud-dat-mosi-off-pins {
+		pins-mosi-off {
+			pinmux = <PINMUX_GPIO216__FUNC_GPIO216>,
+				 <PINMUX_GPIO217__FUNC_GPIO217>;
+		};
+	};
+
+	aud_dat_mosi_on_pins: aud-dat-mosi-on-pins {
+		pins-mosi-on {
+			pinmux = <PINMUX_GPIO216__FUNC_AUD_DAT_MOSI0>,
+				 <PINMUX_GPIO217__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <10>;
+		};
+	};
+
+	aud_gpio_i2s3_off_pins: aud-gpio-i2s3-off-pins {
+		pins-i2s3-off {
+			pinmux = <PINMUX_GPIO32__FUNC_GPIO32>,
+				 <PINMUX_GPIO33__FUNC_GPIO33>,
+				 <PINMUX_GPIO35__FUNC_GPIO35>;
+		};
+	};
+
+	aud_gpio_i2s3_on_pins: aud-gpio-i2s3-on-pins {
+		pins-i2s3-on {
+			pinmux = <PINMUX_GPIO32__FUNC_I2S3_BCK>,
+				 <PINMUX_GPIO33__FUNC_I2S3_LRCK>,
+				 <PINMUX_GPIO35__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_gpio_i2s8_off_pins: aud-gpio-i2s8-off-pins {
+		pins-i2s8-off {
+			pinmux = <PINMUX_GPIO10__FUNC_GPIO10>,
+				 <PINMUX_GPIO11__FUNC_GPIO11>,
+				 <PINMUX_GPIO12__FUNC_GPIO12>,
+				 <PINMUX_GPIO13__FUNC_GPIO13>;
+		};
+	};
+
+	aud_gpio_i2s8_on_pins: aud-gpio-i2s8-on-pins {
+		pins-i2s8-on {
+			pinmux = <PINMUX_GPIO10__FUNC_I2S8_MCK>,
+				 <PINMUX_GPIO11__FUNC_I2S8_BCK>,
+				 <PINMUX_GPIO12__FUNC_I2S8_LRCK>,
+				 <PINMUX_GPIO13__FUNC_I2S8_DI>;
+		};
+	};
+
+	aud_gpio_i2s9_off_pins: aud-gpio-i2s9-off-pins {
+		pins-i2s9-off {
+			pinmux = <PINMUX_GPIO29__FUNC_GPIO29>;
+		};
+	};
+
+	aud_gpio_i2s9_on_pins: aud-gpio-i2s9-on-pins {
+		pins-i2s9-on {
+			pinmux = <PINMUX_GPIO29__FUNC_I2S9_DO>;
+		};
+	};
+
+	aud_gpio_tdm_off_pins: aud-gpio-tdm-off-pins {
+		pins-tdm-off {
+			pinmux = <PINMUX_GPIO0__FUNC_GPIO0>,
+				 <PINMUX_GPIO1__FUNC_GPIO1>,
+				 <PINMUX_GPIO2__FUNC_GPIO2>,
+				 <PINMUX_GPIO3__FUNC_GPIO3>;
+		};
+	};
+
+	aud_gpio_tdm_on_pins: aud-gpio-tdm-on-pins {
+		pins-tdm-on {
+			pinmux = <PINMUX_GPIO0__FUNC_TDM_LRCK>,
+				 <PINMUX_GPIO1__FUNC_TDM_BCK>,
+				 <PINMUX_GPIO2__FUNC_TDM_MCK>,
+				 <PINMUX_GPIO3__FUNC_TDM_DATA0>;
+		};
+	};
+
+	aud_nle_mosi_off_pins: aud-nle-mosi-off-pins {
+		pins-nle-mosi-off {
+			pinmux = <PINMUX_GPIO197__FUNC_GPIO197>,
+				 <PINMUX_GPIO198__FUNC_GPIO198>;
+		};
+	};
+
+	aud_nle_mosi_on_pins: aud-nle-mosi-on-pins {
+		pins-nle-mosi-on {
+			pinmux = <PINMUX_GPIO197__FUNC_AUD_NLE_MOSI1>,
+				 <PINMUX_GPIO198__FUNC_AUD_NLE_MOSI0>;
+		};
+	};
+
 	cr50_int: cr50-irq-default-pins {
 		pins-gsc-ap-int-odl {
 			pinmux = <PINMUX_GPIO171__FUNC_GPIO171>;
@@ -932,6 +1183,13 @@ pins-inhibit {
 		};
 	};
 
+	rt1015p_pins: rt1015p-default-pins {
+		pins {
+			pinmux = <PINMUX_GPIO147__FUNC_GPIO147>;
+			output-low;
+		};
+	};
+
 	scp_pins: scp-pins {
 		pins-vreq-vao {
 			pinmux = <PINMUX_GPIO195__FUNC_SCP_VREQ_VAO>;
@@ -987,6 +1245,30 @@ pins-report-sw {
 			output-low;
 		};
 	};
+
+	vow_clk_miso_off_pins: vow-clk-miso-off-pins {
+		pins-miso-off {
+			pinmux = <PINMUX_GPIO219__FUNC_GPIO219>;
+		};
+	};
+
+	vow_clk_miso_on_pins: vow-clk-miso-on-pins {
+		pins-miso-on {
+			pinmux = <PINMUX_GPIO219__FUNC_VOW_CLK_MISO>;
+		};
+	};
+
+	vow_dat_miso_off_pins: vow-dat-miso-off-pins {
+		pins-miso-off {
+			pinmux = <PINMUX_GPIO218__FUNC_GPIO218>;
+		};
+	};
+
+	vow_dat_miso_on_pins: vow-dat-miso-on-pins {
+		pins-miso-on {
+			pinmux = <PINMUX_GPIO218__FUNC_VOW_DAT_MISO>;
+		};
+	};
 };
 
 &pmic {
-- 
2.37.3


