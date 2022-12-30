Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF80BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJQDjuF3r6zEq7hcTaeVjEXZUzPPpjXcmQnnLZNDmdA=; b=OtNaDvudVH8lGD
	RUhxI7DCWmS1iZkDq6SzBZeeFP1TzsMBPEIPKDBDGLE7iIY2lnnYee7GRdQLDL1XIRaPr3tydnitZ
	R/CZt36YETHrNyGPxc2GNo2zd3CbNS1xsH3Veq+zf0Tgln56iwxuPTEqIkKtZY6ZRDuz2V8XyfmW8
	XsjKEmr5g1CTpS6dNhvjgGVjfdPLWQJub0f07LVVXv2W4seK339O30e4LRhz9kcKLRqNxpuMCCNec
	mqfzJapFCIPeqLi4diKop8qvR3h1V8hXgJLwbSazfi1ymZ97rF5O5m6PfXSsW1p1HDWw63sD98RKZ
	RAETwvMkSZmfFUpl/Ckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9vz-006wNF-7S; Fri, 30 Dec 2022 07:36:07 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9s6-006uW0-9Z; Fri, 30 Dec 2022 07:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QJQDjuF3r6zEq7hcTaeVjEXZUzPPpjXcmQnnLZNDmdA=; b=lHtFlgleNENzTCYf483HXQ6I3A
	+/nn0r2WJoi56C5ai53UEZt7Wp/m9aWcOvHR/co7N9aBFge3GNjWuNngkkspjyFy1FA/ZcqtOEv04
	JhUk0yWjr0DsB4rcoIdEh12wh1I+0m2zCmsm9rMwmVe8C+BrtvW1XzH4jPT75DMsloZo=;
Received: from p200300daa720fc00fd7bb9014adaf597.dip0.t-ipconnect.de ([2003:da:a720:fc00:fd7b:b901:4ada:f597] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pB9ro-00CcyM-QG; Fri, 30 Dec 2022 08:31:48 +0100
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop generic vlan rx offload, only use DSA untagging
Date: Fri, 30 Dec 2022 08:31:44 +0100
Message-Id: <20221230073145.53386-4-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230073145.53386-1-nbd@nbd.name>
References: <20221230073145.53386-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_233207_063023_8C500357 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Through testing I found out that hardware vlan rx offload support seems to
have some hardware issues. At least when using multiple MACs and when receiving
tagged packets on the secondary MAC, the hardware can sometimes start to emit
wrong tags on the first MAC as well.

In order to avoid such issues, drop the feature configuration and use the
offload feature only for DSA hardware untagging on MT7621/MT7622 devices which
only use one MAC.

Tested-By: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
v3: rebase

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 101 ++++++++------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |   1 -
 2 files changed, 39 insertions(+), 63 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 04b75c7ad5b0..ab6c571a39ae 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2042,29 +2042,16 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
 			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
 
-		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX) {
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
-				if (trxd.rxd3 & RX_DMA_VTAG_V2)
-					__vlan_hwaccel_put_tag(skb,
-						htons(RX_DMA_VPID(trxd.rxd4)),
-						RX_DMA_VID(trxd.rxd4));
-			} else if (trxd.rxd2 & RX_DMA_VTAG) {
-				__vlan_hwaccel_put_tag(skb, htons(RX_DMA_VPID(trxd.rxd3)),
-						       RX_DMA_VID(trxd.rxd3));
-			}
-		}
-
 		/* When using VLAN untagging in combination with DSA, the
 		 * hardware treats the MTK special tag as a VLAN and untags it.
 		 */
-		if (skb_vlan_tag_present(skb) && netdev_uses_dsa(netdev)) {
-			unsigned int port = ntohs(skb->vlan_proto) & GENMASK(2, 0);
+		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2) &&
+		    (trxd.rxd2 & RX_DMA_VTAG) && netdev_uses_dsa(netdev)) {
+			unsigned int port = RX_DMA_VPID(trxd.rxd3) & GENMASK(2, 0);
 
 			if (port < ARRAY_SIZE(eth->dsa_meta) &&
 			    eth->dsa_meta[port])
 				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
-
-			__vlan_hwaccel_clear_tag(skb);
 		}
 
 		skb_record_rx_queue(skb, 0);
@@ -2889,29 +2876,11 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
 
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
 
@@ -3211,30 +3180,6 @@ static int mtk_open(struct net_device *dev)
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
@@ -3273,6 +3218,39 @@ static int mtk_open(struct net_device *dev)
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
 
@@ -3599,10 +3577,9 @@ static int mtk_hw_init(struct mtk_eth *eth)
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
@@ -4203,7 +4180,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		eth->netdev[id]->hw_features |= NETIF_F_LRO;
 
 	eth->netdev[id]->vlan_features = eth->soc->hw_features &
-		~(NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX);
+		~NETIF_F_HW_VLAN_CTAG_TX;
 	eth->netdev[id]->features |= eth->soc->hw_features;
 	eth->netdev[id]->ethtool_ops = &mtk_ethtool_ops;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 420a7d412f24..e8bb8b511f06 100644
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
2.38.1


