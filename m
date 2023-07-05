Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB156C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnLqXOY5KwTjIOEFy51ANagMZo4XdzRpY7gfu7Vu0l8=; b=moTHzQk33RfgXHTD8eep+5/+B5
	KQLJvYG6ge3XxNfegWjclwiEN2SxDt07U2SafqNr9laV3YXNBK7PlbVTcOx/ZTIGAsQzfxjzSwD9J
	jsIDY5gsS8HR0R78CGqXp2b4GemzE1EzDJm0jxxD8kW71m9Dn+5DavU0AjQDVWRZbCMfbbWa2jACB
	ZYvj2gIj4ZV3VA5aIzbKsL2YS8A5MttZDek3DiTVpdAsY3tywhZTv+XEMM+A0xyBJijDAHX6J7xSU
	1SygePsozZeF7Y5/abjxGZ7ILMF0KQgFmQfTet7cHDJ78KIHLjnBXZaDkUlas3KR3vNibwwjI0K6L
	56yE7ZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH401-00GFGC-1O;
	Wed, 05 Jul 2023 15:00:57 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3zN-00GEw1-0S
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jul 2023 15:00:18 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1590574a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jul 2023 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688569213; x=1691161213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnLqXOY5KwTjIOEFy51ANagMZo4XdzRpY7gfu7Vu0l8=;
        b=r26AqE30HS/XnHKZXPS9m0ct+30STfkk420BMG1Us2IupdRziXJKiqQnveJkvsX/CA
         GiXmeHVfluPVqr88tSpUYDlhnSAIPGqMHW3iTaH8CnHUH7dE9+jd/kBMN2WHRSxtDaJ7
         /Ql35sMahFWE4iNeiiCHdJnBLkOTtQCohTMyo/D8W/7rRB5Ro8fMmxBVHgMXqyNHv/Mb
         lkpP+fesYqY1elxYzBn8l+0URYjR/XDY255DHT8GNMr1eolI0++4fBx2ddGtGp+6B3PT
         RTCA+MQCbZJzTHimVzOfoJE8uqwda/HfyviTbdReJCzqGuEBK4B3knb+K3A8sPFpPuFi
         QvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688569213; x=1691161213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnLqXOY5KwTjIOEFy51ANagMZo4XdzRpY7gfu7Vu0l8=;
        b=BYBky35WKB9/0EPYb4RTUXdjEbbnHfgM6V7myCKUgbd+QkUkLqsKpv9c6CzFSrYRrG
         0tJPl/csmDyi5xwSabez63i1YunXwfny22e4lH/F74IGY19OWYig1h8C3bFfudBESS+g
         8IB/QVLQobIJGzlAa4iqpyE+WLYgLrgkAJjyjzukp8tNu83Yh9oKxMo4VaRWJWlE1rkv
         5xuRqeuaIiKa5Pq9d1XkkbFReEfkTPCdJcYXTgJxZpIx9Oz0LQ6ZCb7Tucit9slWCZGu
         fZp4yoDllfKxOepcbys673HXwoM61VTYmAy4TXhf/OqefBVJb5U+RvwJfCMjvtc5T1HA
         IZGQ==
X-Gm-Message-State: ABy/qLbUvrjstipjikuNL6tW0qfQX1rgGi1Ct7m2me8mKzspxScKavWS
	A3Pe1X59hEuzH9BUrINIFNMfgg==
