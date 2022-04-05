Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKZ05TAQMtpE1XQ/HLewW19tvxee/SMb3XRTlL8PdUo=; b=xdMQuEKWGh7lRT
	GMI8VUgqI/NKtPP6rkDTr+kXUikHiSlb/eFR62giBMYECfgf1nuG7Aw0GSDPGXe5NoR8bh7THuEAk
	/DYUJC5lHdU3jIU2jYidpbTlg8khqOcEDl+Qhrvh1QvFNgBdVf1uLlVr+JQToNFbuj3YjkU83qfXc
	AABovhSJQG1Aw8ZBL04FO3KXumqsFt7Cfu1Qmd5E5RTATxuhzItbNiWxrIIU0EqD4W0pLDHFXKDjV
	pkhmy6SNQlQQUKHIxuxhRhU9Qx4ThlAj7kOR8xQPI6IFHh24GIN9JISnVrG6n3kjp2g0+F6xIK+Pp
	geOHigHJ7Qev2yQ+Zu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpjk-002aJY-Iy; Tue, 05 Apr 2022 20:25:12 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpjY-002aFv-W4; Tue, 05 Apr 2022 20:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZVo/UJA82fMBmvy5lMP09GMnUCqAAhZxbufBzvUA/UQ=; b=OzBXsxUQ3NnIbrCDCjl2ju4Ox6
 OTFaQhi3yjEfHqfjDSpTYDnY1JmKbxZ0ylPkQGX7hQwMHra4J7EvhBCrG04cVm2GT37/HyNWqolXg
 0OPBRwT+kbRciFFh06sHKUjj/vaZFErmNYV2hHG7FN6p5G+QO/v+kNgetOP1blHQRDxs=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJY-00035V-5i; Tue, 05 Apr 2022 21:58:08 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/14] net: ethernet: mtk_eth_soc: allocate struct mtk_ppe
 separately
Date: Tue,  5 Apr 2022 21:57:52 +0200
Message-Id: <20220405195755.10817-12-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_132501_235875_DC3B8821 
X-CRM114-Status: GOOD (  17.60  )
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

Preparation for adding more data to it, which will increase its size.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c     | 11 ++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h     |  2 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c         | 11 ++++++++---
 drivers/net/ethernet/mediatek/mtk_ppe.h         |  3 +--
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 12 ++++++------
 5 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4d7c542d89fb..5a2f3cb26e66 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2269,7 +2269,7 @@ static int mtk_open(struct net_device *dev)
 		if (err)
 			return err;
 
-		if (eth->soc->offload_version && mtk_ppe_start(&eth->ppe) == 0)
+		if (eth->soc->offload_version && mtk_ppe_start(eth->ppe) == 0)
 			gdm_config = MTK_GDMA_TO_PPE;
 
 		mtk_gdm_config(eth, gdm_config);
@@ -2343,7 +2343,7 @@ static int mtk_stop(struct net_device *dev)
 	mtk_dma_free(eth);
 
 	if (eth->soc->offload_version)
-		mtk_ppe_stop(&eth->ppe);
+		mtk_ppe_stop(eth->ppe);
 
 	return 0;
 }
@@ -3262,10 +3262,11 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	if (eth->soc->offload_version) {
-		err = mtk_ppe_init(&eth->ppe, eth->dev,
-				   eth->base + MTK_ETH_PPE_BASE, 2);
-		if (err)
+		eth->ppe = mtk_ppe_init(eth->dev, eth->base + MTK_ETH_PPE_BASE, 2);
+		if (!eth->ppe) {
+			err = -ENOMEM;
 			goto err_free_dev;
+		}
 
 		err = mtk_eth_offload_init(eth);
 		if (err)
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 74661682fd92..c98c7ee42c6f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -985,7 +985,7 @@ struct mtk_eth {
 	u32				rx_dma_l4_valid;
 	int				ip_align;
 
-	struct mtk_ppe			ppe;
+	struct mtk_ppe			*ppe;
 	struct rhashtable		flow_table;
 };
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 472bcd3269a7..c56518272729 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -384,10 +384,15 @@ int mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
 	return hash;
 }
 
