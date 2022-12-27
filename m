Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD179C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu4+/ysy1Pzt6jWFfy9ST450nk1QbkSGcPcWerr8QPI=; b=MeGyxVJBOGWIlK0sOYvs3B7xRI
	ebZT+iO6Xip0gsXag5Jhs7pOhx6j+fIs/rYWeqRQyc6DJsojSAJjj81VuSurJoZX9O2IyApqP9Dau
	ijNHe939zI6pjNRE2SrvSJJof7BLOeeKMIZZt9LCkH/xirwSrTkZcQ/VEL5AEDMCnY8U54YFf+uLP
	Yo9DBZxbFIHiB6od6gWmgzkVX7PjDjTVTDgttbgtz186/QvQi/TR2G5NEA73zalxU2h0MtRh4hyuW
	3txnl5F5n8ty1NXPXAXTQnaX20D6+wkjLtkPUaCtv+ow7Wo7g20zHJ60lx9kwyWINoYVGDpVts5KA
	chz7W+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAeI-00DWxF-Fm; Tue, 27 Dec 2022 14:09:46 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAd1-00DWJR-5A; Tue, 27 Dec 2022 14:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Wu4+/ysy1Pzt6jWFfy9ST450nk1QbkSGcPcWerr8QPI=; b=SHQ43VMNc5LoDG+o6N4TLX9TOD
	zkYv9dxNbhCN/i/VFStXwETNNXhNR2tTAtUsF/GrXzvU70r7QBMdSUqlcLxdhKSaXDLWthXgBIIwG
	sd75zTFVu4Jj5SPzDXFXsVLfyEvXxmfIaqs5Y9yalQrZsCFoHw1muOanIEIQO24PT0uI=;
Received: from p200300daa720fc040c81ba64b0a9b1e5.dip0.t-ipconnect.de ([2003:da:a720:fc04:c81:ba64:b0a9:b1e5] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pAAcj-00C3RB-1x; Tue, 27 Dec 2022 15:08:09 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/5] net: ethernet: mtk_eth_soc: work around issue with sending small fragments
Date: Tue, 27 Dec 2022 15:08:04 +0100
Message-Id: <20221227140807.48413-2-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221227140807.48413-1-nbd@nbd.name>
References: <20221227140807.48413-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_060827_420832_5CB1691C 
X-CRM114-Status: GOOD (  17.02  )
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

When lots of frames are sent with a number of very small fragments, an
internal FIFO can overflow, causing the DMA engine to lock up lock up and
transmit attempts time out.

Fix this on MT7986 by increasing the reserved FIFO space.
Fix this on older chips by detecting the presence of small fragments and use
skb_gso_segment + skb_linearize to deal with them.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
v2: add proper fix for MT7986, limit workaround to NETSYS v1

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 38 +++++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e3de9a53b2d9..8245cddccb5a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1441,12 +1441,28 @@ static void mtk_wake_queue(struct mtk_eth *eth)
 	}
 }
 
+static bool mtk_skb_has_small_frag(struct sk_buff *skb)
+{
+	int min_size = 16;
+	int i;
+
+	if (skb_headlen(skb) < min_size)
+		return true;
+
+	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)
+		if (skb_frag_size(&skb_shinfo(skb)->frags[i]) < min_size)
+			return true;
+
+	return false;
+}
+
 static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
 	struct mtk_tx_ring *ring = &eth->tx_ring;
 	struct net_device_stats *stats = &dev->stats;
+	struct sk_buff *segs, *next;
 	bool gso = false;
 	int tx_num;
 
@@ -1468,6 +1484,18 @@ static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2) &&
+	    skb_is_gso(skb) && mtk_skb_has_small_frag(skb)) {
+		segs = skb_gso_segment(skb, dev->features & ~NETIF_F_ALL_TSO);
+		if (IS_ERR(segs))
+			goto drop;
+
+		if (segs) {
+			consume_skb(skb);
+			skb = segs;
+		}
+	}
+
 	/* TSO: fill MSS info in tcp checksum field */
 	if (skb_is_gso(skb)) {
 		if (skb_cow_head(skb, 0)) {
@@ -1483,8 +1511,14 @@ static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		}
 	}
 
-	if (mtk_tx_map(skb, dev, tx_num, ring, gso) < 0)
-		goto drop;
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
+		skb_list_walk_safe(skb, skb, next) {
+			if ((mtk_skb_has_small_frag(skb) && skb_linearize(skb)) ||
+			    mtk_tx_map(skb, dev, tx_num, ring, gso) < 0) {
+				stats->tx_dropped++;
+				dev_kfree_skb_any(skb);
+			}
+		}
 
 	if (unlikely(atomic_read(&ring->free_count) <= ring->thresh))
 		netif_tx_stop_all_queues(dev);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 628ed72911bd..ce8044e8b3f7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -246,7 +246,7 @@
 #define MTK_CHK_DDONE_EN	BIT(28)
 #define MTK_DMAD_WR_WDONE	BIT(26)
 #define MTK_WCOMP_EN		BIT(24)
-#define MTK_RESV_BUF		(0x40 << 16)
+#define MTK_RESV_BUF		(0x80 << 16)
 #define MTK_MUTLI_CNT		(0x4 << 12)
 #define MTK_LEAKY_BUCKET_EN	BIT(11)
 
-- 
2.38.1


