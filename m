Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E19C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZPcN7pXOOOVbqcHKkwXkkN1izYaSljOt4XC8q/dXTg=; b=jhxMnwOHdC3ukU
	rQSJF4i008aB29l4cXAXxHuHUV/MLZcC7xtoPxAIrWJ2aA83nhEdk4rLNZtdspnqwQNaPPWYeD5fD
	sywJi4VFl4sNmrGPFPr9nZfIF2RSv8tFgloEZkCazHh0XAKE2g0TS1Ml1+tT1ALiUcOZ3p/73AZHk
	a8az4nze+sabePFC6PHAGB+IOkSQoxH3u45SgSzc8NsPTLKLGyRh0aOWc1CFbW+KYwT3vpKZAcD2U
	6z/we6hR2lfyIodCi61xLIanSihtcvLhvcbXc85axhetytv6YQ3pGeAJ4/JU+B3ipsS5t1gTvGzz8
	PiSl4NOrYL+9NkuTRz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncYqS-00Dvo9-C7; Thu, 07 Apr 2022 20:35:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncYpX-00DvOz-9b
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 20:34:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id bq8so13226909ejb.10
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgadCIuDHSONda5a8AlBMiHSHORPXO/YIVbS7AR7TQA=;
 b=HJcyO+iyzMqE/sQyRjthCVW+qXowVaN11+BZizM5k1G161UQb2N9kNPsp7GKv6z+zo
 CWHEYiTS1J5yuneRxmPcMImj6LTHI3O4XD5500mf93f9iofku7I3jOFqQFvk/pY7KsE7
 iSrnxlwj22PC9mHQtg4bmj1wQszLTcPWQnwqH04EQeLVJu96yveMmTal53PCAYWhxk0j
 GCUl1IuKda4n0K7ksYu7wy7xxLhFmyGapDNwVxM0UfyCnlrTWTALpG3vSc8RD0lhAZGO
 89DeWEHs0PCYfK1Ozss6ps4moEu7BPtdZtBd+AyPRD064enE7bwxNMy3urL/mbFZp9oD
 cMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgadCIuDHSONda5a8AlBMiHSHORPXO/YIVbS7AR7TQA=;
 b=l37K6Fe1bappZsP1APtjIiG1QItqHp/onHmFINvG7d7cSuU6W8EQMbl4reklLs1ocs
 FBUyABxd1FhaQRc3JpiX9L3V3DJWvK9w2d9kpH38he5bIhXlsClW8dQ9sWUbuhWIhvP7
 VhD4Z9KjLisCjGeizFLMLv/7VfwSZmgvz1BYBZTcpSLhiMr/7GEC+X1nZwG4cJk9DMPm
 TyEO8d8PTbenX85hqrREvz5jDzKii7cF5+Jv74nio8Eu9K5UQBAvSl2IhtVuk0+wSux2
 mnPfSGyCgNiXRfewtKHxh1gQGEsbJc2lu4LuWsyyVtD/DxeQXM+yVAoqxWtIE3JiQJpo
 3xBA==
X-Gm-Message-State: AOAM530rX7Kx3/XetzNB1dAF7YvOT7lPjLzL9vm4R3zqDtaEKGPO6V4l
 xjL5HYXsgR7LHhYUFMZ49Tr9Qw==
X-Google-Smtp-Source: ABdhPJwg2fPFcOmOxRETaOJJDkf4GoOxHDtuoVYZsGbXoaBOj8r/RXDTmCiJ+hztxHnvqqxDzS2f5Q==
X-Received: by 2002:a17:907:7ba6:b0:6df:ee7d:10f2 with SMTP id
 ne38-20020a1709077ba600b006dfee7d10f2mr15400650ejc.98.1649363648703; 
 Thu, 07 Apr 2022 13:34:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 p13-20020a50d88d000000b0041cd1a083f7sm6134799edj.1.2022.04.07.13.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:34:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: mediatek: align thermal zone node names with
 dtschema
Date: Thu,  7 Apr 2022 22:34:02 +0200
Message-Id: <20220407203402.33356-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407203402.33356-1-krzysztof.kozlowski@linaro.org>
References: <20220407203402.33356-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_133411_385162_450E22FB 
X-CRM114-Status: GOOD (  12.48  )
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

Align the name of thermal zone node to dtschema to fix warnings like:

  arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
    thermal-zones: 'cpu_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index acb775ca682e..9811f92faa56 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -273,7 +273,7 @@ cpum_ck: oscillator2 {
 	};
 
 	thermal-zones {
-		cpu_thermal: cpu_thermal {
+		cpu_thermal: cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3129e7783902..151877fa6bfd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -823,7 +823,7 @@ thermal: thermal@1100b000 {
 		};
 
 		thermal_zones: thermal-zones {
-			cpu_thermal: cpu_thermal {
+			cpu_thermal: cpu-thermal {
 				polling-delay-passive = <100>;
 				polling-delay = <500>;
 				thermal-sensors = <&thermal 0>;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
