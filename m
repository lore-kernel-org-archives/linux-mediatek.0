Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9414C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uad60cSzAXiHSpdcytbyiKBr/CE77yY/3ojKpyTmnKo=; b=lOyMbkywF2NkgcHoSUAWg2d8lH
	LqCWOh6ONqIcZ8Ghd9FKOVFOT2wfEbsLj1Y/i9NKLyw38ZsVG8Ccfq8FPyOzmLzZz8ppDYH67GWic
	spXl6Y+0UE+UrcjNc7orfxwwPDgSe87WEg0DlfZgiYdreEA8L7ohb0OSp318c9Rt5nJ+LAw3HMWyd
	rFYLwvMPbrhfLqq9Xmw3JQfZkVdKtRGdxqFE8u+BhpMuGU04769PzsblkOeVqGtGTHR53eGNNfFr6
	kKNOWvELMhC/bLqKwQJSHi8AMITMF3p+jas95jay1n9pyk/tscBLflpcYQzIy7oR41Bfd2LRMe9g4
	f++eH4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4d-00DT0p-4e; Wed, 02 Nov 2022 19:06:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4C-00DSOm-Lm; Wed, 02 Nov 2022 19:06:26 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EA0E66028E3;
	Wed,  2 Nov 2022 19:06:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667415982;
	bh=1MQda8HO+asp2YDdSHvFW0nRegZrXBKBPzRi8BdE+0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ULLNX7HM3PDSD3hhfnbIiHHV2zPfHshyTCPqPxXyOt6pqWgZ3PJ9rTVFFhFvpjIxw
	 hitG0xcMiS+YZRXmZy0Qc8poyU9aeDKCewOGuauDkz5/i5r14QO20KsB0C1SxhT5dk
	 iZE/Jz8RNlsmuRCBUeVopXIs+Fqwy3Dna2MU8owWFLgbDg1ZNHRCOIPSPHl9ap2wvV
	 A7GdCLm7g1WdzBdpGuLBO6ZzZQOAIjnBJLpAAtT176GQCSJHgLuhVkwv7Vz7dszL2e
	 ol2xj4deoIBTbuBTrnZVVU1GG4Y6IYxZvqw6WbUU97J9J76crg5O34qipE1qihMs9A
	 kUxjF61ePCaiA==
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
Subject: [PATCH v3 1/5] arm64: dts: mediatek: asurada: Add display regulators
Date: Wed,  2 Nov 2022 15:06:07 -0400
Message-Id: <20221102190611.283546-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102190611.283546-1-nfraprado@collabora.com>
References: <20221102190611.283546-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_120625_046511_D01CA264 
X-CRM114-Status: GOOD (  11.60  )
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

Add the regulators present on the Asurada platform that are used to
power the internal and external displays.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v2)

Changes in v2:
- Added missing vin-supply to regulators
- Removed min/max-microvolt from regulators that are simple switches

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 4b314435f8fd..fafca7428539 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -23,6 +23,43 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x80000000>;
 	};
 
+	pp1000_dpbrdg: regulator-1v0-dpbrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1000_dpbrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1000_dpbrdg_en_pins>;
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 19 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&mt6359_vs2_buck_reg>;
+	};
+
+	pp1000_mipibrdg: regulator-1v0-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1000_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1000_mipibrdg_en_pins>;
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&mt6359_vs2_buck_reg>;
+	};
+
+	pp1800_dpbrdg: regulator-1v8-dpbrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_dpbrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_dpbrdg_en_pins>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 126 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&mt6359_vio18_ldo_reg>;
+	};
+
 	/* system wide LDO 1.8V power rail */
 	pp1800_ldo_g: regulator-1v8-g {
 		compatible = "regulator-fixed";
@@ -34,6 +71,28 @@ pp1800_ldo_g: regulator-1v8-g {
 		vin-supply = <&pp3300_g>;
 	};
 
+	pp1800_mipibrdg: regulator-1v8-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_mipibrdg_en_pins>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 128 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&mt6359_vio18_ldo_reg>;
+	};
+
+	pp3300_dpbrdg: regulator-3v3-dpbrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_dpbrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_dpbrdg_en_pins>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 26 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
+	};
+
 	/* system wide switching 3.3V power rail */
 	pp3300_g: regulator-3v3-g {
 		compatible = "regulator-fixed";
@@ -56,6 +115,17 @@ pp3300_ldo_z: regulator-3v3-z {
 		vin-supply = <&ppvar_sys>;
 	};
 
+	pp3300_mipibrdg: regulator-3v3-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_mipibrdg_en_pins>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
+	};
+
 	/* separately switched 3.3V power rail */
 	pp3300_u: regulator-3v3-u {
 		compatible = "regulator-fixed";
@@ -719,6 +789,48 @@ pins-wifi-kill {
 		};
 	};
 
+	pp1000_dpbrdg_en_pins: pp1000-dpbrdg-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO19__FUNC_GPIO19>;
+			output-low;
+		};
+	};
+
+	pp1000_mipibrdg_en_pins: pp1000-mipibrdg-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO129__FUNC_GPIO129>;
+			output-low;
+		};
+	};
+
+	pp1800_dpbrdg_en_pins: pp1800-dpbrdg-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO126__FUNC_GPIO126>;
+			output-low;
+		};
+	};
+
+	pp1800_mipibrdg_en_pins: pp1800-mipibrd-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO128__FUNC_GPIO128>;
+			output-low;
+		};
+	};
+
+	pp3300_dpbrdg_en_pins: pp3300-dpbrdg-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO26__FUNC_GPIO26>;
+			output-low;
+		};
+	};
+
+	pp3300_mipibrdg_en_pins: pp3300-mipibrdg-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO127__FUNC_GPIO127>;
+			output-low;
+		};
+	};
+
 	pp3300_wlan_pins: pp3300-wlan-pins {
 		pins-pcie-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO143__FUNC_GPIO143>;
-- 
2.38.1


