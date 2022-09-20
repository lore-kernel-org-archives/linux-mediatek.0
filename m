Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3E9C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcpF9KvI9eQWJOS6ogFd4irjzvqn/jb1faTt+Mp/md0=; b=eGHYLCUq8C/+yzNTw7N4QiUdfJ
	Uj3A6VDZ5LdQaC9w3SnQPiQHwWXcOdNNQoc+K3fKV4gd9pwT/EvUUEVPG2/kKby1iPUcajh8EQdPN
	bwdhjRhctjJ/yRBO3giTxtlzGXzL2cFlSlb/qkvTRrsuKUWkPolhE078goiKrSTIiaNKAmnY8Ufw/
	GM5Wu00uExAxd3aHUUejXcxr8POEsb4XRH4iwqC1dYvX74o9sDkqN+7XNWbURmP6QmdPc5DcV6NBr
	pDf+TShJwcUkGPeXQwrJOFUld/2jAlklbpcdCqa0OiJZN3PKdnpuuWZNmum9tPZYyslEFVrwByQCW
	kZqWipgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaF6-002pTd-Rc; Tue, 20 Sep 2022 10:12:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaEn-002pDI-QT
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 10:12:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4CA36617EA;
	Tue, 20 Sep 2022 10:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F7C433D6;
	Tue, 20 Sep 2022 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663668740;
	bh=gerfit2UfgDBpzYnYGdl6yzr9H1uApgURUYpBp5g5Tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GKv3Zw8EfN/PZJe+ytaz2bCiaatTOtL7Tbf8DZGv2mDPfYxPQwUwzt1wdRfgvT+Sr
	 9RtIn7bcLsETUZEL2hy63ncmvQ8edvG3khv+3vTlbd5yJh7YRz8yo4YwLY+sMzDUkw
	 IFHewujB3GwpLFzQvkvea4d/HXO+1zGo2sCtxMmv4e9Fj2LWJXz4v2n6nSy5gQ3SHr
	 Lud2P4HY+4PFyEUQLk9O/Bc10E6hsLX8CU5YNQzFhoARRfLuMVuDpruBJ9pts+os6b
	 YyRF3xgDE8kpYXa5xM4rf0xoD4O/AxePUDdQetw5/tCa+T05mhrwwEEAQ4kzil6pbi
	 1np4TvlrBCTAg==
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
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v3 net-next 07/11] net: ethernet: mtk_eth_soc: add foe_entry_size to mtk_eth_soc
Date: Tue, 20 Sep 2022 12:11:19 +0200
Message-Id: <75cf89018d91820607f6f07c81c49234db1c8501.1663668203.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1663668203.git.lorenzo@kernel.org>
References: <cover.1663668203.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031222_038423_0E270325 
X-CRM114-Status: GOOD (  23.30  )
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

Introduce foe_entry_size to mtk_eth_soc data structure since mt7986
relies on a bigger mtk_foe_entry data structure.

