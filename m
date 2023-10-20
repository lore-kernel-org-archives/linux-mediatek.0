Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6057DC19F5C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFbyZ9X816in+y4ixoWhfibzF+4LMk7tXZpbtrbqooo=; b=svrz8gyA2jJ9aB9MqQMdNPKOe/
	Vy5s2DQZtxakCO6B7kElDc4LyFpGtCujRkShkE4VRRNVwgvP8Bba4jR8hH900F+awhW9dngjkn+uI
	Ht4li1mYZYA9OfsY30aJtx2rx+DxLSdPDdobok0MaMI8YTb2Yy6bSeHNoa+fVnl9uBMR5ney26SgD
	QWDW1NL5wkP3Xz5G+0p0CJPGaE1nxrOpdrtUA0dfl9ky8NCsKFDuvOioOOJE56xTdgRVxf5e0zkkN
	g6qC7HHLLBJUa+1FDm9a1Kim8Xi4pN2Z9rlpEHKkVciIGozbxGIZ1tVvU5Eb9RoPc4mKjoAiFjpcL
	MpVDXMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmmy-001mN9-15;
	Fri, 20 Oct 2023 10:31:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmmv-001mMH-1D
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D697962037;
	Fri, 20 Oct 2023 10:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CD3C433C7;
	Fri, 20 Oct 2023 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697797888;
	bh=3vLyqqYT010XU7aySBEjTffX1ERMPpYj/d//AMHvRpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vFYTeVIg5LTrp56iIypXkDq5Y1qb9d1v+J20ycEgGVT0joZbi53R/K7Rb4nfARJxe
	 d6MjDDcpZk7wwC76/W5qCGXcZgctRV9h9OsKFvH1vP/rL2L+VD7eWXfjYX1i5QaFfi
	 U42OFgB8vY1Z70FnoDm0Hh3iEYpcafACca5TIlYVwrmrkAQuo8vG+vppopZgOiH90V
	 f7tGn8BMv11oSjrT4GzxySogMK0mg726k4N+s+okHGz6BA+SrAz0MDi124fideg2R/
	 0n/GSbl+1xXFYgMA1eDiLhGs8TbOeNWPEGaIcw9TZD6eOL3zSw/z9cejUZTysFjVXR
	 tnbvk8yRdUi7w==
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
Subject: [PATCH v3 02/13] wifi: mt76: move mt76_mmio_wed_offload_{enable,disable} in common code
Date: Fri, 20 Oct 2023 12:30:49 +0200
Message-ID: <6924f13aba360ff415acd68cb5a39b3048d06d6f.1697797423.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697797422.git.lorenzo@kernel.org>
References: <cover.1697797422.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033129_503093_820863E0 
X-CRM114-Status: GOOD (  10.24  )
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


