Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB956C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvD2GjUyC+OJf+V+Q+0aeoi4zClYZchENPXtjkdARBA=; b=VgXPOmCxIBcvjdzYgkYKLIcyF3
	U2nVjGuSz73xXBLXTQaPz3nPwF6SndQMi+GIsWkzbU8K0GFvvOmi9b6MNWQTphEyzB4UL6DylmWZn
	cQ8q6ncRr3EcyFa4UGhZQnL9FyiJnkMooxEu7N0Blvfl195lQdnONnjig/A6JBwAcgw485cr7z5S4
	2FAJ9rIDm0d2XbrZN04GPhqsfWFGfuWGndiUD3Z82y6kOETHlq43qnsEIlZb+4MOelTfK7lQgT1Hu
	UZOqkSoz+yB7lBjjSNQ+aP7qsELzrSdeuuYl4XSHG5//V7txCrlfUR+xRT9XSPAmftz7JIeegLg16
	l/Px7UFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiOH-00AIrh-2x;
	Mon, 27 Mar 2023 08:39:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLm-00AHCo-34;
	Mon, 27 Mar 2023 08:37:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F17726603100;
	Mon, 27 Mar 2023 09:37:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906229;
	bh=ucKptTRH40q7Kj2bw2zloSjqxJ0pG6yGrjzKJ5KlYwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dh3DyE+D44Hnu3lYslkkV836PvJsUsswIKehfJ4XsNcNoMbBl7ZvgCDmo47pxkbCl
	 8B++vRrrhvIGdQTs1efvrFpxT32Zg1KImKqVuk+am61tMyfE1SIUfBcTIN01iROXXL
	 iS2kG6A7avLyaeWV835WfssRgVn+PzSw0+XwhwiFJ+btHl4O/+ts40QsKBKvEjSFV2
	 X+1sXLOVLb5cICwYgG+9PD0eh4HVgStG9BLe5Tklejqql81HUDaR3OM4YPoLjDvue2
	 iVIlcDbbeYWLYr6EgoTbI9nsCAYChLOtYrW5eAB+ODl2Lpqzy9FMv7OL0a7hsvouT4
	 XGuZOCcz/w3vw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 17/17] arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
Date: Mon, 27 Mar 2023 10:36:47 +0200
Message-Id: <20230327083647.22017-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013711_138286_EE8B58EA 
X-CRM114-Status: UNSURE (   9.57  )
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

Add support for the NXP PN547 NFC chip found on this smartphone and
configure its pins.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index bff0760cc1c8..8f00232e7348 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt6795.dtsi"
 
 / {
@@ -112,6 +113,16 @@ magnetometer@0x12 {
 		reg = <0x12>;
 	};
 
+	pn547: nfc@28 {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x28>;
+		interrupts-extended = <&pio 3 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_pins>;
+		enable-gpios = <&pio 149 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&pio 94 GPIO_ACTIVE_HIGH>;
+	};
+
 	proximity@48 {
 		compatible = "sensortek,stk3310";
 		reg = <0x48>;
@@ -122,6 +133,19 @@ proximity@48 {
 };
 
 &pio {
+	nfc_pins: nfc-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO3__FUNC_GPIO3>;
+			bias-pull-down;
+			input-enable;
+		};
+
+		pins-fw-ven {
+			pinmux = <PINMUX_GPIO94__FUNC_GPIO94>,
+				 <PINMUX_GPIO149__FUNC_GPIO149>;
+		};
+	};
+
 	ts_pins: touchscreen-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
-- 
2.40.0


