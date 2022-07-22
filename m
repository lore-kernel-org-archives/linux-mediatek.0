Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98F7C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPw0AEXGUBQeLjXB7uKRQl5QYLH2OGDue6n5OGWYXr0=; b=LRz6VTUBa9Vc1BqjCj3UeHoPWP
	FSkJ8ADQD0Q5x/3kuwcIG8q0kmln2i30NqVs8z6I0+6096mMa9eKn+n1+3Pkzh2nfXG2ynvB231Sn
	y7TZilA1ivkVZ9IQxRKZ2klq8uFqhWwITX5nynoPN5Y6lpzSVsmvSK+3B0LuHdCpBij54PuECEopv
	f44Nq8vjq1ptQAv4EAh0WURS6re1E8Y6taYx4oPx02KJ8gxidcgwi3GbyLYBwTaybfMwfrvk3IG0h
	gp/50oNX3czWllvQbOSWdeDCUNMAbHQ+BUaNJ7e6TiTQvAhxDeUdPTXxPwhMiazX4W42wVEaLisK/
	hnUi8P4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmzo-000bya-C7; Fri, 22 Jul 2022 07:22:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmzl-000bwh-4e
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 07:22:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CBC0AB827A0;
	Fri, 22 Jul 2022 07:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0B9C341C6;
	Fri, 22 Jul 2022 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658474562;
	bh=CnYkj1Ii7nMMi7fZxhtZxbEj7WgtArU1b5/mp8OWqGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a70lAY6XQLqHg2aG7Fkzt8v1FTX9zLHzNgjDlriEXee+rQLAA31RXZTZ/sTvHNFTn
	 SSj2GGuMrIEcR9XAS6mYLc4pAWlBSGAA3b3UBKHdxVUmNO6u+nuZ+YAIoUG9TnRRjH
	 FcsBn6qh4AF5srqSqsatxxl8CIuu9hjxqsFrJTc/1mwQuYvGh/5uXJwk0+CtFCuY9b
	 +YxCj26M6Hb3o5vvYfz1OgvcwaOIjIjoEDtz7cSXSmDcttEJXJ2MktyUSgsbr3cQVq
	 a92rRLQSUFBMIYopacnJyC55aX8kguYDojSkwnQiYrMqWzi1XzoXPGrQOei8rk1yUU
	 gi5bPFSrQTDGw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH v4 net-next 5/5] net: ethernet: mtk_eth_soc: add support for page_pool_get_stats
Date: Fri, 22 Jul 2022 09:19:40 +0200
Message-Id: <a92b8f4b901bb7b8b1e3abdc2dd3d09de7d2c96c.1658474059.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1658474059.git.lorenzo@kernel.org>
References: <cover.1658474059.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_002245_493629_C84913E4 
X-CRM114-Status: GOOD (  15.44  )
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

Introduce support for the page_pool stats API into mtk_eth_soc driver.
Report page_pool stats through ethtool.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/Kconfig       |  1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 37 +++++++++++++++++++--
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index d2422c7b31b0..97374fb3ee79 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -18,6 +18,7 @@ config NET_MEDIATEK_SOC
 	select PHYLINK
 	select DIMLIB
 	select PAGE_POOL
+	select PAGE_POOL_STATS
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  MediaTek SoC family.
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index cfbdcf68f9b9..c370d6589596 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3528,11 +3528,18 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 	int i;
 
 	switch (stringset) {
-	case ETH_SS_STATS:
+	case ETH_SS_STATS: {
+		struct mtk_mac *mac = netdev_priv(dev);
+
 		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++) {
 			memcpy(data, mtk_ethtool_stats[i].str, ETH_GSTRING_LEN);
 			data += ETH_GSTRING_LEN;
 		}
+		if (mtk_page_pool_enabled(mac->hw))
+			page_pool_ethtool_stats_get_strings(data);
+		break;
+	}
+	default:
 		break;
 	}
 }
@@ -3540,13 +3547,35 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 static int mtk_get_sset_count(struct net_device *dev, int sset)
 {
 	switch (sset) {
-	case ETH_SS_STATS:
-		return ARRAY_SIZE(mtk_ethtool_stats);
+	case ETH_SS_STATS: {
+		int count = ARRAY_SIZE(mtk_ethtool_stats);
+		struct mtk_mac *mac = netdev_priv(dev);
+
+		if (mtk_page_pool_enabled(mac->hw))
+			count += page_pool_ethtool_stats_get_count();
+		return count;
+	}
 	default:
 		return -EOPNOTSUPP;
 	}
 }
 
+static void mtk_ethtool_pp_stats(struct mtk_eth *eth, u64 *data)
+{
+	struct page_pool_stats stats = {};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(eth->rx_ring); i++) {
+		struct mtk_rx_ring *ring = &eth->rx_ring[i];
+
+		if (!ring->page_pool)
+			continue;
+
+		page_pool_get_stats(ring->page_pool, &stats);
+	}
+	page_pool_ethtool_stats_get(data, &stats);
+}
+
 static void mtk_get_ethtool_stats(struct net_device *dev,
 				  struct ethtool_stats *stats, u64 *data)
 {
@@ -3574,6 +3603,8 @@ static void mtk_get_ethtool_stats(struct net_device *dev,
 
 		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++)
 			*data_dst++ = *(data_src + mtk_ethtool_stats[i].offset);
+		if (mtk_page_pool_enabled(mac->hw))
+			mtk_ethtool_pp_stats(mac->hw, data_dst);
 	} while (u64_stats_fetch_retry_irq(&hwstats->syncp, start));
 }
 
-- 
2.36.1


