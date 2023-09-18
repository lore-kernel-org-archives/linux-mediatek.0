Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95B8CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2FsYtmojgwRPZfSLO0NDmuy4WFq9qI/pv5VWKhiEXw=; b=x9ECvHYfDK73rpzQMYJ4yJIu1c
	NYDJbKDgere8MM+Moo6ygDk0KZrz7FMBFA5EgzAwZf+UaRlIzJ+5oVhpDX5EcNziyRnAaLa35C9SV
	DjFG8VWqj2LPNiK16j463EX/HcHnXhxMvO8JRaZN2wTWDcS4avIsL0FRvOIT0xlu2dDosBNE1kCML
	2dueMcK4WOGtK0lGP8EItzBjxBK3zvNAJIk48kTpHltYHDM1vkHRCdHewqJacp2c7lhm+e/9SfCuy
	ckmlk3Ip38Pq4rlhPGs0fsWhBT2Jz4YUDb+9AHiZW1RvLvwz08vcFI27hnjDGy1aEY2VsEs5qPHWj
	ALnw9KQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBW7-00F7uD-25;
	Mon, 18 Sep 2023 10:30:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBW4-00F7qf-2v
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 19FD0CE0B74;
	Mon, 18 Sep 2023 10:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E7FC433C8;
	Mon, 18 Sep 2023 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033005;
	bh=yAXZDfthDM+JXclNb0yFwzC4eXIf9CoNOD2FqTErOCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FgEvAaA9+L6vguVPWqORGES01LoDmi9o2qgdBZOnZbqs+59zkSfsW1hJeLBw5g3wh
	 vUq79YO4jEFNbHwjSSa6seW7ec7JulQPAfrOSjuWYkLQxUe9q6RdR6uohCcjPC/GRS
	 mjeyBKiHX9z2kUMubWe2h1Xao2oODGosZ07mwqQDyAVsEMwzbAqpuY9hj9zjFl+o5V
	 q0AA2Dt1SWRJREM3ZE66I7nvx5bYgWt03fCcxvfuSIkbWBs9RZblWXWscFjeBzJpbt
	 3637b4z1QIEmtKVCXTYnJLNm8R62jpZIYNegca74W5Dc8S3HZfFCMl6uERRg4GvNQV
	 VSZ+E9XvpmMvg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 03/17] net: ethernet: mtk_wed: introduce versioning utility routines
Date: Mon, 18 Sep 2023 12:29:05 +0200
Message-ID: <b81731d23a64ba2b1a5295fd0540cb4996b78ded.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033009_295641_A9DB60A7 
X-CRM114-Status: GOOD (  17.90  )
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

Similar to mtk_eth_soc, introduce the following wed versioning
utility routines:
- mtk_wed_is_v1
- mtk_wed_is_v2

This is a preliminary patch to introduce WED support for MT7988 SoC

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c       | 40 +++++++++----------
 drivers/net/ethernet/mediatek/mtk_wed.h       | 10 +++++
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  2 +-
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   |  2 +-
 4 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index e7d3525d2e30..ce1ca98ea1d6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -278,7 +278,7 @@ mtk_wed_assign(struct mtk_wed_device *dev)
 		if (!hw->wed_dev)
 			goto out;
 
-		if (hw->version == 1)
+		if (mtk_wed_is_v1(hw))
 			return NULL;
 
 		/* MT7986 WED devices do not have any pcie slot restrictions */
@@ -359,7 +359,7 @@ mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
 			desc->buf0 = cpu_to_le32(buf_phys);
 			desc->buf1 = cpu_to_le32(buf_phys + txd_size);
 
-			if (dev->hw->version == 1)
+			if (mtk_wed_is_v1(dev->hw))
 				ctrl = FIELD_PREP(MTK_WDMA_DESC_CTRL_LEN0, txd_size) |
 				       FIELD_PREP(MTK_WDMA_DESC_CTRL_LEN1,
 						  MTK_WED_BUF_SIZE - txd_size) |
