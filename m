Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E954EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdEmm/PG8ks5QwQbfXOGXMmOhhP2S8SkBzWqPCfpHh8=; b=jVClYKPsXntOoP6q2VChdvFox9
	SJ8+7MCD8WFRJVI8Kq+fEgDhEyoGW641wAlGrlzQg7Uzxh7HFhmV7UNIu7QPl4PWbw5qD2krvacz5
	FuNCg373IMjAsm7biPlRqzs1vdgMz4oo+RdCaW4L9jZNxjldyCHOk/UHoixvdNMgjvM6TtQUZJrK0
	eBAnZ5/5sgCXYGmClsd3a+Ru5HsLfEquiTFf+ldwadD0h8EA9lrUNQ0uTQ9VBHrLTp6i6dJ8sEe7N
	u4Wbg15YEX1uqbkfr5o7k3JC1tC6MglQWiWdlUfduWr+yqFVMZyr66qwslW13VSiRPMqQbJX+EniT
	MK2CgiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osU1L-007kqe-Uy; Tue, 08 Nov 2022 19:12:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osU1J-007koq-3X
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 19:12:26 +0000
X-UUID: 2d143353c0114998878822ccc2093672-20221108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gdEmm/PG8ks5QwQbfXOGXMmOhhP2S8SkBzWqPCfpHh8=;
	b=VQGc5CwBiWwVuuVPYeSfs1YQHpeRsI/+4JUCp39Is9W8H65xlMtas7uSSPg7R1iZgw+DmWFRWdJTXwKD90dMRzdb+vCWHNgpjkKAfpEtnfOD5yfg0wZC9oes5f/Fzk+qXOW1DjZEhDMCPl3xbAyC/jEnDum7++2u5KTqSVHgBBk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b9696f32-26a5-4500-b1c5-3bb99754b7db,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:9af1d2eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2d143353c0114998878822ccc2093672-20221108
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1066035291; Tue, 08 Nov 2022 12:12:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 9 Nov 2022 03:02:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 9 Nov 2022 03:02:14 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/4] wifi: mt76: mt7915: add full system reset into debugfs
Date: Wed, 9 Nov 2022 03:02:09 +0800
Message-ID: <de5e0b76c246926d21c13625310e810584b742c7.1667929344.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667929344.git.ryder.lee@mediatek.com>
References: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667929344.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_111225_176345_F81135BE 
X-CRM114-Status: GOOD (  15.11  )
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

Trigger firmware crash and enable full system recovery through debugfs.
This also renames knob "fw_ser" to a clear-cut name "sys_recovery".

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 51 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  5 ++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  2 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  4 ++
 5 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index e1d15394a621..56320c5da499 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -46,8 +46,8 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
 
 /* test knob of system error recovery */
 static ssize_t
