Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917BFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 05:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWuhXliJf4LNGvUCz31n1TTeINGwZ1aIEvAL7BSapmI=; b=ucPemE1n10qfg4sAS6elRHOxpC
	0k5xlG4OBKxIZvxlp/jqivDFXnQCJ4HGM5rEl/34J2wRJI5IrFI9Vr7LOOgohDEQ452HZX9e+HKYt
	5Gh+FHRg0JpDsQ96nQo3ceX5Q8VFc0s9oomlMqsu4k9tJGt9EKxh2zwT6sWk5bXd5y+n37a7zvDFk
	lzZ2EOQG1319bw27lgFtdNxXm81A/1l2Oe2sIirJa732WI4q+LnAzwH/1QJVpAODEtEATM8Cg05Ud
	9EMg8fJhsHO5Yd6C48OHku3WvGfznGHHVs2gTOILDTx1pFfcru6SxvgB5trQMZ9DJKcFnLJ0zxzf4
	uC74A1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqSnD-00G8pL-7v; Thu, 03 Nov 2022 05:29:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqSnA-00G8oc-CB; Thu, 03 Nov 2022 05:29:29 +0000
X-UUID: 35e70ea3137a43fbb28c33f6cd6e5101-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AWuhXliJf4LNGvUCz31n1TTeINGwZ1aIEvAL7BSapmI=;
	b=NjF0mb3a6LWmCRZmAQfsFlHSezhnmi4EJ40c6rjHBW3+yrDFg2u7A+sCia/qclvpyNBlllXlnOo067wdJFi+tVdoeEm/6z2kUnTnm52qGh86OWnxl7/l0wlwmNCbteTfY3u1q0ClQPw5h3/iRZTxpu5HOXDgL5nMsibSTenSZlg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:647f3ac7-5a69-4c8a-8ed7-816e829badd3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:8ad17190-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 35e70ea3137a43fbb28c33f6cd6e5101-20221102
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <bayi.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 265239781; Wed, 02 Nov 2022 22:29:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 13:29:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 3 Nov 2022 13:29:12 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chuanhong Guo <gch981213@gmail.com>, <linux-kernel@vger.kernel.org>,
	<srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, bayi cheng
	<bayi.cheng@mediatek.com>
Subject: [PATCH v1] spi: spi-mtk-nor: Optimize timeout for dma read
Date: Thu, 3 Nov 2022 13:28:43 +0800
Message-ID: <20221103052843.2025-2-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103052843.2025-1-bayi.cheng@mediatek.com>
References: <20221103052843.2025-1-bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_222928_448622_5F4B39D0 
X-CRM114-Status: GOOD (  13.04  )
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

In order to be more accurately, It is necessary to use msecs_to_jiffies,
After modification, the measured timeout value is about 130ms.

Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index d167699a1a96..3d989db80ee9 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -354,7 +354,7 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
 			    dma_addr_t dma_addr)
 {
 	int ret = 0;
-	ulong delay;
+	ulong delay, timeout;
 	u32 reg;
 
 	writel(from, sp->base + MTK_NOR_REG_DMA_FADR);
@@ -376,15 +376,16 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
 	mtk_nor_rmw(sp, MTK_NOR_REG_DMA_CTL, MTK_NOR_DMA_START, 0);
 
 	delay = CLK_TO_US(sp, (length + 5) * BITS_PER_BYTE);
+	timeout = (delay + 1) * 100;
 
 	if (sp->has_irq) {
 		if (!wait_for_completion_timeout(&sp->op_done,
-						 (delay + 1) * 100))
+		    msecs_to_jiffies(max_t(size_t, timeout / 1000, 10))))
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