@@ -498,7 +498,7 @@ mtk_wed_set_ext_int(struct mtk_wed_device *dev, bool en)
 {
 	u32 mask = MTK_WED_EXT_INT_STATUS_ERROR_MASK;
 
-	if (dev->hw->version == 1)
+	if (mtk_wed_is_v1(dev->hw))
 		mask |= MTK_WED_EXT_INT_STATUS_TX_DRV_R_RESP_ERR;
 	else
 		mask |= MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH |
@@ -577,7 +577,7 @@ mtk_wed_dma_disable(struct mtk_wed_device *dev)
 		 MTK_WDMA_GLO_CFG_RX_INFO1_PRERES |
 		 MTK_WDMA_GLO_CFG_RX_INFO2_PRERES);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		regmap_write(dev->hw->mirror, dev->hw->index * 4, 0);
 		wdma_clr(dev, MTK_WDMA_GLO_CFG,
 			 MTK_WDMA_GLO_CFG_RX_INFO3_PRERES);
@@ -606,7 +606,7 @@ mtk_wed_stop(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_INT_GRP2, 0);
 	wed_w32(dev, MTK_WED_WPDMA_INT_MASK, 0);
 
-	if (dev->hw->version == 1)
+	if (mtk_wed_is_v1(dev->hw))
 		return;
 
 	wed_w32(dev, MTK_WED_EXT_INT_MASK1, 0);
@@ -625,7 +625,7 @@ mtk_wed_deinit(struct mtk_wed_device *dev)
 		MTK_WED_CTRL_WED_TX_BM_EN |
 		MTK_WED_CTRL_WED_TX_FREE_AGENT_EN);
 
