Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47937C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4Sjt2K9FqbtOAKp1csCu0Oo/PQS/Y32V6GmBniW5fo=; b=PT1rN4YuYwiFp3sspUyg51oF73
	tnUZkOyEDXP7db1hSE08FPJvkRC7Et63NoRcAKX0fpTUxgqPLQ5oXDEFX84MbeKEKMZ41YaAWgXT+
	cYj+Srzi/Bcp2QaogKopAVKeXmLaOJJWSniHuhNMmSQJtfCSltwpaaoj452dCooJdP5eUQbCmwPVU
	jq9RkbcS6VF2dzsiWpgYq3vVk2O0/MrbGgB9jaYKfSTtBaNsrGpdX4g+plRTVsbTuxHctRY8JeRsT
	uEQFZQMNrvmfCPIE9zowzPPzfHwddg4BRpDSx5cGZ8YxpWMFSa13xvBlTN7UFQHN9APpxB/8TOrVe
	0uBh/9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aEo-00Csw2-U8; Wed, 29 Jun 2022 16:08:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a77-00CoeD-CU; Wed, 29 Jun 2022 16:00:26 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 057AA6601A28;
	Wed, 29 Jun 2022 17:00:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518424;
	bh=gqdq1+xz9/LOr4x7zjy0Q3+2j4Bwrp8jWZIH9ix1isE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJB2DZI25Uezk14CTkd4yAkAz0+oE4+EXH2g0f59vZgs5JIdEd1epUZS0U8pJc0AI
	 65y+l2bKNEx8qd40agBs44u5rvqSjq2Z5h84khUSJUkp/SrPpIYj51E7xyiJXu6Bmn
	 LPqkuuRFNlIYs7T3ArzN/CEN692EKy4FxevXo5v6W5fgDlBIf2f6bIQMYRamuA3wFK
	 qDgJ0YqwGpmz34uNGYM1Y9wXrDKAthDGYvstTNdmxhQ2WMVcqiU6x6cyfwdvfK20KP
	 9NEckruvJi+YNtZNexa4Ka5DpjhK9fd92cEu9ieT/9eKMdxe1xssJBYERbBlpes0xU
	 At69IliUbtFgg==
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
Subject: [PATCH v4 14/19] arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
Date: Wed, 29 Jun 2022 11:59:51 -0400
Message-Id: <20220629155956.1138955-15-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090025_615509_C3875221 
X-CRM114-Status: GOOD (  13.66  )
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

Enable MT8192's PCIe controller and add support for the MT7921e WiFi
card that is present on that bus for the Asurada platform.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

(no changes since v3)

Changes in v3:
- Renamed regulator node to be generic

Changes in v2:
- Added this patch

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 69bb43f7b346..e59c178d3d26 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -66,6 +66,19 @@ pp3300_u: regulator-3v3-u {
 		vin-supply = <&pp3300_g>;
 	};
 
+	pp3300_wlan: regulator-3v3-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_wlan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_wlan_pins>;
+		enable-active-high;
+		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* system wide switching 5.0V power rail */
 	pp5000_a: regulator-5v0-a {
 		compatible = "regulator-fixed";
@@ -84,6 +97,17 @@ ppvar_sys: regulator-var-sys {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi_restricted_dma_region: wifi@c0000000 {
+			compatible = "restricted-dma-pool";
+			reg = <0 0xc0000000 0 0x4000000>;
+		};
+	};
 };
 
 &i2c0 {
@@ -144,6 +168,28 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 };
 
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+
+	pcie0: pcie@0,0 {
+		device_type = "pci";
+		reg = <0x0000 0 0 0 0>;
+		num-lanes = <1>;
+		bus-range = <0x1 0x1>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi: wifi@0,0 {
+			reg = <0x10000 0 0 0 0x100000>,
+			      <0x10000 0 0x100000 0 0x100000>;
+			memory-region = <&wifi_restricted_dma_region>;
+		};
+	};
+};
+
 &pio {
 	/* 220 lines */
 	gpio-line-names = "I2S_DP_LRCK",
@@ -430,6 +476,34 @@ pins-bus {
 		};
 	};
 
+	pcie_pins: pcie-default-pins {
+		pins-pcie-wake {
+			pinmux = <PINMUX_GPIO63__FUNC_PCIE_WAKE_N>;
+			bias-pull-up;
+		};
+
+		pins-pcie-pereset {
+			pinmux = <PINMUX_GPIO64__FUNC_PCIE_PERESET_N>;
+		};
+
+		pins-pcie-clkreq {
+			pinmux = <PINMUX_GPIO65__FUNC_PCIE_CLKREQ_N>;
+			bias-pull-up;
+		};
+
+		pins-wifi-kill {
+			pinmux = <PINMUX_GPIO145__FUNC_GPIO145>; /* WIFI_KILL_L */
+			output-high;
+		};
+	};
+
+	pp3300_wlan_pins: pp3300-wlan-pins {
+		pins-pcie-en-pp3300-wlan {
+			pinmux = <PINMUX_GPIO143__FUNC_GPIO143>;
+			output-high;
+		};
+	};
+
 	spi1_pins: spi1-default-pins {
 		pins-cs-mosi-clk {
 			pinmux = <PINMUX_GPIO157__FUNC_SPI1_A_CSB>,
-- 
2.36.1


