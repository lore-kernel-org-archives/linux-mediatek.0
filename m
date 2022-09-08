Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFAAC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ+4COXx0MhI4OBwdo3hV8F2WytiRvLIUxLAqkQE6UI=; b=E/w+jLFqNXyP7mA3WkP5QjvvXD
	GhLuTCW9LcdwKrHgwdmBmh+OMAba6+BTZ2bYkr239sSmNz6Q9IglUtX1ShLiuFV+UbNavHnCFRS/E
	8ul9XZGa6oT3fy+vnLDDPA2u5zAcNMVzWGUUBzfE6Y60Q7S7j/CiHbYXxn6A0RcnuZbyJRWN3yM5+
	5rLpe6Ca3MFiNVJ8y7Q/wKtsFet3QYaxYGPxzmslzhgkdfnsDU6pp2l5+uPCSVtj5HWmgjMPWO6Jz
	YNcuIopaOZS9E/X8aTvJzlPEAthTlEl6oyre1Qiam4Vjq4z9GwgBJ6ohwLUZT7QkWBV/aTYmIpEgC
	NHlOY46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNJ7-007h9O-Iy; Thu, 08 Sep 2022 19:35:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNJ3-007gyX-6D
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 19:35:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 107B5B82236;
	Thu,  8 Sep 2022 19:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31421C433D7;
	Thu,  8 Sep 2022 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662665716;
	bh=t+trN+nMmksX+M+u18ZOQ0bCmlZr7/qSh7/d7RGQDqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBA/UIIoUa1eIF4WckH9ThZgAV5vphoAV4S50sx97c5adcJYfE2Yc0BittQS5aZy7
	 E1OlvhYfepZrEdTv2UlvyHbdp6sKeEMGxLr2on3+/avFPMUhfYmpnk4kKWA8uJDvMl
	 qGIjSyvhag0FlGzibcjcPFfWSRfk6UpmuTc/qhHmZ8xOorc77SXJdVj8uY2Iw7Mdd8
	 uWt/IYjHHuZizNOFSsogEZvnQmCn+A+cnvtTiGydDj96HU0vKIS8Lk5oYZROAPsa5e
	 lfFahKZ7HdRisFElR/LhEfL8cMugpLYUm/xuAB23QsJi95qGaMutlQU8TY5sVH8G4T
	 83/rYSSn0CACA==
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
	robh@kernel.org
Subject: [PATCH net-next 04/12] net: ethernet: mtk_eth_soc: move ppe table hash offset to mtk_soc_data structure
Date: Thu,  8 Sep 2022 21:33:38 +0200
Message-Id: <cc263ffeaa3e1d7314e36a4f941e96d38e41a6bf.1662661555.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662661555.git.lorenzo@kernel.org>
References: <cover.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_123521_532350_A4650830 
X-CRM114-Status: GOOD (  16.89  )
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

