Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A47C77B61
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KSatJAZyCfwpD4TZPKhwQdPlv6+YyvJv4XQLuenDj2A=; b=acP1Pjs/M1W0bW
	Jwg+LDVpbyDNKkG+J1nmKMgu2I6vsZXAhecceFnXtIm0HkK4L+9fjBdxjvliSaQzr7pZPjOzjGpp0
	9Lp/bxpW7Aj5nFH8A4mRXY2ox2/pU28Wxf/zsTRy17goqDyHsKiAJgrPi2GfiggRHOAg7UYM77X6Z
	nopTt1mqHogiEbjX0L2fuIMkp8Dg8qvXsWqCo1iUKXQ9wcFctuLGaRCui8tOxxAg745B086x7GHfn
	fg/xQCo8QV+Ln1qIP4We2HlvLnDqW4msNBgZes1pjN6ys5fFJpvR0mx6uKILQNxCe1tkY85HdpcqQ
	d8UWxzzlCtviV4mJlAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnyRz-00DQO0-1P;
	Sun, 16 Apr 2023 09:13:35 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnyRt-00DQN3-1v;
	Sun, 16 Apr 2023 09:13:31 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 09A601012C4;
	Sun, 16 Apr 2023 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1681636403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KSatJAZyCfwpD4TZPKhwQdPlv6+YyvJv4XQLuenDj2A=;
	b=A9mOekSEXDx7Zp1E9gy+f6GvqZskvOPcfTOwPI/YSnYoclR6u1WyETS6vXTKSRG3NGgVZJ
	G1mxhuD/5tZ1l2w8a85Lqgj+OeucODT3B1r50jasNfVJAOVSt/QXQUQw46I9KYp46Bymex
	tsjZOt7NFjxOR9VmelXciagSNvikFbQ=
Received: from frank-G5.. (fttx-pool-217.61.152.230.bambit.de [217.61.152.230])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 9AD651013A7;
	Sun, 16 Apr 2023 09:11:35 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [RFC/RFT v1] net: ethernet: mtk_eth_soc: drop generic vlan rx offload, only use DSA untagging
Date: Sun, 16 Apr 2023 11:10:38 +0200
Message-Id: <20230416091038.54479-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 33c41008-f1e3-46f3-802e-ecce294b5d3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_021329_962802_DF1FAA5E 
X-CRM114-Status: GOOD (  21.73  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

Through testing I found out that hardware vlan rx offload support seems to
have some hardware issues. At least when using multiple MACs and when receiving
tagged packets on the secondary MAC, the hardware can sometimes start to emit
wrong tags on the first MAC as well.

In order to avoid such issues, drop the feature configuration and use the
offload feature only for DSA hardware untagging on MT7621/MT7622 devices which
only use one MAC.

Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
used felix Patch as base and ported up to 6.3-rc6 which seems to get lost
and the original bug is not handled again.

it reverts changes from vladimirs patch

1a3245fe0cf8 net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for switch port 0

tested this on bananapi-r3 on non-dsa gmac1 and dsa aware eth0 (wan).
on both vlan is working, but maybe it breaks HW-vlan-untagging
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 105 ++++++++------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |   1 -
 2 files changed, 39 insertions(+), 67 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e14050e17862..20c60cee6aa7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1921,9 +1921,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 	while (done < budget) {
 		unsigned int pktlen, *rxdcsum;
-		bool has_hwaccel_tag = false;
 		struct net_device *netdev;
-		u16 vlan_proto, vlan_tci;
 		dma_addr_t dma_addr;
 		u32 hash, reason;
 		int mac = 0;
@@ -2058,31 +2056,16 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			skb_checksum_none_assert(skb);
 		skb->protocol = eth_type_trans(skb, netdev);
 
-		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX) {
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
-				if (trxd.rxd3 & RX_DMA_VTAG_V2) {
-					vlan_proto = RX_DMA_VPID(trxd.rxd4);
-					vlan_tci = RX_DMA_VID(trxd.rxd4);
-					has_hwaccel_tag = true;
-				}
-			} else if (trxd.rxd2 & RX_DMA_VTAG) {
-				vlan_proto = RX_DMA_VPID(trxd.rxd3);
-				vlan_tci = RX_DMA_VID(trxd.rxd3);
-				has_hwaccel_tag = true;
-			}
-		}
-
 		/* When using VLAN untagging in combination with DSA, the
 		 * hardware treats the MTK special tag as a VLAN and untags it.
 		 */
-		if (has_hwaccel_tag && netdev_uses_dsa(netdev)) {
-			unsigned int port = vlan_proto & GENMASK(2, 0);
+		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2) &&
+		    (trxd.rxd2 & RX_DMA_VTAG) && netdev_uses_dsa(netdev)) {
+			unsigned int port = RX_DMA_VPID(trxd.rxd3) & GENMASK(2, 0);
 
 			if (port < ARRAY_SIZE(eth->dsa_meta) &&
 			    eth->dsa_meta[port])
 				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
-		} else if (has_hwaccel_tag) {
-			__vlan_hwaccel_put_tag(skb, htons(vlan_proto), vlan_tci);
 		}
 
 		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
