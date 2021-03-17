Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118D0C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 00:56:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 773FC64FB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 00:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 773FC64FB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LhA351IwqSf89WTZi2FciSQnfBtxqUZV4fKyWE6qcE4=; b=nHyIGaWcHLSC112GAxics03Xd0
	GJzbMyBG6N3P5fiHfU3iWuwLcBoM89LWT4NK5D2/OcbeaUsV/JhwCchnLtpgpmzktT3eJjm9eyhSn
	LHosxnOx8nvUkBYSxMGa6qOP4i5Ejz+lJd6yXk7PVVy2cbs6gJqArJeJSAgJ0QVMSe4ui5d+buaw4
	TvAdFY7raqDc75r9/D3HLWkJddi7VPSqwyUn03l/AIBRbR/ZtzKh699WPcjaLo3zbeonL+6bYus4e
	CKfgEh1Rzf7CX6Z1LJLnPXCfGrYyMlbILq+HV8WaGQ6BnLSnIvKsCm5tITJUi+/SweiSYT9/SrSmz
	4KyOYGVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMKTm-0026XR-9f; Wed, 17 Mar 2021 00:56:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMKTQ-0026UR-7e; Wed, 17 Mar 2021 00:55:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4308764F8C;
 Wed, 17 Mar 2021 00:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942538;
 bh=ogm/cRjZMwqqmZU1ZzdX0tSSKIkx2756zP3cr0KdFQo=;
 h=From:To:Cc:Subject:Date:From;
 b=EuUbbAwe7YpXyoeHfP9zIdXQLLJ8og2djlKhhc18kLNNNdA1Kh03Y3GRkdY25j0Eq
 fTp8KnwPKD0INuvJpVIG+yvvK8SOFzRyL5yEOOAd1OfZnPdizB6XaCsbH7V+xo5CFE
 5d3/S5HAznpqjl9BxTucU735FrM1MTzsLOZ2Ujy+g0lNqQvW3habrRaeH1kFH5cScJ
 VlqGU8icXuLyoIA8DmwqV99Va3va6g9/NEezl3RjhyvAB427jXPbcVRbRokXHOGT3S
 K+8XDXKg+j9WPqrS01a38mFmUtINj2HPEoLK4wJjCqLu+ag2orpO1TdZHGWXs8Qt6l
 +c73yMk0S9FGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 01/61] mt76: fix tx skb error handling in
 mt76_dma_tx_queue_skb
Date: Tue, 16 Mar 2021 20:54:35 -0400
Message-Id: <20210317005536.724046-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_005544_818073_5882FD66 
X-CRM114-Status: GOOD (  10.31  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit ae064fc0e32a4d28389086d9f4b260a0c157cfee ]

When running out of room in the tx queue after calling drv->tx_prepare_skb,
the buffer list will already have been modified on MT7615 and newer drivers.
This can leak a DMA mapping and will show up as swiotlb allocation failures
on x86.

Fix this by moving the queue length check further up. This is less accurate,
since it can overestimate the needed room in the queue on MT7615 and newer,
but the difference is small enough to not matter in practice.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210216135119.23809-1-nbd@nbd.name
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index e81dfaf99bcb..372f27687f2d 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -345,7 +345,6 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	};
 	struct ieee80211_hw *hw;
 	int len, n = 0, ret = -ENOMEM;
-	struct mt76_queue_entry e;
 	struct mt76_txwi_cache *t;
 	struct sk_buff *iter;
 	dma_addr_t addr;
@@ -387,6 +386,11 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	}
 	tx_info.nbuf = n;
 
+	if (q->queued + (tx_info.nbuf + 1) / 2 >= q->ndesc - 1) {
+		ret = -ENOMEM;
+		goto unmap;
+	}
+
 	dma_sync_single_for_cpu(dev->dev, t->dma_addr, dev->drv->txwi_size,
 				DMA_TO_DEVICE);
 	ret = dev->drv->tx_prepare_skb(dev, txwi, q->qid, wcid, sta, &tx_info);
@@ -395,11 +399,6 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	if (ret < 0)
 		goto unmap;
 
-	if (q->queued + (tx_info.nbuf + 1) / 2 >= q->ndesc - 1) {
-		ret = -ENOMEM;
-		goto unmap;
-	}
-
 	return mt76_dma_add_buf(dev, q, tx_info.buf, tx_info.nbuf,
 				tx_info.info, tx_info.skb, t);
 
@@ -415,9 +414,7 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 		dev->test.tx_done--;
 #endif
 
-	e.skb = tx_info.skb;
-	e.txwi = t;
-	dev->drv->tx_complete_skb(dev, &e);
+	dev_kfree_skb(tx_info.skb);
 	mt76_put_txwi(dev, t);
 	return ret;
 }
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
