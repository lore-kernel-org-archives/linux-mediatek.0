Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15F7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3GOja7Is52RRRLrMfML51HAl004gx2DWCw4/j2hhVg=; b=rJ2keaM/jm9ZOle02GWHVYhVqX
	n4nwfKs/un8mVSDt8KwL7FX8kYtNLjXM7/8De5zilPuNvc9oQnQEzgLo1BHEHLbQp8AL6HwVbQN5y
	mORKhehLF8Nt94zdYhHsa1STgn8JkqAHH8gqtaYRpYvHnFNW+SZZFMaD8cs6Vi9K1jdk3HUGckhYY
	ztwii8Qfsf5/kKLaYco6TrkIqoY964zGpOZNDx2GeKdp9z1b16Nny3mWjfzaMB8rQTO4G0cTxz2fX
	z4IaVra04AsTlrKd1zo7Donm8cDXZhr8cwEzl/nGMjb4EjzEX/I+5bT6t4YhPt7QkmQ+VmQnucwpQ
	gPdPjCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso4L-00F4ew-2K; Wed, 09 Nov 2022 16:36:53 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2P-00F3NN-Le; Wed, 09 Nov 2022 16:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=f3GOja7Is52RRRLrMfML51HAl004gx2DWCw4/j2hhVg=; b=s2mZaC37XGQFJySuzmmq+zPGl4
	gVQQ5udGWO2v+3j0hkG83G2yQFylFoy2dxSJ3CzJgCTpU9q/0gY2g9hIDaiw+zLKesLXJdcxHJrhc
	qKhHLI06DGxcdHV1tBNpKUnyDMI1d3tQG30L89fpfEAl0Tkll7BAPGNnw+AtFZqUi95Y=;
Received: from p200300daa72ee100054f3c61b16ef6e7.dip0.t-ipconnect.de ([2003:da:a72e:e100:54f:3c61:b16e:f6e7] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oso29-000l4N-SG; Wed, 09 Nov 2022 17:34:38 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 09/12] net: ethernet: mtk_eth_soc: fix VLAN rx hardware acceleration
Date: Wed,  9 Nov 2022 17:34:23 +0100
Message-Id: <20221109163426.76164-10-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_083453_890056_930C4774 
X-CRM114-Status: GOOD (  25.17  )
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

- enable VLAN untagging for PDMA rx
- make it possible to disable the feature via ethtool
- pass VLAN tag to the DSA driver
- untag special tag on PDMA only if no non-DSA devices are in use
- disable special tag untagging on 7986 for now, since it's not working yet

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 99 ++++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  8 ++
 2 files changed, 84 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 92bdd69eed2e..ffaa9fe32b14 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -23,6 +23,7 @@
 #include <linux/jhash.h>
 #include <linux/bitfield.h>
 #include <net/dsa.h>
+#include <net/dst_metadata.h>
 
 #include "mtk_eth_soc.h"
 #include "mtk_wed.h"
@@ -2008,23 +2009,27 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
 			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
 
-		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX) {
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
-				if (trxd.rxd3 & RX_DMA_VTAG_V2)
-					__vlan_hwaccel_put_tag(skb,
-						htons(RX_DMA_VPID(trxd.rxd4)),
-						RX_DMA_VID(trxd.rxd4));
-			} else if (trxd.rxd2 & RX_DMA_VTAG) {
-				__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
-						       RX_DMA_VID(trxd.rxd3));
-			}
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
+			if (trxd.rxd3 & RX_DMA_VTAG_V2)
+				__vlan_hwaccel_put_tag(skb,
+					htons(RX_DMA_VPID(trxd.rxd4)),
+					RX_DMA_VID(trxd.rxd4));
+		} else if (trxd.rxd2 & RX_DMA_VTAG) {
+			__vlan_hwaccel_put_tag(skb, htons(RX_DMA_VPID(trxd.rxd3)),
+					       RX_DMA_VID(trxd.rxd3));
+		}
+
+		/* When using VLAN untagging in combination with DSA, the
+		 * hardware treats the MTK special tag as a VLAN and untags it.
+		 */
+		if (skb_vlan_tag_present(skb) && netdev_uses_dsa(netdev)) {
+			unsigned int port = ntohs(skb->vlan_proto) & GENMASK(2, 0);
+
+			if (port < ARRAY_SIZE(eth->dsa_meta) &&
+			    eth->dsa_meta[port])
+				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
 
-			/* If the device is attached to a dsa switch, the special
-			 * tag inserted in VLAN field by hw switch can * be offloaded
-			 * by RX HW VLAN offload. Clear vlan info.
-			 */
-			if (netdev_uses_dsa(netdev))
-				__vlan_hwaccel_clear_tag(skb);
+			__vlan_hwaccel_clear_tag(skb);
 		}
 
 		skb_record_rx_queue(skb, 0);
