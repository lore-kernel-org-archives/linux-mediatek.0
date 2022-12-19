Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DD9C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xGTZi6VmOFcWr4cuW00ZdwUqVgHtzUi+7zZ9/GhuAWY=; b=Od8M38mIW0GBfI24GuazEiu0vU
	l+b507QzawISOSAaTPn3x++mH35S8WC6e4feBKkqh3RycHbGcucIpMa+BIdZ6KdgP36bldVcDz6WE
	WQb7Aj4MlNoqvOfr4e7iADN01f4VRsz4Yjwuv4ogGpksNb4dlVvCQGuPRsYp8k9R+7ajHSnB9kCLw
	0xosRchWj71wiUZFk1L7LKOyS+0AjrzTmKm4JH08SzzCzJPN7zzHSVSGwTgVxf/cTPtGo0Rscq10w
	f4bhXmMM6wlrUoUCi3ox44CYPzq6H/HKHqWK8xUHToZ8IBxKv2VQUoZ6PPfZVWtQIqQD/GxH2Yd5H
	Z0AFR5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p78BJ-008LLq-Cz; Mon, 19 Dec 2022 04:55:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p78BF-008LHA-Jw
	for linux-mediatek@lists.infradead.org; Mon, 19 Dec 2022 04:55:15 +0000
X-UUID: f3667f1390b9417f8f2eb083e26c80d9-20221218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xGTZi6VmOFcWr4cuW00ZdwUqVgHtzUi+7zZ9/GhuAWY=;
	b=d9NVy6TC417SlhIWWbgd4RA9Kbyhtp1TOCE5PIqjF8yKOd/DCFzb3OUOV9BWBel08ACcbIT3WsUMKqiFPAuw/M07+KFVPRLDvge5FBw0FPCjx0ZxuSOylBQZdtfQyvzycLRH/OKmbgUqD3qPOpP56OpdSMCqJ1MxzhSLCAaNYnM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f91f30e0-0942-456d-971b-8387624da99a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:027e47f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f3667f1390b9417f8f2eb083e26c80d9-20221218
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <bo.jiao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 890429564; Sun, 18 Dec 2022 21:48:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Dec 2022 12:48:08 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 19 Dec 2022 12:48:07 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Bo Jiao
	<Bo.Jiao@mediatek.com>
Subject: [PATCH v2] wifi: mt76: fix potential memory leakage
Date: Mon, 19 Dec 2022 12:48:04 +0800
Message-ID: <0a218783098a6b1b90ff120c7182acee93dc8feb.1671423784.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_205513_708205_C339EA19 
X-CRM114-Status: UNSURE (   9.63  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bo Jiao <Bo.Jiao@mediatek.com>

fix potential memory leakage, recycle rxwi when mt76_dma_add_buf() call fail.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
v2:
- recycle rxwi when page_frag_alloc() and dma_map_single() fail.
---
 drivers/net/wireless/mediatek/mt76/dma.c | 27 ++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index fc24b35..76ad47d 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -580,24 +580,29 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q)
 
 		buf = page_frag_alloc(&q->rx_page, q->buf_size, GFP_ATOMIC);
 		if (!buf)
-			break;
+			goto out;
 
 		addr = dma_map_single(dev->dma_dev, buf, len, DMA_FROM_DEVICE);
-		if (unlikely(dma_mapping_error(dev->dma_dev, addr))) {
-			skb_free_frag(buf);
-			break;
-		}
+		if (unlikely(dma_mapping_error(dev->dma_dev, addr)))
+			goto free;
 
 		qbuf.addr = addr + offset;
 		qbuf.len = len - offset;
 		qbuf.skip_unmap = false;
-		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0) {
-			dma_unmap_single(dev->dma_dev, addr, len,
-					 DMA_FROM_DEVICE);
-			skb_free_frag(buf);
-			break;
-		}
+		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0)
+			goto umap;
+
 		frames++;
+		continue;
+
+umap:
+		dma_unmap_single(dev->dma_dev, addr, len,
+				 DMA_FROM_DEVICE);
+free:
+		skb_free_frag(buf);
+out:
+		mt76_put_rxwi(dev, t);
+		break;
 	}
 
 	if (frames)
-- 
2.18.0


