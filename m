Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DDDC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc4Y4SAIFoFn8jPAI1hxh2Ksk+Zr6EYx6OygiPrKgco=; b=XeUnF1wWBkNmoJ39Fkg5LgP/nw
	DNa46AGWJBqxqcez40zGsMbqvt1mEtOHQpkb+6PyLqI2a1MCtgVaN994k+y4goRozTmK3pecOZgMY
	H+BUpYsIqyTJyvVuiXJjr8pgZ2ZJiRzQykOcPHIUMpW+EJPD35PnezSJIyiahR7s6HRVBWXV5SqX7
	pufJLlm2RvbTxajpK43jI8oBoaylspXhWjbBioNqjemJ5B2jXSYpKpPSBHphFJXd6dfK/m1P233Bw
	8DM2a8pgcJWq5LSqqAvAS9LlElW9yX1RbBZhwEOTSwK9Fit9dDzwIQQHkVYTag4Meq6pU1yhjelHR
	DBc7W+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owx2g-008cl5-FP; Mon, 21 Nov 2022 03:00:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1l-008JNF-Uo
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id gv23so25378351ejb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc4Y4SAIFoFn8jPAI1hxh2Ksk+Zr6EYx6OygiPrKgco=;
        b=2U6M1hW2z1IDf9Pi6vhVLi2hcgjGP1H9Xc9hMTZxCCXDju+bFv13kSmaSIR8KgK0gq
         QX6WhTSHFOM919dhLRz/wKu2VG17p7OD8DoD0A2TQBnZtku1Iw7EFdxhhtnn7zkTGhJU
         wCrsUa/VnPXIkDJ932h39+yAy56eHjO3/RutNrdkoJSl40asovIpPyM2Q0szxSDs32zo
         nbaE25+PHY+cJyOKSNSHtm9+jprVsa0iV1jhz+C1X4aOYmgGwFxWdguU+B5zKzb2SKtj
         PweNV5ANsuBva3Pw27HJofSYx1qQex/bqn7zimo6BBHw0TfwIk/+cKRgTPLImMcVfVvJ
         MOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bc4Y4SAIFoFn8jPAI1hxh2Ksk+Zr6EYx6OygiPrKgco=;
        b=l7u1t/EaMe1HRrkcMLU9GGaowKk962YXtLMao0V3Hnh7AS/lNqG/Y7v7iY31BPRmmC
         6zm4CGFpeFKUs5t1fHjawxKzUo2Q+eANsOslnDgQaBLBRY5/3QPFfk+MokUbCPEmFrKA
         GRQpvb+BeznMqMJgy078bbwN4nZzOOLUTMxHBDKqwynmKCA07HVP1PMw3VwVJQrmojFg
         tl9R2xWF7EO4fnq1HOfP0zmp5HfQ865bvhllsgIwMuIevoVMke08g/HbWAKQmAjnb2y2
         p0/zA//RkkDIrf8ME+erCGhHTNhulKGb6wMlts2FW6bSgx4JTiNfOCokyOhdmEjWwgti
         HDLg==
X-Gm-Message-State: ANoB5plqwicXYAVpSsdGdWi4tgIVguWV0TRwsSpQyP3y272kz/PEXYWd
	CKKwTkeKxA3YPFVu+S6TAWV8MQ==
X-Google-Smtp-Source: AA0mqf6HbQ2JREY6+R1bij4vZP84OeYrnYzMw1GJ9Yd6OfCk6AgctzLAKVQwFVS8h2k0lKKVkxo5BA==
X-Received: by 2002:a17:907:d092:b0:7ad:7e85:8056 with SMTP id vc18-20020a170907d09200b007ad7e858056mr13505975ejc.40.1668995710662;
        Sun, 20 Nov 2022 17:55:10 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:10 -0800 (PST)
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
Subject: [PATCH 5/9] arm64: dts: mediatek: Remove pins-are-numbered property
Date: Mon, 21 Nov 2022 02:54:47 +0100
Message-Id: <20221121015451.2471196-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175518_395851_0061437D 
X-CRM114-Status: UNSURE (   7.99  )
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


