Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A01C282C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sym4lHtfWHbXPcWM2Dn2VFNqxHkczqaPp7c3p8UqtY=; b=cA8kA6bT1oscaYT2eCHDG9AJAy
	F3L9eMNrm7QFEhTBp4QXYPLJ5FaK2iDD9W3YWhzvCe4txWpY+In4fEb/07a/a7Oed2NmLzPr/BStg
	+ZWVjZg5BF/13IM+w+qHowiuXrUVjYclKZupTYGvgxcc82B0YAmj9uhuy7U0vNTjNYVNaUX9ti1Gq
	OSYt07QrOz0Z8orsH52vXaIlp9yB35iWczDV7VQhtpveWcejmRH3Z+GiZFHYFEw7EH+xBWldVAT2L
	CTSA3+c+uFUj+xOafPP/cz1oGuz9+gyzpTBv5eWBQESw04fFPMlekFcG0T2BE4a5TI6OXAFlaJcNG
	L9yfZVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpStW-00000004txF-46Fm;
	Tue, 04 Mar 2025 14:05:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSqO-00000004tJK-10Hu;
	Tue, 04 Mar 2025 14:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741096918;
	bh=pq3KZLjVtYgG3QJjA0gfc0ATstLTL4U024ZZLEq+S30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jOOUnhh7ghUI7j0/Rzy79CJhgMGKYVh8gNeUQyN3tI+o1DY+O4FTOn2G8cbBVD3fN
	 16B2GZdaUK9f53fxgfmB7n+bq+AWzsF74bV7UCayIDzYLfvWKZYxsv5lesh0NtjQJg
	 eGGcPU+2mEf3C60V8JeKC0YHHxtEPt7Ovccp8hj8hkGN0priJUtbel9GJ/xkUHvFfX
	 byrmL+bIbkRyJXjMGoYgQzCbB3GVnbO1DNSOI55K8YpIYmXnCnCH6Fn73eCYNTUm3w
	 JYmmRFDOEXApUgTSYjx5P2Od7fRzx/h4GSXAH/aMos2nzz3EgnE7LPkXWhVTHeA9ZX
	 gHxZUc4IfUSDw==
Received: from apertis-1.home (2a01cb0892F2D600C8F85cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF2EE17E0B56;
	Tue,  4 Mar 2025 15:01:57 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 04 Mar 2025 15:01:55 +0100
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI
 DSI port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-radxa-panel-overlay-v2-1-3ee6797d3f86@collabora.com>
References: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
In-Reply-To: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_060200_428133_9A539286 
X-CRM114-Status: GOOD (  11.06  )
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

This board can use a MIPI-DSI panel on the DSI0 connector: in
preparation for adding an overlay for the Radxa Display 8HD,
add the backlight, and some definitions for pins available
through the DSI0 port.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 7184dc99296c7f5d749c7e6d378722677970b3b7..1c922e98441a1aadf0aa3cdd76583a70401a1fa3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -48,6 +48,18 @@ memory@40000000 {
 		reg = <0 0x40000000 0x1 0x0>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 1023>;
+		default-brightness-level = <576>;
+		enable-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
+		num-interpolated-steps = <1023>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi0_backlight_pins>;
+		pwms = <&disp_pwm0 0 500000>;
+		status = "disabled";
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -502,6 +514,13 @@ &mt6359_vsram_others_ldo_reg {
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 
+	dsi0_backlight_pins: dsi0-backlight-pins {
+		pins-backlight-en {
+			pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
+			output-high;
+		};
+	};
+
 	eth_default_pins: eth-default-pins {
 		pins-cc {
 			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
@@ -699,6 +718,13 @@ pins-irq {
 		};
 	};
 
+	panel_default_pins: panel-pins {
+		pins-rst {
+			pinmux = <PINMUX_GPIO108__FUNC_GPIO108>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_default_pins: pcie0-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
@@ -717,6 +743,12 @@ pins-bus {
 		};
 	};
 
+	pwm0_default_pins: pwm0-pins {
+		pins-disp-pwm {
+			pinmux = <PINMUX_GPIO97__FUNC_DISP_PWM0>;
+		};
+	};
+
 	spi1_pins: spi1-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
@@ -737,6 +769,19 @@ pins-bus {
 		};
 	};
 
+	touch_pins: touch-pins {
+		pins-touch-int {
+			pinmux = <PINMUX_GPIO132__FUNC_GPIO132>;
+			input-enable;
+			bias-disable;
+		};
+
+		pins-touch-rst {
+			pinmux = <PINMUX_GPIO133__FUNC_GPIO133>;
+			output-high;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,

-- 
2.48.1


