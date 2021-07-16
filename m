Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB96C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 05:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B30A613E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 05:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B30A613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+VQrL+XUyG2e8b+6IqoxEZ8JyRZQsP8tBUZ9zZJCliQ=; b=QAExlQ0JqgQbva
	8RZq7EsgnaHDZAehyf6/Wc/mixmEjU9Ehnp3E9AO+uewedVqx2EftjzSG1pIuKDvummtQjdM5rGA3
	96N1ecPnMsYNy10x8aYTMWCROGlaS4/wHO3cDfWfe/ojxzSX3oO141QNWM0JNUS9+6BK/uF/SCP+T
	fRKdrJaBkXH+7KcxVEZOx0M3Qi2cU6GqZ5jXSfp8enYd97oPM/JUQaWEFPi3+xmVFABEJIiiiXZFr
	BRvX1pWGUHw4wkS7FU6F2pnXqWOeJ0cD87IHOwpxHNi4S9p49OwkXA8KuK8fgSNuqFKIdIZBgt2xK
	7va0fX5X68Tqrusos+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4GHq-003AJy-Fl; Fri, 16 Jul 2021 05:21:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4GHo-003AJO-K4; Fri, 16 Jul 2021 05:21:21 +0000
X-UUID: a54edb6be84d46e892bdc966812a6e32-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gfqlfFO6NqiHqskUozb2VwsLBL4xyFF4zNJNag6javU=; 
 b=ZYjATG8jHzY1mahZi+nKMQzuHbXZAxBI94JeOKl2tFDbGtYqYC+r33/JL2ajVd1oKGWgkgq5WpsGfQCdwcU3I06JX/5Fqftl/A5sNXhukNr2WbiPgBtBgUj7Q4xYmjqF6hYLwoeI1pbt+ltS0QxYHy9BrGu00ZtcjhIZy4c91oc=;
X-UUID: a54edb6be84d46e892bdc966812a6e32-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1103342450; Thu, 15 Jul 2021 22:21:16 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 22:17:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 13:17:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 13:17:33 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent
 <fparent@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [RESEND PATCH] clk: mediatek: make COMMON_CLK_MT8167* depend on
 COMMON_CLK_MT8167
Date: Fri, 16 Jul 2021 13:17:32 +0800
Message-ID: <20210716051732.3422-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_222120_710575_1952D18D 
X-CRM114-Status: GOOD (  10.61  )
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
I think it is clearer to make COMMON_CLK_MT8167* depend on
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
