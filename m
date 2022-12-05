Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC8AC4708C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=; b=VrCNt2DDXJwVSzRRuIE6wwgNkn
	iKS01Q/UXM+QASjFvcw6p0AbnZGX99QwxT0zDhGhT11WlkHT/RHboCCUYm4hXl73zvqAtJifBZsrr
	KBVweWfqLwI1ZT/CygkD+KxXOoC0tgUtSx8T0qbbdPjaYbFUSIruCD9i2BqC/AA3UbBYuCAUxzq49
	yn6oFt5XgBGzBRc2M0BzZH1bhDKuHE1lf60G9/yruJ138mXOpI8pP699wtuFmWPk5FedQ+i4VknQT
	3UxnYGuwQ+JSmIO2TnRJ64dqHji/vt0BRbMUdcb+vLWykvBznVSXZAwXnvKmpAT3IUKb8g0NNm8vb
	3gFLfF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Btb-003gx1-2W; Mon, 05 Dec 2022 13:52:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BtG-003gg4-2B
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 13:52:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so11798800wma.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=wsgdxTuhatf3mw1TVkJQeXcqLfocJhxhj74YDevQF9YeRF3dfceSwSOa7IojVzyb7L
         B5YvTchNNBM8QERb8Z7fZ00Jr+oRZR0N/NuKpDCFANoDerZjz9ZdYHt82uWhTHHbAOCQ
         vXVW0fi+9ldGrDVOsSuL8bIFpJXG8/m/TfObyMHBcJ8DmBJ1sTkaZf1o5lOuo3ghvqsi
         ZPcAfUwmTSACNF3BiQwmC2Prh5kU/b4NT3DCQd1ANXM4wBVZdEuaevnv+aFsnxuVEiWy
         ebRpiQCTG3e/og2yEhXh3KrXQQVDdzNur2s96I56dkMdMoZRBpPh53XbFOQXhbNr8WYf
         clNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=S3WywCH6bJkXhG+vqpfBiO1ne03V0gRIJOOVhOPaFqizVTHLXGZ0uusym8ZFf/04gM
         ohGjO+HsRJCuFqUvwGLq65O9pcGr7gIZp6xFNH1+d6oJ98ZUcV6shCM4GiVFzAf/jrwg
         rdgikBRL+xzLbX4sOvaMO4F0egFaIsMSn8TkrGs1/vMls617bnfO8a98cz2sa79l/la+
         mGy0ER0IBun0XkXjpn50C7L6WB2TSFhjjG20YIDcW0lmyDF/Dg3TMwopd3iOxcfw87Cc
         yqrPcCM4N1qbWdlpu5kCqLVqpQP0csTfOfAemlzqiBdnkk2Ixy3Ro0Fd8GiyxyK7yygX
         7EzA==
X-Gm-Message-State: ANoB5pn6Wgj6PEL0uVFlb6urDIFOzXGEM8n/cH1bmpMR80ffROF/VdyU
	Wk46UO+GK78ruyl1POpZK33xqyoUjQ5+6+2GG0F+4g==
X-Google-Smtp-Source: AA0mqf52PvQXYzT5vaPuTGBXNCz91Q2KV0iCLC9fNEbt3klSJRTAtpx67PD5xqTxQIpCyNL0zdkknw==
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id h10-20020a05600c350a00b003d074bea059mr16204523wmq.177.1670248330589;
        Mon, 05 Dec 2022 05:52:10 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:52:10 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/3] ARM: dts: mediatek: Remove pins-are-numbered property
Date: Mon,  5 Dec 2022 14:51:57 +0100
Message-Id: <20221205135158.1842465-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205135158.1842465-1-bero@baylibre.com>
References: <20221205135158.1842465-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_055214_145095_577631CC 
X-CRM114-Status: UNSURE (   7.49  )
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


