Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8718EE7070E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtY3wHPyPVkE0vzfnGmhuDLV2GgVJwAkQ+hkpgdQgUQ=; b=mSc7Xq5f8CFr1RTvJBmZ6VhvVl
	/QlsGeOpgE9WCL90an54ye1AlA9/N4VKrXOK03zaFcjnXRCNIk1HN1CQagnavDqLL9lalxqrUq97L
	qoHtxoQRIwsu5s5HlAJcetPTDwreMwHfkr7tFh9mcBDCIn4k9MgnhodWxpCkHgVR2PVl7AvVuFP8g
	1MFND+qbReL/XB9hDLN8m/MUOqgz8pKG1QuBMrrbaP+BfWCMKAjl+VLBG7VjE4lRrQrXLYPZUvEgQ
	GfbGLEViPDA11nTSCYWM8IlDYP7d8ZUfD8ibLqWDc7krg8JQErDsZVmL9DUU+/Wcc2feXfq7xbrtf
	1sBZ1XPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHAD-005qfz-1F;
	Thu, 21 Sep 2023 10:44:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHAA-005qeb-2a
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 10:44:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 65F1CB81FF8;
	Thu, 21 Sep 2023 10:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F19C36AE6;
	Thu, 21 Sep 2023 10:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695293040;
	bh=1K/xpj89LnsSxSnZRLe9XnU/8MgULN5QpqENtjkZBsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OEkujMmgiC0A+uad+mha2O9eGGryG5/hjeM3Xy5afVELxgwF716aE7wL0nNJOBLSf
	 FE1cl5SkI7I52ISHYB8P7UhXuVY25tlprAm9OGlKN6fhEtat20h5J8sF+WYF71Cc0G
	 pNsaq8T9uj9P0nZ/8ZCwkbEuR8MEa8A0l4WwTqdBc5us34rQ/TnDY7a6sOqJQqYRUs
	 UE1lJRt6PTFekJ0y3O09+pDMrTC7J8U6EkOdBdOqAb4AGG2zsZX2A21/oeLaRjh3zc
	 qr8Wje4DDh7qfv5GtPc5vL0epYHn0oGBitRkB+jN/UFsP8OTxyX0L/ebe+w5XO/Rk8
	 aVE6UyB+bdpKw==
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
Subject: [PATCH 4/9] wifi: mt76: introduce mt76_queue_is_wed_tx_free utility routine
Date: Thu, 21 Sep 2023 12:43:33 +0200
Message-ID: <833b5d797b2da35fd42e59b0a8b193cf379d5d43.1695292502.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695292502.git.lorenzo@kernel.org>
References: <cover.1695292502.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_034403_127386_1AD23B47 
X-CRM114-Status: GOOD (  11.05  )
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
index 643e18ebb5ee..f62b6af4316b 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -724,7 +724,7 @@ mt76_dma_alloc_queue(struct mt76_dev *dev, struct mt76_queue *q,
 	if (ret)
 		return ret;
 
-	if (q->flags != MT_WED_Q_TXFREE)
+	if (!mt76_queue_is_wed_tx_free(q))
 		mt76_dma_queue_reset(dev, q);
 
 	return 0;
@@ -773,7 +773,7 @@ mt76_dma_rx_reset(struct mt76_dev *dev, enum mt76_rxq_id qid)
 
 	/* reset WED rx queues */
 	mt76_dma_wed_setup(dev, q, true);
-	if (q->flags != MT_WED_Q_TXFREE) {
+	if (!mt76_queue_is_wed_tx_free(q)) {
 		mt76_dma_sync_idx(dev, q);
 		mt76_dma_rx_fill(dev, q, false);
 	}
@@ -816,7 +816,7 @@ mt76_dma_rx_process(struct mt76_dev *dev, struct mt76_queue *q, int budget)
 	bool more;
 
 	if (IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED) &&
-	    q->flags == MT_WED_Q_TXFREE) {
+	    mt76_queue_is_wed_tx_free(q)) {
 		dma_idx = Q_READ(dev, q, dma_idx);
 		check_ddone = true;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e8e9d9bc3730..4ce3a0def8fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1555,6 +1555,12 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
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


