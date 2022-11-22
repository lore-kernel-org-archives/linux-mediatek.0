Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D22EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22cpIMVo0mA6Jzd/hOHKABBmcBen8QvMhPR2HSaKBfQ=; b=L9YZCZJL1ukv6Dc7lOIIUQej9+
	3tIw3qdJBmn2EPCL021CQIYhtmJeB2POocPgs6MytygDY1WGZSQPoq+ARaZPqQEatvsmBl/a7jhEp
	Lpk96CF3+NYqdr4fZyTg3ibXcgyFARXaaUF/K0lIbg+X6Q/z3n9CS1efr+emeGTTs37WyTlO1xSUy
	D3qddfySUEo5QRrb/RFhdO92MZcrQhPhXvPwk+W5Q2ZspzNYlNxHrCsVy47LKfgJeG2ifuGsW+hoN
	0XpjQ3qUAX9lY0uMMeFBL4rOIkSiyF3aT+b4Sn5pt3P7D2GKfxjqd9FmPZH/LhX2ggRjUX9hXMjMU
	BK8ycVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHmW-001nZe-4k; Tue, 22 Nov 2022 01:09:00 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlx-001nK1-Fb
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x102so18671514ede.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22cpIMVo0mA6Jzd/hOHKABBmcBen8QvMhPR2HSaKBfQ=;
        b=LRmSuVMnncjGcUb8pM7UB1DOpIbSDESZoRfDOnAXZaN8BoBbkDvlUt+uVm4Hib7uuS
         Ip4tdmCk4thVn2IupNxpnmo1/gud2XUpxZ5lmFTOJMZlkMAQlalllgrI/ZKc78NbCJtt
         hjEpqtqtgkUp2f0J5r2ERbSih32Ldc2ngjNALYTeJgfp8nmZr+qQb5rf1RCzjLkiTxOJ
         eESiK3Vp8E6sc+ZXFvyaux4WvrRI0dW/uHOv2QtvgcDyzhbY5HYHOaWfrHEB6gY9vuL9
         Klx5jJBW6hCdUfkWEqDsrKxSW0TgClohG3ZW5l3SDYPr7pctr1KJlnlY1mWBI/yOt6pU
         s0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22cpIMVo0mA6Jzd/hOHKABBmcBen8QvMhPR2HSaKBfQ=;
        b=olCSxVS8s14QhbGHaCmWpnn7uo4UO3q6FQkIiCrV+UmkbyD6dzaDzwYgh08kNmqDMW
         6sOTj6mswS0dYO8Ff2U7aV5nz4vCRAX4mTtE1bVlIEbXam9VAC7gW7vBXfLD5QpiTV7q
         pmpe0Z5Qqr4Kns2PFAiAcQuSWLLDbiBP9U/c60UucuPT6uAOMgRNt4XZ45J+qNGAjQk3
         LIfqpLfxBjQlxO+kcWZX/xp7p/E3T9HP5CaDEVymFjB8/6bryu5whim54CFcNotimAhK
         OJCb7NNIqSyhmvO4qa5r/jE5kZGxasPX1pcaEVygyPUrSS00O+z19qBgz3b5blLPiWP5
         gKKQ==
X-Gm-Message-State: ANoB5pk2JCUd3t4xXI/LSJuVsOS5S0F/a3au18uFENNZPu4Ecuj7BJ2a
	3jij7Rg00cIz0ewDpFgb4O3NeQ==
X-Google-Smtp-Source: AA0mqf6RkthBpqU68CQBd+vmDxOO1uiFkhkP9+BnLWGQjYO0j8vRPC7xMyHfe5FD8ZpgEeJ9TX4Szg==
X-Received: by 2002:a05:6402:294b:b0:458:cd82:91a with SMTP id ed11-20020a056402294b00b00458cd82091amr18650253edb.15.1669079292221;
        Mon, 21 Nov 2022 17:08:12 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:11 -0800 (PST)
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
Subject: [PATCH v2 5/7] arm64: dts: mediatek: Remove pins-are-numbered property
Date: Tue, 22 Nov 2022 02:07:51 +0100
Message-Id: <20221122010753.3126828-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170825_604029_D4944D70 
X-CRM114-Status: UNSURE (   8.26  )
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
arm64 Mediatek DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi    | 1 -
 arch/arm64/boot/dts/mediatek/mt8167.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi     | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 9dc0794fcd2e6..ace8e751c8ea4 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -270,7 +270,6 @@ pio: pinctrl@10005000 {
 		compatible = "mediatek,mt2712-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index fbe1a1128cc6a..6a54315cf6502 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -117,7 +117,6 @@ pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822b..18e214464a2d3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -929,7 +929,6 @@ clock: mt6397clock {
 
 		pio6397: pinctrl {
 			compatible = "mediatek,mt6397-pinctrl";
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7640b5158ff9d..c47d7d900f283 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -375,7 +375,6 @@ pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8173-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index d1b67c82d7617..118025263a29b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -229,7 +229,6 @@ pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8516-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.38.1


