Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5436C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7I1bkJNlcmREu68gJt0fCjWLMpb+s58iPxmfiK6IF8=; b=j3h2On/7Xz2ZML
	9mmKv9GdfQv9ykBhzaxzdmk3w9Sbohtme1c5yLp/5phksUAHtUVnfVtwlIHfypKpgRtn9AOHDqW21
	yIhGRw+2su+Rvu2tH1qDzzbVdAdvUfvMKNXXUTzpF7YCsrdGKNNq9NaBSP8ncm5TDlgP57guhrcIN
	IWacvq3yKLUwT6L9pmfbtH9olYIJchl0peR0BnI5oIvrK009d8YPuFFNQR6JdyQnhNYOecryPW1pS
	fq2Ui0uAUVBsfym4BTXcSSRWKsM2qTh61OLl/gH0OTD1+EUYLnz+jrSWsHU7BiGIfFXHe7hkKwgz6
	8P9fp8wl08htYEJ+0vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpLT-002TqW-UY; Tue, 05 Apr 2022 20:00:07 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpJg-002ScG-WA; Tue, 05 Apr 2022 19:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=49n/N3seNVvQaTYjzXX+V0A2d2uQ8w8pWanG0yiINLI=; b=s7Jvcei0nZ761JrSTKn37efb7i
 IXfmjw4mdzgtqgxidpBiK91XIgl9ho4GfV5eDOVmGplOo5V3e7qZ1mqOqo5lf+wvEKSZY32aG5ZDy
 VKBkiovCncqsQ57ffjY8hDrf1Uv7t8SyWUYy5psVAs+ClIxvtVLGUqi5Hreg42O2R3Bs=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJV-00035V-9W; Tue, 05 Apr 2022 21:58:05 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/14] net: ethernet: mtk_eth_soc: implement flow
 offloading to WED devices
Date: Tue,  5 Apr 2022 21:57:48 +0200
Message-Id: <20220405195755.10817-8-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125817_252839_0C049233 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This allows hardware flow offloading from Ethernet to WLAN on MT7622 SoC

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 18 ++++++
 drivers/net/ethernet/mediatek/mtk_ppe.h       | 14 +++--
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 56 ++++++++++++++++++-
 drivers/net/ethernet/mediatek/mtk_wed.h       |  7 +++
 include/linux/netdevice.h                     |  7 +++
 net/core/dev.c                                |  4 ++
 6 files changed, 98 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 3ad10c793308..472bcd3269a7 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -329,6 +329,24 @@ int mtk_foe_entry_set_pppoe(struct mtk_foe_entry *entry, int sid)
 	return 0;
 }
 