Tested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  3 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 10 ++++
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 55 +++++++++++--------
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  2 +-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |  2 +-
 5 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f289b994e7d5..b4bccd42a22c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4217,6 +4217,7 @@ static const struct mtk_soc_data mt7621_data = {
 	.required_pctl = false,
 	.offload_version = 2,
 	.hash_offset = 2,
+	.foe_entry_size = sizeof(struct mtk_foe_entry),
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
@@ -4236,6 +4237,7 @@ static const struct mtk_soc_data mt7622_data = {
 	.required_pctl = false,
 	.offload_version = 2,
 	.hash_offset = 2,
+	.foe_entry_size = sizeof(struct mtk_foe_entry),
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
@@ -4254,6 +4256,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.required_pctl = true,
 	.offload_version = 2,
 	.hash_offset = 2,
+	.foe_entry_size = sizeof(struct mtk_foe_entry),
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 39a0361ca989..08236e054616 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -968,6 +968,7 @@ struct mtk_reg_map {
  * @required_pctl		A bool value to show whether the SoC requires
  *				the extra setup for those pins used by GMAC.
  * @hash_offset			Flow table hash offset.
+ * @foe_entry_size		Foe table entry size.
  * @txd_size			Tx DMA descriptor size.
  * @rxd_size			Rx DMA descriptor size.
  * @rx_irq_done_mask		Rx irq done register mask.
@@ -983,6 +984,7 @@ struct mtk_soc_data {
 	bool		required_pctl;
 	u8		offload_version;
 	u8		hash_offset;
+	u16		foe_entry_size;
 	netdev_features_t hw_features;
 	struct {
 		u32	txd_size;
@@ -1143,6 +1145,14 @@ struct mtk_mac {
 /* the struct describing the SoC. these are declared in the soc_xyz.c files */
 extern const struct of_device_id of_mtk_match[];
 
+static inline struct mtk_foe_entry *
+mtk_foe_get_entry(struct mtk_ppe *ppe, u16 hash)
+{
+	const struct mtk_soc_data *soc = ppe->eth->soc;
+
+	return ppe->foe_table + hash * soc->foe_entry_size;
+}
+
 /* read the hardware status register */
 void mtk_stats_update_mac(struct mtk_mac *mac);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 687d365b601a..8c52cfc7ce76 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -410,9 +410,10 @@ __mtk_foe_entry_clear(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 
 	hlist_del_init(&entry->list);
 	if (entry->hash != 0xffff) {
-		ppe->foe_table[entry->hash].ib1 &= ~MTK_FOE_IB1_STATE;
-		ppe->foe_table[entry->hash].ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE,
-							      MTK_FOE_STATE_UNBIND);
+		struct mtk_foe_entry *hwe = mtk_foe_get_entry(ppe, entry->hash);
+
+		hwe->ib1 &= ~MTK_FOE_IB1_STATE;
+		hwe->ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_UNBIND);
 		dma_wmb();
 	}
 	entry->hash = 0xffff;
@@ -451,7 +452,7 @@ mtk_flow_entry_update_l2(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 		int cur_idle;
 		u32 ib1;
 
-		hwe = &ppe->foe_table[cur->hash];
+		hwe = mtk_foe_get_entry(ppe, cur->hash);
 		ib1 = READ_ONCE(hwe->ib1);
 
 		if (FIELD_GET(MTK_FOE_IB1_STATE, ib1) != MTK_FOE_STATE_BIND) {
@@ -473,8 +474,8 @@ mtk_flow_entry_update_l2(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 static void
 mtk_flow_entry_update(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 {
+	struct mtk_foe_entry foe = {};
 	struct mtk_foe_entry *hwe;
-	struct mtk_foe_entry foe;
 
 	spin_lock_bh(&ppe_lock);
 
@@ -486,8 +487,8 @@ mtk_flow_entry_update(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 	if (entry->hash == 0xffff)
 		goto out;
 
-	hwe = &ppe->foe_table[entry->hash];
-	memcpy(&foe, hwe, sizeof(foe));
+	hwe = mtk_foe_get_entry(ppe, entry->hash);
+	memcpy(&foe, hwe, ppe->eth->soc->foe_entry_size);
 	if (!mtk_flow_entry_match(entry, &foe)) {
 		entry->hash = 0xffff;
 		goto out;
@@ -511,8 +512,8 @@ __mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
 	entry->ib1 &= ~MTK_FOE_IB1_BIND_TIMESTAMP;
 	entry->ib1 |= FIELD_PREP(MTK_FOE_IB1_BIND_TIMESTAMP, timestamp);
 
-	hwe = &ppe->foe_table[hash];
-	memcpy(&hwe->data, &entry->data, sizeof(hwe->data));
+	hwe = mtk_foe_get_entry(ppe, hash);
+	memcpy(&hwe->data, &entry->data, ppe->eth->soc->foe_entry_size);
 	wmb();
 	hwe->ib1 = entry->ib1;
 
@@ -561,7 +562,7 @@ mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 {
 	const struct mtk_soc_data *soc = ppe->eth->soc;
 	struct mtk_flow_entry *flow_info;
-	struct mtk_foe_entry foe, *hwe;
+	struct mtk_foe_entry foe = {}, *hwe;
 	struct mtk_foe_mac_info *l2;
 	u32 ib1_mask = MTK_FOE_IB1_PACKET_TYPE | MTK_FOE_IB1_UDP;
 	int type;
@@ -578,8 +579,8 @@ mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 		       &ppe->foe_flow[hash / soc->hash_offset]);
 	hlist_add_head(&flow_info->l2_data.list, &entry->l2_flows);
 
-	hwe = &ppe->foe_table[hash];
-	memcpy(&foe, hwe, sizeof(foe));
+	hwe = mtk_foe_get_entry(ppe, hash);
+	memcpy(&foe, hwe, soc->foe_entry_size);
 	foe.ib1 &= ib1_mask;
 	foe.ib1 |= entry->data.ib1 & ~ib1_mask;
 
@@ -601,7 +602,7 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 {
 	const struct mtk_soc_data *soc = ppe->eth->soc;
 	struct hlist_head *head = &ppe->foe_flow[hash / soc->hash_offset];
-	struct mtk_foe_entry *hwe = &ppe->foe_table[hash];
+	struct mtk_foe_entry *hwe = mtk_foe_get_entry(ppe, hash);
 	struct mtk_flow_entry *entry;
 	struct mtk_foe_bridge key = {};
 	struct hlist_node *n;
@@ -686,9 +687,9 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base,
 {
 	const struct mtk_soc_data *soc = eth->soc;
 	struct device *dev = eth->dev;
-	struct mtk_foe_entry *foe;
 	struct mtk_ppe *ppe;
 	u32 foe_flow_size;
+	void *foe;
 
 	ppe = devm_kzalloc(dev, sizeof(*ppe), GFP_KERNEL);
 	if (!ppe)
@@ -704,7 +705,8 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base,
 	ppe->dev = dev;
 	ppe->version = version;
 
-	foe = dmam_alloc_coherent(ppe->dev, MTK_PPE_ENTRIES * sizeof(*foe),
+	foe = dmam_alloc_coherent(ppe->dev,
+				  MTK_PPE_ENTRIES * soc->foe_entry_size,
 				  &ppe->foe_phys, GFP_KERNEL);
 	if (!foe)
 		return NULL;
@@ -727,15 +729,21 @@ static void mtk_ppe_init_foe_table(struct mtk_ppe *ppe)
 	static const u8 skip[] = { 12, 25, 38, 51, 76, 89, 102 };
 	int i, k;
 
-	memset(ppe->foe_table, 0, MTK_PPE_ENTRIES * sizeof(*ppe->foe_table));
+	memset(ppe->foe_table, 0,
+	       MTK_PPE_ENTRIES * ppe->eth->soc->foe_entry_size);
 
 	if (!IS_ENABLED(CONFIG_SOC_MT7621))
 		return;
 
 	/* skip all entries that cross the 1024 byte boundary */
-	for (i = 0; i < MTK_PPE_ENTRIES; i += 128)
-		for (k = 0; k < ARRAY_SIZE(skip); k++)
-			ppe->foe_table[i + skip[k]].ib1 |= MTK_FOE_IB1_STATIC;
+	for (i = 0; i < MTK_PPE_ENTRIES; i += 128) {
+		for (k = 0; k < ARRAY_SIZE(skip); k++) {
+			struct mtk_foe_entry *hwe;
+
+			hwe = mtk_foe_get_entry(ppe, i + skip[k]);
+			hwe->ib1 |= MTK_FOE_IB1_STATIC;
+		}
+	}
 }
 
 void mtk_ppe_start(struct mtk_ppe *ppe)
@@ -822,9 +830,12 @@ int mtk_ppe_stop(struct mtk_ppe *ppe)
 	if (!ppe)
 		return 0;
 
-	for (i = 0; i < MTK_PPE_ENTRIES; i++)
-		ppe->foe_table[i].ib1 = FIELD_PREP(MTK_FOE_IB1_STATE,
-						   MTK_FOE_STATE_INVALID);
+	for (i = 0; i < MTK_PPE_ENTRIES; i++) {
+		struct mtk_foe_entry *hwe = mtk_foe_get_entry(ppe, i);
+
+		hwe->ib1 = FIELD_PREP(MTK_FOE_IB1_STATE,
+				      MTK_FOE_STATE_INVALID);
+	}
 
 	mtk_ppe_cache_enable(ppe, false);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 4c31d854e986..6d4c91acd1a5 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -268,7 +268,7 @@ struct mtk_ppe {
 	int version;
 	char dirname[5];
 
-	struct mtk_foe_entry *foe_table;
+	void *foe_table;
 	dma_addr_t foe_phys;
 
 	u16 foe_check_time[MTK_PPE_ENTRIES];
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 0868226ccc27..ec49829ab32d 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -79,7 +79,7 @@ mtk_ppe_debugfs_foe_show(struct seq_file *m, void *private, bool bind)
 	int i;
 
 	for (i = 0; i < MTK_PPE_ENTRIES; i++) {
-		struct mtk_foe_entry *entry = &ppe->foe_table[i];
+		struct mtk_foe_entry *entry = mtk_foe_get_entry(ppe, i);
 		struct mtk_foe_mac_info *l2;
 		struct mtk_flow_addr_info ai = {};
 		unsigned char h_source[ETH_ALEN];
-- 
2.37.3


