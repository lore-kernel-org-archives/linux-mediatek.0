Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E63C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 02:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YuRpMYUsTz6Ix5NA6ot3RfU99bP5fMTtwrOEIpm5/iw=; b=HX1nZ3dJVE6UjHF15qYIWdXZ7w
	ksr66NLv28B6Rx2k+Lc5PoKnOXDY2U6HkmPtHXwH7nfqbaa8kk+UKLDofL/zjsiK/yBwDDx4gr2+6
	giea3j8s8NhdMadSu8FYLAks6hmRtYvRKjWKUSRzGNF25jCNJoxG4DFOEE4fWPrg59kav2f90xsdM
	ZIs0ZC3modCBJsZfZ7N5R0hQzgootlVOOO2lXM2509UWIdgnoNg+iqgG6k50+T+umlZTCG15G0zAr
	zxJ7mj+KqA76djr5gaV8y1a0ccBuYKCQVADfma5NpKPdEeL1UK/Dzk9MMf0tl+bUHRFuhUs8TcAmL
	5iI0Y8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWpUt-007Z0T-0S;
	Fri, 18 Aug 2023 02:45:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWpUq-007Z00-2e;
	Fri, 18 Aug 2023 02:45:58 +0000
X-UUID: 57b765f63d7111ee912e1518a6540028-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YuRpMYUsTz6Ix5NA6ot3RfU99bP5fMTtwrOEIpm5/iw=;
	b=Q+KkmEJplkWQ3wvg8gJqN75bq8PaDmxieM2XfBdPmENuBLPx73yGOBBhmyUHn+8bTCUH5ocsjjwuV8o0zKE3KMuoJL+YhNYcxnIT9QWMI+3y2j+MKUFPaNoz3W3I9sQZ9xcRdLep8fs1qFBsgrAwcn0ixx/tsGFP2fPb7+CW0TY=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f385f109-793f-4cf9-9219-d0b1eafca7b9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:f385f109-793f-4cf9-9219-d0b1eafca7b9,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:79f5761f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:230818104550QUCSL7YS,BulkQuantity:1,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_USA,
	TF_CID_SPAM_FSD
X-UUID: 57b765f63d7111ee912e1518a6540028-20230817
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <sharp.xia@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 759436797; Thu, 17 Aug 2023 19:45:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 18 Aug 2023 10:45:48 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 18 Aug 2023 10:45:47 +0800
From: <Sharp.Xia@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@medaitek.com>, Sharp Xia <Sharp.Xia@mediatek.com>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Date: Fri, 18 Aug 2023 10:28:15 +0800
Message-ID: <20230818022817.3341-1-Sharp.Xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_194556_892352_F717FC53 
X-CRM114-Status: GOOD (  10.76  )
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

From: Sharp Xia <Sharp.Xia@mediatek.com>

MMC does not set readahead and uses the default VM_READAHEAD_PAGES
resulting in slower reading speed.
Use the max_req_size reported by host driver to set the optimal
I/O size to improve performance.

Signed-off-by: Sharp Xia <Sharp.Xia@mediatek.com>
---
 drivers/mmc/core/queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index b396e3900717..fc83c4917360 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -359,6 +359,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
 		blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
 	blk_queue_max_hw_sectors(mq->queue,
 		min(host->max_blk_count, host->max_req_size / 512));
+	blk_queue_io_opt(mq->queue, host->max_req_size);
 	if (host->can_dma_map_merge)
 		WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
 							mmc_dev(host)),
-- 
2.18.0


