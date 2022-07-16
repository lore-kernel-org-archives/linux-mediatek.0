Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38011C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I24vYZVaSBzmFOGvlx+hDeqzzuyFfFYct06dPvVZwx8=; b=R57RWN/vHraMrmLzHIbhzKoeR+
	DTfHdW8F5UCkyJu2QsFEB+yQUKTjie6+JRcNRZVWmdt/Y14rZwwgFwEE6/t1I653hwbSjMBwz9HEM
	vqNunYk8Sc2Vwfe6RZbuCSORzY8DckWxkb4kT3eQus4X5LOToqNsvL+XbmipLPtLv+kDHbAvJp4qi
	n3WoVaZ1BeKaaJR0RN+UwnBRCvAQy21lsXwQsJc8+kzM8xJrkI/2vzUVBVBPHs40BTbFRVxEV3AJ1
	L+VglE0qfZJmezjNuOzUCtSyxBINq7XjexI7jad+04rNFqNX8EOBK8T8gWJkalTnutHB1zfvBfsJZ
	H3fMsY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcKZ-00ETFJ-7H; Sat, 16 Jul 2022 07:35:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcKU-00ETBD-8t
	for linux-mediatek@lists.infradead.org; Sat, 16 Jul 2022 07:35:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6D50B82F63;
	Sat, 16 Jul 2022 07:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC532C3411C;
	Sat, 16 Jul 2022 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657956907;
	bh=7OpGJ3ShzgdHVf9A3CxHwSqBqO4HxHrg3gyyVyOKpI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KHhW0PTElwSL1r5uYA5oCMyJK8jotmyM2w3jkc2xZ/4XC/NLBetZUwDtiLq0ZVkW8
	 azPPJYso8DXQ9UCAQhicrYjA7Fqf+f/wXYazjyB0wcYNX742z3Hmfmw5LgiCHnAUD0
	 vAoKn72/YeBCvocoJxoQUoZxaVjeEo1Vlnc6qosAuS9a4xeCZgukZBDLkU5pzhMYxP
	 DBFesFyxF7HPWPWSq1PNILUrdR4ZL5Kn/Cr5LV2TJZQ3+xzEqEQ5ps2S0povr1FnRG
	 WR1C2Kwb/ovW3jfstgiIIoQdNWnG6vD4/lt3oTqJqmCNgyWoe9eIi3HpGQV50ip5tJ
	 woAdsrmNbHUjA==
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
Subject: [PATCH v3 net-next 5/5] net: ethernet: mtk_eth_soc: add support for page_pool_get_stats
Date: Sat, 16 Jul 2022 09:34:31 +0200
Message-Id: <8592ada26b28995d038ef67f15c145b6cebf4165.1657956652.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657956652.git.lorenzo@kernel.org>
References: <cover.1657956652.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_003510_629981_7DCD9CE5 
X-CRM114-Status: GOOD (  15.07  )
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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 40 +++++++++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

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
index abb8bc281015..eba95a86086d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3517,11 +3517,19 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 	int i;
 
 	switch (stringset) {
-	case ETH_SS_STATS:
+	case ETH_SS_STATS: {
+		struct mtk_mac *mac = netdev_priv(dev);
+		struct mtk_eth *eth = mac->hw;
+
 		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++) {
 			memcpy(data, mtk_ethtool_stats[i].str, ETH_GSTRING_LEN);
 			data += ETH_GSTRING_LEN;
 		}
+		if (!eth->hwlro)
+			page_pool_ethtool_stats_get_strings(data);
+		break;
+	}
+	default:
 		break;
 	}
 }
@@ -3529,18 +3537,42 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 static int mtk_get_sset_count(struct net_device *dev, int sset)
 {
 	switch (sset) {
-	case ETH_SS_STATS:
-		return ARRAY_SIZE(mtk_ethtool_stats);
+	case ETH_SS_STATS: {
+		int count = ARRAY_SIZE(mtk_ethtool_stats);
+		struct mtk_mac *mac = netdev_priv(dev);
+		struct mtk_eth *eth = mac->hw;
+
+		if (!eth->hwlro)
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
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_hw_stats *hwstats = mac->hw_stats;
+	struct mtk_eth *eth = mac->hw;
 	u64 *data_src, *data_dst;
 	unsigned int start;
 	int i;
@@ -3563,6 +3595,8 @@ static void mtk_get_ethtool_stats(struct net_device *dev,
 
 		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++)
 			*data_dst++ = *(data_src + mtk_ethtool_stats[i].offset);
+		if (!eth->hwlro)
+			mtk_ethtool_pp_stats(eth, data_dst);
 	} while (u64_stats_fetch_retry_irq(&hwstats->syncp, start));
 }
 
-- 
2.36.1


