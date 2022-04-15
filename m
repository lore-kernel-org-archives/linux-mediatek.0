Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C526DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dy+BiPV9YSkfiaYm561lxyQnakC17/zSnrc+ZJ3TRow=; b=TdQdR2Vs14te8L
	LcudVBa/Hy44kB/LbU746oIUHTz7fGAHRp1oQsWutwHA3Z2GMCSQ2hlOxfNgTiji4/zXORK5LsFvz
	nCj+Q743GA0/SlWEmSlk/5lajm70+wvJMsMk5rAQos4MGnNn65x3SA8Qsz9c/wfhbze47u3ImJBDw
	l17N3YMqbihv1EUqa+4fhVARJp8FP6hpoJWsx3Ls7v7j2qyqjZ8cOqNjfSMKEVfvyP8uiENlFm0pi
	/NzZ6xu5w3qCg6E6sljckrcC5YKWFdV4j417KP3W31j9fXc3u6LvimfMJlNTF4psg1Q+2McMxyx1U
	GO8hCXs0JsHtjWreDfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFUO-0090WV-Oz; Fri, 15 Apr 2022 06:31:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFEQ-008v8U-WC
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 06:15:01 +0000
X-UUID: 7d2ddb2c64fc4094958816ec114c23e0-20220414
X-UUID: 7d2ddb2c64fc4094958816ec114c23e0-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 407230653; Thu, 14 Apr 2022 23:14:51 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 23:14:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Apr 2022 14:14:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 14:14:48 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: add debugfs knob for RF registers read/write
Date: Fri, 15 Apr 2022 14:14:44 +0800
Message-ID: <20220415061444.30720-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_231459_109534_7DF35199 
X-CRM114-Status: GOOD (  11.10  )
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

Add RF registers read/write support for debugging RF issues, which
should be processed by mcu commands.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: add dev_kfree_skb()
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 82 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 30 +++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
 3 files changed, 116 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index dece0a6e..275ff49e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -867,6 +867,85 @@ mt7915_twt_stats(struct seq_file *s, void *data)
 	return 0;
 }
 
+static ssize_t
+mt7915_rf_regidx_read(struct file *file, char __user *userbuf,
+		      size_t count, loff_t *ppos)
+{
+	struct mt7915_dev *dev = file->private_data;
+	int ret, len = 14;
+	char *buf;
+
+	buf = kzalloc(len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = snprintf(buf, len, "%u 0x%08x\n", dev->rf_sel, dev->rf_ofs);
+	ret = simple_read_from_buffer(userbuf, count, ppos, buf, ret);
+
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t
+mt7915_rf_regidx_write(struct file *file, const char __user *userbuf,
+		       size_t count, loff_t *ppos)
+{
+	struct mt7915_dev *dev = file->private_data;
+	char buf[13];
+
+	if (count > sizeof(buf))
+		return -EINVAL;
+
+	if (copy_from_user(buf, userbuf, count))
+		return -EFAULT;
+
+	buf[sizeof(buf) - 1] = '\0';
+
+	if (sscanf(buf, "%hhu 0x%x", &dev->rf_sel, &dev->rf_ofs) != 2) {
+		dev_warn(dev->mt76.dev,
+			 "format: <rf_sel> 0x<rf_ofs>\n");
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static const struct file_operations fops_rf_regidx = {
+	.open = simple_open,
+	.llseek = generic_file_llseek,
+	.read = mt7915_rf_regidx_read,
+	.write = mt7915_rf_regidx_write,
+	.owner = THIS_MODULE,
+};
+
+static int
+mt7915_rf_regval_get(void *data, u64 *val)
+{
+	struct mt7915_dev *dev = data;
+	u32 regval;
+	int ret;
+
+	ret = mt7915_mcu_rf_regval(dev, dev->rf_sel, dev->rf_ofs, &regval, false);
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(regval);
+
+	return 0;
+}
+
+static int
+mt7915_rf_regval_set(void *data, u64 val)
+{
+	struct mt7915_dev *dev = data;
+
+	return mt7915_mcu_rf_regval(dev, dev->rf_sel, dev->rf_ofs,
+				    (u32 *)&val, true);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_rf_regval, mt7915_rf_regval_get,
+			 mt7915_rf_regval_set, "0x%08llx\n");
+
 int mt7915_init_debugfs(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
@@ -898,6 +977,9 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	debugfs_create_devm_seqfile(dev->mt76.dev, "twt_stats", dir,
 				    mt7915_twt_stats);
 	debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
+	debugfs_create_file("rf_regidx", 0600, dir, dev, &fops_rf_regidx);
+	debugfs_create_file("rf_regval", 0600, dir, dev, &fops_rf_regval);
+
 	if (!dev->dbdc_support || phy->band_idx) {
 		debugfs_create_u32("dfs_hw_pattern", 0400, dir,
 				   &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ec93a924..183ab554 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3677,3 +3677,33 @@ int mt7915_mcu_twt_agrt_update(struct mt7915_dev *dev,
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(TWT_AGRT_UPDATE),
 				 &req, sizeof(req), true);
 }
+
+int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u8 rf_sel,
+			 u32 rf_offset, u32 *val, bool set)
+{
+	struct {
+		__le32 idx;
+		__le32 ofs;
+		__le32 data;
+	} __packed req = {
+		.idx = cpu_to_le32(dev->rf_sel),
+		.ofs = cpu_to_le32(dev->rf_ofs),
+		.data = set ? cpu_to_le32(*val) : 0,
+	};
+	struct sk_buff *skb;
+	int ret;
+
+	if (set)
+		return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RF_REG_ACCESS),
+					 &req, sizeof(req), false);
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(RF_REG_ACCESS),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(*(__le32 *)(skb->data + 8));
+	dev_kfree_skb(skb);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index ca129e5e..ccff5043 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -312,6 +312,8 @@ struct mt7915_dev {
 	u8 fw_debug_wm;
 	u8 fw_debug_wa;
 	u8 fw_debug_bin;
+	u8 rf_sel;
+	u32 rf_ofs;
 
 	struct dentry *debugfs_dir;
 	struct rchan *relay_fwlog;
@@ -507,6 +509,8 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_background_enable(struct mt7915_phy *phy,
 				     struct cfg80211_chan_def *chandef);
+int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u8 rf_sel,
+			 u32 rf_offset, u32 *val, bool set);
 int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
 int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
