Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18CCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yojani6yn2+kJJ61hD9zQcUn8nFUjZtEJH18DxEg50k=; b=dar92yKbW0ZYF5znCg4ZFl0BYE
	FzJ1IkAJAZm+6d7HzxtfkRjwgChjJx+WVnpJ9nLPtPq89XPwY16g5DSZmInt7dKdWBSbznFJ7Wnio
	dEdKA99vZNh2PIYGwxwGAbWORnRJbyP4pREi9uTOuwmOtbECcubLYXXjj2APtaFN4DUrglk0/3U6c
	ScDXvBQJdxZbdgCDPu3r1Hf/ICSTh77+Wjwk7ZTf/0mUHsZ4KdwM13kc+vmBOwWPCNXCiFkzjjENk
	xqeO6EafLZFF34Eyci53DqCqv+bDboVT1VS/DHzBGnGplgA7GX11QdqyW4h6m3n3rEMpUk3iQz2a+
	yjLSAN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJcC-008wMu-14;
	Mon, 16 Oct 2023 09:10:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJc9-008wLV-0y
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73C93CE111D;
	Mon, 16 Oct 2023 09:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFD0C433C8;
	Mon, 16 Oct 2023 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697447414;
	bh=YdZwi7PiVHPeDTOb8qJp4IGfc6Ab3P3P06xqpebgMOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pAwkM7phcVLwa5w4DekhnR/7+SIxvjsHBQ3LUyf8lNDcLfWqUwAbiZ29ZwY1HRP1B
	 kKwB+1sHraVl2+Q2CON2G8j2aWh6HE966sheMi4rncUR+kVMwXB79J3m6GtqTivLNz
	 p8WziFvuzHC4qvAqnMKp7IEzrWFr4kU1UdbyygjuxQXs7sXK2Dqr7nxl5onr2u85s9
	 Aft9KsOr9XVW0CnJhadHWmJD7w6PUZHwe4T8VZPdlJmhGTxB3oN9nkEQ3fOdg4VkIZ
	 jH+k2pDgqRWDzUTfA+Yrpq8PHOT6yuPjv3jhbacLq8is31K5XAWVRR/XvWdzVR2UHj
	 fIzE4Qpi3fcjw==
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
Subject: [PATCH v2 08/12] wifi: mt76: dma: introduce __mt76_dma_queue_reset utility routine
Date: Mon, 16 Oct 2023 11:03:41 +0200
Message-ID: <766391291f1b3f58635eb041d2a0139aaf57588b.1697445996.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697445995.git.lorenzo@kernel.org>
References: <cover.1697445995.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_021017_538005_26244A34 
X-CRM114-Status: UNSURE (   8.99  )
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
 drivers/net/wireless/mediatek/mt76/dma.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 64027572a5e6..7b622e966f58 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -195,7 +195,8 @@ mt76_dma_sync_idx(struct mt76_dev *dev, struct mt76_queue *q)
 }
 
 static void
-mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
+__mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
+		       bool reset_idx)
 {
 	int i;
 
@@ -206,11 +207,19 @@ mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
 	for (i = 0; i < q->ndesc; i++)
 		q->desc[i].ctrl = cpu_to_le32(MT_DMA_CTL_DMA_DONE);
 
-	Q_WRITE(q, cpu_idx, 0);
-	Q_WRITE(q, dma_idx, 0);
+	if (reset_idx) {
+		Q_WRITE(q, cpu_idx, 0);
+		Q_WRITE(q, dma_idx, 0);
+	}
 	mt76_dma_sync_idx(dev, q);
 }
 
+static void
+mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
+{
+	__mt76_dma_queue_reset(dev, q, true);
+}
+
 static int
 mt76_dma_add_rx_buf(struct mt76_dev *dev, struct mt76_queue *q,
 		    struct mt76_queue_buf *buf, void *data)
-- 
2.41.0


