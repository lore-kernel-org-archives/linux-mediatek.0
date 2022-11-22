Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED477C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=; b=hGjFAifO0bxD32I16wfFOqZAWl
	6NNxVMjIN4mC452e119KbdGnCPro6obPQf8/EljmdlEcHemPCbSMAZSSOZK0yHq1IkL27KUKwVFGd
	KViGLYhXbEcd3FXY0i8qNRaJJzYPgqab9DPPT9wmUEPC5VQckuhvwWktxjxDFK/jTb0hQfgnCrR9I
	hs4WfFt6C9emGEnbwwuFGU2XbEOYZOasO+lsb7D5GfLfcahG64PWPnJTC1f6Z2xkV4mU9E4dlKpSa
	kuFH886uL3j0GsOJNkSveGuDLVoLfYwYykD6AeTmBElFTvaIIwKcbFAH6TC1L/35cMS0Sazx7dyTW
	rdVgMkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHnI-001nz7-2p; Tue, 22 Nov 2022 01:09:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHly-001nK6-12
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id gv23so32381443ejb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=khl3j/XE7m0EGnorZA5Q3DsiTbyoBwHi5GUL7KsN5WlbQ+h1lY66BGMbM+GhD9kaMz
         u47U0zrTL0kvn7kfYNZRORwbSPyXy0piyY8zcGPxNckS1lhvn6VR8nu13RnVQQ0XbgmN
         0KI3ZRrknYNP6Oh7kYy/xVEcCuU+e6yxPxPfz1P9vEm2T4Rn+GdfM6OOPnRXK6UTo8LN
         SDHXV/U2xOlAaiu0s8kV6f0i6hk1zkL1yaJU4GlQFS61EyqKe7kZa+nux6/RbpzqoF7d
         2y37q0+hcsMmpuWIk/qYoT/rFdaz1C3009x2XE7O/z6IaXZpW/GlAGBWwCjFFYvGP2ZR
         mnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=glO4iyr2r7YSvjh3R08nA5zjhyKuKd1QgnX38t+meTWixye0l4mXdY5Gks6VJFKt4l
         yr5d6qo1qKA7UNvDaGvFh29ye71fAsjRRw0788u9uSp2bGOvcjJFtueLgkngLYCTm8VC
         OARveQXg+R1Emh0Amr1jlUj04Lh57pcXrY0ujUxrmtHpBctARH0gXZsSMu9Cbx+7ztOT
         daJHjYUhGYoXJ2KTpAagD04gPV78+pp4MMEbtQt92DyP8bU95Bwwtp1DYsle1RY0TJCk
         5XAqqkA7cjTgf5qNwdCIY/yIu/AoT4C51xaWBQoOU5ipKazE3Tp7FdGvc2eDoFCjYDZE
         /18g==
X-Gm-Message-State: ANoB5pnmxY+bd08AUCSyfltVN9lBk1Q3qnaLvmy7vulFD3qsznTAVAC2
	j79ooA+33KUgC/CXcboeRRJ0Ww==
X-Google-Smtp-Source: AA0mqf7Go5aHljXna58A3ki2BugYv1A9YAbDkmIxbJqzeq58ZihN3W52HFeTXtwAFk/yPKe8S3aGLQ==
X-Received: by 2002:a17:906:1ecf:b0:7ad:902c:d1d6 with SMTP id m15-20020a1709061ecf00b007ad902cd1d6mr6197186ejj.143.1669079293135;
        Mon, 21 Nov 2022 17:08:13 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:12 -0800 (PST)
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
	khilman@baylibre.com
Subject: [PATCH v2 6/7] ARM: dts: mediatek: Remove pins-are-numbered property
Date: Tue, 22 Nov 2022 02:07:52 +0100
Message-Id: <20221122010753.3126828-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170826_085373_D589C2D7 
X-CRM114-Status: UNSURE (   8.12  )
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


