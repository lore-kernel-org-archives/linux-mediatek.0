Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01808CDB482
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyc9d4bXHixU6darx/12EVMAT6WiG8Gh2ML+BHGOGBw=; b=tWcTxhxCV1JIvq1veN9qkRd9II
	YHPZso5zImYtKwE4VZlDTvgLsIOsBkiezpREVKjGHNIkPNMnK9scAOhpfqxE5rHznEDytNBSYwJVJ
	75b0s/y/KAyhCO+hMbDpfswd3Hi7fWjkSG4fO0pU2un7A7OhM7u1GaAXAzqkpEe7/cpSG2yicMn9v
	c3+6j3amC5LfMGmBhNMml+OpuGoKk6zy9XubY1jNzbh8mRVvtTX29BDa2W5LZhSmFPUNE+xf6CqnM
	cUBW+cEnhOe7wk4rewBzopFVbfNL21A+jGQXKWiQO91VchOaBcDhwbFta++NApLSdUjnX1Sy2+7CA
	H190yVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJbw-008wHq-3A;
	Mon, 16 Oct 2023 09:10:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJbt-008wGE-11
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0B341B811A2;
	Mon, 16 Oct 2023 09:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4A0C433C9;
	Mon, 16 Oct 2023 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697447399;
	bh=5DSCe8D4qsVY/zWY9E6Zp8QX+LyLbr3uDvpEyNMTcvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lCnEmTrGNaYitjjncd9lrybbv2m5e/AK4LJkOGeoKQtBP9wdkJ9w4NXG6qu9Q4w3/
	 MkuQWARk7RhEECGXxFYn+F8XmlSubXohEgmSFGudKpWz0i4VA0pbFMe7vyTwBtX3IX
	 yP284NNjhwmP/jXNDz9RCbVO4T5f9CERW5J0NBSxOOtWLSDEeLydS47nsqXVGxm9du
	 L1yk89hxz+b6NgNmN2n91qRV+gBh8ts5CQdRqy/qLQHGQj5T8DF32fdOeztsleFhVK
	 DmeK0XME0NtEExM/VevNpayBaaZTcs5OfYvlqwvL5JRFzDc6BeNnfU6cCF9Y4InC4p
	 XwtNy+GeSoNOg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 04/12] wifi: mt76: introduce mt76_queue_is_wed_tx_free utility routine
Date: Mon, 16 Oct 2023 11:03:37 +0200
Message-ID: <bbe39e56bb55db46c1416f4d10b73243db5122e9.1697445995.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697445995.git.lorenzo@kernel.org>
References: <cover.1697445995.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_021001_640504_D8CB47F6 
X-CRM114-Status: UNSURE (   9.56  )
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c        | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76.h       | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c | 2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 5f31d4d6a640..f1cb78450d99 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -724,7 +724,7 @@ mt76_dma_alloc_queue(struct mt76_dev *dev, struct mt76_queue *q,
 	if (ret)
 		return ret;
 
-	if (q->flags != MT_WED_Q_TXFREE)
+	if (!mt76_queue_is_wed_tx_free(q))
 		mt76_dma_queue_reset(dev, q);
 
 	return 0;
@@ -775,7 +775,7 @@ mt76_dma_rx_reset(struct mt76_dev *dev, enum mt76_rxq_id qid)
 
 	/* reset WED rx queues */
 	mt76_dma_wed_setup(dev, q, true);
-	if (q->flags != MT_WED_Q_TXFREE) {
+	if (!mt76_queue_is_wed_tx_free(q)) {
 		mt76_dma_sync_idx(dev, q);
 		mt76_dma_rx_fill(dev, q, false);
 	}
@@ -818,7 +818,7 @@ mt76_dma_rx_process(struct mt76_dev *dev, struct mt76_queue *q, int budget)
 	bool more;
 
 	if (IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED) &&
-	    q->flags == MT_WED_Q_TXFREE) {
+	    mt76_queue_is_wed_tx_free(q)) {
 		dma_idx = Q_READ(dev, q, dma_idx);
 		check_ddone = true;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 141f2e80c165..16982fd53716 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1560,6 +1560,12 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 			      struct mt76_power_limits *dest,
 			      s8 target_power);
 
+static inline bool mt76_queue_is_wed_tx_free(struct mt76_queue *q)
+{
+	return (q->flags & MT_QFLAG_WED) &&
+	       FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_Q_TXFREE;
+}
+
 static inline bool mt76_queue_is_wed_rx(struct mt76_queue *q)
 {
 	return (q->flags & MT_QFLAG_WED) &&
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 59a44d79aaed..96b2c3802ac1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -643,7 +643,7 @@ int mt7915_dma_reset(struct mt7915_dev *dev, bool force)
 		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		if (dev->mt76.q_rx[i].flags == MT_WED_Q_TXFREE)
+		if (mt76_queue_is_wed_tx_free(&dev->mt76.q_rx[i]))
 			continue;
 
 		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
-- 
2.41.0


