Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F9BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njhxjTKf5qgs999H/NFNZlENyL8kuhp42cJfuLDuDe8=; b=CacBv5nN6jEpQsuWFZ2hottQax
	/VTL+N25/q2coaK1OahKT6NvwXwTUWCa5qKdX6P95WjERwyAMV5nzAQzwQqvOJb4bPzQqTzt5vPqw
	ACV8qS/h4vW5nj2vgYLVJVugsm8Hw3FjB3JBnWezDiyDsX9HUHdvarDpgRgb10ecCzf1tCkV8MeP8
	FNb59RvnTS6zuaKlWSx3oQ3ZzR3ua63f4uJJjh40PWehRc5LIdigJG4XxrUCIknZ9DMdxCd7oyKJ+
	n7ceWLI7ii4fEdc8iRbWMvuj+8niUPn6TTfaRHWVz6vEp6mAZtQqpJhFvVr1itJTOmnN3crPruLY4
	djyjwdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mmy-0038DQ-Mn; Fri, 24 Jun 2022 17:08:12 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mmc-00384d-Jt
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 17:07:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id ge10so5951426ejb.7
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njhxjTKf5qgs999H/NFNZlENyL8kuhp42cJfuLDuDe8=;
        b=DRmse1ypXl3VHFhtM0fcsmCn7+/q47zNeWtzMZTE+8ishHTdLgLxHlbVqqKO27TDCX
         QyCX/uRL352TkcOj0XEA1jqrTDB4+g1jygkbeGFYVUTut1Q1enRegCed8YUgqchsnVlW
         BxplUtOmtf2h9ihNfB1YvxNPnDixxWeQqXjFbevoee7gjWSntrGBH9oGWvINUUsB9KoJ
         qu0e4VbUNSAG0n0L7Ryvb46akd6jUkn9Cyv0YF5YeASDU9pRm0xNzGzsXrzys8JHhRiR
         etgbLPC2GNJYVjH5Kh7kmckCmZA6z/KoxUm7egZb6rBhk2IhFFoAaABVqLga9lMQpBgJ
         tN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njhxjTKf5qgs999H/NFNZlENyL8kuhp42cJfuLDuDe8=;
        b=4uXwjoEJi7XjWzmN7gzICMomeaiz/Kzll568oCqN7piFvPMRPHWr1/pPEvifz/M+F6
         6yDy/im9Ui10MaxKRXdE4/vrpRDjTP9YUA+9QdcxxsH9kG72wKjYBndBnZZQEmnhSqEu
         3xNg5Z5gMj+tqtcNDHYq4Ep129Io0fIO3OyQ49sHMDrRL8y9gXw24as6vPMbO58iC5KF
         pnIW7W2ZsNd34YZypazklYfLqq0wDFrH/Nyo5gBTalh87sflPTfY+8KbH05QPyv3AI09
         YZDYNAwdCohPMmru5aPqs09oBCVtwGlmcuWPAjdEfcKKKC4AZMxjn/CTiD0gKx+mfewL
         oXqA==
X-Gm-Message-State: AJIora+NkcIxtNymzSVAsjnk+nsOTJK3Uq1k0A9fySg0q8pLY6DdTSVo
	3hYKAmW8scOQxYAC2YCv5NKFUQ==
X-Google-Smtp-Source: AGRyM1usU5fpLW1YUCimsRoTEJR1DvpJy1/MZt5fr7TyD1VT7jW9A3P3c5qYz+5Zb+cMdCk6FTIlyQ==
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id g8-20020a1709065d0800b006ff08eddb63mr14168737ejt.408.1656090467032;
        Fri, 24 Jun 2022 10:07:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b19-20020aa7dc13000000b00435959d3605sm2455929edu.84.2022.06.24.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:07:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] MIPS: dts: align gpio-key node names with dtschema
Date: Fri, 24 Jun 2022 19:07:40 +0200
Message-Id: <20220624170740.66271-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
References: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_100750_700080_B6B3154C 
X-CRM114-Status: GOOD (  11.10  )
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

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/mips/boot/dts/ingenic/ci20.dts                        | 2 +-
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index ab6e3dc0bc1d..37c46720c719 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -31,7 +31,7 @@ memory {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw1 {
+		switch {
 			label = "ci20:sw1";
 			linux,code = <KEY_F13>;
 			gpios = <&gpd 17 GPIO_ACTIVE_HIGH>;
diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 826e91b840a3..179558161f85 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -26,7 +26,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_gpio_gpio>;	/* GPIO11 */
 
-		user_btn1 {
+		button {
 			label = "USER_BTN1";
 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 			linux,code =<KEY_PROG1> ;
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 37037e4f3c3b..24eebc5a85b1 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -29,7 +29,7 @@ i2c@900 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_RESTART>;
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index a6201a119a1f..34006e667780 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -29,7 +29,7 @@ i2c@900 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_RESTART>;
-- 
2.34.1


