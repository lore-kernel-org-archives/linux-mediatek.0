Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D776C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:22:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02006135A
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02006135A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGtN9foAEmMtlr5j9xwzKgJPigNAEhE6DCXs7sQSTus=; b=KB+EQO3GKTKuH/cmQOeqmWgHLh
	hUsNwDZ6k7eBNjVv4nu6qBG4dtnIeLPUnfqYc7pjHJpninoKcBE7gyEOQvPScGk+KCU6Nq1X5eIDx
	TU67RlMUp1gllohrBOw83o8pthkxKbg1l8fswFDmXH+CX2PITc5yCVan6jQuZ4rzJSZ09IzEYKkkB
	XWk5n8fpwvoWN1W63dQMiIe8FgVJ0jLQ1Yynlk//ZZx0nngGHBDcgMB58IlcSTYJwncT3sIc1gVDo
	aj1HykJpb0xCOm/rwMUedF4mjYBTRvx12Lp9QqmOSgTleG/wReVYkh5JcQZnTqgILv7ZZosTQYu5E
	nxADy9Kg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgkq-000Qew-1h; Thu, 20 May 2021 11:22:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgjt-000QBt-6t
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 11:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=I1s2g7mZiKD+3vqbYSRNmdSX/CMtcVBGAGHbX0P5N+Y=; b=EvFMyF/SyZp+kGJhMdWeprOK0w
 vxSAZFfqcIz4tBIXaL8GYTFdmtOHcDpOMph7BvSlizFEU4gHwl79osTf2uEM6eoujXCjQS83ktsh/
 e+FCE0jc6c2o1tWFf5Xgah5Vo8J7cnXZnUdSbi4aZOx+H8gd2haSVzXSc2/l8+nRYejTvXp4RtZp/
 Af4o2MbbO6hMJMcZU/fbd2HFwUuvroZNqxuXEnVPlwlJR7ufkiVlq1HFqxNT75NpZOhfrFo6S3wSn
 EzkbfCHWdqC5NVkfeL9VJOkjzb3Rd0Y+v0vM86hpxtIs8InHWHo/kB2236agRZsnbw1d5VMgkJ3RL
 G1xvgXdg==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgjq-00GEl1-Ma
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 11:21:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 62so7919076wmb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1s2g7mZiKD+3vqbYSRNmdSX/CMtcVBGAGHbX0P5N+Y=;
 b=dQXS0Q9+oZRSBGRK9IhEcny+g10qxP56m7wQL+S2aq4svKPeRJkuV1BHZlLHSQNs1B
 woNjvZXc2ckEW/Kl8q78BIRa6upPdqxeGocCHpS5/JL53eYZErgAtR6zBZar3EdqH6NN
 xVOlHbRmDlUXGA8OK5xXHyFW0p/B68RYExjov+c0N9uX9Jn/ZhoFGf2UZ7KhmceSQofR
 mUdNAG992HfUBXokhiuWG/b0q5QIpRtAcKir4Dtrigr6OuWcm5VQ8IdB/EodtZwe5FOU
 5zDqO3qxJBRWkX/8OUMSffv6if7yrcPbxGjzY6vJ8axrb4YjVBpe3HFM4YEnxqVeLccs
 BO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1s2g7mZiKD+3vqbYSRNmdSX/CMtcVBGAGHbX0P5N+Y=;
 b=fNTrX2+2TCjgD0iEpTyVfcwpiKkte/aeVU/uRb5hs2Me3wiorLg1IE2H/CmCepOWX9
 hg5A4p8cKQPIchUjQy4w2waKOgce1BS2xkFq+qtv1y6QTusL9AtKwEekTmMw1/taYBKC
 LpKbpLt/pTo/WOKgeMHn7dy2+QlSBdrTEnzZEuU2J7phNkS/I72uMMkt9DdJflAwT6Ic
 T7/Qriif77Q4+6tv229j1AOmhyFS3+enDzzqS5hSagay2CVoT5xPGC/mJQYo+fAcDp4n
 wNJWHLDeoRoeItem15Na8bY4KxFbUWjX3l3c5yzmUJXEpSk9rb5bxRhsRicDPaIi/MMn
 8yxQ==