-	if (dev->hw->version == 1)
+	if (mtk_wed_is_v1(dev->hw))
 		return;
 
 	wed_clr(dev, MTK_WED_CTRL,
@@ -731,7 +731,7 @@ mtk_wed_bus_init(struct mtk_wed_device *dev)
 static void
 mtk_wed_set_wpdma(struct mtk_wed_device *dev)
 {
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		wed_w32(dev, MTK_WED_WPDMA_CFG_BASE,  dev->wlan.wpdma_phys);
 	} else {
 		mtk_wed_bus_init(dev);
@@ -762,7 +762,7 @@ mtk_wed_hw_init_early(struct mtk_wed_device *dev)
 	      MTK_WED_WDMA_GLO_CFG_IDLE_DMAD_SUPPLY;
 	wed_m32(dev, MTK_WED_WDMA_GLO_CFG, mask, set);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		u32 offset = dev->hw->index ? 0x04000400 : 0;
 
 		wdma_set(dev, MTK_WDMA_GLO_CFG,
@@ -935,7 +935,7 @@ mtk_wed_hw_init(struct mtk_wed_device *dev)
 
 	wed_w32(dev, MTK_WED_TX_BM_BUF_LEN, MTK_WED_PKT_SIZE);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		wed_w32(dev, MTK_WED_TX_BM_TKID,
 			FIELD_PREP(MTK_WED_TX_BM_TKID_START,
 				   dev->wlan.token_start) |
@@ -968,7 +968,7 @@ mtk_wed_hw_init(struct mtk_wed_device *dev)
 
 	mtk_wed_reset(dev, MTK_WED_RESET_TX_BM);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		wed_set(dev, MTK_WED_CTRL,
 			MTK_WED_CTRL_WED_TX_BM_EN |
 			MTK_WED_CTRL_WED_TX_FREE_AGENT_EN);
@@ -1218,7 +1218,7 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 	}
 
 	dev->init_done = false;
-	if (dev->hw->version == 1)
+	if (mtk_wed_is_v1(dev->hw))
 		return;
 
 	if (!busy) {
@@ -1344,7 +1344,7 @@ mtk_wed_configure_irq(struct mtk_wed_device *dev, u32 irq_mask)
 		MTK_WED_CTRL_WED_TX_BM_EN |
 		MTK_WED_CTRL_WED_TX_FREE_AGENT_EN);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		wed_w32(dev, MTK_WED_PCIE_INT_TRIGGER,
 			MTK_WED_PCIE_INT_TRIGGER_STATUS);
 
@@ -1417,7 +1417,7 @@ mtk_wed_dma_enable(struct mtk_wed_device *dev)
 		 MTK_WDMA_GLO_CFG_RX_INFO1_PRERES |
 		 MTK_WDMA_GLO_CFG_RX_INFO2_PRERES);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		wdma_set(dev, MTK_WDMA_GLO_CFG,
 			 MTK_WDMA_GLO_CFG_RX_INFO3_PRERES);
 	} else {
@@ -1466,7 +1466,7 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 
 	mtk_wed_set_ext_int(dev, true);
 
-	if (dev->hw->version == 1) {
+	if (mtk_wed_is_v1(dev->hw)) {
 		u32 val = dev->wlan.wpdma_phys | MTK_PCIE_MIRROR_MAP_EN |
 			  FIELD_PREP(MTK_PCIE_MIRROR_MAP_WED_ID,
 				     dev->hw->index);
@@ -1551,7 +1551,7 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 	}
 
 	mtk_wed_hw_init_early(dev);
-	if (hw->version == 1) {
+	if (mtk_wed_is_v1(hw)) {
 		regmap_update_bits(hw->hifsys, HIFSYS_DMA_AG_MAP,
 				   BIT(hw->index), 0);
 	} else {
@@ -1619,7 +1619,7 @@ static int
 mtk_wed_txfree_ring_setup(struct mtk_wed_device *dev, void __iomem *regs)
 {
 	struct mtk_wed_ring *ring = &dev->txfree_ring;
-	int i, index = dev->hw->version == 1;
+	int i, index = mtk_wed_is_v1(dev->hw);
 
 	/*
 	 * For txfree event handling, the same DMA ring is shared between WED
@@ -1677,7 +1677,7 @@ mtk_wed_irq_get(struct mtk_wed_device *dev, u32 mask)
 {
 	u32 val, ext_mask = MTK_WED_EXT_INT_STATUS_ERROR_MASK;
 
-	if (dev->hw->version == 1)
+	if (mtk_wed_is_v1(dev->hw))
 		ext_mask |= MTK_WED_EXT_INT_STATUS_TX_DRV_R_RESP_ERR;
 	else
 		ext_mask |= MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH |
@@ -1844,7 +1844,7 @@ mtk_wed_setup_tc(struct mtk_wed_device *wed, struct net_device *dev,
 {
 	struct mtk_wed_hw *hw = wed->hw;
 
-	if (hw->version < 2)
+	if (mtk_wed_is_v1(hw))
 		return -EOPNOTSUPP;
 
 	switch (type) {
@@ -1918,9 +1918,9 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 	hw->wdma = wdma;
 	hw->index = index;
 	hw->irq = irq;
-	hw->version = mtk_is_netsys_v1(eth) ? 1 : 2;
+	hw->version = eth->soc->version;
 
-	if (hw->version == 1) {
+	if (mtk_wed_is_v1(hw)) {
 		hw->mirror = syscon_regmap_lookup_by_phandle(eth_np,
 				"mediatek,pcie-mirror");
 		hw->hifsys = syscon_regmap_lookup_by_phandle(eth_np,
diff --git a/drivers/net/ethernet/mediatek/mtk_wed.h b/drivers/net/ethernet/mediatek/mtk_wed.h
index 43ab77eaf683..6f5db891a6b9 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed.h
@@ -40,6 +40,16 @@ struct mtk_wdma_info {
 };
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
+static inline bool mtk_wed_is_v1(struct mtk_wed_hw *hw)
+{
+	return hw->version == 1;
+}
+
+static inline bool mtk_wed_is_v2(struct mtk_wed_hw *hw)
+{
+	return hw->version == 2;
+}
+
 static inline void
 wed_w32(struct mtk_wed_device *dev, u32 reg, u32 val)
 {
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
index e24afeaea0da..674e919d0d3a 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
@@ -261,7 +261,7 @@ void mtk_wed_hw_add_debugfs(struct mtk_wed_hw *hw)
 	debugfs_create_u32("regidx", 0600, dir, &hw->debugfs_reg);
 	debugfs_create_file_unsafe("regval", 0600, dir, hw, &fops_regval);
 	debugfs_create_file_unsafe("txinfo", 0400, dir, hw, &wed_txinfo_fops);
-	if (hw->version != 1)
+	if (!mtk_wed_is_v1(hw))
 		debugfs_create_file_unsafe("rxinfo", 0400, dir, hw,
 					   &wed_rxinfo_fops);
 }
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 72bcdaed12a9..8216403e5834 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -207,7 +207,7 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 {
 	struct mtk_wed_wo *wo = dev->hw->wed_wo;
 
-	if (dev->hw->version == 1)
+	if (mtk_wed_is_v1(dev->hw))
 		return 0;
 
 	if (WARN_ON(!wo))
-- 
2.41.0


