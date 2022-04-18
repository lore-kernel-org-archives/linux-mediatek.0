Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95320C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RE0UHLpgETVpIcmTIb9i47s0LKJdf7Q+/YT7eBnaC48=; b=AZLXF8mgF1ctUM
	82WUsEqiqWIpwBeZGrjakIeBzaFTGZzqHzs6ftrsMPUc8KbQ0XoOv1I1H/XL3B2PjHFcWb1Ahu2k6
	KyJtXNiB2flI+0UhOBwRgjwLcsu92Tx8synq3zvspVyZlwkRI2lxPiuEOoFaVRlFVbrVHBkhckSBj
	CJ3aImwIzfrRrSGHzb7QT+vC1pauUS8aRBJoZgHZG0EZ7F/tlgo1mvdI4+gZ0qYZeUJleXi87ML5f
	wHqMgnN9Q4ivw4jXgYgze9BIHOWz/8bXSHdubgRB5G2uJle7zd3zcyYV/yOPQdBPCsg7O97AgeYxN
	9ZjsiP6Xoym6iyXk8fdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngMMd-00FvaG-3w; Mon, 18 Apr 2022 08:04:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngMMP-00FvRg-3d
 for linux-mediatek@lists.infradead.org; Mon, 18 Apr 2022 08:03:50 +0000
X-UUID: 83b4d10d01d3499691f7d0318d1aed8a-20220418
X-UUID: 83b4d10d01d3499691f7d0318d1aed8a-20220418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1360006425; Mon, 18 Apr 2022 01:03:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 01:03:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 16:03:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Apr 2022 16:03:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v3] mt76: mt7915: add debugfs knob for RF registers read/write
Date: Mon, 18 Apr 2022 16:03:30 +0800
Message-ID: <20220418080330.1249-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_010349_216907_4C9B1FB8 
X-CRM114-Status: GOOD (  10.96  )
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
The index of rf registers use the generic regidx, and are combined
with two parts: WF selection [31:28] and offset [27:0].

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: add dev_kfree_skb()
v3: - remove rf_regidx to use generic regidx
    - update commit message
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 32 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 29 +++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 62 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index dece0a6e..77bbeeed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -867,6 +867,36 @@ mt7915_twt_stats(struct seq_file *s, void *data)
 	return 0;
 }
 
+/* The index of RF registers use the generic regidx, combined with two parts:
+ * WF selection [31:28] and offset [27:0].
+ */
+static int
+mt7915_rf_regval_get(void *data, u64 *val)
+{
+	struct mt7915_dev *dev = data;
+	u32 regval;
+	int ret;
+
+	ret = mt7915_mcu_rf_regval(dev, dev->mt76.debugfs_reg, &regval, false);
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
+	return mt7915_mcu_rf_regval(dev, dev->mt76.debugfs_reg, (u32 *)&val, true);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_rf_regval, mt7915_rf_regval_get,
+			 mt7915_rf_regval_set, "0x%08llx\n");
+
 int mt7915_init_debugfs(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
@@ -898,6 +928,8 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	debugfs_create_devm_seqfile(dev->mt76.dev, "twt_stats", dir,
 				    mt7915_twt_stats);
 	debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
+	debugfs_create_file("rf_regval", 0600, dir, dev, &fops_rf_regval);
+
 	if (!dev->dbdc_support || phy->band_idx) {
 		debugfs_create_u32("dfs_hw_pattern", 0400, dir,
 				   &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ec93a924..c1ff3b40 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3677,3 +3677,32 @@ int mt7915_mcu_twt_agrt_update(struct mt7915_dev *dev,
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(TWT_AGRT_UPDATE),
 				 &req, sizeof(req), true);
 }
+
+int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set)
+{
+	struct {
+		__le32 idx;
+		__le32 ofs;
+		__le32 data;
+	} __packed req = {
+		.idx = cpu_to_le32(u32_get_bits(regidx, GENMASK(31, 28))),
+		.ofs = cpu_to_le32(u32_get_bits(regidx, GENMASK(27, 0))),
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
index ca129e5e..c695c740 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -507,6 +507,7 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_background_enable(struct mt7915_phy *phy,
 				     struct cfg80211_chan_def *chandef);
+int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set);
 int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
 int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
