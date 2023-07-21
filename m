Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8A2C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TP+Zctkmo1+sVEUMhTumg/ppqu/vfAcabkGjt9un+cI=; b=I0zsA53MqiaTLA9RLWkdS4lgKc
	WSQ7ajnIC/a26+N44tMKb71p6VdCmU05mc96UB4bZHuZh0t7HtHJNXC+/ZBfqJ8JCc2RNNgWDwMkQ
	ia8XZR2176em7jSIqj0cm/Yonv5qsFNjWJa4cIFzhAqFFOtGJ4hbRVDtrdR4ZA1IDtf0jJcOuDZ2q
	LQ6fDLW9yB0DRCHRJKDEY2oabh14BUwqpS6G4CC0LESsX418ps3p0s58Xm8PaGYCTRX8hOaqV8cKB
	I+/gjUw8FDQ7FIsHC01RUsw76Fxd4BzBv4Hqe94JICZBzWkJAKXPgyHd9TMhuGbveVslugDUFhc99
	TAyHBdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlVD-00DN2D-28;
	Fri, 21 Jul 2023 08:28:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlV5-00DMwX-2D;
	Fri, 21 Jul 2023 08:28:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1629660709A;
	Fri, 21 Jul 2023 09:28:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689928111;
	bh=BVidntw4WSumarLqrqu9nRPaS3zqlQubYugq7T2Z6Lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWJ1uKGSJUvbCfz9wGn2aYA/MnFxOtz/6yrxod0OX7qfmXa1KeQJudjX0C14+uSlD
	 wfeVk18PCtwKE95J2Oa/LTAljA0agxFbPp9wH+IJn18OhWHjN72hXSovvg0L4xIjlg
	 mm3i39lcZVTQxhdVGJN1l+HjUacspRxxjhcSLfeildEly+PCHkAEp+hFO1LFLiaw0B
	 y6R5kOqSHB4WJgUo821Ut9O/i5SHlDsD7+AZjZdaxx31t5XYT11kazbaGfMKLNji2A
	 Q9ZB4bNIimCq0Gym+H07nZw+I/M2gqUQuqulL2DHZauWV415EpM5QbLCVzzDiicmEn
	 HNrMQ6mQp2/tg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
Date: Fri, 21 Jul 2023 10:28:21 +0200
Message-ID: <20230721082822.680010-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
References: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012835_851506_D531D746 
X-CRM114-Status: GOOD (  10.24  )
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

Add the relevant nodes for display backlight on Sony Xperia M5: this
needs both the SoC PWM IP and MT6332 PMIC LED strings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index b5746e6d0b15..ecdf00707a44 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -22,6 +22,23 @@ aliases {
 		serial1 = &uart1;
 	};
 
+	backlight_lcd0: backlight {
+		compatible = "led-backlight";
+		leds = <&disp_led_pwm>, <&pmic_bl_led>;
+
+		default-brightness-level = <300>;
+	};
+
+	led-controller-display {
+		compatible = "pwm-leds";
+
+		disp_led_pwm: led-0 {
+			label = "backlight-pwm";
+			pwms = <&pwm0 0 500000>;
+			max-brightness = <1024>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x1e800000>;
@@ -338,6 +355,21 @@ &pmic {
 	 * an interrupt on the companion, so we use the MT6332 IRQ GPIO.
 	 */
 	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6332-led {
+		compatible = "mediatek,mt6332-led";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic_bl_led: led@0 {
+			reg = <0>;
+			label = "backlight-pmic";
+		};
+	};
+};
+
+&pwm0 {
+	status = "okay";
 };
 
 &uart0 {
-- 
2.41.0


