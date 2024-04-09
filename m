Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8F6CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=; b=pu7b390/up+g5if36nf2b7GsyO
	Fxjlzgn7iT/iUPuqDSPs6YXpLR9bE75wEv6wa2NXpR1zdj/C4U248WyKi4BUPijqrwKklo2WDc4q8
	C5Ve/Cnlns55fB1JZPt32N36a2YFTLRrKEaimBTl3yoX17js6ceszxIiWKQ1pn0/4FGXtmZhdiWqx
	WdVjOED9vzmVIFp23VejaKhjUpaWx4SGL7Wa65miwaJ01LrIFsWy1GKj3b/34aGVWd84s3THXMimo
	sHvpHKF50tAOMY/JqApcBoJYfpfKLbJwbFGveTXECSDcunjGF7n0ReZsQCXLgyDW8bsnurwOo1DsB
	2WqxkHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8WD-00000001OtP-0LgT;
	Tue, 09 Apr 2024 10:15:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UY-00000001NmH-38LT
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 10:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=; b=iMYRGL37faWzCakauuvV4NfSii
	RQkZ9Gl24unCuztWs/vDvrRlFGv47fSoN1vV5sYCI3nzZFsFAKSitNTjLIiAKGWBbLZyYJ8fFtiDS
	36ESGqMJxdok99m0MqetIZFPOzSNbhw7gpAcBeE9wL6ZUPOI02Je/37MUZ4Q+SFq8RLWTevQwNYGq
	MnbrMkGTw7DuWdq7MMJD8jpD8B72vaCGNRIGCApiFm896iRM37PG/0pna3jPnQzUuY49s/9fJmZZ0
	SzGRTFNsGV8BMK/6mHAechCX6pWXAa/42808+hkqHlyZOZxgiH5HVfDVsDOm8i4LZpIL2G98NqlHV
	xpjQSB2Q==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UT-00000007YGK-1a05
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:14:12 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d8b4778f5fso1200511fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657647; x=1713262447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=hZ0w8NfQGHcxIYWTRgFhQcIAPc0kO8Zbv2KFme0FBn/C0E7jGFJFngaAsWmNPbSwWB
         X+Pwk4I1LHFt5qco6hMKE9BvDB3JAsdzZab7VPpt521MyyHa5zyF3BQeEjHepKf6sFLG
         Qz/65+Iotwf6YHPmq85LRcM9VFv3Q1FWihV0+hf6S0Hk1gHfQKOP0S5xYAtSnpazzH+e
         hLH/1mXs4RzbVPrwAfR0q3vVkggKg1eZpa4OQSEyh5AudC3yJnvpimzbbaKouKequ1Ta
         StXeFjXi9dskTjsoK12IbTTwEQzjy/clXKWLPiJXoujkE6Z3hWGSyrpKChKhhVTwIJhR
         EzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657647; x=1713262447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=cJxXs6Y7J9BslvI5ajdZQ854vKrOOJmjb642l256y3ICC6UNKjGTG+S5P3kZrzWFXy
         53oWw9WEXsyJzuak8qUp1LFlozdJG9sjcPfUjhFPj8ILZIIom4S0M3AP5/KcM6lEtMwV
         kr8ffFfgv73m/GajdTspiK63a1JonCUEyl2ZPSz6kQ/zqJsSZ5z8ySu+BYxjEo+gIkjh
         az6xXDLChKkhR8MoKOEXsBQTuiWPu9DdaKlGCE7mKWz/KCNDmTBqhui5vvU+oqgJb2tR
         j133R+tVHBDfLmA+zqC6lOlyQioKCcmcmvrt1rd2imAbgp7DjOjDkEaHLRtjlSPt2/6J
         Ltdg==
