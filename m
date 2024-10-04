Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EE1CFA775
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGNkAERzmbmhktLSThqm9IZzpYMeb4IRfHtIToZxK3U=; b=08U1RLFmLOJaQd
	LGawhAZERpQkS4oxX0hAhgVUiCMS25DkLzCPwTLvNpVxvvaDT6J5kU+NalpRA2xj3SzjI6DHkSNJQ
	okvpmOyXKV8bkmd8CmE7dAnT2mkQsf3hhMPDMuENgpBEZeafn+vVPHVA9WsiwO31R1MG0/Zg/pQG3
	muDa5TUtqlTI3Z9NffUMPDGKbfrKlMf7wQB5mqPOmmhbDv1r3QtAY4Y3nzlcTQgi8ffau63voo7FB
	JFgjPUsLNVrGRMGgOVNh7Sxz52PqVhKgx7L5Mku/I2jZxaWxkp4jDxZwkqNvNb0wOmPhUICY8tVt1
	LOP+z8KyyEh9ZD1XUw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swhwI-0000000CPnc-1zCo;
	Fri, 04 Oct 2024 13:01:46 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swhsY-0000000COvr-27Z5;
	Fri, 04 Oct 2024 12:57:57 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 77ED45FB6C;
	Fri,  4 Oct 2024 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728046671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGNkAERzmbmhktLSThqm9IZzpYMeb4IRfHtIToZxK3U=;
	b=wBzLlyEKIZFYvpGhovJM4fer3lSKPI3bViPYTbE8qet4hgTuXi5gBYPfjmp+EceXvjmwRR
	IJnOP+2tgiibVaR3j5xQY9xFzTJiZsCt5If6ny0gaSRS2lkdworvIJZZD13e3LZMp8jhtl
	XSJ7oZm7StU83yjhKqPuD2DE/6YoyNI=
Received: from frank-u24.. (fttx-pool-217.61.153.189.bambit.de [217.61.153.189])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id B1BF840040;
	Fri,  4 Oct 2024 12:57:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v1 4/4] arm64: dts: mediatek: mt7988: add pinctrl support
Date: Fri,  4 Oct 2024 14:34:18 +0200
Message-ID: <20241004123423.34519-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004123423.34519-1-linux@fw-web.de>
References: <20241004123423.34519-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: dd6e6c2b-f958-40c9-8efd-a8b3355d0527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_055754_861638_885534C8 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988a pinctrl node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 241 ++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index aa728331e876..096d11a002ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/mediatek,mt7988-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -105,6 +106,246 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7988-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			<0 0x11c10000 0 0x1000>,
+			<0 0x11d00000 0 0x1000>,
+			<0 0x11d20000 0 0x1000>,
+			<0 0x11e00000 0 0x1000>,
+			<0 0x11f00000 0 0x1000>,
+			<0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_tr",
+				    "iocfg_br", "iocfg_rb",
+				    "iocfg_lb", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 84>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+
+			mdio0_pins: mdio0-pins {
+				mux {
+					function = "eth";
+					groups = "mdc_mdio0";
+				};
+
+				conf {
+					pins = "SMI_0_MDC", "SMI_0_MDIO";
+					drive-strength = <MTK_DRIVE_8mA>;
+				};
+			};
+
+			i2c0_pins: i2c0-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c0_1";
+				};
+			};
+
+			i2c1_pins: i2c1-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c1_0";
+				};
+			};
+
+			i2c1_sfp_pins: i2c1-sfp-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c1_sfp";
+				};
+			};
+
+			i2c2_0_pins: i2c2-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c2_0";
+				};
+			};
+
+			i2c2_1_pins: i2c2-g1-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c2_1";
+				};
+			};
+
+			gbe0_led0_pins: gbe0-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe0_led0";
+				};
+			};
+
+			gbe1_led0_pins: gbe1-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe1_led0";
+				};
+			};
+
+			gbe2_led0_pins: gbe2-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe2_led0";
+				};
+			};
+
+			gbe3_led0_pins: gbe3-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe3_led0";
+				};
+			};
+
+			gbe0_led1_pins: gbe0-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe0_led1";
+				};
+			};
+
+			gbe1_led1_pins: gbe1-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe1_led1";
+				};
+			};
+
+			gbe2_led1_pins: gbe2-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe2_led1";
+				};
+			};
+
+			gbe3_led1_pins: gbe3-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe3_led1";
+				};
+			};
+
+			i2p5gbe_led0_pins: 2p5gbe-led0-pins {
+				mux {
+					function = "led";
+					groups = "2p5gbe_led0";
+				};
+			};
+
+			i2p5gbe_led1_pins: 2p5gbe-led1-pins {
+				mux {
+					function = "led";
+					groups = "2p5gbe_led1";
+				};
+			};
+
+			mmc0_pins_emmc_45: mmc0-emmc-45-pins {
+				mux {
+					function = "flash";
+					groups = "emmc_45";
+				};
+			};
+
+			mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+				mux {
+					function = "flash";
+					groups = "emmc_51";
+				};
+			};
+
+			mmc0_pins_sdcard: mmc0-sdcard-pins {
+				mux {
+					function = "flash";
+					groups = "sdcard";
+				};
+			};
+
+			uart0_pins: uart0-pins {
+				mux {
+					function = "uart";
+					groups =  "uart0";
+				};
+			};
+
+			snfi_pins: snfi-pins {
+				mux {
+					function = "flash";
+					groups = "snfi";
+				};
+			};
+
+			spi0_pins: spi0-pins {
+				mux {
+					function = "spi";
+					groups = "spi0";
+				};
+			};
+
+			spi0_flash_pins: spi0-flash-pins {
+				mux {
+					function = "spi";
+					groups = "spi0", "spi0_wp_hold";
+				};
+			};
+
+			spi1_pins: spi1-pins {
+				mux {
+					function = "spi";
+					groups = "spi1";
+				};
+			};
+
+			spi2_pins: spi2-pins {
+				mux {
+					function = "spi";
+					groups = "spi2";
+				};
+			};
+
+			spi2_flash_pins: spi2-flash-pins {
+				mux {
+					function = "spi";
+					groups = "spi2", "spi2_wp_hold";
+				};
+			};
+
+			pcie0_pins: pcie0-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
+						 "pcie_wake_n0_0";
+				};
+			};
+
+			pcie1_pins: pcie1-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
+						 "pcie_wake_n1_0";
+				};
+			};
+
+			pcie2_pins: pcie2-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
+						 "pcie_wake_n2_0";
+				};
+			};
+
+			pcie3_pins: pcie3-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
+						 "pcie_wake_n3_0";
+				};
+			};
+		};
+
 		pwm@10048000 {
 			compatible = "mediatek,mt7988-pwm";
 			reg = <0 0x10048000 0 0x1000>;
-- 
2.43.0


