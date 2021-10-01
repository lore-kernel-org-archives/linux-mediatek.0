Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DEBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:38:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7685261A08
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7685261A08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ezh75gY9BMulS/h7VW33+yK8Hcv37etdq57Mij5qLsM=; b=Jx/diuliqCVris
	whM7ZBLKg3zUFOwv6/OwROelVJFotPgrH5b8l/aRnS1cmRAW3HEoXED0NKJyMjOLVmae728fLwAZ1
	9edyZkyCdSBVXdCHxooG0sBwFsvaoytHfi2gMedKdb16cVE7ib6VWTxIJlynQeCb4mPf+wlBnXyAI
	e4y9Gm2roKY+klWMsqQhMDJ4OARUKqgtBnyY61XS1z7Yu6vkwFRQRqWdd7ydKey8auObkxuNTmVQj
	laW0GCJQjihDFuM0S6XT/bBAUQ1hFoU33CnjSBdfgyJ5wX5AOj5auBxayP3wv+nHfRXuLz1MCKnl4
	YgQKKtkaDLK5IeCdA+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWEzH-00HGkg-Vx; Fri, 01 Oct 2021 09:37:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWEzC-00HGjG-JP
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:37:51 +0000
X-UUID: deba7c5ee49a4f2894d44fbfb0c48803-20211001
X-UUID: deba7c5ee49a4f2894d44fbfb0c48803-20211001
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1863340840; Fri, 01 Oct 2021 02:37:41 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Oct 2021 02:37:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 1 Oct 2021 17:37:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 17:37:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v3 2/2] mt76: mt7915: add debugfs knobs for MCU utilization
Date: Fri, 1 Oct 2021 17:36:36 +0800
Message-ID: <20211001093636.10501-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211001093636.10501-1-shayne.chen@mediatek.com>
References: <20211001093636.10501-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_023746_674399_8E91D076 
X-CRM114-Status: GOOD (  14.09  )
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

Add debugfs knobs to read MCU utilization, which helps user know
firmware status more easily to narrow down CPU bottleneck issues.

Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 49 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  2 +
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  3 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 17 +++++++
 6 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index b9689762f529..a71cc111420b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -100,6 +100,12 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++)
 		mt7915_mcu_fw_dbg_ctrl(dev, debug, !!dev->fw_debug_wm);
 
+	/* WM CPU info record control */
+	mt76_clear(dev, MT_CPU_UTIL_CTRL, BIT(0));
+	mt76_wr(dev, MT_DIC_CMD_REG_CMD, BIT(2) | BIT(13) | !dev->fw_debug_wm);
+	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR, BIT(5));
+	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR, BIT(5));
+
 	return 0;
 }
 
@@ -123,7 +129,11 @@ mt7915_fw_debug_wa_set(void *data, u64 val)
 
 	dev->fw_debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	return mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
+	mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
+	mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET), MCU_WA_PARAM_PDMA_RX,
+			  !!dev->fw_debug_wa, 0);
+
+	return 0;
 }
 
 static int
@@ -139,6 +149,39 @@ mt7915_fw_debug_wa_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug_wa, mt7915_fw_debug_wa_get,
 			 mt7915_fw_debug_wa_set, "%lld\n");
 
+static int
+mt7915_fw_util_wm_show(struct seq_file *file, void *data)
+{
+	struct mt7915_dev *dev = file->private;
+
+	if (dev->fw_debug_wm) {
+		seq_printf(file, "Busy: %u%%  Peak busy: %u%%\n",
+			   mt76_rr(dev, MT_CPU_UTIL_BUSY_PCT),
+			   mt76_rr(dev, MT_CPU_UTIL_PEAK_BUSY_PCT));
+		seq_printf(file, "Idle count: %u  Peak idle count: %u\n",
+			   mt76_rr(dev, MT_CPU_UTIL_IDLE_CNT),
+			   mt76_rr(dev, MT_CPU_UTIL_PEAK_IDLE_CNT));
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(mt7915_fw_util_wm);
+
+static int
+mt7915_fw_util_wa_show(struct seq_file *file, void *data)
+{
+	struct mt7915_dev *dev = file->private;
+
+	if (dev->fw_debug_wa)
+		mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(QUERY),
+				  MCU_WA_PARAM_CPU_UTIL, 0, 0);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(mt7915_fw_util_wa);
+
 static void
 mt7915_ampdu_stat_read_phy(struct mt7915_phy *phy,
 			   struct seq_file *file)
@@ -480,6 +523,10 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	debugfs_create_file("tx_stats", 0400, dir, dev, &mt7915_tx_stats_fops);
 	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
 	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
+	debugfs_create_file("fw_util_wm", 0400, dir, dev,
+			    &mt7915_fw_util_wm_fops);
+	debugfs_create_file("fw_util_wa", 0400, dir, dev,
+			    &mt7915_fw_util_wa_fops);
 	debugfs_create_file("implicit_txbf", 0600, dir, dev,
 			    &fops_implicit_txbf);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 419b2acad41d..6bc940b271eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -416,8 +416,7 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[qid], skb, 0);
 }
 
