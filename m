Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393D3C43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:50:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF08061154
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF08061154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vCrnz8QTkgKPww/4VMBMCFqcaYFw+EeVCpirBeBKqwU=; b=pjeb3f3XDPrJh+t78D0vkXJVkm
	RQSKqiWSIVXx71UE00+3a4QmKRGXdmDWZTaGqatbYBB2MbJDTcUIEXuinRFkADWtU+W+4lpLr2eL9
	NGom0zeOV5TrjjpzyXZthYno7VZsOIxvUnlXQP78JtvJqeyvJ8dWOkUNHtXMQO2ow9FNuOZ6RJyl/
	DEKah03KyQbGFPd6r0PwpTTPxNstYf2MEkh++u4OWlliHK265TBYdJXf6b/y+tCfZlZsYDgs0cf5j
	ryA4lEsh7GH1sIg4sEbdWSFlQRmU0mGlvx2dQofhYGk29HT0F5d+PkbTb7WV5GeTNvXy+D+ryZrJT
	yrRGFEvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj3rA-001Wxj-T9; Tue, 18 May 2021 17:50:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3qz-001WvG-AT
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 17:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Gl8VJYhAQI3TRwRQ35D+w8dJpAM3ONFhp8A1OmnXSMo=; b=lPYL3jBB+SYL0wnflD/QEIsAls
 rXVDWyj1r39fA1TbYauzOk/vFENCRRWqNvlpu/6Xd+lJHhBtWd15WKh1iP36KEF/Yhh3kUKs8di6e
 Yn5ZNgSgw4O1H+HjUIJW93O8zTYMOQ/TceUOV/7TXIhqDhxUzw++93f4wU1EcWCOhrwu6m2Mio13b
 Lb5InqljmfyCzJpLH0VknHBZ1EwbfGRumSEkcEgn5HcCI7/5BugrAJLiWnrhWgKquhlLwXygzF4VF
 YXVgPIQ1xhSyHrlFCvQf3SzArCosKQIjhCZN4CyKxXGbiLPnMSJ7FG6urSyA/mqfv3+fURmG5tdfS
 kxnRCdlQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3qv-00EqrQ-Nr
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 17:49:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id j14so9449018wrq.5
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl8VJYhAQI3TRwRQ35D+w8dJpAM3ONFhp8A1OmnXSMo=;
 b=AUr8zBIIePIoFqg6DpFsMwpGhzG/9Cvzt08MmeLDH1cBeySEuFQsikNKFiUxOeAvlK
 +ni5gM9njkAcFTtetDG7+q8EBh6ERotNyyf8olQnXc+dsYfJZNNMqd7fNScyXDpU87MJ
 BRPGhT0Nk77eyFJfAo8ba9TL6HP3hBZUvHvWwW+Qx1dUyHvZ4DF1LjVt4oqpDevw8BgX
 rgYpXbrqU7kV4p1gCHXNx0HgN6QafJa1cN9JmVYJgReTk+viRpQdpS229la+utsIbUYb
 qdD2NRRT/qkEQpOQGHgeYYxrPz3pc5a96tRaS4fVBHk0+z8eseezhXSayKY5kagRc4Of
 XXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl8VJYhAQI3TRwRQ35D+w8dJpAM3ONFhp8A1OmnXSMo=;
 b=BitA7cLVYAD4SavSsp10BGD5vuoZroepHanGI1wURmXWThKPka0IJK4nbzLmSV+8BI
 tSNeTXOUuFWsSjGWiyt8ozOeaBHTOcWyAVibyaFaocELFxh5Ct2ExwHSXjvry/J1fFbz
 guJP5MA0EiaxcG1gdGuk480S+c6BsPJR92+BIIH5N4YQLxoc0Vk6wvqPWZYRM2fTirz1
 JwlLMfswycE8QnNc8scSSs+qTqE1kZFxGTdk2FuTW/0MrFgKOIfscWUN0DwF9KoG4rUd
 UHmFK0dm8lKe1l4wpnbh38bi8UIkYNyv77et7dGfoexa8TsexP8ix9x9p+EAyErMGgQ0
 KStQ==
X-Gm-Message-State: AOAM532mxFOP+9ZLrxzR8DDADdHRURXCxTWQbcmnRQWm97bD2GfqbPo9
 XDnF5s7Cjor948Z/GKn2PFuC3w==
X-Google-Smtp-Source: ABdhPJxcKvaemzBTl73kbrRDUgwxoDNdc1YVk6iTA3PvkBjZBgHGlW/VsDW6/2iGMRJEBKgbCJFRbQ==
X-Received: by 2002:a05:6000:1445:: with SMTP id
 v5mr6930370wrx.412.1621360196158; 
 Tue, 18 May 2021 10:49:56 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id h14sm27991329wrq.45.2021.05.18.10.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 10:49:55 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8516: remove 2 invalid i2c clocks
Date: Tue, 18 May 2021 19:49:40 +0200
Message-Id: <20210518174940.2672318-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_104957_879525_89C94D1B 
X-CRM114-Status: GOOD (  10.24  )
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
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
