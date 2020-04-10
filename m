Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5575C2BB85
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73DF206F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qiSKnsWC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ELzc+fAn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73DF206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnoA6OBtgk5jpkdyLcP8JX2cqWsMBxe8Y3razylf8Fw=; b=qiSKnsWCcuDSAJ
	0NtZ9b1ZyIlWYqtcC9deBJeh2OBiV0oU2q42MYFjWERDnbNn4oGFzCBayrIbet99QEKhwfMAnrZm3
	ywkjaDxZwjCatLsnzq+LHAcFjDlgN9SzKKisfVrdkhzS3Mmk0hkvuJU6pnHTBo7h8oWDlQ9UfeyIR
	j/hqkA1aQkmFTzuQ6/8TWchjEs5PRM/N2nMRjjjaoxJxNufMJFlJzlFRHx69AfnNx3vMtvVLCOMcr
	mU6xZbw4SZtUDRK2vNLRzQv8ELyFDVQlF7jR5qlgUsCkyNuJG8kY6QvVxCyE1nV+n2C7JT5Ak567a
	aU9Yd0lZ/LZgNXHB6QJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMpZ1-00058Z-It; Fri, 10 Apr 2020 09:03:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMpYv-0004sI-Ec
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 09:02:58 +0000
X-UUID: d402c859f9004abfbdd92c30181d5904-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6Z84khGhQYyuo1cZg0hLV+dSmShOhAlIr+T5Pr4slCA=; 
 b=ELzc+fAnQsKdn77/1c9/sR0F3yR+bInSaPTRz62VZN5Y1NxxrGGRgZr03aelpgJRkxAU+A3wM5wF5KaFek05dx9AsCy1uiC7kp+U5voVsIl4XNYhTZW5WPIesJ9+0SGa739v4NpV7DCcxi/rDX2D/txzqm2+7sSCL8tK6PmYp7k=;
X-UUID: d402c859f9004abfbdd92c30181d5904-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 374347468; Fri, 10 Apr 2020 01:02:47 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 01:55:08 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 16:55:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 16:55:06 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 16/16] mt76: mt7915: enable firmware module debug support
Date: Fri, 10 Apr 2020 16:54:53 +0800
Message-ID: <6b3f595b5caf8ee13776e6f5a52447df384ac4ab.1586507878.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586507878.git.ryder.lee@mediatek.com>
References: <cover.1586507878.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_020257_501154_EE406D34 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This allows host driver to get useful information of some important modules.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Chih-Min Chen <chih-min.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 36 ++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 58 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  3 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +
 4 files changed, 99 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 181f42fcdeda..73071db709b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -74,6 +74,41 @@ mt7915_dbdc_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_dbdc, mt7915_dbdc_get,
 			 mt7915_dbdc_set, "%lld\n");
 
+static int
+mt7915_fw_debug_set(void *data, u64 val)
+{
+	struct mt7915_dev *dev = data;
+	enum {
+		DEBUG_TXCMD = 62,
+		DEBUG_CMD_RPT_TX,
+		DEBUG_CMD_RPT_TRIG,
+		DEBUG_SPL,
+		DEBUG_RPT_RX,
+	} debug;
+
+	dev->fw_debug = !!val;
+
+	mt7915_mcu_fw_log_2_host(dev, dev->fw_debug ? 2 : 0);
+
+	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++)
+		mt7915_mcu_fw_dbg_ctrl(dev, debug, dev->fw_debug);
+
+	return 0;
+}
+
+static int
+mt7915_fw_debug_get(void *data, u64 *val)
+{
+	struct mt7915_dev *dev = data;
+
+	*val = dev->fw_debug;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug, mt7915_fw_debug_get,
+			 mt7915_fw_debug_set, "%lld\n");
+
 static void
 mt7915_ampdu_stat_read_phy(struct mt7915_phy *phy,
 			   struct seq_file *file)
@@ -287,6 +322,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 				    mt7915_queues_acq);
 	debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
 	debugfs_create_file("dbdc", 0600, dir, dev, &fops_dbdc);
+	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
 	/* test knobs */
 	debugfs_create_file("radar_trigger", 0200, dir, dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b80cc5e2448f..2ee9e7fcd7e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -503,6 +503,28 @@ mt7915_mcu_tx_rate_report(struct mt7915_dev *dev, struct sk_buff *skb)
 	}
 }
 