X-Forwarded-Encrypted: i=1; AJvYcCXegq74FgR+V3L5W5Myg1+SJ+DuERJy879V4xoIVFdGxj0Q/CdeyimUQCysxBOGE29ORhaNsSA2LkJJlWAl+sbgV8GOSkjkgcpkDtOvOcigKkcl
X-Gm-Message-State: AOJu0YxCoRctZqaOpELNsGcSWk2jDl8CnNvdHUSIs7lFqX6+kaONgOIN
	b4gUXMeyRugWSXB/GHGvjPAiaxaTul3wgdxYYrd8XrCfhT1lMxxXyeV/dtvmRpw=
X-Google-Smtp-Source: AGHT+IFF17tHptZ9yy6IboRmSrKnC6vMAvTQkGkS1sBkZY8PuDxFonOZnqVYYrkMq5Oo47sHNuMP1w==
X-Received: by 2002:a2e:888f:0:b0:2d6:cd05:1890 with SMTP id k15-20020a2e888f000000b002d6cd051890mr8048170lji.0.1712657646820;
        Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:38 +0200
Subject: [PATCH v2 17/18] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v2-17-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTEUNfu/l/RVmmFfvIfx7YUtVHj60bjRZ75BE3
 zH4QqnqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURTusEA
 CtYibBPzDz7hlWPn5zSwhUIaHtQ40nqsNB9rX8kXiBuFjqyqRdaTX4wbJqkHHUGFeEEJR4qJpOPE4s
 s1FqxsB0qzQrHAyMk4ZL5Zbs7M7n+hNutLNMbnpckX7/CNf1knNSHZ+/HO0FyXueP0/j+fvp0DOGA2
 3KFSEW84DMto/lKOKx0d4axfVmzoAwVOXBjYM2hV3R4dVnQuSD6HhkzazzXFiGC6FUZq9pEyqdfqoj
 Wwy/zAD75w/a34+bPUxNBah8QclxBSI6/49cY4mROW/i60I0VaVqhwNNFUG34tetH2lCVcd9bPEgdp
 G0ZfQDDFaFxdmma+3rgRvL8eOY+6XaB/bsS83DCgUAaXQL8dvaGn7G4VwzU1NsFeMcEwPZJwUClZRl
 tqi6Gr4zpFdzLqpSYvfp+G3rKzC4e/Aa+8JnPnRCAmTWpGvvHBlRZKuHMTB0d3hJ4Dhw7rkQ3BFYEv
 uTAsJEtd6pHT1ZT4/ib+Yu26zW6fqmbQUJuAadg+77yDN0cn8zLzkefbEHPccxQ7xfuc9knTbAVqbX
 Vo2VfjkeOfce2+Z5kOh8cpVi0QGNKKJow+sy2J0CKGevUYP4J9PSZs05Njy0DiRECnXCNiYizvMc5h
 C9ZwmafDd+g+rjVce2iRRt/FLjXkkjRlYZcm8ti8E+bZaGuMrTs2t2MUmc+A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_111410_808044_70F8B40B 
X-CRM114-Status: GOOD (  11.35  )
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

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0bb6f6388bb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * (C) 2018 MediaTek Inc.
- * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (C) 2024 BayLibre SAS
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,44 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>;
+			#sound-dai-cells = <0>;
+			clocks = <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_SEL>,
+				 <&topckgen CLK_TOP_AUD_I2S0_M>,
+				 <&topckgen CLK_TOP_AUD_I2S1_M>,
+				 <&topckgen CLK_TOP_AUD_I2S2_M>,
+				 <&topckgen CLK_TOP_AUD_I2S3_M>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+				 <&topckgen CLK_TOP_AUD_1_SEL>,
+				 <&topckgen CLK_TOP_AUD_2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+			clock-names = "top_clk26m_clk",
+				      "top_audio_sel",
+				      "audio_i2s0_m",
+				      "audio_i2s1_m",
+				      "audio_i2s2_m",
+				      "audio_i2s3_m",
+				      "engen1",
+				      "engen2",
+				      "aud1",
+				      "aud2",
+				      "i2s0_m_sel",
+				      "i2s1_m_sel",
+				      "i2s2_m_sel",
+				      "i2s3_m_sel";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			mediatek,topckgen = <&topckgen>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


