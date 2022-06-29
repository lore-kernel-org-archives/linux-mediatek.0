Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws6Nlmsrs7fmJ5igck8uPciOqALX8t+9ov9cQUKHHKQ=; b=nWG5sA+6rMJk5aRLpeZM++ILlT
	HW3naAGHoysY5ZRhbE3d3ojqbs30dX9WDv0RgO2S+RkenLQvxSdHCacyjrOY7lEX1RsHYrSjM4pLy
	J0Mh8dO/jVWDOkmwws3PBy8gVKAYuqoAH1Oo/qlj75sJav9P+SdCIYr41A/s6uN5Ikisr24S3f9Kj
	n5kjCElezSV6d8dt7VlWY4uCzkJawZ9EGIhAtIAkgaes/XZH0dYEITFc/JhFyxzInZvCoPFGb0/C0
	Sei19p9TsKCJHQmeyT6Apc9D7LVyE0UlubuWFMb9g+V3n9qkaXGqqwCO9EE+irKBROn9EIloglICc
	QxJwTk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aAK-00CqNP-Qh; Wed, 29 Jun 2022 16:03:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6v-00CoTu-Lr; Wed, 29 Jun 2022 16:00:16 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D6E96601967;
	Wed, 29 Jun 2022 17:00:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518412;
	bh=RMpC7msGnNKAM7uk86ht5QA2izSfq/gh610fxQejVhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bs0N+97WYD/VZ1ms59+wyryFPnLK72LcqPhyBx3T/gSa9LC8svbQftcYEo37GGW80
	 efuaw1RDu1bPwZeGTN1E2a4i8Y3KicXyXa5gltDGQDp/yETI6e2KnQ1pI0wJHPoFFh
	 dXxslJw+XPlPRFE392+X1Nq6UtQdk7o/47mjZFWBUdxul0gz5Wv1bGKbpP4M+vjrtK
	 n/6l1tJPg+fT+SdyvVlb/2vbGPCtAHdYvUu6cTDHR88WC2KX26XoHdKP5+jpz1Iw/l
	 indPvI3L4Ala69UDD8hCi7LX/xKRRBpjQqg1t3CYRfj6DIKQpfUB2+pnjsciYx4lOb
	 RGi8d9TplkEdw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 06/19] arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busses
Date: Wed, 29 Jun 2022 11:59:43 -0400
Message-Id: <20220629155956.1138955-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090014_064630_55A7AFE0 
X-CRM114-Status: GOOD (  11.11  )
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

The Asurada platform has five I2C controllers and two SPI controllers
that are used. In preparation for enabling the devices connected to
these controllers, enable and configure their busses.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

Changes in v4:
- Switched mediatek,drive-strength-adv for drive-strength-microamp
- Switched mediatek,pull-up-adv for bias-pull-up

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index ca55dd095e80..72dc974fe6fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -85,6 +85,47 @@ ppvar_sys: regulator-var-sys {
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+};
+
+&i2c2 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	clock-stretch-ns = <12600>;
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
+&i2c7 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c7_pins>;
+};
+
 &pio {
 	/* 220 lines */
 	gpio-line-names = "I2S_DP_LRCK",
@@ -311,6 +352,91 @@ &pio {
 			  "AUD_DAT_MOSI1",
 			  "AUD_DAT_MISO0",
 			  "AUD_DAT_MISO1";
+
+	i2c0_pins: i2c0-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO204__FUNC_SCL0>,
+				 <PINMUX_GPIO205__FUNC_SDA0>;
+			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c1_pins: i2c1-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO118__FUNC_SCL1>,
+				 <PINMUX_GPIO119__FUNC_SDA1>;
+			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c2_pins: i2c2-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO141__FUNC_SCL2>,
+				 <PINMUX_GPIO142__FUNC_SDA2>;
+			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
+		};
+	};
+
+	i2c3_pins: i2c3-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO160__FUNC_SCL3>,
+				 <PINMUX_GPIO161__FUNC_SDA3>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c7_pins: i2c7-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO124__FUNC_SCL7>,
+				 <PINMUX_GPIO125__FUNC_SDA7>;
+			bias-disable;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	spi1_pins: spi1-default-pins {
+		pins-cs-mosi-clk {
+			pinmux = <PINMUX_GPIO157__FUNC_SPI1_A_CSB>,
+				 <PINMUX_GPIO159__FUNC_SPI1_A_MO>,
+				 <PINMUX_GPIO156__FUNC_SPI1_A_CLK>;
+			bias-disable;
+		};
+
+		pins-miso {
+			pinmux = <PINMUX_GPIO158__FUNC_SPI1_A_MI>;
+			bias-pull-down;
+		};
+	};
+
+	spi5_pins: spi5-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO38__FUNC_SPI5_A_MI>,
+				 <PINMUX_GPIO37__FUNC_GPIO37>,
+				 <PINMUX_GPIO39__FUNC_SPI5_A_MO>,
+				 <PINMUX_GPIO36__FUNC_SPI5_A_CLK>;
+			bias-disable;
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	mediatek,pad-select = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+};
+
+&spi5 {
+	status = "okay";
+
+	cs-gpios = <&pio 37 GPIO_ACTIVE_LOW>;
+	mediatek,pad-select = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi5_pins>;
 };
 
 &uart0 {
-- 
2.36.1