@@ -2847,15 +2852,19 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
 
 static int mtk_set_features(struct net_device *dev, netdev_features_t features)
 {
-	int err = 0;
-
-	if (!((dev->features ^ features) & NETIF_F_LRO))
-		return 0;
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_eth *eth = mac->hw;
+	netdev_features_t diff = dev->features ^ features;
 
-	if (!(features & NETIF_F_LRO))
+	if ((diff & NETIF_F_LRO) && !(features & NETIF_F_LRO))
 		mtk_hwlro_netdev_disable(dev);
 
-	return err;
+	/* Set RX VLAN offloading */
+	if (diff & NETIF_F_HW_VLAN_CTAG_RX)
+		mtk_w32(eth, !!(features & NETIF_F_HW_VLAN_CTAG_RX),
+			MTK_CDMP_EG_CTRL);
+
+	return 0;
 }
 
 /* wait for DMA to finish whatever it is doing before we start using it again */
@@ -3137,11 +3146,45 @@ static int mtk_device_event(struct notifier_block *n, unsigned long event, void
 	return NOTIFY_DONE;
 }
 
+static bool mtk_uses_dsa(struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_NET_DSA)
+	return netdev_uses_dsa(dev) &&
+	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
+#else
+	return false;
+#endif
+}
+
 static int mtk_open(struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
-	int err;
+	int i, err;
+
+	if (mtk_uses_dsa(dev)) {
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
+	}
 
 	err = phylink_of_phy_connect(mac->phylink, mac->of_node, 0);
 	if (err) {
@@ -3469,6 +3512,10 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	 */
 	val = mtk_r32(eth, MTK_CDMQ_IG_CTRL);
 	mtk_w32(eth, val | MTK_CDMQ_STAG_EN, MTK_CDMQ_IG_CTRL);
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
+		val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
+		mtk_w32(eth, val | MTK_CDMP_STAG_EN, MTK_CDMP_IG_CTRL);
+	}
 
 	/* Enable RX VLan Offloading */
 	mtk_w32(eth, 1, MTK_CDMP_EG_CTRL);
@@ -3686,6 +3733,12 @@ static int mtk_free_dev(struct mtk_eth *eth)
 		free_netdev(eth->netdev[i]);
 	}
 
+	for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
+		if (!eth->dsa_meta[i])
+			break;
+		metadata_dst_free(eth->dsa_meta[i]);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 146437ca044b..1c85fbad5bc1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -22,6 +22,9 @@
 #include <linux/bpf_trace.h>
 #include "mtk_ppe.h"
 
+#define MTK_MAX_DSA_PORTS	7
+#define MTK_DSA_PORT_MASK	GENMASK(2, 0)
+
 #define MTK_QDMA_NUM_QUEUES	16
 #define MTK_QDMA_PAGE_SIZE	2048
 #define MTK_MAX_RX_LENGTH	1536
@@ -93,6 +96,9 @@
 #define MTK_CDMQ_IG_CTRL	0x1400
 #define MTK_CDMQ_STAG_EN	BIT(0)
 
+/* CDMQ Exgress Control Register */
+#define MTK_CDMQ_EG_CTRL	0x1404
+
 /* CDMP Ingress Control Register */
 #define MTK_CDMP_IG_CTRL	0x400
 #define MTK_CDMP_STAG_EN	BIT(0)
@@ -1149,6 +1155,8 @@ struct mtk_eth {
 
 	int				ip_align;
 
+	struct metadata_dst		*dsa_meta[MTK_MAX_DSA_PORTS];
+
 	struct mtk_ppe			*ppe[2];
 	struct rhashtable		flow_table;
 
-- 
2.38.1


