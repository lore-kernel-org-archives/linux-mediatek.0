Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A24DC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzN7ujylWrMcgLihrKAecBgTe6avi08vUXH8c/YUwpM=; b=SBPtNZrWgx3Emz8PMceExtqys9
	cfLWbZ8DDJMMB/8J1wFyGTS7kSpFlbNhyE96csYes5W9KwRQ6AMRLYjqtq6OOIQ0GD4djXNZwDvoY
	YZ1K+3oFn6UVh6EWJoh0dKhgRpu8VUq2VlEQUxmSzhWbOJ12hQZJukYWUt5KcjbWdorJ01lvIzhb7
	hZ14KuyMK4d5mFjLxmddGdnRAgnxxHcJoP+udGveFmie7jnm0hC7+q+hSR8SYSiA/phSW0SXn+zIA
	3oiHtJ7lg8Cc4MCgP1P1ZJnp/9Gpx3H+YDhCqi9jZvUzZZpZZXe0nqlBUqq0GBrZGBUglrOYK5r2s
	ClH+ASdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIID-007OvG-Rz; Sun, 26 Feb 2023 14:46:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWII1-007Oqr-Qr; Sun, 26 Feb 2023 14:46:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78FF6B80BEB;
	Sun, 26 Feb 2023 14:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2BCC4339C;
	Sun, 26 Feb 2023 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677422771;
	bh=++Dve21aH/Fdi7PtK/V++Z7RPLfB4XMp3I03VOVGCmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkllopnbcKZxtMF4I7HAQ4XQeyx/3rKbeQyaYq0Fdo71jrFIYLbkCX12StkV3+7mD
	 hLZShoFb96nAFRkLFjqSnoqCh8WZhrmTgoOalZyeVhgoCBAgf/HOpNa8dqZK3bj8hk
	 OoBmX95ARRuqVKQzJ7DoKJieJifIFi0j5WR1VQn8Kyou+n9e3TnKHCgZHo0amW7MhV
	 DWJDYvavPJU3/5nYYcykTny6rOpwc7vp/7hW5Bb8Fpt5q2RSmzAM9AopAhWKmJ3Jwh
	 cAT3orKYKltOGxOUofGmqcEX/DasL8r2Ypnj+xehem5aaKDqLMRC/mSFvDt5MusN1L
	 nUaqErmoZAO9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.2 36/53] wifi: mt76: dma: free rx_head in mt76_dma_rx_cleanup
Date: Sun, 26 Feb 2023 09:44:28 -0500
Message-Id: <20230226144446.824580-36-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144446.824580-1-sashal@kernel.org>
References: <20230226144446.824580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_064614_163227_91545837 
X-CRM114-Status: GOOD (  11.02  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 1b88b47e898edef0e56e3a2f4e49f052a136153d ]

Free rx_head skb in mt76_dma_rx_cleanup routine in order to avoid
possible memory leak at module unload.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 06161815c180e..03b484b0473e4 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -737,6 +737,7 @@ mt76_dma_rx_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 		return;
 
 	spin_lock_bh(&q->lock);
+
 	do {
 		buf = mt76_dma_dequeue(dev, q, true, NULL, NULL, &more, NULL);
 		if (!buf)
@@ -744,6 +745,12 @@ mt76_dma_rx_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 
 		skb_free_frag(buf);
 	} while (1);
+
+	if (q->rx_head) {
+		dev_kfree_skb(q->rx_head);
+		q->rx_head = NULL;
+	}
+
 	spin_unlock_bh(&q->lock);
 
 	if (!q->rx_page.va)
@@ -769,12 +776,6 @@ mt76_dma_rx_reset(struct mt76_dev *dev, enum mt76_rxq_id qid)
 	mt76_dma_rx_cleanup(dev, q);
 	mt76_dma_sync_idx(dev, q);
 	mt76_dma_rx_fill(dev, q);
-
-	if (!q->rx_head)
-		return;
-
-	dev_kfree_skb(q->rx_head);
-	q->rx_head = NULL;
 }
 
 static void
-- 
2.39.0


