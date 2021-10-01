Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D336619EC
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D336619EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=znZR6u/YhN+V9Pm/YXnelZvXDuzrWK9oxeFUHch5L2w=; b=axepNNQGm2uQ7Z
	vhs/kWKKTDFRoapVHAYwdFnJpIyaUicRITDtwO5LWPOcdWnRRyofL6K87DdTd07f+8ra8m4ME25Sq
	7XhyizvF23riFngPAZRwnB4udO/E+zFw1KX5ZH1DX0tzGWg6kvIdhupNHkEMF0p3IbYPmCUNRWEzf
	k0MzW7lFXBMzeZiqlra/d0EqDVV5we7NKsU3jB8CCCxU/Ew8CrQyrhkXP0l2HJmtliSuIkKVfyA1l
	KgTt5gOi+PJYDaZU2xenOfh+2X2njxJuftvz/G5lLPiINJ1+0onq/AyVxA+B69s7oX3TxzeGJOb3T
	TDOnpJUtu/WBHVe8fi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF5g-00HIUB-RR; Fri, 01 Oct 2021 09:44:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF5b-00HIR2-Ep
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:44:25 +0000
X-UUID: 729c6c474aa3417290ce761a147dc92e-20211001
X-UUID: 729c6c474aa3417290ce761a147dc92e-20211001
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1638348790; Fri, 01 Oct 2021 02:44:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Oct 2021 02:37:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 1 Oct 2021 17:37:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 17:37:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v3 1/2] mt76: mt7915: add WA firmware log support
Date: Fri, 1 Oct 2021 17:36:35 +0800
Message-ID: <20211001093636.10501-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024423_544875_7E1C96C9 
X-CRM114-Status: GOOD (  12.33  )
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

Support to turn on/off WA firmware log from debugfs.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 42 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 12 +++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  6 +++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  5 ++-
 4 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 8c1725c00126..b9689762f529 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -82,7 +82,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_radar_trigger, NULL,
 			 mt7915_radar_trigger, "%lld\n");
 
 static int
-mt7915_fw_debug_set(void *data, u64 val)
+mt7915_fw_debug_wm_set(void *data, u64 val)
 {
 	struct mt7915_dev *dev = data;
 	enum {
@@ -93,28 +93,51 @@ mt7915_fw_debug_set(void *data, u64 val)
 		DEBUG_RPT_RX,
 	} debug;
 
-	dev->fw_debug = !!val;
+	dev->fw_debug_wm = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	mt7915_mcu_fw_log_2_host(dev, dev->fw_debug ? 2 : 0);
+	mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, dev->fw_debug_wm);
 
 	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++)
-		mt7915_mcu_fw_dbg_ctrl(dev, debug, dev->fw_debug);
+		mt7915_mcu_fw_dbg_ctrl(dev, debug, !!dev->fw_debug_wm);
 
 	return 0;
 }
 
 static int
-mt7915_fw_debug_get(void *data, u64 *val)
+mt7915_fw_debug_wm_get(void *data, u64 *val)
 {
 	struct mt7915_dev *dev = data;
 
-	*val = dev->fw_debug;
+	*val = dev->fw_debug_wm;
 
 	return 0;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug, mt7915_fw_debug_get,
-			 mt7915_fw_debug_set, "%lld\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug_wm, mt7915_fw_debug_wm_get,
+			 mt7915_fw_debug_wm_set, "%lld\n");
+
+static int
+mt7915_fw_debug_wa_set(void *data, u64 val)
+{
+	struct mt7915_dev *dev = data;
+
+	dev->fw_debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
+
+	return mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
+}
+
+static int
+mt7915_fw_debug_wa_get(void *data, u64 *val)
+{
+	struct mt7915_dev *dev = data;
+
+	*val = dev->fw_debug_wa;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug_wa, mt7915_fw_debug_wa_get,
+			 mt7915_fw_debug_wa_set, "%lld\n");
 
 static void
 mt7915_ampdu_stat_read_phy(struct mt7915_phy *phy,
@@ -455,7 +478,8 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	debugfs_create_devm_seqfile(dev->mt76.dev, "hw-queues", dir,
 				    mt7915_hw_queues_read);
 	debugfs_create_file("tx_stats", 0400, dir, dev, &mt7915_tx_stats_fops);
-	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
+	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
+	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
 	debugfs_create_file("implicit_txbf", 0600, dir, dev,
 			    &fops_implicit_txbf);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 7415b9391175..419b2acad41d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2824,7 +2824,7 @@ static int mt7915_load_firmware(struct mt7915_dev *dev)
 	return 0;
 }
 
-int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 ctrl)
+int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl)
 {
 	struct {
 		u8 ctrl_val;
@@ -2833,6 +2833,10 @@ int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 ctrl)
 		.ctrl_val = ctrl
 	};
 
+	if (type == MCU_FW_LOG_WA)
+		return mt76_mcu_send_msg(&dev->mt76, MCU_WA_EXT_CMD(FW_LOG_2_HOST),
+					 &data, sizeof(data), true);
+
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(FW_LOG_2_HOST), &data,
 				 sizeof(data), true);
 }
@@ -2889,7 +2893,11 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 		return ret;
 
 	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
-	ret = mt7915_mcu_fw_log_2_host(dev, 0);
+	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, 0);
+	if (ret)
+		return ret;
+
+	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index e02659272f9e..4a601bdee156 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -230,6 +230,12 @@ enum {
 };
 
 
+enum {
+	MCU_FW_LOG_WM,
+	MCU_FW_LOG_WA,
+	MCU_FW_LOG_TO_HOST,
+};
+
 #define __MCU_CMD_FIELD_ID	GENMASK(7, 0)
 #define __MCU_CMD_FIELD_EXT_ID	GENMASK(15, 8)
 #define __MCU_CMD_FIELD_QUERY	BIT(16)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index ff3be5ba2ce9..50c7c8c09d83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -184,8 +184,9 @@ struct mt7915_dev {
 
 	bool dbdc_support;
 	bool flash_mode;
-	bool fw_debug;
 	bool ibf;
+	u8 fw_debug_wm;
+	u8 fw_debug_wa;
 
 	void *cal;
 };
@@ -355,7 +356,7 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_cmd(struct mt7915_dev *dev, enum mt7915_rdd_cmd cmd,
 		       u8 index, u8 rx_sel, u8 val);
-int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 ctrl);
+int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
 int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
 void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb);
 void mt7915_mcu_exit(struct mt7915_dev *dev);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
