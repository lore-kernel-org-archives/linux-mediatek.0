Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C378FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSHKeTsfQYEIk4ez/phdKACrKIghP4OTYzUyD0eVILE=; b=FLO8pBXCXinsCw
	wMmh8Fb6ZlL2z2RRA+7gH2xCXKOdAp2BWTdislfSkEKG4L5bulPtZ7K2b8tubBDxEuGSGzH5dlcMV
	BFzRFMs/g3RE+8AVY4gdGl9OLX0sVoOjneT+Csb8+YRF9LSBj5LXuBWiIt9zhKZoBB1h+0G0zLwQb
	3XbUjDu8CjuOjZ9N1TPETickvTgqooLWOSwuUJFC5P+Lvnw38h5W13i6akn07Ocz2uJrJyvWxIRGO
	qEMF7PIi0YFirc/HVl9tFgo/Xrn2DKOWipRV3X6UeI3uWM14W4g2YRI3kauQIUSaKfvRtX4zzQx6G
	CADFq9g63Y3fWOzBE/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLU1-00Ehbv-Og; Tue, 26 Apr 2022 13:44:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLS0-00EgZc-44
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:41:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id j15so12289167wrb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K24pI48bckEH3Y3oSHXKjeqIQ2pS3pf+1QNVp3L1AGk=;
 b=i08Wa0+I8vFqudmLcKEpFUrwdRPyrrmNGYg9ArqPlVQA/tJVlnOobY+g4E4P6S+h3a
 R1H604yOHa5tAQ3PBTVTS74d67hDZNWH9/AIcx/LeoAfVE1+xz9gbna3tKAl4ojTqdvq
 5fCqS2TFR6WdzG6e8JXN9436Js/xK4YQo7zWW80kJ8mIGzxu4Cb/qoBOHtrUib3MC59c
 3hQLeOBI8OdAsq1BY9dLfVUcN2r1t/hSwEcGDfZKGuR+c38WYBj86mt3jqhVHs3DVfQk
 L3Mh3OG2rE0gkT0QyrpsxkNvQWBHAkNCFjUOHP/4M5fy+CvoarAXjTvWpO8ZE4i5CKcS
 bvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K24pI48bckEH3Y3oSHXKjeqIQ2pS3pf+1QNVp3L1AGk=;
 b=rp/Sz5iagOk3ykVaUh08imcP8HjO9OCqjQNNYWtTmEKiyHgGU0nDmOLT9VVi1vMsxy
 rTpFLa9N1TVpPyxFI0hqMda2kA0c5Js4bzbJKz2V752iA0a8mCVQfjrGUK3XpcuJ3NVZ
 ccpdYcBEO/n9mZM+T9/RZ80zXyplIwmJIzS6aFRlvdJ5D5VLiN0lplg7FPAI7nWXVVap
 W7vLaN01zj2+wVWGBKesZSyqT47oSggk3HfIaQEeRoA9j1tq8aFU2q8HMuxCx8b8GuGW
 pCT24E9fD/dC2+F5k63Gmkd26H8BB+r+/9jAqArpzECPqO3C8hu0SRtddJFgaHgAY3i5
 w0ow==
X-Gm-Message-State: AOAM533KNA9HeTGxPTbOj4F47+TmFaQ0rQSMUqJ8oxXZSrWl0LvRFQXK
 nxBIRwbl/aFjyNyunjOuqLg00Q==
X-Google-Smtp-Source: ABdhPJwTqjD7xukDeJkwtYT17PIwAxavld4VVDUXrUeGccOnlqTLBHELXQALY+5oCYTdLFIgdPaRCg==
X-Received: by 2002:a5d:6301:0:b0:205:cb42:74a5 with SMTP id
 i1-20020a5d6301000000b00205cb4274a5mr18242860wru.385.1650980513022; 
 Tue, 26 Apr 2022 06:41:53 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:52 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: mediatek: mt8195-demo: enable ethernet
Date: Tue, 26 Apr 2022 15:41:03 +0200
Message-Id: <20220426134106.242353-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426134106.242353-1-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064156_279049_2D1598CF 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable ethernet on the MT8195 demo board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 108 +++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 08cab3b3943b..0b7985486e2a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -80,6 +80,30 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&eth {
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&eth_phy>;
+	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 10000>;
+	mediatek,tx-delay-ps = <2030>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_default_pins>;
+	pinctrl-1 = <&eth_sleep_pins>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: phy@1 {
+			compatible = "ethernet-phy-id001c.c916";
+			#phy-cells = <0>;
+			reg = <0x1>;
+		};
+	};
+};
+
 &i2c6 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c6_pins>;
@@ -260,6 +284,90 @@ &mt6359_vsram_others_ldo_reg {
 };
 
 &pio {
+	eth_default_pins: eth-default-pins {
+		pins-cc {
+			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
+				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
+				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
+				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+
+		pins-mdio {
+			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
+				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
+			input-enable;
+		};
+
+		pins-phy-reset {
+			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
+		};
+
+		pins-power {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			output-high;
+		};
+
+		pins-rxd {
+			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
+				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
+				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
+				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
+		};
+
+		pins-txd {
+			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
+				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
+				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
+				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+	};
+
+	eth_sleep_pins: eth-sleep-pins {
+		pins-cc {
+			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
+				 <PINMUX_GPIO88__FUNC_GPIO88>,
+				 <PINMUX_GPIO87__FUNC_GPIO87>,
+				 <PINMUX_GPIO86__FUNC_GPIO86>;
+		};
+
+		pins-mdio {
+			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
+				 <PINMUX_GPIO90__FUNC_GPIO90>;
+			input-disable;
+			bias-disable;
+		};
+
+		pins-phy-reset {
+			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
+			input-disable;
+			bias-disable;
+		};
+
+		pins-power {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			input-disable;
+			bias-disable;
+		};
+
+		pins-rxd {
+			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
+				 <PINMUX_GPIO82__FUNC_GPIO82>,
+				 <PINMUX_GPIO83__FUNC_GPIO83>,
+				 <PINMUX_GPIO84__FUNC_GPIO84>;
+		};
+
+		pins-txd {
+			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
+				 <PINMUX_GPIO78__FUNC_GPIO78>,
+				 <PINMUX_GPIO79__FUNC_GPIO79>,
+				 <PINMUX_GPIO80__FUNC_GPIO80>;
+		};
+	};
+
 	gpio_keys_pins: gpio-keys-pins {
 		pins {
 			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
