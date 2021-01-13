Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C837C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 18:10:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE56233ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 18:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE56233ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4etqmeCdemOe47Lv8n5FEg1Pu/7VyZRKW4zgo90D7dc=; b=n+Eui9NMQ2kkmfqCXLzAndPSs9
	6DF4bCvuKLzg5WFopz2R7aaJ0IpstcyG2rbn94a+byVbjLeNRt0XgZaP9Hb+s48+Ki42XYJdXHnIj
	nrYax9IqDWFCY2yJ4HhnlSiW5kgkUi0fs46+t+GiMbFmq9p+lVK7s5C2KvMUV3ZJMYcftjAPsEm6M
	1dQumiUkCDWG9fxKWedStuTd4XzwguVPEOgtorWRD9etI8R5KM/K7pLGQPHg/MyR/GT4KoZxJz2Ve
	75cMUmRHkM07NJ58zGrFwtGOcOkMBTazAwdpWIpfqT2aTgLzZEyfj8/jIAvN6ooQJWm6600pAPW3D
	ElVc9lcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzkah-0007kO-5F; Wed, 13 Jan 2021 18:09:55 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzkaZ-0007iJ-KS; Wed, 13 Jan 2021 18:09:51 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout1.routing.net (Postfix) with ESMTP id B79043FF07;
 Wed, 13 Jan 2021 18:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1610561380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=E2lk75BZSz27MihA13aYu0dHFwcD4S99yuODfKDmRY4=;
 b=p7KbIaT2J3AJYD/JahEVLjPrQ4jj7GjomcnVJ1/fcmhVkIq5wT9Poun1UJTkfxPJgCRs2E
 ZIwh4ylWARf/gJ8NRKEki06Nr2tg/vW8um66hjs/vhUbrUAh4m3HNYVjaLDlJI1z0NsXEj
 pMpCAGQ/8uCMPo41Ebg8aqi654rZ5k4=
Received: from localhost.localdomain (fttx-pool-185.75.74.15.bambit.de
 [185.75.74.15])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 884FD80AFA;
 Wed, 13 Jan 2021 18:09:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dts64: mt7622: fix slow sd card access
Date: Wed, 13 Jan 2021 19:09:19 +0100
Message-Id: <20210113180919.49523-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: a4fbb957-4fd1-4532-9841-53bdb81f3d8c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_130948_022307_31B9FF5B 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Wenbin.Mei@mediatek.com, sin_wenjiehu <sin_wenjiehu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jimin Wang <jimin.wang@mediatek.com>, skylake.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Fix extreme slow speed (200MB takes ~20 min) on writing sdcard on
bananapi-r64 by adding reset-control for mmc1 like it's done for mmc0/emmc.

Cc: stable@vger.kernel.org
Fixes: 2c002a3049f7 ("arm64: dts: mt7622: add mmc related device nodes")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes since v1:
 - drop change to uhs-mode because mt7622 does not support it
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 5b9ec032ce8d..7c6d871538a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -698,6 +698,8 @@ mmc1: mmc@11240000 {
 		clocks = <&pericfg CLK_PERI_MSDC30_1_PD>,
 			 <&topckgen CLK_TOP_AXI_SEL>;
 		clock-names = "source", "hclk";
+		resets = <&pericfg MT7622_PERI_MSDC1_SW_RST>;
+		reset-names = "hrst";
 		status = "disabled";
 	};
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
