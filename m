Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B41FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=16ql8s7UXjz7QayRZm19LzIg6ERRvCYLZDA5lHE/kUI=; b=uoW9hCqZ3NmuPce39TuA5ws1li
	7MOk32KHx500aiA4diNol5V7kZXuTMhMxScWjnZ09Zj5anPDQwDQ7Z/XFI992h7l9ZY6jSsy9u7XJ
	ffScgyElgLkd5s8zm+0vzKlJdF0YPx8iD+pM8LHvO+f/jcMILEyZXAAzKakCn9rmhOkbhYzXpzEmn
	IfzQPo6lH7XNqHXwGmEBFS16Iy/5dWAubSv7AYLjWE7MA5hZRx0F3J8K+uQdxVh0bo0aqg4CIOLIs
	cKewAyXc0W9GViyczbZ1zJ3YeL2uhaWLrFrHnGrkBWNMNc6YM0KhzqlQL+Uu30wcvrgqtI9V1KzRX
	NxeP5V6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouV5C-00Gumi-Ea; Mon, 14 Nov 2022 08:44:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouV59-00Gujo-H4; Mon, 14 Nov 2022 08:44:44 +0000
X-UUID: e7c19f23aef440aaa631a33b53c3fe5d-20221114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=16ql8s7UXjz7QayRZm19LzIg6ERRvCYLZDA5lHE/kUI=;
	b=ttFZPNcKo29ZvIlbZeKZbUTxeLqC1lGuSef9jhMhrtqKci8yvLH9AmeG0C/PDbLO1gdII++uOiwrGDiLudRfrcAFh2KDqYpDh61FioWL6CMcL/KjNcGekQRVRBBFNiSbapWwancHy0lhFejaW1YuSYd0cU1ftHTUdFx6c6+tTgc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f5c17a52-8062-4b09-829a-a49b540c09a9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:d132aedd-c087-4fa8-aefb-7a0acf417f59,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e7c19f23aef440aaa631a33b53c3fe5d-20221114
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <bayi.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 561581450; Mon, 14 Nov 2022 01:44:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 14 Nov 2022 16:13:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 14 Nov 2022 16:13:46 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, bayi cheng
	<bayi.cheng@mediatek.com>
Subject: [PATCH v2] spi: spi-mtk-nor: Optimize timeout for dma read
Date: Mon, 14 Nov 2022 16:13:27 +0800
Message-ID: <20221114081327.25750-1-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_004443_596944_1BB36624 
X-CRM114-Status: GOOD (  13.23  )
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

From: bayi cheng <bayi.cheng@mediatek.com>

The timeout value of the current dma read is unreasonable. For example,
If the spi flash clock is 26Mhz, It will takes about 1.3ms to read a
4KB data in spi mode. But the actual measurement exceeds 50s when a
dma read timeout is encountered.

In order to be more accurately, It is necessary to use usecs_to_jiffies,
After modification, the measured timeout value is about 130ms.

Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
---
Change in v2:
  -Change the type of "timeout" from ulong to u32.
  -Replace max_t with max.
  -Replace msecs_to_jiffies with usecs_to_jiffies.
---
---
 drivers/spi/spi-mtk-nor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index d167699a1a96..58eca18b28b0 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -354,7 +354,7 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
 			    dma_addr_t dma_addr)
 {
 	int ret = 0;
-	ulong delay;
+	u32 delay, timeout;
 	u32 reg;
 
 	writel(from, sp->base + MTK_NOR_REG_DMA_FADR);
@@ -376,15 +376,16 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
 	mtk_nor_rmw(sp, MTK_NOR_REG_DMA_CTL, MTK_NOR_DMA_START, 0);
 
 	delay = CLK_TO_US(sp, (length + 5) * BITS_PER_BYTE);
+	timeout = (delay + 1) * 100;
 
 	if (sp->has_irq) {
 		if (!wait_for_completion_timeout(&sp->op_done,
-						 (delay + 1) * 100))
+		    usecs_to_jiffies(max(timeout, 10000U))))
 			ret = -ETIMEDOUT;
 	} else {
 		ret = readl_poll_timeout(sp->base + MTK_NOR_REG_DMA_CTL, reg,
 					 !(reg & MTK_NOR_DMA_START), delay / 3,
-					 (delay + 1) * 100);
+					 timeout);
 	}
 
 	if (ret < 0)
-- 
2.25.1