This is a preliminary patch to introduce mt7986 hw packet engine.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |  4 ++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 ++
 drivers/net/ethernet/mediatek/mtk_ppe.c     | 24 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_ppe.h     |  2 +-
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b2b92fe2a96a..d09717d4f3be 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4201,6 +4201,7 @@ static const struct mtk_soc_data mt7621_data = {
 	.required_clks = MT7621_CLKS_BITMAP,
 	.required_pctl = false,
 	.offload_version = 2,
+	.hash_offset = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
@@ -4219,6 +4220,7 @@ static const struct mtk_soc_data mt7622_data = {
 	.required_clks = MT7622_CLKS_BITMAP,
 	.required_pctl = false,
 	.offload_version = 2,
+	.hash_offset = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
@@ -4236,6 +4238,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
 	.offload_version = 2,
+	.hash_offset = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
@@ -4269,6 +4272,7 @@ static const struct mtk_soc_data mt7986_data = {
 	.caps = MT7986_CAPS,
 	.required_clks = MT7986_CLKS_BITMAP,
 	.required_pctl = false,
+	.hash_offset = 4,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma_v2),
 		.rxd_size = sizeof(struct mtk_rx_dma_v2),
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 2617cbecdfca..6c5e144cb9f0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -969,6 +969,7 @@ struct mtk_reg_map {
  *				the target SoC
  * @required_pctl		A bool value to show whether the SoC requires
  *				the extra setup for those pins used by GMAC.
+ * @hash_offset			Flow table hash offset.
  * @txd_size			Tx DMA descriptor size.
  * @rxd_size			Rx DMA descriptor size.
  * @rx_irq_done_mask		Rx irq done register mask.
@@ -983,6 +984,7 @@ struct mtk_soc_data {
 	u32		required_clks;
 	bool		required_pctl;
 	u8		offload_version;
+	u8		hash_offset;
 	netdev_features_t hw_features;
 	struct {
 		u32	txd_size;
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index cfe804bc8d20..1cc7d8338722 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -88,7 +88,7 @@ static void mtk_ppe_cache_enable(struct mtk_ppe *ppe, bool enable)
 		enable * MTK_PPE_CACHE_CTL_EN);
 }
 
-static u32 mtk_ppe_hash_entry(struct mtk_foe_entry *e)
+static u32 mtk_ppe_hash_entry(struct mtk_eth *eth, struct mtk_foe_entry *e)
 {
 	u32 hv1, hv2, hv3;
 	u32 hash;
@@ -122,7 +122,7 @@ static u32 mtk_ppe_hash_entry(struct mtk_foe_entry *e)
 	hash = (hash >> 24) | ((hash & 0xffffff) << 8);
 	hash ^= hv1 ^ hv2 ^ hv3;
 	hash ^= hash >> 16;
-	hash <<= 1;
+	hash <<= (ffs(eth->soc->hash_offset) - 1);
 	hash &= MTK_PPE_ENTRIES - 1;
 
 	return hash;
@@ -540,15 +540,16 @@ mtk_foe_entry_commit_l2(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 int mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 {
 	int type = FIELD_GET(MTK_FOE_IB1_PACKET_TYPE, entry->data.ib1);
+	const struct mtk_soc_data *soc = ppe->eth->soc;
 	u32 hash;
 
 	if (type == MTK_PPE_PKT_TYPE_BRIDGE)
 		return mtk_foe_entry_commit_l2(ppe, entry);
 
-	hash = mtk_ppe_hash_entry(&entry->data);
+	hash = mtk_ppe_hash_entry(ppe->eth, &entry->data);
 	entry->hash = 0xffff;
 	spin_lock_bh(&ppe_lock);
-	hlist_add_head(&entry->list, &ppe->foe_flow[hash / 2]);
+	hlist_add_head(&entry->list, &ppe->foe_flow[hash / soc->hash_offset]);
 	spin_unlock_bh(&ppe_lock);
 
 	return 0;
@@ -558,6 +559,7 @@ static void
 mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 			     u16 hash)
 {
+	const struct mtk_soc_data *soc = ppe->eth->soc;
 	struct mtk_flow_entry *flow_info;
 	struct mtk_foe_entry foe, *hwe;
 	struct mtk_foe_mac_info *l2;
@@ -572,7 +574,8 @@ mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 	flow_info->l2_data.base_flow = entry;
 	flow_info->type = MTK_FLOW_TYPE_L2_SUBFLOW;
 	flow_info->hash = hash;
-	hlist_add_head(&flow_info->list, &ppe->foe_flow[hash / 2]);
+	hlist_add_head(&flow_info->list,
+		       &ppe->foe_flow[hash / soc->hash_offset]);
 	hlist_add_head(&flow_info->l2_data.list, &entry->l2_flows);
 
 	hwe = &ppe->foe_table[hash];
@@ -596,7 +599,8 @@ mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 
 void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 {
-	struct hlist_head *head = &ppe->foe_flow[hash / 2];
+	const struct mtk_soc_data *soc = ppe->eth->soc;
+	struct hlist_head *head = &ppe->foe_flow[hash / soc->hash_offset];
 	struct mtk_foe_entry *hwe = &ppe->foe_table[hash];
 	struct mtk_flow_entry *entry;
 	struct mtk_foe_bridge key = {};
@@ -680,9 +684,11 @@ int mtk_foe_entry_idle_time(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base,
 		 int version)
 {
+	const struct mtk_soc_data *soc = eth->soc;
 	struct device *dev = eth->dev;
 	struct mtk_foe_entry *foe;
 	struct mtk_ppe *ppe;
+	u32 foe_flow_size;
 
 	ppe = devm_kzalloc(dev, sizeof(*ppe), GFP_KERNEL);
 	if (!ppe)
@@ -705,6 +711,12 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base,
 
 	ppe->foe_table = foe;
 
+	foe_flow_size = (MTK_PPE_ENTRIES / soc->hash_offset) *
+			sizeof(*ppe->foe_flow);
+	ppe->foe_flow = devm_kzalloc(dev, foe_flow_size, GFP_KERNEL);
+	if (!ppe->foe_flow)
+		return NULL;
+
 	mtk_ppe_debugfs_init(ppe);
 
 	return ppe;
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index bb079e3c0417..22efed6599c2 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -270,7 +270,7 @@ struct mtk_ppe {
 	dma_addr_t foe_phys;
 
 	u16 foe_check_time[MTK_PPE_ENTRIES];
-	struct hlist_head foe_flow[MTK_PPE_ENTRIES / 2];
+	struct hlist_head *foe_flow;
 
 	struct rhashtable l2_flows;
 
-- 
2.37.3