+int mtk_foe_entry_set_wdma(struct mtk_foe_entry *entry, int wdma_idx, int txq,
+			   int bss, int wcid)
+{
+	struct mtk_foe_mac_info *l2 = mtk_foe_entry_l2(entry);
+	u32 *ib2 = mtk_foe_entry_ib2(entry);
+
+	*ib2 &= ~MTK_FOE_IB2_PORT_MG;
+	*ib2 |= MTK_FOE_IB2_WDMA_WINFO;
+	if (wdma_idx)
+		*ib2 |= MTK_FOE_IB2_WDMA_DEVIDX;
+
+	l2->vlan2 = FIELD_PREP(MTK_FOE_VLAN2_WINFO_BSS, bss) |
+		    FIELD_PREP(MTK_FOE_VLAN2_WINFO_WCID, wcid) |
+		    FIELD_PREP(MTK_FOE_VLAN2_WINFO_RING, txq);
+
+	return 0;
+}
+
 static inline bool mtk_foe_entry_usable(struct mtk_foe_entry *entry)
 {
 	return !(entry->ib1 & MTK_FOE_IB1_STATIC) &&
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 242fb8f2ae65..df8ccaf48171 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -48,9 +48,9 @@ enum {
 #define MTK_FOE_IB2_DEST_PORT		GENMASK(7, 5)
 #define MTK_FOE_IB2_MULTICAST		BIT(8)
 
-#define MTK_FOE_IB2_WHNAT_QID2		GENMASK(13, 12)
-#define MTK_FOE_IB2_WHNAT_DEVIDX	BIT(16)
-#define MTK_FOE_IB2_WHNAT_NAT		BIT(17)
+#define MTK_FOE_IB2_WDMA_QID2		GENMASK(13, 12)
+#define MTK_FOE_IB2_WDMA_DEVIDX		BIT(16)
+#define MTK_FOE_IB2_WDMA_WINFO		BIT(17)
 
 #define MTK_FOE_IB2_PORT_MG		GENMASK(17, 12)
 
@@ -58,9 +58,9 @@ enum {
 
 #define MTK_FOE_IB2_DSCP		GENMASK(31, 24)
 
-#define MTK_FOE_VLAN2_WHNAT_BSS		GEMMASK(5, 0)
-#define MTK_FOE_VLAN2_WHNAT_WCID	GENMASK(13, 6)
-#define MTK_FOE_VLAN2_WHNAT_RING	GENMASK(15, 14)
+#define MTK_FOE_VLAN2_WINFO_BSS		GENMASK(5, 0)
+#define MTK_FOE_VLAN2_WINFO_WCID	GENMASK(13, 6)
+#define MTK_FOE_VLAN2_WINFO_RING	GENMASK(15, 14)
 
 enum {
 	MTK_FOE_STATE_INVALID,
@@ -281,6 +281,8 @@ int mtk_foe_entry_set_ipv6_tuple(struct mtk_foe_entry *entry,
 int mtk_foe_entry_set_dsa(struct mtk_foe_entry *entry, int port);
 int mtk_foe_entry_set_vlan(struct mtk_foe_entry *entry, int vid);
 int mtk_foe_entry_set_pppoe(struct mtk_foe_entry *entry, int sid);
+int mtk_foe_entry_set_wdma(struct mtk_foe_entry *entry, int wdma_idx, int txq,
+			   int bss, int wcid);
 int mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
 			 u16 timestamp);
 int mtk_ppe_debugfs_init(struct mtk_ppe *ppe);
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 7bb1f20002b5..bcf342bb9051 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -10,6 +10,7 @@
 #include <net/pkt_cls.h>
 #include <net/dsa.h>
 #include "mtk_eth_soc.h"
+#include "mtk_wed.h"
 
 struct mtk_flow_data {
 	struct ethhdr eth;
@@ -39,6 +40,7 @@ struct mtk_flow_entry {
 	struct rhash_head node;
 	unsigned long cookie;
 	u16 hash;
+	s8 wed_index;
 };
 
 static const struct rhashtable_params mtk_flow_ht_params = {
@@ -80,6 +82,35 @@ mtk_flow_offload_mangle_eth(const struct flow_action_entry *act, void *eth)
 	memcpy(dest, src, act->mangle.mask ? 2 : 4);
 }
 
+static int
+mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_info *info)
+{
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+		.daddr = addr,
+	};
+	struct net_device_path path = {};
+
+	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
+		return -1;
+
+	if (!dev->netdev_ops->ndo_fill_forward_path)
+		return -1;
+
+	if (dev->netdev_ops->ndo_fill_forward_path(&ctx, &path))
+		return -1;
+
+	if (path.type != DEV_PATH_MTK_WDMA)
+		return -1;
+
+	info->wdma_idx = path.mtk_wdma.wdma_idx;
+	info->queue = path.mtk_wdma.queue;
+	info->bss = path.mtk_wdma.bss;
+	info->wcid = path.mtk_wdma.wcid;
+
+	return 0;
+}
+
 
 static int
 mtk_flow_mangle_ports(const struct flow_action_entry *act,
@@ -149,10 +180,20 @@ mtk_flow_get_dsa_port(struct net_device **dev)
 
 static int
 mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
-			   struct net_device *dev)
+			   struct net_device *dev, const u8 *dest_mac,
+			   int *wed_index)
 {
+	struct mtk_wdma_info info = {};
 	int pse_port, dsa_port;
 
+	if (mtk_flow_get_wdma_info(dev, dest_mac, &info) == 0) {
+		mtk_foe_entry_set_wdma(foe, info.wdma_idx, info.queue, info.bss,
+				       info.wcid);
+		pse_port = 3;
+		*wed_index = info.wdma_idx;
+		goto out;
+	}
+
 	dsa_port = mtk_flow_get_dsa_port(&dev);
 	if (dsa_port >= 0)
 		mtk_foe_entry_set_dsa(foe, dsa_port);
@@ -164,6 +205,7 @@ mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
 	else
 		return -EOPNOTSUPP;
 
+out:
 	mtk_foe_entry_set_pse_port(foe, pse_port);
 
 	return 0;
@@ -179,6 +221,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	struct net_device *odev = NULL;
 	struct mtk_flow_entry *entry;
 	int offload_type = 0;
+	int wed_index = -1;
 	u16 addr_type = 0;
 	u32 timestamp;
 	u8 l4proto = 0;
@@ -326,10 +369,14 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	if (data.pppoe.num == 1)
 		mtk_foe_entry_set_pppoe(&foe, data.pppoe.sid);
 
-	err = mtk_flow_set_output_device(eth, &foe, odev);
+	err = mtk_flow_set_output_device(eth, &foe, odev, data.eth.h_dest,
+					 &wed_index);
 	if (err)
 		return err;
 
+	if (wed_index >= 0 && (err = mtk_wed_flow_add(wed_index)) < 0)
+		return err;
+
 	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry)
 		return -ENOMEM;
@@ -343,6 +390,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	}
 
 	entry->hash = hash;
+	entry->wed_index = wed_index;
 	err = rhashtable_insert_fast(&eth->flow_table, &entry->node,
 				     mtk_flow_ht_params);
 	if (err < 0)
@@ -353,6 +401,8 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	mtk_foe_entry_clear(&eth->ppe, hash);
 free:
 	kfree(entry);
+	if (wed_index >= 0)
+	    mtk_wed_flow_remove(wed_index);
 	return err;
 }
 