-static int
-mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
+int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 {
 	struct {
 		__le32 args[3];
@@ -429,7 +428,7 @@ mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 		},
 	};
 
-	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), true);
+	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), false);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 4a601bdee156..ee732e206751 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -300,6 +300,8 @@ enum {
 };
 
 enum {
+	MCU_WA_PARAM_PDMA_RX = 0x04,
+	MCU_WA_PARAM_CPU_UTIL = 0x0b,
 	MCU_WA_PARAM_RED = 0x0e,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 7bbb38e7116a..1f6ba306c850 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -34,6 +34,9 @@ static u32 __mt7915_reg_addr(struct mt7915_dev *dev, u32 addr)
 		u32 mapped;
 		u32 size;
 	} fixed_map[] = {
+		{ 0x00400000, 0x80000, 0x10000 }, /* WF_MCU_SYSRAM */
+		{ 0x00410000, 0x90000, 0x10000 }, /* WF_MCU_SYSRAM (configure regs) */
+		{ 0x40000000, 0x70000, 0x10000 }, /* WF_UMAC_SYSRAM */
 		{ 0x54000000, 0x02000, 0x1000 }, /* WFDMA PCIE0 MCU DMA0 */
 		{ 0x55000000, 0x03000, 0x1000 }, /* WFDMA PCIE0 MCU DMA1 */
 		{ 0x58000000, 0x06000, 0x1000 }, /* WFDMA PCIE1 MCU DMA0 (MEM_DMA) */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 50c7c8c09d83..aceea6438184 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -356,6 +356,7 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_cmd(struct mt7915_dev *dev, enum mt7915_rdd_cmd cmd,
 		       u8 index, u8 rx_sel, u8 val);
+int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
 int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
 void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 3cf81bbcf1d8..e161c5dc1f8d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -424,6 +424,18 @@
 #define MT_HIF_REMAP_L2_BASE		GENMASK(31, 12)
 #define MT_HIF_REMAP_BASE_L2		0x00000
 
+#define MT_DIC_CMD_REG_BASE		0x41f000
+#define MT_DIC_CMD_REG(ofs)		(MT_DIC_CMD_REG_BASE + (ofs))
+#define MT_DIC_CMD_REG_CMD		MT_DIC_CMD_REG(0x10)
+
+#define MT_CPU_UTIL_BASE		0x41f030
+#define MT_CPU_UTIL(ofs)		(MT_CPU_UTIL_BASE + (ofs))
+#define MT_CPU_UTIL_BUSY_PCT		MT_CPU_UTIL(0x00)
+#define MT_CPU_UTIL_PEAK_BUSY_PCT	MT_CPU_UTIL(0x04)
+#define MT_CPU_UTIL_IDLE_CNT		MT_CPU_UTIL(0x08)
+#define MT_CPU_UTIL_PEAK_IDLE_CNT	MT_CPU_UTIL(0x0c)
+#define MT_CPU_UTIL_CTRL		MT_CPU_UTIL(0x1c)
+
 #define MT_SWDEF_BASE			0x41f200
 #define MT_SWDEF(ofs)			(MT_SWDEF_BASE + (ofs))
 #define MT_SWDEF_MODE			MT_SWDEF(0x3c)
@@ -486,4 +498,9 @@
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR	BIT(29)
 
+#define MT_MCU_WM_CIRQ_BASE			0x89010000
+#define MT_MCU_WM_CIRQ(ofs)			(MT_MCU_WM_CIRQ_BASE + (ofs))
+#define MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR	MT_MCU_WM_CIRQ(0x80)
+#define MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR		MT_MCU_WM_CIRQ(0xc0)
+
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