-mt7915_fw_ser_set(struct file *file, const char __user *user_buf,
-		  size_t count, loff_t *ppos)
+mt7915_sys_recovery_set(struct file *file, const char __user *user_buf,
+			size_t count, loff_t *ppos)
 {
 	struct mt7915_phy *phy = file->private_data;
 	struct mt7915_dev *dev = phy->dev;
@@ -71,8 +71,18 @@ mt7915_fw_ser_set(struct file *file, const char __user *user_buf,
 		return -EINVAL;
 
 	switch (val) {
+	/*
+	 * 0: grab firmware current SER state.
+	 * 1: trigger & enable system error L1 recovery.
+	 * 2: trigger & enable system error L2 recovery.
+	 * 3: trigger & enable system error L3 rx abort.
+	 * 4: trigger & enable system error L3 tx abort
+	 * 5: trigger & enable system error L3 tx disable.
+	 * 6: trigger & enable system error L3 bf recovery.
+	 * 7: trigger & enable system error full recovery.
+	 * 8: trigger firmware crash.
+	 */
 	case SER_QUERY:
-		/* grab firmware SER stats */
 		ret = mt7915_mcu_set_ser(dev, 0, 0, ext_phy);
 		break;
 	case SER_SET_RECOVER_L1:
@@ -87,6 +97,23 @@ mt7915_fw_ser_set(struct file *file, const char __user *user_buf,
 
 		ret = mt7915_mcu_set_ser(dev, SER_RECOVER, val, ext_phy);
 		break;
+
+	/* enable full chip reset */
+	case SER_SET_RECOVER_FULL:
+		mt76_set(dev, MT_WFDMA0_MCU_HOST_INT_ENA, MT_MCU_CMD_WDT_MASK);
+		ret = mt7915_mcu_set_ser(dev, 1, 3, ext_phy);
+		if (ret)
+			return ret;
+
+		dev->recovery.state |= MT_MCU_CMD_WDT_MASK;
+		mt7915_reset(dev);
+		break;
+
+	/* WARNING: trigger firmware crash */
+	case SER_SET_SYSTEM_ASSERT:
+		mt76_wr(dev, MT_MCU_WM_CIRQ_EINT_MASK_CLR_ADDR, BIT(18));
+		mt76_wr(dev, MT_MCU_WM_CIRQ_EINT_SOFT_ADDR, BIT(18));
+		break;
 	default:
 		break;
 	}
@@ -95,8 +122,8 @@ mt7915_fw_ser_set(struct file *file, const char __user *user_buf,
 }
 
 static ssize_t
-mt7915_fw_ser_get(struct file *file, char __user *user_buf,
-		  size_t count, loff_t *ppos)
+mt7915_sys_recovery_get(struct file *file, char __user *user_buf,
+			size_t count, loff_t *ppos)
 {
 	struct mt7915_phy *phy = file->private_data;
 	struct mt7915_dev *dev = phy->dev;
@@ -109,6 +136,7 @@ mt7915_fw_ser_get(struct file *file, char __user *user_buf,
 	if (!buff)
 		return -ENOMEM;
 
+	/* dump firmware SER statistics */
 	desc += scnprintf(buff + desc, bufsz - desc,
 			  "::E  R , SER_STATUS        = 0x%08x\n",
 			  mt76_rr(dev, MT_SWDEF_SER_STATS));
@@ -139,15 +167,19 @@ mt7915_fw_ser_get(struct file *file, char __user *user_buf,
 	desc += scnprintf(buff + desc, bufsz - desc,
 			  "::E  R , SER_LMAC_WISR7_B1 = 0x%08x\n",
 			  mt76_rr(dev, MT_SWDEF_LAMC_WISR7_BN1_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "\nSYS_RESET_COUNT: WM %d, WA %d\n",
+			  dev->recovery.wm_reset_count,
+			  dev->recovery.wa_reset_count);
 
 	ret = simple_read_from_buffer(user_buf, count, ppos, buff, desc);
 	kfree(buff);
 	return ret;
 }
 
-static const struct file_operations mt7915_fw_ser_ops = {
-	.write = mt7915_fw_ser_set,
-	.read = mt7915_fw_ser_get,
+static const struct file_operations mt7915_sys_recovery_ops = {
+	.write = mt7915_sys_recovery_set,
+	.read = mt7915_sys_recovery_get,
 	.open = simple_open,
 	.llseek = default_llseek,
 };
@@ -1010,7 +1042,8 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	debugfs_create_file("xmit-queues", 0400, dir, phy,
 			    &mt7915_xmit_queues_fops);
 	debugfs_create_file("tx_stats", 0400, dir, phy, &mt7915_tx_stats_fops);
-	debugfs_create_file("fw_ser", 0600, dir, phy, &mt7915_fw_ser_ops);
+	debugfs_create_file("sys_recovery", 0600, dir, phy,
+			    &mt7915_sys_recovery_ops);
 	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
 	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
 	debugfs_create_file("fw_debug_bin", 0600, dir, dev, &fops_fw_debug_bin);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 8667bf7f1aab..a9200a71999e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1504,6 +1504,11 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		/* disable WA/WM WDT */
 		mt76_clear(dev, MT_WFDMA0_MCU_HOST_INT_ENA, MT_MCU_CMD_WDT_MASK);
 
+		if (READ_ONCE(dev->recovery.state) & MT_MCU_CMD_WA_WDT)
+			dev->recovery.wa_reset_count++;
+		else
+			dev->recovery.wm_reset_count++;
+
 		mt7915_mac_full_reset(dev);
 
 		/* enable mcu irq */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 87cd1bfff3e6..5a8c57a1421f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -448,6 +448,8 @@ enum {
 	SER_SET_RECOVER_L3_TX_ABORT,
 	SER_SET_RECOVER_L3_TX_DISABLE,
 	SER_SET_RECOVER_L3_BF,
+	SER_SET_RECOVER_FULL,
+	SER_SET_SYSTEM_ASSERT,
 	/* action */
 	SER_ENABLE = 2,
 	SER_RECOVER
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 49caf7b21a20..96ef06511552 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -306,6 +306,8 @@ struct mt7915_dev {
 
 	struct {
 		u32 state;
+		u32 wa_reset_count;
+		u32 wm_reset_count;
 		bool hw_full_reset:1;
 		bool hw_init_done:1;
 		bool restart:1;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 9120380d74c6..d7756cb0d29b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -711,6 +711,8 @@ enum offs_rev {
 #define MT_MCU_CMD_NORMAL_STATE		BIT(5)
 #define MT_MCU_CMD_ERROR_MASK		GENMASK(5, 1)
 
+#define MT_MCU_CMD_WA_WDT		BIT(31)
+#define MT_MCU_CMD_WM_WDT		BIT(30)
 #define MT_MCU_CMD_WDT_MASK		GENMASK(31, 30)
 
 /* TOP RGU */
@@ -1129,5 +1131,7 @@ enum offs_rev {
 #define MT_MCU_WM_CIRQ(ofs)			(MT_MCU_WM_CIRQ_BASE + (ofs))
 #define MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR	MT_MCU_WM_CIRQ(0x80)
 #define MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR		MT_MCU_WM_CIRQ(0xc0)
+#define MT_MCU_WM_CIRQ_EINT_MASK_CLR_ADDR	MT_MCU_WM_CIRQ(0x108)
+#define MT_MCU_WM_CIRQ_EINT_SOFT_ADDR		MT_MCU_WM_CIRQ(0x118)
 
 #endif
-- 
2.36.1