+static void
+mt7915_mcu_rx_log_message(struct mt7915_dev *dev, struct sk_buff *skb)
+{
+	struct mt7915_mcu_rxd *rxd = (struct mt7915_mcu_rxd *)skb->data;
+	const char *data = (char *)&rxd[1];
+	const char *type;
+
+	switch (rxd->s2d_index) {
+	case 0:
+		type = "WM";
+		break;
+	case 2:
+		type = "WA";
+		break;
+	default:
+		type = "unknown";
+		break;
+	}
+
+	wiphy_info(mt76_hw(dev)->wiphy, "%s: %s", type, data);
+}
+
 static void
 mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 {
@@ -520,6 +542,9 @@ mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 	case MCU_EXT_EVENT_RATE_REPORT:
 		mt7915_mcu_tx_rate_report(dev, skb);
 		break;
+	case MCU_EXT_EVENT_FW_LOG_2_HOST:
+		mt7915_mcu_rx_log_message(dev, skb);
+		break;
 	default:
 		break;
 	}
@@ -545,6 +570,7 @@ void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb)
 	struct mt7915_mcu_rxd *rxd = (struct mt7915_mcu_rxd *)skb->data;
 
 	if (rxd->ext_eid == MCU_EXT_EVENT_THERMAL_PROTECT ||
+	    rxd->ext_eid == MCU_EXT_EVENT_FW_LOG_2_HOST ||
 	    rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
 	    rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
 	    rxd->ext_eid == MCU_EXT_EVENT_RATE_REPORT ||
@@ -2304,6 +2330,37 @@ static int mt7915_load_firmware(struct mt7915_dev *dev)
 	return 0;
 }
 
+int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 ctrl)
+{
+	struct {
+		u8 ctrl_val;
+		u8 pad[3];
+	} data = {
+		.ctrl_val = ctrl
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_FW_LOG_2_HOST,
+				   &data, sizeof(data), true);
+}
+
+int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level)
+{
+	struct {
+		u8 ver;
+		u8 pad;
+		u16 len;
+		u8 level;
+		u8 rsv[3];
+		u32 module_idx;
+	} data = {
+		.module_idx = cpu_to_le32(module),
+		.level = level,
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_FW_DBG_CTRL,
+				   &data, sizeof(data), false);
+}
+
 int mt7915_mcu_init(struct mt7915_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7915_mcu_ops = {
@@ -2325,6 +2382,7 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 		return ret;
 
 	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
+	mt7915_mcu_fw_log_2_host(dev, 0);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 2b2708828c1a..42767c5204da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -38,6 +38,7 @@ enum {
 /* ext event table */
 enum {
 	MCU_EXT_EVENT_PS_SYNC = 0x5,
+	MCU_EXT_EVENT_FW_LOG_2_HOST = 0x13,
 	MCU_EXT_EVENT_THERMAL_PROTECT = 0x22,
 	MCU_EXT_EVENT_ASSERT_DUMP = 0x23,
 	MCU_EXT_EVENT_RDD_REPORT = 0x3a,
@@ -192,6 +193,7 @@ enum {
 	MCU_EXT_CMD_EFUSE_ACCESS = 0x01,
 	MCU_EXT_CMD_PM_STATE_CTRL = 0x07,
 	MCU_EXT_CMD_CHANNEL_SWITCH = 0x08,
+	MCU_EXT_CMD_FW_LOG_2_HOST = 0x13,
 	MCU_EXT_CMD_EFUSE_BUFFER_MODE = 0x21,
 	MCU_EXT_CMD_STA_REC_UPDATE = 0x25,
 	MCU_EXT_CMD_BSS_INFO_UPDATE = 0x26,
@@ -207,6 +209,7 @@ enum {
 	MCU_EXT_CMD_SET_SER_TRIGGER = 0x81,
 	MCU_EXT_CMD_SCS_CTRL = 0x82,
 	MCU_EXT_CMD_RATE_CTRL = 0x87,
+	MCU_EXT_CMD_FW_DBG_CTRL = 0x95,
 	MCU_EXT_CMD_SET_RDD_TH = 0x9d,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index c9015fa25156..fbca203d1706 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -323,6 +323,8 @@ int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
 int mt7915_mcu_rdd_cmd(struct mt7915_dev *dev, enum mt7915_rdd_cmd cmd,
 		       u8 index, u8 rx_sel, u8 val);
+int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 ctrl);
+int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
 void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb);
 void mt7915_mcu_exit(struct mt7915_dev *dev);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
