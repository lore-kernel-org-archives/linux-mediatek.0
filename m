Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75592C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 20:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a9AlBPeJgfHCUstEBvtnnn5nMWn+dE+m3tosXNjPQ5U=; b=qSl5y9sM5ZEJ6Z
	BZUVUEvKrQq6Uih879znW3wblpdqvkSO9Te7VQE4mkYywXXQORyqo35FBdETOEhATONpEmDj/XqcA
	cSdKPNhWHGycXBiVpI84+KWruTJ/jn/fwIGyqOH97FMUMU1pPZrAOFsjVzos0WDC/CyAr4ijMI+4t
	XSAFVuBxuF8q2as6Dvq2eFqPZMAOeUSUukMeZbvyA69VGWCn5kQRiPfE//ySmtmm+FnYXdAgGlVyZ
	YnQqHWvkE5IaLgeIgvsbFFNyVAuxfnyuw1AQfAzy2ep0vKRWb2PrZhXUiEIVzfdUyVtueCgjjBife
	CWGJ7Par4VCkKLHMmxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncYq1-00DvcF-U5; Thu, 07 Apr 2022 20:34:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncYpV-00DvOb-Vn
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 20:34:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id qh7so13179223ejb.11
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4demkHQ8Fg0Aca60O/7JU7pagAyPbUQlML8jEugCG4=;
 b=faF6ayajtjqODf8i8x4Ee4sgq1q3Fe8w5GIBNd6EUxYhTh8lRr3ScB1O2+f/eFZVB7
 WBZuT4ZezncXpe3w3YfCgXtmZ9ME1HUKZCh7SMj18BdBBLX61EI2U6s/TlRJ2XnOnROK
 CBSmDDp2XF77fg+vfg4nylz11gURLu/w9p9t9U7ins3Z5+XVdzzfmyQi/UDZohlf/hSl
 6zfP7PMuZ7D/yis5OyxXt6AirCAXefP5nyXCPBWGl367EWAh1GzSdImNZbK4X1i7HBSa
 voE2I93cGhnsbCRAHteqmmHiYjHWMuzbqRTyegl56f5fMmWddGdye9mBnm7QBXCU5N8b
 IShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4demkHQ8Fg0Aca60O/7JU7pagAyPbUQlML8jEugCG4=;
 b=Gaztt08vXxitmjfXOG+/4EW9eBVmhUU9gYHeysPifb7bc0367CAi4xFhJiNH9r0Pta
 EoIHX2N+lfiei8BvWJ0JZRlZIdW+zd0zh3LCigD4mHjpSlyjDoWamiTQloCTKswqRUeJ
 HdI/SGU3ZlKm7FYw8+RxFNwoT9AOUaTAmRymbOVY2E5ymYsy7/83zVXhv9Xh/8NvPkEm
 jr8ghHvRiCW6XdxxhZEJuswC8Ck2SwJ/UgnMlaF2PIP5omt84+6IPeaOEAAjh1pRCOJQ
 PQhDa4qB6HFbJ26/RdXlAqXdAKfaQEvGsQ9kY1jXXr8svpWN++tlE9NarTcwEe3emcti
 psNg==
X-Gm-Message-State: AOAM531jrikio1Lg5vKphLvQKCejBtuPJJvMOd1JSo7+FGVcII9DzGdM
 LOVh4WWu2NTStoEcQY3FMeECAA==
X-Google-Smtp-Source: ABdhPJxEDGr4Jf8tpwen4hc/gkUEJCBUHaMs6G9kK5gOiZYqgWgJpng5I7H46vgQYhy+G8VXg0Ns5g==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr15195488ejj.767.1649363647213; 
 Thu, 07 Apr 2022 13:34:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 p13-20020a50d88d000000b0041cd1a083f7sm6134799edj.1.2022.04.07.13.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:34:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: mediatek: align operating-points table name
 with dtschema
Date: Thu,  7 Apr 2022 22:34:01 +0200
Message-Id: <20220407203402.33356-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_133410_062839_8DDDDBCC 
X-CRM114-Status: GOOD (  10.82  )
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

Align the name of operating-points node to dtschema to fix warnings like:

  arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
    opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi  | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index a27b7628c5f7..16905596316d 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -19,7 +19,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp00 {
@@ -36,7 +36,7 @@ opp02 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp00 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2b7d331a4588..acb775ca682e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -57,7 +57,7 @@ aliases {
 		serial3 = &uart3;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp-507000000 {
@@ -94,7 +94,7 @@ opp-1703000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp-507000000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 4b08691ed39e..3129e7783902 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -197,7 +197,7 @@ CLUSTER_SLEEP1: cluster-sleep-1 {
 		};
 	};
 
-	gpu_opp_table: opp_table0 {
+	gpu_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
