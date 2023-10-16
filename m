Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0872CDB483
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFbyZ9X816in+y4ixoWhfibzF+4LMk7tXZpbtrbqooo=; b=xyeqFA36FmTHZ7W7nvD2t5XW6s
	4xWUgti1FLRJsk0NeBYSuiDvQXqJzNhKdWbUCT7NUdMBmpODtot4Wv8S/g5BKktsebi5OnJ8jldq+
	Y1gKCGykYSEGK4yIt74YogWuysfBJJqQ63k9RzGN6fe/YhK7KNWadVUpYwIgpo5gH4VCQ4yxfWsuA
	k04fJRCt28K2MEoXjI4e6X89jYDB12CkKnu80S1MDidew5ucFURs/KA9FhLN7mM+6FUu68qqcrrcz
	8t7LYx0a8bKqsPcYl9pB2sZnaEX5SFxCJWpYpxc4YKKh3OVlsKgHEr4OCsEkjWdYaJsP8U66LIH6o
	3B6BQpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJbp-008wF3-2i;
	Mon, 16 Oct 2023 09:09:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJbm-008wEQ-1u
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B7FB2CE1307;
	Mon, 16 Oct 2023 09:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7D9C433C7;
	Mon, 16 Oct 2023 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697447392;
	bh=3vLyqqYT010XU7aySBEjTffX1ERMPpYj/d//AMHvRpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AjhFedQGLmrdDjhtjyuAt8MBHhhSC6M3SqJqw/9uyoU25RUPBWCBu9sWnRiNe8fJ4
	 Mmh3Y8fylMT5EXMWLfsYvXbMkr9GcItzh6K4OtqaCzS9uhf1UYN3uYpI35ZJPJlZka
	 3tcrqh1KTGJuoUMNds/6tp2Se6K092F1dGvLi3obAkFb2S3H9+sJlHoj2P5WWIqR1K
	 9lQEb4dSF8e8wu+i2qDNYjczkqaGhuIpw/++IwQD82XnZiRoSiEERzzp8vhei/hz1F
	 VwG7DkY20KV1Bu79uqkGyxXd6sdgXLW5SwQjlDtmiOiB2VHH+I7smDk3MsllULAU91
	 QkyO/7hUFNyyw==
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
Subject: [PATCH v2 02/12] wifi: mt76: move mt76_mmio_wed_offload_{enable,disable} in common code
Date: Mon, 16 Oct 2023 11:03:35 +0200
Message-ID: <6924f13aba360ff415acd68cb5a39b3048d06d6f.1697445995.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697445995.git.lorenzo@kernel.org>
References: <cover.1697445995.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_020955_006772_8ED45E3B 
X-CRM114-Status: GOOD (  10.23  )
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

mt76_mmio_wed_offload_enable and mt76_mmio_wed_offload_disable routines
will be reused by mt7996 driver for wed support.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mmio.c     | 22 ++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 29 ++-----------------
 3 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index 350650a0fce2..c34624978a14 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -157,6 +157,28 @@ u32 mt76_mmio_wed_init_rx_buf(struct mtk_wed_device *wed, int size)
 	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(mt76_mmio_wed_init_rx_buf);
+
+int mt76_mmio_wed_offload_enable(struct mtk_wed_device *wed)
+{
+	struct mt76_dev *dev = container_of(wed, struct mt76_dev, mmio.wed);
+
+	spin_lock_bh(&dev->token_lock);
+	dev->token_size = wed->wlan.token_start;
+	spin_unlock_bh(&dev->token_lock);
+
+	return !wait_event_timeout(dev->tx_wait, !dev->wed_token_count, HZ);
+}
+EXPORT_SYMBOL_GPL(mt76_mmio_wed_offload_enable);
+
+void mt76_mmio_wed_offload_disable(struct mtk_wed_device *wed)
+{
+	struct mt76_dev *dev = container_of(wed, struct mt76_dev, mmio.wed);
+
+	spin_lock_bh(&dev->token_lock);
+	dev->token_size = dev->drv->token_size;
+	spin_unlock_bh(&dev->token_lock);
+}
+EXPORT_SYMBOL_GPL(mt76_mmio_wed_offload_disable);
 #endif /*CONFIG_NET_MEDIATEK_SOC_WED */
 
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 11212b6153ab..2e9f208ae8f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1060,6 +1060,8 @@ static inline u16 mt76_rev(struct mt76_dev *dev)
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
 u32 mt76_mmio_wed_init_rx_buf(struct mtk_wed_device *wed, int size);
 void mt76_mmio_wed_release_rx_buf(struct mtk_wed_device *wed);
+int mt76_mmio_wed_offload_enable(struct mtk_wed_device *wed);
+void mt76_mmio_wed_offload_disable(struct mtk_wed_device *wed);
 #endif /*CONFIG_NET_MEDIATEK_SOC_WED */
 
 #define mt76xx_chip(dev) mt76_chip(&((dev)->mt76))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 1621a8150798..85cb3fed9505 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -542,31 +542,6 @@ static u32 mt7915_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 }
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
-static int mt7915_mmio_wed_offload_enable(struct mtk_wed_device *wed)
-{
-	struct mt7915_dev *dev;
-
-	dev = container_of(wed, struct mt7915_dev, mt76.mmio.wed);
-
-	spin_lock_bh(&dev->mt76.token_lock);
-	dev->mt76.token_size = wed->wlan.token_start;
-	spin_unlock_bh(&dev->mt76.token_lock);
-
-	return !wait_event_timeout(dev->mt76.tx_wait,
-				   !dev->mt76.wed_token_count, HZ);
-}
-
-static void mt7915_mmio_wed_offload_disable(struct mtk_wed_device *wed)
-{
-	struct mt7915_dev *dev;
-
-	dev = container_of(wed, struct mt7915_dev, mt76.mmio.wed);
-
-	spin_lock_bh(&dev->mt76.token_lock);
-	dev->mt76.token_size = MT7915_TOKEN_SIZE;
-	spin_unlock_bh(&dev->mt76.token_lock);
-}
-
 static void mt7915_mmio_wed_update_rx_stats(struct mtk_wed_device *wed,
 					    struct mtk_wed_wo_rx_stats *stats)
 {
@@ -704,8 +679,8 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 	}
 
 	wed->wlan.init_buf = mt7915_wed_init_buf;
-	wed->wlan.offload_enable = mt7915_mmio_wed_offload_enable;
-	wed->wlan.offload_disable = mt7915_mmio_wed_offload_disable;
+	wed->wlan.offload_enable = mt76_mmio_wed_offload_enable;
+	wed->wlan.offload_disable = mt76_mmio_wed_offload_disable;
 	wed->wlan.init_rx_buf = mt76_mmio_wed_init_rx_buf;
 	wed->wlan.release_rx_buf = mt76_mmio_wed_release_rx_buf;
 	wed->wlan.update_wo_rx_stats = mt7915_mmio_wed_update_rx_stats;
-- 
2.41.0