X-Google-Smtp-Source: APBJJlGBz2LTi9nzkoIhxcnP2EJrmjWUF3R+KjVyK+evz95mgQUJMozKV4c0894dJHDAiwuCYykt3g==
X-Received: by 2002:a17:907:8a20:b0:98e:3935:60f4 with SMTP id sc32-20020a1709078a2000b0098e393560f4mr2489875ejc.1.1688569213351;
        Wed, 05 Jul 2023 08:00:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bu5-20020a170906a14500b0096f6a131b9fsm14704838ejb.23.2023.07.05.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:00:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: mediatek: add missing space before {
Date: Wed,  5 Jul 2023 17:00:06 +0200
Message-Id: <20230705150006.293690-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705150006.293690-1-krzysztof.kozlowski@linaro.org>
References: <20230705150006.293690-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_080017_198705_8BFC940C 
X-CRM114-Status: GOOD (  10.09  )
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

Add missing whitespace between node name/label and opening {.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 48 +++++++++----------
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 ++---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 12 ++---
 3 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index d8bd51807683..ce336a48c897 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -155,8 +155,8 @@ &mt6358_vsram_gpu_reg {
 };
 
 &pio {
-	i2c_pins_0: i2c0{
-		pins_i2c{
+	i2c_pins_0: i2c0 {
+		pins_i2c {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
 			mediatek,pull-up-adv = <3>;
@@ -164,8 +164,8 @@ pins_i2c{
 		};
 	};
 
-	i2c_pins_1: i2c1{
-		pins_i2c{
+	i2c_pins_1: i2c1 {
+		pins_i2c {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
 			mediatek,pull-up-adv = <3>;
@@ -173,8 +173,8 @@ pins_i2c{
 		};
 	};
 
-	i2c_pins_2: i2c2{
-		pins_i2c{
+	i2c_pins_2: i2c2 {
+		pins_i2c {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
 			mediatek,pull-up-adv = <3>;
@@ -182,8 +182,8 @@ pins_i2c{
 		};
 	};
 
-	i2c_pins_3: i2c3{
-		pins_i2c{
+	i2c_pins_3: i2c3 {
+		pins_i2c {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
 			mediatek,pull-up-adv = <3>;
@@ -191,8 +191,8 @@ pins_i2c{
 		};
 	};
 
-	i2c_pins_4: i2c4{
-		pins_i2c{
+	i2c_pins_4: i2c4 {
+		pins_i2c {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
 			mediatek,pull-up-adv = <3>;
@@ -200,8 +200,8 @@ pins_i2c{
 		};
 	};
 
-	i2c_pins_5: i2c5{
-		pins_i2c{
+	i2c_pins_5: i2c5 {
+		pins_i2c {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
 			mediatek,pull-up-adv = <3>;
@@ -209,8 +209,8 @@ pins_i2c{
 		};
 	};
 
-	spi_pins_0: spi0{
-		pins_spi{
+	spi_pins_0: spi0 {
+		pins_spi {
 			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
 				 <PINMUX_GPIO86__FUNC_SPI0_CSB>,
 				 <PINMUX_GPIO87__FUNC_SPI0_MO>,
@@ -324,8 +324,8 @@ pins_clk {
 		};
 	};
 
-	spi_pins_1: spi1{
-		pins_spi{
+	spi_pins_1: spi1 {
+		pins_spi {
 			pinmux = <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
 				 <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
 				 <PINMUX_GPIO163__FUNC_SPI1_A_MO>,
@@ -334,8 +334,8 @@ pins_spi{
 		};
 	};
 
-	spi_pins_2: spi2{
-		pins_spi{
+	spi_pins_2: spi2 {
+		pins_spi {
 			pinmux = <PINMUX_GPIO0__FUNC_SPI2_CSB>,
 				 <PINMUX_GPIO1__FUNC_SPI2_MO>,
 				 <PINMUX_GPIO2__FUNC_SPI2_CLK>,
@@ -344,8 +344,8 @@ pins_spi{
 		};
 	};
 
-	spi_pins_3: spi3{
-		pins_spi{
+	spi_pins_3: spi3 {
+		pins_spi {
 			pinmux = <PINMUX_GPIO21__FUNC_SPI3_MI>,
 				 <PINMUX_GPIO22__FUNC_SPI3_CSB>,
 				 <PINMUX_GPIO23__FUNC_SPI3_MO>,
@@ -354,8 +354,8 @@ pins_spi{
 		};
 	};
 
-	spi_pins_4: spi4{
-		pins_spi{
+	spi_pins_4: spi4 {
+		pins_spi {
 			pinmux = <PINMUX_GPIO17__FUNC_SPI4_MI>,
 				 <PINMUX_GPIO18__FUNC_SPI4_CSB>,
 				 <PINMUX_GPIO19__FUNC_SPI4_MO>,
@@ -364,8 +364,8 @@ pins_spi{
 		};
 	};
 
-	spi_pins_5: spi5{
-		pins_spi{
+	spi_pins_5: spi5 {
+		pins_spi {
 			pinmux = <PINMUX_GPIO13__FUNC_SPI5_MI>,
 				 <PINMUX_GPIO14__FUNC_SPI5_CSB>,
 				 <PINMUX_GPIO15__FUNC_SPI5_MO>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 6ce16a265e05..f881bb82005c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -692,7 +692,7 @@ pins_scp_uart {
 	};
 
 	spi0_pins: spi0 {
-		pins_spi{
+		pins_spi {
 			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
 				 <PINMUX_GPIO86__FUNC_GPIO86>,
 				 <PINMUX_GPIO87__FUNC_SPI0_MO>,
@@ -702,7 +702,7 @@ pins_spi{
 	};
 
 	spi1_pins: spi1 {
-		pins_spi{
+		pins_spi {
 			pinmux = <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
 				 <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
 				 <PINMUX_GPIO163__FUNC_SPI1_A_MO>,
@@ -712,7 +712,7 @@ pins_spi{
 	};
 
 	spi2_pins: spi2 {
-		pins_spi{
+		pins_spi {
 			pinmux = <PINMUX_GPIO0__FUNC_SPI2_CSB>,
 				 <PINMUX_GPIO1__FUNC_SPI2_MO>,
 				 <PINMUX_GPIO2__FUNC_SPI2_CLK>;
@@ -725,7 +725,7 @@ pins_spi_mi {
 	};
 
 	spi3_pins: spi3 {
-		pins_spi{
+		pins_spi {
 			pinmux = <PINMUX_GPIO21__FUNC_SPI3_MI>,
 				 <PINMUX_GPIO22__FUNC_SPI3_CSB>,
 				 <PINMUX_GPIO23__FUNC_SPI3_MO>,
@@ -735,7 +735,7 @@ pins_spi{
 	};
 
 	spi4_pins: spi4 {
-		pins_spi{
+		pins_spi {
 			pinmux = <PINMUX_GPIO17__FUNC_SPI4_MI>,
 				 <PINMUX_GPIO18__FUNC_SPI4_CSB>,
 				 <PINMUX_GPIO19__FUNC_SPI4_MO>,
@@ -745,7 +745,7 @@ pins_spi{
 	};
 
 	spi5_pins: spi5 {
-		pins_spi{
+		pins_spi {
 			pinmux = <PINMUX_GPIO13__FUNC_SPI5_MI>,
 				 <PINMUX_GPIO14__FUNC_SPI5_CSB>,
 				 <PINMUX_GPIO15__FUNC_SPI5_MO>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 526bcae7a3f8..b5784a60c315 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -193,7 +193,7 @@ &mt6358_vsram_gpu_reg {
 
 &pio {
 	i2c_pins_0: i2c0 {
-		pins_i2c{
+		pins_i2c {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
 			mediatek,pull-up-adv = <3>;
@@ -202,7 +202,7 @@ pins_i2c{
 	};
 
 	i2c_pins_1: i2c1 {
-		pins_i2c{
+		pins_i2c {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
 			mediatek,pull-up-adv = <3>;
@@ -211,7 +211,7 @@ pins_i2c{
 	};
 
 	i2c_pins_2: i2c2 {
-		pins_i2c{
+		pins_i2c {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
 			mediatek,pull-up-adv = <3>;
@@ -220,7 +220,7 @@ pins_i2c{
 	};
 
 	i2c_pins_3: i2c3 {
-		pins_i2c{
+		pins_i2c {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
 			mediatek,pull-up-adv = <3>;
@@ -229,7 +229,7 @@ pins_i2c{
 	};
 
 	i2c_pins_4: i2c4 {
-		pins_i2c{
+		pins_i2c {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
 			mediatek,pull-up-adv = <3>;
@@ -238,7 +238,7 @@ pins_i2c{
 	};
 
 	i2c_pins_5: i2c5 {
-		pins_i2c{
+		pins_i2c {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
 			mediatek,pull-up-adv = <3>;
-- 
2.34.1


