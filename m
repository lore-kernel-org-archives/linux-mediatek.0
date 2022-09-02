Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6040CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGCd4iXOa48GT8qUsI0FUdQGvf6RC/lXIp8aTZLwEA4=; b=MQZPaWOphjCFg4mNlneYzvfrHB
	FC70tp/O7gG1lZpFIORgeaMIuJYnkZCj1rNupfh01UuZpaYFQLsIuOV6yWajt2xgm+OwSWBnEIfTE
	7x+1LR+w/L/32pjlK6Dio3zH/QqCvlxrR9NHjB0qNqjC88pyCV4Cop5rndRxK7dpMrBebvM4x3fa6
	SclyKJJrKcIDZrExEYj2W+pz9z3AmFxyfcsDzy7XBC25QmrdSwgWxxoScFnRmsvhoF10MVGJxP9CW
	Qutk7tQof6yFtnOr7nkjhv4Pt3yIHkBQ5ogXEYpRDCTVG9RouSqEQd2/VCRcfK1W5F1U+Mi3hkzia
	XUipA+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1oG-001h2m-N6; Fri, 02 Sep 2022 08:13:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1mk-001fzf-Qb; Fri, 02 Sep 2022 08:12:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7575F6601F09;
	Fri,  2 Sep 2022 09:12:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106334;
	bh=4LxPwcVeTnZVaB30DwcaoVYhEeK36Lo9JgoJohkej1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+PfIFB+Tp4aImPoC1HbSDaSIOeVts+B3905EULsfoDYB3tzFSLz6jrtBr2kFxgiH
	 Q6BSWoGfmNnWzb4q5UbAqYO+tZFv8/MFhC8r78gERpYGMP4pdKK0jvRtWDy1Wi9mjc
	 1Lf3kjef9Q7Pz1OsXyFT2LU1VMMtPwcuDdxA3vCGuwyIBB+uF5bDoJIb1z28tS+50P
	 CfpbyaLz6s118POTTIZAzxvoH2u2Ld1eJ3w692oTMLNiZSUHfuGfv8yKtzpAaIKtep
	 6IHLvErbgETuEwIX10CWewHodnxwXtBaVOpP3oJu6QcMZq45KUY4BLTFuVYz3mentS
	 mAeAvhk5GG+7Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 6/7] arm64: dts: mediatek: cherry: Enable Elantech eKTH3000 i2c trackpad
Date: Fri,  2 Sep 2022 10:11:55 +0200
Message-Id: <20220902081156.38526-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011219_029690_E1B5B2A9 
X-CRM114-Status: UNSURE (   9.46  )
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

The Cherry platform uses an Elantech touchpad/trackpad: enable
probing it at address 0x15 on I2C1.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 0654a28e6782..ee59619068d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -134,6 +134,16 @@ &i2c1 {
 	i2c-scl-internal-delay-ns = <12500>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
+
+	trackpad@15 {
+		compatible = "elan,ekth3000";
+		reg = <0x15>;
+		interrupts-extended = <&pio 6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
+		vcc-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
 };
 
 &i2c2 {
@@ -710,6 +720,14 @@ subpmic_pin_irq: pins-subpmic-int-n {
 		};
 	};
 
+	trackpad_pins: trackpad-default-pins {
+		pins-int-n {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	touchscreen_pins: touchscreen-default-pins {
 		pins-int-n {
 			pinmux = <PINMUX_GPIO92__FUNC_GPIO92>;
-- 
2.37.2


