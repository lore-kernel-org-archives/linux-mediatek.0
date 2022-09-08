Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B67C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIhT2aKNAtYkQrtbcOhYJcV6kFI7Ila69lV8ymwYPiE=; b=BS9uwiv3tuNzwG4sKnZmI3kSOh
	IKWeLrgA3b7ngEOMK9Gy1Vdqi6mQTHzHpfOqP5IhaXqhT4ODbFRpk+MCumAsk66PhuvRBMMRjxdZi
	NC4e9vJ/aCzZOyNAQ5XOP/bySQZui2KdvinpVeonYTSg2SO/LDToHfRA7O87kzgbklmH7LQbJs8CM
	VesLrEkvbEfRrUKqMSg3q4eppKc4Lsb/OSdbY64S5JzlWqyDmRwF/2boINlg5MHIdFclHVQ/UQfrf
	FXWEjIuntk1TvosXLHG/IC+KGt7PUQyQ3IUDHWIGgdgeNed5H8HL+ne6pk8HlMpyFCBEaa2HnacjH
	W0Y0puYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL6K-006BMg-VT; Thu, 08 Sep 2022 17:14:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL4L-0069ZV-TZ; Thu, 08 Sep 2022 17:12:03 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0AACD6601FA8;
	Thu,  8 Sep 2022 18:11:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662657120;
	bh=tCLoDMHCGsfN19AdOHQQnTF1e0UrnGsePgOOtqnqe10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Io7NRETv7li8kv2CaqgkE0SvYcrV9BAHk9wa+4I/BtX77uBU9JeVamgWhup4V6igE
	 srZccw/DxikEZKXS0hswSTd7IvkagOuCnsielUG+3SB0eG5znY68DmKhLlF9uDZz6n
	 60ChwN2KG1qPr1n0jTSA2Gjmxa7mjr0X9DBlIoOFisv7A2HZmKrpiqWNvKmSJPcj6G
	 pmf7l/5YE0dUMHdsBc+t/Gsy4m5tHKAiGUJwzYy4r+7hMj+BJTQRcrlwWJ7PKMPNos
	 fje0+4ofCQfXgPKweWGPgzhYwEc0zcZRj9eRJHeAIr9TrdJIleZEGXzErRXhGENdS2
	 35XhYF8S2VLVA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] arm64: dts: mediatek: asurada: Add display regulators
Date: Thu,  8 Sep 2022 13:11:51 -0400
Message-Id: <20220908171153.670762-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908171153.670762-1-nfraprado@collabora.com>
References: <20220908171153.670762-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_101202_235626_FFB4D96F 
X-CRM114-Status: GOOD (  11.00  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 4b314435f8fd..1d99e470ea1a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -23,6 +23,42 @@ memory@40000000 {
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
+	};
+
+	pp1800_dpbrdg: regulator-1v8-dpbrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_dpbrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_dpbrdg_en_pins>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 126 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* system wide LDO 1.8V power rail */
 	pp1800_ldo_g: regulator-1v8-g {
 		compatible = "regulator-fixed";
@@ -34,6 +70,30 @@ pp1800_ldo_g: regulator-1v8-g {
 		vin-supply = <&pp3300_g>;
 	};
 
+	pp1800_mipibrdg: regulator-1v8-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_mipibrdg_en_pins>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 128 GPIO_ACTIVE_HIGH>;
+	};
+
+	pp3300_dpbrdg: regulator-3v3-dpbrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_dpbrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_dpbrdg_en_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 26 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* system wide switching 3.3V power rail */
 	pp3300_g: regulator-3v3-g {
 		compatible = "regulator-fixed";
@@ -56,6 +116,18 @@ pp3300_ldo_z: regulator-3v3-z {
 		vin-supply = <&ppvar_sys>;
 	};
 
+	pp3300_mipibrdg: regulator-3v3-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_mipibrdg_en_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* separately switched 3.3V power rail */
 	pp3300_u: regulator-3v3-u {
 		compatible = "regulator-fixed";
@@ -719,6 +791,48 @@ pins-wifi-kill {
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
2.37.3