-int mtk_ppe_init(struct mtk_ppe *ppe, struct device *dev, void __iomem *base,
+struct mtk_ppe *mtk_ppe_init(struct device *dev, void __iomem *base,
 		 int version)
 {
 	struct mtk_foe_entry *foe;
+	struct mtk_ppe *ppe;
+
+	ppe = devm_kzalloc(dev, sizeof(*ppe), GFP_KERNEL);
+	if (!ppe)
+		return NULL;
 
 	/* need to allocate a separate device, since it PPE DMA access is
 	 * not coherent.
@@ -399,13 +404,13 @@ int mtk_ppe_init(struct mtk_ppe *ppe, struct device *dev, void __iomem *base,
 	foe = dmam_alloc_coherent(ppe->dev, MTK_PPE_ENTRIES * sizeof(*foe),
 				  &ppe->foe_phys, GFP_KERNEL);
 	if (!foe)
-		return -ENOMEM;
+		return NULL;
 
 	ppe->foe_table = foe;
 
 	mtk_ppe_debugfs_init(ppe);
 
-	return 0;
+	return ppe;
 }
 
 static void mtk_ppe_init_foe_table(struct mtk_ppe *ppe)
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index df8ccaf48171..190d2560ac86 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -246,8 +246,7 @@ struct mtk_ppe {
 	void *acct_table;
 };
 
-int mtk_ppe_init(struct mtk_ppe *ppe, struct device *dev, void __iomem *base,
-		 int version);
+struct mtk_ppe *mtk_ppe_init(struct device *dev, void __iomem *base, int version);
 int mtk_ppe_start(struct mtk_ppe *ppe);
 int mtk_ppe_stop(struct mtk_ppe *ppe);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index da3bc93676f8..76a94ec85232 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -411,7 +411,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 
 	entry->cookie = f->cookie;
 	timestamp = mtk_eth_timestamp(eth);
-	hash = mtk_foe_entry_commit(&eth->ppe, &foe, timestamp);
+	hash = mtk_foe_entry_commit(eth->ppe, &foe, timestamp);
 	if (hash < 0) {
 		err = hash;
 		goto free;
@@ -426,7 +426,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 
 	return 0;
 clear_flow:
-	mtk_foe_entry_clear(&eth->ppe, hash);
+	mtk_foe_entry_clear(eth->ppe, hash);
 free:
 	kfree(entry);
 	if (wed_index >= 0)
@@ -444,7 +444,7 @@ mtk_flow_offload_destroy(struct mtk_eth *eth, struct flow_cls_offload *f)
 	if (!entry)
 		return -ENOENT;
 
-	mtk_foe_entry_clear(&eth->ppe, entry->hash);
+	mtk_foe_entry_clear(eth->ppe, entry->hash);
 	rhashtable_remove_fast(&eth->flow_table, &entry->node,
 			       mtk_flow_ht_params);
 	if (entry->wed_index >= 0)
@@ -466,7 +466,7 @@ mtk_flow_offload_stats(struct mtk_eth *eth, struct flow_cls_offload *f)
 	if (!entry)
 		return -ENOENT;
 
-	timestamp = mtk_foe_entry_timestamp(&eth->ppe, entry->hash);
+	timestamp = mtk_foe_entry_timestamp(eth->ppe, entry->hash);
 	if (timestamp < 0)
 		return -ETIMEDOUT;
 
@@ -522,7 +522,7 @@ mtk_eth_setup_tc_block(struct net_device *dev, struct flow_block_offload *f)
 	struct flow_block_cb *block_cb;
 	flow_setup_cb_t *cb;
 
-	if (!eth->ppe.foe_table)
+	if (!eth->ppe || !eth->ppe->foe_table)
 		return -EOPNOTSUPP;
 
 	if (f->binder_type != FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
@@ -574,7 +574,7 @@ int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 
 int mtk_eth_offload_init(struct mtk_eth *eth)
 {
-	if (!eth->ppe.foe_table)
+	if (!eth->ppe || !eth->ppe->foe_table)
 		return 0;
 
 	return rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
