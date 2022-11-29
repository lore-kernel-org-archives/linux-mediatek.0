Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043C1C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 02:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=; b=DDqDhWmoY7u0o8MGFmt62fwq4k
	Pu7Uy73A0EL5hqerdCQlpSlqNZyHbi/JMLUBdLEyCpGUbI+9ZyIIHv/at9mRWi1/Eop08Mv6T224r
	k9gm9hmR8FU9IOSn4DjsugS4W7Qs4DoIi4c3MjoFpf4LisY4RossUhd/i80C8wDgMN8q2ggNTBCBN
	LfUHMCn6Jwnj1/tWob2O2XBRvFbm/beObMPdh81DSNfTU0TcMfI85PXymXAPvqAuHhBbJTbQz2+mL
	KpNhNmT1FR3xl7nPjms1IIC/wwdnmWlQcfo9x7/amNzfI0SW4vNUDDRq4BRflCVvz+tYJPqZjp7t7
	uMrtQC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqUL-005LYD-Ct; Tue, 29 Nov 2022 02:36:49 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqRo-005KE0-Kr
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 02:34:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id l11so17983668edb.4
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=TGMnn46CtKmUg45vARZzI+l7g+wJRHX66iFsaESAYfjUreGPhFtBLMrWSVfN8NhQ4R
         EAj8tu1adlY/+N+IFytx6V0pihxUb6rgNkgIhvtEo674brpFnW8vfu7xWJWALL7JtLUM
         OZXaJyvSkMWjBQ2HcTY+/T07EugndtdyOxTAW0ahTze1Z1ZNQvMemygppjQcVhQOBPuT
         WOFzgajTZrV5D4fqhH9WxOTtL5J8mKkhErGwFwJGcuD/SA5SkPVzJt7TTz5oj9QP4Y7A
         poSLVkvYcplY4mgCj0z6tYrs6Oz9E+2nack2BY3eemkJ0u8yVzJbo+mcpjR/U7k+gUId
         CXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=PNNWLHWoWKAUm8wsSJj4HXttINHXMk7o4mnnsWcyDXFWHxCwNRHME1R8DEjwOjNvHG
         3RUZE1vNaC1FHg+DzM/6yp5p980OkcnUdjloRYuF+8alvEZVOtnCvCOvnrVr2FrvbDwH
         TEPPuaUxZ4VhsntUCfrWQqSEnXqaJNZTg3SlUsx+V9osz9JXAniTWk2QoAfgGgiXpPyP
         5mP2vB/2HnrOiEnqpuD5S+sDPAQlUaBQrsUImLY58cwsmS+8slZExV+RfGw5C63owbEg
         qtifZ+n2GfJ/CS8xR8QLgCGBLVZaOGmBERzDJYdecUUdCtNMEr25UzE1MS2ybd4/eRj/
         DPbg==
X-Gm-Message-State: ANoB5plHUsC7AadxlM9xPXRW25wPTpReU2zNKV97xu0OkEsAucPnuUPD
	4lZp3POUWvNNbgZ7nhQ0oBUxuA==
X-Google-Smtp-Source: AA0mqf60o5tLbeI6S6dpTLzC6o649BcnNTqez9gWqoEhygiGGK9mOCHndjEEV+VdcPsGK1nhuiq4LQ==
X-Received: by 2002:a05:6402:3707:b0:467:6847:83d3 with SMTP id ek7-20020a056402370700b00467684783d3mr10333472edb.247.1669689249014;
        Mon, 28 Nov 2022 18:34:09 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: [PATCH v3 6/7] ARM: dts: mediatek: Remove pins-are-numbered property
Date: Tue, 29 Nov 2022 03:34:00 +0100
Message-Id: <20221129023401.278780-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_183412_750297_58DD99A1 
X-CRM114-Status: UNSURE (   8.30  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
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


