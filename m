Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25751C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoxTVndE6utEsycgOunzP3TlGL6F5OaVH50FoV3RT0w=; b=EA/S5blaNCoow9I265Dw73bIOi
	9t2IqPOuaiAkHyi5Dj4ym0Y436TR+m2R3od7EJItzEX3qE+bgzY/gmqeORBiUmpGWXlhDOLAM51Os
	JFk1byp16nlhrUH88yxsSGaHENImtgCaxu04jox2vQxQaJJ7nmvaCHGEFTyA22KFyAmcnlPaySBGM
	CLLwDEWm04btfHeehrNJ71Qckr5xCGWf+cyDk4RfiHzukqD/pRFNcri0gH0+xsfjOM6lUQIgoQ5Uv
	bvpgiyLjEZ51fgVRRBwUPVy30cKopDyP5SGbyQaTKWXeR1e7YJhj9192lvdI3mVfU0ix4XYJPIPns
	4iaQoW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww2b-008K0i-Kr; Mon, 21 Nov 2022 01:56:09 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1m-008JNs-3Y
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id n12so25284181eja.11
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoxTVndE6utEsycgOunzP3TlGL6F5OaVH50FoV3RT0w=;
        b=c8RklIxEnH+bwi8XLTfM85hE6aBFPgxxuk5SRbLV4GnTAc9I1o66ZPMCRqd5G44t8S
         FFLLsr7cdGMGO+muPHBrsAcDZcTy0X3y0UR7DV7gl3ExGa7m3mzUX0GzJz1qfZFMvxNV
         Hti/gyCQ6giO7W0G4LOdzuNyq7BDC4HdLLdaEUCCwA00SGOMgwbGxe8ouBJvXmI22iR8
         w7dDQbDWshTUDS75xIZlGmgBeSrQhdphVUO4efjj0X0G605d3tX/6MVCi1/a8qbymqi0
         fgmJSKJQKrixDOyuPPWCHYRIHLuZZCdJGWDa9cxy89rPTTMv2hU3Zyodk45jBvrhkK5E
         nvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoxTVndE6utEsycgOunzP3TlGL6F5OaVH50FoV3RT0w=;
        b=UnF8Mzm3/cyrTFMf9ZLDmdwinev7myFa2To2OzMDwnOyypeUYCFKffPbAZIrBp+0al
         Fq6GDViNSAE8VPOjVAUlWLJL7ylPvUQ4wj0Y3/Q1r62m5EjhIq9SwGI0hfkAF/QletTr
         zDn/BVBp2slpT2oMu+4KEH+THBytiGpf/QMWNcN9Osh5JEm9x6OtoXjliNg00OeWgS68
         iOoudIDlVzVcQKWo8Uk0q1Lt3kiQYwNXgyIBFJKl7lM899WjIi5G4thSTqE4JHjy9Neh
         zr/2QGV5fr0Ul4YoqwZgwEnnm7xTcp2VbE6QXwFBw7l1ouosU9nNfjPlBm1T4MbMMbXr
         JybA==
X-Gm-Message-State: ANoB5pkDXbhxtCiWKlUQoRDDVFlapISYn2at4zkxqAFQkXas0/GDE4pX
	5/x9aUYfcaY3p/gCsPKRp3IhOw==
X-Google-Smtp-Source: AA0mqf5Iqh1KYyEXUYiziJt2kTgwKqDfHW88f2Xpo6/pLRnXD2QGrPnKm2FyiFj0g7dD6P3SWqd7zQ==
X-Received: by 2002:a17:906:35c8:b0:78d:3a04:e41d with SMTP id p8-20020a17090635c800b0078d3a04e41dmr14088753ejb.39.1668995711474;
        Sun, 20 Nov 2022 17:55:11 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 6/9] ARM: dts: mediatek: Remove pins-are-numbered property
Date: Mon, 21 Nov 2022 02:54:48 +0100
Message-Id: <20221121015451.2471196-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175523_227131_18C4A231 
X-CRM114-Status: UNSURE (   7.74  )
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

Remove the unnecessary pins-are-numbered property from
Mediatek ARM DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 1 -
 arch/arm/boot/dts/mt7623.dtsi | 1 -
 arch/arm/boot/dts/mt8135.dtsi | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index b8eba3ba153c2..0a0fe8c5a4059 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -178,7 +178,6 @@ pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt2701-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 25d31e40a5535..11379c3e6b4ca 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -253,7 +253,6 @@ pio: pinctrl@10005000 {
 		compatible = "mediatek,mt7623-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index a031b36363187..0f291ad22d3af 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -152,7 +152,6 @@ pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8135-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.38.1


