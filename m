Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71FBC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSdo2kHANOHFjYH72V15LpcXuJ+OLhU2YGt0rmk+gMc=; b=4jjIgw/Qkcgf2IklalfnV2xFW6
	Wnko9KEBor87/N+LlM+aiugT8xJkiEiLj8NwUX3VyEYhh4/kfEAJALIMDNSi6X6O6PJO4kidPPdZq
	DgLQgCsyuWVzTizy42y9QSj6YEG++Ah02CLhfOw6r1tij4Q2AU2PASkFFJ7r4HpOs1A+n38fdblFY
	P9jOUzM1ARbazluFcHPwT9tADxqUlGWH2u8K6WGrUT+f2n1XUWqGx7w7eUdwJnqJE44aw33By+vWo
	9+T8Xh9cGicRI0O787X89PR9l4nRzt/xirP7761QbW7cm9fq5E0+GFYq3/jcDfkk/Iterl5TaslIW
	rokrPU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWbS-007Hzp-Qi; Thu, 21 Jul 2022 13:52:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWRr-007CPK-Sf; Thu, 21 Jul 2022 13:42:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5AB8D6601AAE;
	Thu, 21 Jul 2022 14:42:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658410954;
	bh=akTb+gtu7ReGU7vaNrXZI/GzP5obrfG91xyx1IuWCT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y80YZP2S/6CF3IswsEqGwn3wtC0MpOrFK8QfIWWO1/6JCSR7ztz+LzVSO8296vSfB
	 CMEpRj39aea0i2ZYb+jIIWtBpCspZK9iKSMLwvhI+wf0B8ObD38rRgOX9qLqKOcsbc
	 MFftWcYIc3t9lgt+B8vrBwWGgkeK9LooeNH/gyKzfawBYazMO5RyhaplrrmRG+1jxy
	 VYA0acB+ULdpIBfaqTtVRTHY/ogDJMSkyJ/le2fqblWP9ohkLup7ZrnCpF5SStL2yB
	 ulM49iOcPewfTVMqmYD9CnaqAOU5klDURHZ409dMwBbPFO/09fe76Cf+P0vdlGGSoB
	 nAnN8oU/PJGkw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/8] arm64: dts: mediatek: cherry: Enable Elantech eKTH3000 i2c trackpad
Date: Thu, 21 Jul 2022 15:42:25 +0200
Message-Id: <20220721134228.310178-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
References: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_064240_126277_3B353FC0 
X-CRM114-Status: UNSURE (   8.70  )
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
---
 .../arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 8859957c7b27..58349d4c3c8b 100644
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
@@ -727,6 +737,14 @@ subpmic_pin_irq: pins-subpmic-int-n {
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
2.35.1


