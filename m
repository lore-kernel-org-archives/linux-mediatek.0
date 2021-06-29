Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923CFC11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 06:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DEE961DC6
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 06:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DEE961DC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wkod9SC4ycQoEnaJ5aDR2/yupm2aJA/5SezEwJcrhhg=; b=Bf5pdANKuG2d2c
	xlRw7o9CniBCCWW7DU0J37j95klja63SlbShl5Ce2FjaTdOwBMY0MSr3HCzT2swzpruKSFTuJM4XX
	oR6aykLpu+chyq307FNxAVFmfFG9UGsck90NBztiLt5SrOynDySO8SsBi2R4tj2XdhJ1q6+2gROvK
	9t70N9iwmgj9Kh2/3n8ZttIsCj1PcdJNU02oyiwLFumFo2kur0dqhPnvyveoveME7GgOMRiWeP83l
	LRapVCTrfu4OJbQDwNhpqC9w2H3kzRK8AvhBL02t2Z6W3Es3+MlkcrTkAkFCvTdCib9/2qj2+qh1T
	odsS8Y7uzYlYd0TkrTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly7UM-009xwi-4J; Tue, 29 Jun 2021 06:44:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly7UI-009xwA-6x; Tue, 29 Jun 2021 06:44:53 +0000
X-UUID: 00a95205b3e247d78813cb036f6aea78-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ge95IUVelv0o2EQIhGkWZp8E9SepYt/pW/vxf9nffv4=; 
 b=NsFAfKwhvem4eIHK6dWGx0iekHGNIgzH37RT6/mnGc0lIsQgLrgpVp77AsZudxXj7gdJp/DK5IiSWG7uAyeMB1T1ZGKXvnCZUG//pHbC8HLJPhgbQgEw+0t+XOqVQpLVJRYAZNboS616G1WrzhkqwO9mKbLpgHbzrLbkX7o0bmY=;
X-UUID: 00a95205b3e247d78813cb036f6aea78-20210628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 295406468; Mon, 28 Jun 2021 23:44:46 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 23:43:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 14:43:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 14:43:02 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent
 <fparent@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] clk: mediatek: make COMMON_CLK_MT8167* depend on
 COMMON_CLK_MT8167
Date: Tue, 29 Jun 2021 14:43:01 +0800
Message-ID: <20210629064301.1406-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_234451_932340_2B051EB3 
X-CRM114-Status: GOOD (  11.21  )
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

I found that COMMON_CLK_MT8167* do not depend on COMMON_CLK_MT8167,
so it is possible to config:

CONFIG_COMMON_CLK_MT8167=n
CONFIG_COMMON_CLK_MT8167_*=y

Although it does not cause build breaks with such configuration,
I think it is more clear to make COMMON_CLK_MT8167* depend on
COMMON_CLK_MT8167.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 886e2d9fced5..ce6d59e4ca82 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -362,41 +362,36 @@ config COMMON_CLK_MT8167
 
 config COMMON_CLK_MT8167_AUDSYS
 	bool "Clock driver for MediaTek MT8167 audsys"
-	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	depends on COMMON_CLK_MT8167
+	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 audsys clocks.
 
 config COMMON_CLK_MT8167_IMGSYS
 	bool "Clock driver for MediaTek MT8167 imgsys"
-	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	depends on COMMON_CLK_MT8167
+	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 imgsys clocks.
 
 config COMMON_CLK_MT8167_MFGCFG
 	bool "Clock driver for MediaTek MT8167 mfgcfg"
-	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	depends on COMMON_CLK_MT8167
+	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 mfgcfg clocks.
 
 config COMMON_CLK_MT8167_MMSYS
 	bool "Clock driver for MediaTek MT8167 mmsys"
-	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	depends on COMMON_CLK_MT8167
+	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 mmsys clocks.
 
 config COMMON_CLK_MT8167_VDECSYS
 	bool "Clock driver for MediaTek MT8167 vdecsys"
-	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	depends on COMMON_CLK_MT8167
+	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 vdecsys clocks.
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