@@ -369,6 +419,8 @@ mtk_flow_offload_destroy(struct mtk_eth *eth, struct flow_cls_offload *f)
 	mtk_foe_entry_clear(&eth->ppe, entry->hash);
 	rhashtable_remove_fast(&eth->flow_table, &entry->node,
 			       mtk_flow_ht_params);
+	if (entry->wed_index >= 0)
+		mtk_wed_flow_remove(entry->wed_index);
 	kfree(entry);
 
 	return 0;
diff --git a/drivers/net/ethernet/mediatek/mtk_wed.h b/drivers/net/ethernet/mediatek/mtk_wed.h
index 404c9a9b130d..981ec613f4b0 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed.h
@@ -7,6 +7,7 @@
 #include <linux/soc/mediatek/mtk_wed.h>
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
+#include <linux/netdevice.h>
 
 struct mtk_eth;
 
@@ -27,6 +28,12 @@ struct mtk_wed_hw {
 	int index;
 };
 
+struct mtk_wdma_info {
+	u8 wdma_idx;
+	u8 queue;
+	u16 wcid;
+	u8 bss;
+};
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
 static inline void
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 59e27a2b7bf0..93d85f207d3d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -862,6 +862,7 @@ enum net_device_path_type {
 	DEV_PATH_BRIDGE,
 	DEV_PATH_PPPOE,
 	DEV_PATH_DSA,
+	DEV_PATH_MTK_WDMA,
 };
 
 struct net_device_path {
@@ -887,6 +888,12 @@ struct net_device_path {
 			int port;
 			u16 proto;
 		} dsa;
+		struct {
+			u8 wdma_idx;
+			u8 queue;
+			u16 wcid;
+			u8 bss;
+		} mtk_wdma;
 	};
 };
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 8c6c08446556..388be014e981 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -701,6 +701,10 @@ int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 		if (WARN_ON_ONCE(last_dev == ctx.dev))
 			return -1;
 	}
+
+	if (!ctx.dev)
+		return ret;
+
 	path = dev_fwd_path(stack);
 	if (!path)
 		return -1;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
