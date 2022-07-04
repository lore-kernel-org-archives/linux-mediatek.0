Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D71AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgFzA/z0eEwqI9QxTuZCgbz3l0kWWHdrE7pIKBVdbWs=; b=OQok4GQI//pqdjlGmnyVvNkyTC
	67IL+6MnpwnkyuIHjj6m+2eSUAahZvYSwMzRQVYOEsrvBPbM197exAfOF83ilvwkBnp5gjDbkbOoy
	PfHrdcBMb1BDrPRMfdXlUBJF04rOPzaEYe7t1djaD7zHOkUlFfVi1q+7qtsNFa7v7HSCfE/T53NaC
	Y2xsMZ5RO47TLXJdNHRMeHAeCZmBePRWNh9h79Cog6repqxQdcQ75jvzszFgDg+2eUEcYBO23nn3d
	j+XpYGv3yw5Ln9zMM/BueVlERHfJHVGMSdXnnuoUTuIfZKeB+u9YZSWzsgy2ta+O7VR6yEKwRE3XS
	wqFsP3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JAA-006tG7-22; Mon, 04 Jul 2022 10:18:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5P-006pjp-9D; Mon, 04 Jul 2022 10:13:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8ACA2660198D;
	Mon,  4 Jul 2022 11:13:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929619;
	bh=F4XTdpmeLLBzARBbsr/g15mmfE1S0Zdj681HWBdHZeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFRDuScIM3T486D9EEH82Z/qHJcrJPM/Lfi6d7nloU0tYn2zk67XnE6IGPu5Wc++1
	 dKHIgzZILXIhcrfwlpb/o8irqlQyCIzm4k0sx6XC+zZ/JHu1crgXt3lil6n8074sBB
	 /lDQU5u9uYrR9VzTZoUEuqS0yb3tm6Je5M6BDT9NoL7fd87XJTtFt/+Im/y/JMBbkT
	 FCTDpb8aCdpT/r0Gqqm2OVDokULmlZyOimXDL/i+eu+IrwJrjnrvSyOs3SSFiC8D6f
	 c4s2HFka0bjPcVZ9p9+pwkMaTP8/FJolTVH2io/ERk/0qVHf2Cjtlk3J9y3Ar8WwDf
	 IZstoYHSCp81w==
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
Subject: [PATCH v2 11/11] arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4
Date: Mon,  4 Jul 2022 12:13:21 +0200
Message-Id: <20220704101321.44835-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031347_496921_6962F3BA 
X-CRM114-Status: GOOD (  11.58  )
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

This platform carries a HID compatible I2C touchscreen on the i2c4 bus,
but it may be at a different address, depending on the board model.
Add the node for a touchscreen at 0x10, but enable it only in the
final board dts.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  4 +++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  4 +++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  4 +++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 28 +++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 7ca344ccc225..3348ba69ff6c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -9,3 +9,7 @@ / {
 	model = "Acer Tomato (rev1) board";
 	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
 };
+
+&ts_10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index eb80f23273aa..4669e9d917f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -29,3 +29,7 @@ pins-low-power-pcie0-disable {
 		bias-pull-down;
 	};
 };
+
+&ts_10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
index f9cdda07da88..5021edd02f7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -30,3 +30,7 @@ pins-low-power-pcie0-disable {
 		bias-pull-down;
 	};
 };
+
+&ts_10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2c8b760d0da1..fcc600674339 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -145,6 +145,18 @@ &i2c4 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins>;
+
+	ts_10: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		hid-descr-addr = <0x0001>;
+		interrupts-extended = <&pio 92 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		post-power-on-delay-ms = <10>;
+		vdd-supply = <&pp3300_s3>;
+		status = "disabled";
+	};
 };
 
 &i2c5 {
@@ -609,6 +621,22 @@ subpmic_pin_irq: pins-subpmic-int-n {
 			bias-pull-up;
 		};
 	};
+
+	touchscreen_pins: touchscreen-default-pins {
+		pins-int-n {
+			pinmux = <PINMUX_GPIO92__FUNC_GPIO92>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+		pins-rst {
+			pinmux = <PINMUX_GPIO56__FUNC_GPIO56>;
+			output-high;
+		};
+		pins-report-sw {
+			pinmux = <PINMUX_GPIO57__FUNC_GPIO57>;
+			output-low;
+		};
+	};
 };
 
 &pmic {
-- 
2.35.1


