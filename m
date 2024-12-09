Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59812E7717D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9hJbrCkID9njK8gmR7wgNylWfvZwjtKiOfcT9fad1M=; b=VEv5E73cO4joiF
	N1RsVk93Z+QTyu7MDE2OiOP67ClhBBAJqrd1FBUQ/E9dJderJ5bKsPmYyFoQfALL0FUyWynM72KIf
	X29qCwjfXXKjaOwnjzRS7f4H5FgPAnc7b9mLhmMVZoy32XNqoNBcE0DjR1dPkV5P8ckywqrTqqR9C
	lTRPj9pMunV3ikb3s+29VzZ4T9jvbG/GkbjtveHGrWCh38M8Nc8Z/izz2ReNaNlByNyvAe2Hw3WHu
	ExTIZcGcdDegE4H9KBgInNAu6BhPvDVg7SlTtrnzREy6gvdd/yRDMnvY8JAeqooomobuvOwWn2+rW
	fIxH71soQZF+LzqWm2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdfX-00000007wM0-1k6L;
	Mon, 09 Dec 2024 13:19:23 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdKt-00000007pO4-0F60;
	Mon, 09 Dec 2024 12:58:04 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 67ACE40723;
	Mon,  9 Dec 2024 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733749079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9hJbrCkID9njK8gmR7wgNylWfvZwjtKiOfcT9fad1M=;
	b=O6Uvkgqv1oJwuBmp6sexddoNuLPM93k5VMZ2x15satRQe9lMa7TFbCb6UgHi1EonJcJA0b
	WMZtWVSqKmcv1BqIyEmCslFxD0xFEuDhnLYObCSg0Ih2tNNLa+PQa6AsU3ADvqCpN+qP6w
	RraGpOcEmTfM+7NVwQzyzHHHBEbAA5E=
Received: from frank-u24.. (fttx-pool-80.245.75.28.bambit.de [80.245.75.28])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id A755980494;
	Mon,  9 Dec 2024 12:57:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v6 5/5] arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4
Date: Mon,  9 Dec 2024 13:57:39 +0100
Message-ID: <20241209125742.9307-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209125742.9307-1-linux@fw-web.de>
References: <20241209125742.9307-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 6844d47c-33ba-424d-875d-d13ee78b957c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_045803_388033_C1F32319 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add board specific pinctrl configurations on Bananapi R4.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes in v6:
- fix typo
- start title uppercase
- use bpi-r4 prefix
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index efc4ad0b08b8..aa2dabc041fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -9,3 +9,192 @@ / {
 	model = "Banana Pi BPI-R4";
 	chassis-type = "embedded";
 };
+
+&pio {
+	mdio0_pins: mdio0-pins {
+		mux {
+			function = "eth";
+			groups = "mdc_mdio0";
+		};
+
+		conf {
+			pins = "SMI_0_MDC", "SMI_0_MDIO";
+			drive-strength = <8>;
+		};
+	};
+
+	i2c0_pins: i2c0-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c0_1";
+		};
+	};
+
+	i2c1_pins: i2c1-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_0";
+		};
+	};
+
+	i2c1_sfp_pins: i2c1-sfp-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_sfp";
+		};
+	};
+
+	i2c2_0_pins: i2c2-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_0";
+		};
+	};
+
+	i2c2_1_pins: i2c2-g1-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_1";
+		};
+	};
+
+	gbe0_led0_pins: gbe0-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led0";
+		};
+	};
+
+	gbe1_led0_pins: gbe1-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led0";
+		};
+	};
+
+	gbe2_led0_pins: gbe2-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led0";
+		};
+	};
+
+	gbe3_led0_pins: gbe3-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led0";
+		};
+	};
+
+	gbe0_led1_pins: gbe0-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led1";
+		};
+	};
+
+	gbe1_led1_pins: gbe1-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led1";
+		};
+	};
+
+	gbe2_led1_pins: gbe2-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led1";
+		};
+	};
+
+	gbe3_led1_pins: gbe3-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led1";
+		};
+	};
+
+	i2p5gbe_led0_pins: 2p5gbe-led0-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led0";
+		};
+	};
+
+	i2p5gbe_led1_pins: 2p5gbe-led1-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led1";
+		};
+	};
+
+	mmc0_pins_emmc_45: mmc0-emmc-45-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_45";
+		};
+	};
+
+	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_51";
+		};
+	};
+
+	mmc0_pins_sdcard: mmc0-sdcard-pins {
+		mux {
+			function = "flash";
+			groups = "sdcard";
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		mux {
+			function = "uart";
+			groups =  "uart0";
+		};
+	};
+
+	snfi_pins: snfi-pins {
+		mux {
+			function = "flash";
+			groups = "snfi";
+		};
+	};
+
+	spi0_pins: spi0-pins {
+		mux {
+			function = "spi";
+			groups = "spi0";
+		};
+	};
+
+	spi0_flash_pins: spi0-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	spi1_pins: spi1-pins {
+		mux {
+			function = "spi";
+			groups = "spi1";
+		};
+	};
+
+	spi2_pins: spi2-pins {
+		mux {
+			function = "spi";
+			groups = "spi2";
+		};
+	};
+
+	spi2_flash_pins: spi2-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi2", "spi2_wp_hold";
+		};
+	};
+};
-- 
2.43.0