X-Gm-Message-State: AOAM532jvgr05xTzVEL1blo+k9WKEl+DQViO0LNT/PHzIps7tzYb7c1D
 bfarKPrxMl8FTNrGz9UvcDTvqg==
X-Google-Smtp-Source: ABdhPJwgZ2Uy9gIUoGlppdjJs1r6s6YTR4PaEUrIYWth4zddJArej2XDwuX9NSmnvHi6LOsm7bcw/Q==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr3600762wmo.180.1621509672880; 
 Thu, 20 May 2021 04:21:12 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:21:12 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt8192: fix i2c node names
Date: Thu, 20 May 2021 13:21:05 +0200
Message-Id: <20210520112106.77190-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_042114_743397_ED747C51 
X-CRM114-Status: GOOD (  10.89  )
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

Fix the i2c node names to be compliant to the YAML schema. The
I2C node name should match the following pattern: "^i2c@[0-9a-f]+$".

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2: New patch

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9757138a8bbd..684e8e32af16 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -436,7 +436,7 @@ nor_flash: spi@11234000 {
 			status = "disable";
 		};
 
-		i2c3: i2c3@11cb0000 {
+		i2c3: i2c@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
 			      <0 0x10217300 0 0x80>;
@@ -449,7 +449,7 @@ i2c3: i2c3@11cb0000 {
 			status = "disabled";
 		};
 
-		i2c7: i2c7@11d00000 {
+		i2c7: i2c@11d00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d00000 0 0x1000>,
 			      <0 0x10217600 0 0x180>;
@@ -462,7 +462,7 @@ i2c7: i2c7@11d00000 {
 			status = "disabled";
 		};
 
-		i2c8: i2c8@11d01000 {
+		i2c8: i2c@11d01000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d01000 0 0x1000>,
 			      <0 0x10217780 0 0x180>;
@@ -475,7 +475,7 @@ i2c8: i2c8@11d01000 {
 			status = "disabled";
 		};
 
-		i2c9: i2c9@11d02000 {
+		i2c9: i2c@11d02000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d02000 0 0x1000>,
 			      <0 0x10217900 0 0x180>;
@@ -488,7 +488,7 @@ i2c9: i2c9@11d02000 {
 			status = "disabled";
 		};
 
-		i2c1: i2c1@11d20000 {
+		i2c1: i2c@11d20000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d20000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
@@ -501,7 +501,7 @@ i2c1: i2c1@11d20000 {
 			status = "disabled";
 		};
 
-		i2c2: i2c2@11d21000 {
+		i2c2: i2c@11d21000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d21000 0 0x1000>,
 			      <0 0x10217180 0 0x180>;
@@ -514,7 +514,7 @@ i2c2: i2c2@11d21000 {
 			status = "disabled";
 		};
 
-		i2c4: i2c4@11d22000 {
+		i2c4: i2c@11d22000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d22000 0 0x1000>,
 			      <0 0x10217380 0 0x180>;
@@ -527,7 +527,7 @@ i2c4: i2c4@11d22000 {
 			status = "disabled";
 		};
 
-		i2c5: i2c5@11e00000 {
+		i2c5: i2c@11e00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11e00000 0 0x1000>,
 			      <0 0x10217500 0 0x80>;
@@ -540,7 +540,7 @@ i2c5: i2c5@11e00000 {
 			status = "disabled";
 		};
 
-		i2c0: i2c0@11f00000 {
+		i2c0: i2c@11f00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11f00000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
@@ -553,7 +553,7 @@ i2c0: i2c0@11f00000 {
 			status = "disabled";
 		};
 
-		i2c6: i2c6@11f01000 {
+		i2c6: i2c@11f01000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11f01000 0 0x1000>,
 			      <0 0x10217580 0 0x80>;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
