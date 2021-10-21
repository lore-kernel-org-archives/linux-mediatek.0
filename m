Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D50C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 17:39:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCB561354
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 17:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDCB561354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oK8NJpBUSfY53IUiZNRF4RY8eMQBgVjjYyWovqIM5E=; b=FVJqj82AuNiCyI
	iER4zzHXes4RrU7aRvU+1BF9jHV5MIFxjiZdTBnX4Zu9wf+i47T4DSCyOJLYR1MK5cPj/H3OPxwP5
	+Z5SWwXeBIePp2YWmWRUp6QemkEbyv7v7uTHs9A/+V/1+9zSeuQMGjfkLtmDCFEuihv0M/cgJ6/wd
	Jh9KwfRIsl9blcifnM2UxnjX8W4cG4LMV+d3nfyfwKQsRAsZON3CjKikShXJCMtHxBh0AmqbBuWu5
	haz+U5e+dPF82MHeUX9eyyVCUBVnz8xbnvF0ixPqrj4vR52Tla8FvzxJW71DODzQCQuSMMBHn+gG1
	xFPYcyOIZ2W1JIuFQ+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc2D-008Van-JK; Thu, 21 Oct 2021 17:39:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc28-008Va1-1W
 for linux-mediatek@lists.infradead.org; Thu, 21 Oct 2021 17:39:19 +0000
X-UUID: 12db68d333c84e86a9781bbf48541dda-20211021
X-UUID: 12db68d333c84e86a9781bbf48541dda-20211021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 664261587; Thu, 21 Oct 2021 10:39:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 10:39:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 01:39:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 01:39:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v5 2/2] mt76: mt7915: add debugfs knobs for MCU utilization
Date: Fri, 22 Oct 2021 01:38:40 +0800
Message-ID: <20211021173840.6203-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211021173840.6203-1-shayne.chen@mediatek.com>
References: <20211021173840.6203-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_103916_122238_5F17480D 
X-CRM114-Status: GOOD (  14.60  )
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
v2: abbreviate utilization to util
v3: rebase to staging tree
v4: rebase to staging tree
v5: check return value of mcu cmd
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 51 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  2 +
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  3 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 17 +++++++
 6 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index e720958..64fb51d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -106,6 +106,12 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 			return ret;
 	}
 
+	/* WM CPU info record control */
+	mt76_clear(dev, MT_CPU_UTIL_CTRL, BIT(0));
+	mt76_wr(dev, MT_DIC_CMD_REG_CMD, BIT(2) | BIT(13) | !dev->fw_debug_wm);
+	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR, BIT(5));
+	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR, BIT(5));
+
 	return 0;
 }
 
@@ -126,10 +132,16 @@ static int
 mt7915_fw_debug_wa_set(void *data, u64 val)
 {
 	struct mt7915_dev *dev = data;
+	int ret;
 
 	dev->fw_debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	return mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
+	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
+	if (ret)
+		return ret;
+
+	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET), MCU_WA_PARAM_PDMA_RX,
+				 !!dev->fw_debug_wa, 0);
 }
 
 static int
@@ -145,6 +157,39 @@ mt7915_fw_debug_wa_get(void *data, u64 *val)
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
+		return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(QUERY),
+					 MCU_WA_PARAM_CPU_UTIL, 0, 0);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(mt7915_fw_util_wa);
+
 static void
 mt7915_ampdu_stat_read_phy(struct mt7915_phy *phy,
 			   struct seq_file *file)
@@ -491,6 +536,10 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	debugfs_create_file("tx_stats", 0400, dir, phy, &mt7915_tx_stats_fops);
 	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
 	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
+	debugfs_create_file("fw_util_wm", 0400, dir, dev,
+			    &mt7915_fw_util_wm_fops);
+	debugfs_create_file("fw_util_wa", 0400, dir, dev,
+			    &mt7915_fw_util_wa_fops);
 	debugfs_create_file("implicit_txbf", 0600, dir, dev,
 			    &fops_implicit_txbf);
 	debugfs_create_file("txpower_sku", 0400, dir, phy,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 70193bb..56ed550 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -416,8 +416,7 @@ exit:
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
index 99ff265..9f64f87 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -309,6 +309,8 @@ enum {
 };
 
 enum {
+	MCU_WA_PARAM_PDMA_RX = 0x04,
+	MCU_WA_PARAM_CPU_UTIL = 0x0b,
 	MCU_WA_PARAM_RED = 0x0e,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 7bbb38e..1f6ba30 100644
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
index 070950b..b318b3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -450,6 +450,7 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_cmd(struct mt7915_dev *dev, enum mt7915_rdd_cmd cmd,
 		       u8 index, u8 rx_sel, u8 val);
+int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
 int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
 void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 99574ed..ff71f56 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -528,6 +528,18 @@
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
@@ -591,4 +603,9 @@
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
