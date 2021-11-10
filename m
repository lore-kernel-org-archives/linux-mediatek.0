Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA22C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C346112E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9C346112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ty/rntiiYwKElk5Td2HfyH62mu7dOQQdWZXtmNjoi3A=; b=BQjQzqeGCoawXv
	vPaKZ/1/gjFBJkVP9fpGmUJWsgqXxSWDo93bmRIChSJfCycGs5UaaWj9i3sFF/UvDSyg1AJJqoBDa
	tjlwESRcqG3PD5I1JXlvKuaAsgcKc4k5EYW6tgXSMFDVnRhKHTfk1xe9rlmU438hl1qAjTEhmvTxy
	qaaRRypo5+Pg5w+fuOa2/rzIXqzb427t9bzr8lo9GhOvk7AOdKvBClt32hTZ36uzEpshtZMMxTwar
	Cd2s5SgtzfcZX0kVPSgC46EfPnt6e79YvIxskVfqRuWjlmbt/YfXzNLAs/kHLFCzWDerkvL0pcoaE
	MxWpI7jC2/k9ibH9SpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktNY-006Ae7-G0; Wed, 10 Nov 2021 19:35:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktNV-006AdP-2w
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:35:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id z200so3188714wmc.1
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BDkwgvrUDY3WNqv5c3OEWcmTwIG6Y5n1NIoE/HHargo=;
 b=WTEPfSkKl1x1pcFcsX0dahL/fokN11844m9pMKwfpY5EKNfTL0T9qPkarOB/O1pipb
 sR7UtCTsLUe4jWufYwekcni7SPUgKlCSbZHPOtlm1wkKDM/+45p1pZEANOcrwHI4BbsA
 3SuQ+H0quIMLdOCUOTHS/v78uRLlwm2CcYhKiGTwM58YidI4za3XTdt8pjo30I0c5set
 LVSbsEkoVM0iSAvJdt4vAkj3L2kaq6OXbQqB66+RfGfM2SZfEUB/Xod0m7IZb73C6TdJ
 Z/lyz7MSWy86/gecrInJilbffZCfm2jmZhUhsD9/gYpCju26Pyp7P0he5XEUTI6+miyG
 72jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BDkwgvrUDY3WNqv5c3OEWcmTwIG6Y5n1NIoE/HHargo=;
 b=mzrBmZNjEOd0QkhHazlWGTQegIwQyYJkKJ8Oj8sRt/p04x4S00zyKkaxcCwBEGfoqq
 hdtc6PeHbEIsgpb1F5IXAh10U7mSTuoy5dpAu+Yl8IcIv7rjj+lICHORG6UX9gOCsIJf
 POlbMwQJvn/pg3PfOpYuwylMR0dmtLd3rCEaHqhu+7jkjdnfUrazQddKqgOspCLzDH6G
 IpleGQYcuonKfIf/gwwKHkqeZtzHzOCeyRGV1zUXESd1WkuyyUxQEl6ZCwCWi/Y14oSp
 Ysp2BsudAM6ekyKUiyrhI9o+gHcFUDiZfpx/YnI9e5XnpGBux0F5idH1hv7Ic37HuhjC
 Z0tA==
X-Gm-Message-State: AOAM530zpjTtnAsiPNEund4NE/Ll666Wq+QfA+qFYGYr1xzyTVjgr16l
 z+DP7QCA/t+v3/oeqVQEZcZ7MA==
X-Google-Smtp-Source: ABdhPJxLSkiQVKdK5iWX3YgkQimNkBMhi7q2SK4uMMDbAIzThyqRP8tMQWTVa/C9vFzbwSeDZeuWLQ==
X-Received: by 2002:a1c:7910:: with SMTP id l16mr19521732wme.36.1636572923181; 
 Wed, 10 Nov 2021 11:35:23 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id c5sm791324wrd.13.2021.11.10.11.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:35:22 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove 2 invalid i2c
 clocks
Date: Wed, 10 Nov 2021 20:35:20 +0100
Message-Id: <20211110193520.488-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_113525_435791_41FE5E41 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The two clocks "main-source" and "main-sel" are not present in the
driver and not defined in the binding documentation. Remove them
as they are not used and not described in the documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 27 ++++++------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index bbe5a1419eff..d1b67c82d761 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -345,14 +345,9 @@ i2c0: i2c@11009000 {
 			reg = <0 0x11009000 0 0x90>,
 			      <0 0x11000180 0 0x80>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&topckgen CLK_TOP_AHB_INFRA_D2>,
-				 <&infracfg CLK_IFR_I2C0_SEL>,
-				 <&topckgen CLK_TOP_I2C0>,
+			clocks = <&topckgen CLK_TOP_I2C0>,
 				 <&topckgen CLK_TOP_APDMA>;
-			clock-names = "main-source",
-				      "main-sel",
-				      "main",
-				      "dma";
+			clock-names = "main", "dma";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -364,14 +359,9 @@ i2c1: i2c@1100a000 {
 			reg = <0 0x1100a000 0 0x90>,
 			      <0 0x11000200 0 0x80>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&topckgen CLK_TOP_AHB_INFRA_D2>,
-				 <&infracfg CLK_IFR_I2C1_SEL>,
-				 <&topckgen CLK_TOP_I2C1>,
+			clocks = <&topckgen CLK_TOP_I2C1>,
 				 <&topckgen CLK_TOP_APDMA>;
-			clock-names = "main-source",
-				      "main-sel",
-				      "main",
-				      "dma";
+			clock-names = "main", "dma";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -383,14 +373,9 @@ i2c2: i2c@1100b000 {
 			reg = <0 0x1100b000 0 0x90>,
 			      <0 0x11000280 0 0x80>;
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&topckgen CLK_TOP_AHB_INFRA_D2>,
-				 <&infracfg CLK_IFR_I2C2_SEL>,
-				 <&topckgen CLK_TOP_I2C2>,
+			clocks = <&topckgen CLK_TOP_I2C2>,
 				 <&topckgen CLK_TOP_APDMA>;
-			clock-names = "main-source",
-				      "main-sel",
-				      "main",
-				      "dma";
+			clock-names = "main", "dma";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