@@ -2910,29 +2893,11 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
 
 static int mtk_set_features(struct net_device *dev, netdev_features_t features)
 {
-	struct mtk_mac *mac = netdev_priv(dev);
-	struct mtk_eth *eth = mac->hw;
 	netdev_features_t diff = dev->features ^ features;
-	int i;
 
 	if ((diff & NETIF_F_LRO) && !(features & NETIF_F_LRO))
 		mtk_hwlro_netdev_disable(dev);
 
-	/* Set RX VLAN offloading */
-	if (!(diff & NETIF_F_HW_VLAN_CTAG_RX))
-		return 0;
-
-	mtk_w32(eth, !!(features & NETIF_F_HW_VLAN_CTAG_RX),
-		MTK_CDMP_EG_CTRL);
-
-	/* sync features with other MAC */
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
-		if (!eth->netdev[i] || eth->netdev[i] == dev)
-			continue;
-		eth->netdev[i]->features &= ~NETIF_F_HW_VLAN_CTAG_RX;
-		eth->netdev[i]->features |= features & NETIF_F_HW_VLAN_CTAG_RX;
-	}
-
 	return 0;
 }
 
@@ -3250,30 +3215,6 @@ static int mtk_open(struct net_device *dev)
 	struct mtk_eth *eth = mac->hw;
 	int i, err;
 
-	if (mtk_uses_dsa(dev) && !eth->prog) {
-		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
-			struct metadata_dst *md_dst = eth->dsa_meta[i];
-
-			if (md_dst)
-				continue;
-
-			md_dst = metadata_dst_alloc(0, METADATA_HW_PORT_MUX,
-						    GFP_KERNEL);
-			if (!md_dst)
-				return -ENOMEM;
-
-			md_dst->u.port_info.port_id = i;
-			eth->dsa_meta[i] = md_dst;
-		}
-	} else {
-		/* Hardware special tag parsing needs to be disabled if at least
-		 * one MAC does not use DSA.
-		 */
-		u32 val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
-		val &= ~MTK_CDMP_STAG_EN;
-		mtk_w32(eth, val, MTK_CDMP_IG_CTRL);
-	}
-
 	err = phylink_of_phy_connect(mac->phylink, mac->of_node, 0);
 	if (err) {
 		netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
@@ -3312,6 +3253,39 @@ static int mtk_open(struct net_device *dev)
 	phylink_start(mac->phylink);
 	netif_tx_start_all_queues(dev);
 
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
+		return 0;
+
+	if (mtk_uses_dsa(dev) && !eth->prog) {
+		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
+			struct metadata_dst *md_dst = eth->dsa_meta[i];
+
+			if (md_dst)
+				continue;
+
+			md_dst = metadata_dst_alloc(0, METADATA_HW_PORT_MUX,
+						    GFP_KERNEL);
+			if (!md_dst)
+				return -ENOMEM;
+
+			md_dst->u.port_info.port_id = i;
+			eth->dsa_meta[i] = md_dst;
+		}
+	} else {
+		/* Hardware special tag parsing needs to be disabled if at least
+		 * one MAC does not use DSA.
+		 */
+		u32 val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
+		val &= ~MTK_CDMP_STAG_EN;
+		mtk_w32(eth, val, MTK_CDMP_IG_CTRL);
+
+		val = mtk_r32(eth, MTK_CDMQ_IG_CTRL);
+		val &= ~MTK_CDMQ_STAG_EN;
+		mtk_w32(eth, val, MTK_CDMQ_IG_CTRL);
+
+		mtk_w32(eth, 0, MTK_CDMP_EG_CTRL);
+	}
+
 	return 0;
 }
 
@@ -3796,10 +3770,9 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
 		val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
 		mtk_w32(eth, val | MTK_CDMP_STAG_EN, MTK_CDMP_IG_CTRL);
-	}
 
-	/* Enable RX VLan Offloading */
-	mtk_w32(eth, 1, MTK_CDMP_EG_CTRL);
+		mtk_w32(eth, 1, MTK_CDMP_EG_CTRL);
+	}
 
 	/* set interrupt delays based on current Net DIM sample */
 	mtk_dim_rx(&eth->rx_dim.work);
@@ -4437,7 +4410,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		eth->netdev[id]->hw_features |= NETIF_F_LRO;
 
 	eth->netdev[id]->vlan_features = eth->soc->hw_features &
-		~(NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX);
+		~NETIF_F_HW_VLAN_CTAG_TX;
 	eth->netdev[id]->features |= eth->soc->hw_features;
 	eth->netdev[id]->ethtool_ops = &mtk_ethtool_ops;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 084a6badef6d..ac57dc87c59a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -48,7 +48,6 @@
 #define MTK_HW_FEATURES		(NETIF_F_IP_CSUM | \
 				 NETIF_F_RXCSUM | \
 				 NETIF_F_HW_VLAN_CTAG_TX | \
-				 NETIF_F_HW_VLAN_CTAG_RX | \
 				 NETIF_F_SG | NETIF_F_TSO | \
 				 NETIF_F_TSO6 | \
 				 NETIF_F_IPV6_CSUM |\
-- 
2.34.1


