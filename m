Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788ABC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479A92067B
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yf8c2wd7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WqtX1hSz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479A92067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BeoE2OUvJH80yygxKQ8xoE68j+P9H1Fn+WZDGXfBftc=; b=Yf8c2wd7nUyHax
	oCf9BkGDApdgYzsQ9zdJPRceeP6/t6qFRFdWCB5KtD7ktAjRQgP/RDCFQplUkZ/Mk1FcB1AXqQzP5
	RxyAoeZd/xE8TiPfDRO7k5MD7ik0dIkQOEGrOwl/OldDCApqyHfHENhhXMj/bf+PiOjJp3n3Q01r8
	ztpwMA7xr6Yt95y1Q53k04eEGXUmkOufmd/q1n1lbeNH2kW0xqvCd704Ea/A3oviIv6vU6MPzA22p
	oc3mWWVvlromAHeSw3yqcw618MDVuMio9VgrWP8YwgipjX8OpBOd7/LzpvHUjOoyGLoWik5VA9a4J
	8Qii5JMTLeD9Li9+sFBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkj80-0005CW-Ke; Mon, 15 Jun 2020 07:01:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkj7x-0005C3-Du
 for linux-mediatek@lists.infradead.org; Mon, 15 Jun 2020 07:01:55 +0000
X-UUID: 70a91e0bf0cd4466befd627e579f4252-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Kcva/qL1i6LODFzK4y6MzaWYG4epWEmzgMdS77XC8E4=; 
 b=WqtX1hSzB+5GhnpHNe+hGdu6r6yzMXAJrB6sX4EUxnvo4cnPH09ht50q4cy225l/Q1nHhoRsS/67pYn1JtcdLJOqFy1SuM5QEocelbNDhwkjfsCxMnLDRyk6U7zI+Mwuzo4w1WqHQaf3Zfpv0CiI393YROdPWo52ynOnK68I954=;
X-UUID: 70a91e0bf0cd4466befd627e579f4252-20200614
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2130957891; Sun, 14 Jun 2020 23:01:50 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 00:01:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 15:01:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 15:01:46 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: cleanup codes
Date: Mon, 15 Jun 2020 15:01:37 +0800
Message-ID: <0cb7ad2a49010a540baca21cd19c43540534b141.1592204310.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_000153_481174_3331273C 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cleanup indentation, mixed licenses and change some functions' type as void.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/Kconfig    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/dma.c      |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c      | 12 ++++--------
 drivers/net/wireless/mediatek/mt76/mt7615/main.c     |  8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      |  8 ++------
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c     |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h   |  8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c | 10 +++-------
 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c  |  2 +-
 9 files changed, 24 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
index e25db1135eda..d84548d5e000 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 
 config MT7615_COMMON
 	tristate
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
index e5a965df899a..786d6530ab53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
@@ -13,7 +13,7 @@
 
 static int
 mt7615_init_tx_queue(struct mt7615_dev *dev, struct mt76_sw_queue *q,
-		      int idx, int n_desc)
+		     int idx, int n_desc)
 {
 	struct mt76_queue *hwq;
 	int err;
@@ -283,7 +283,7 @@ int mt7615_dma_init(struct mt7615_dev *dev)
 		return ret;
 
 	if (!is_mt7615(&dev->mt76))
-	    rx_ring_size /= 2;
+		rx_ring_size /= 2;
 
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN], 0,
 			       rx_ring_size, rx_buf_size, MT_RX_RING_BASE);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index f43e0a087732..958dbf84b637 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -167,7 +167,6 @@ void mt7615_mac_set_timing(struct mt7615_phy *phy)
 	else
 		mt76_clear(dev, MT_ARB_SCR,
 			   MT_ARB_SCR_TX0_DISABLE | MT_ARB_SCR_RX0_DISABLE);
-
 }
 
 static void
@@ -488,10 +487,10 @@ mt7615_mac_tx_rate_val(struct mt7615_dev *dev,
 	return rateval;
 }
 
-int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
-			  struct sk_buff *skb, struct mt76_wcid *wcid,
-			  struct ieee80211_sta *sta, int pid,
-			  struct ieee80211_key_conf *key, bool beacon)
+void mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
+			   struct sk_buff *skb, struct mt76_wcid *wcid,
+			   struct ieee80211_sta *sta, int pid,
+			   struct ieee80211_key_conf *key, bool beacon)
 {
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
@@ -642,8 +641,6 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	if (is_usb)
 		txwi[8] = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
 			  FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_write_txwi);
 
@@ -1931,7 +1928,6 @@ void mt7615_mac_reset_work(struct work_struct *work)
 	if (phy2)
 		ieee80211_queue_delayed_work(ext_phy->hw, &phy2->mac_work,
 					     MT7615_WATCHDOG_TIME);
-
 }
 
 static void mt7615_dfs_stop_radar_detector(struct mt7615_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index e6dbd7034bd7..6b4dd5d8794e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -693,16 +693,16 @@ static int
 mt7615_sta_add(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       struct ieee80211_sta *sta)
 {
-    return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NOTEXIST,
-			  IEEE80211_STA_NONE);
+	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NOTEXIST,
+			      IEEE80211_STA_NONE);
 }
 
 static int
 mt7615_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		  struct ieee80211_sta *sta)
 {
-    return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NONE,
-			  IEEE80211_STA_NOTEXIST);
+	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NONE,
+			      IEEE80211_STA_NOTEXIST);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index b76ecc24f333..f1e8e1ca9a75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -721,7 +721,7 @@ mt7615_mcu_add_tlv(struct sk_buff *skb, int tag, int len)
 	return mt7615_mcu_add_nested_tlv(skb, tag, len, skb->data, NULL);
 }
 
-static int
+static void
 mt7615_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta, bool enable)
 {
@@ -762,8 +762,6 @@ mt7615_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	bss->bmc_tx_wlan_idx = wlan_idx;
 	bss->wmm_idx = mvif->wmm_idx;
 	bss->active = enable;
-
-	return 0;
 }
 
 static void
@@ -1047,7 +1045,7 @@ mt7615_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		      IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT;
 
 		if (ht)
-		    ht->af = max(ht->af, af);
+			ht->af = max(ht->af, af);
 
 		if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_80)
 			flags |= MT_WTBL_W5_SHORT_GI_80;
@@ -3133,7 +3131,6 @@ static int mt7615_dcoc_freq_idx(u16 freq, u8 bw)
 			break;
 
 		return -1;
-
 	}
 
 	return mt7615_find_freq_idx(freq_list, ARRAY_SIZE(freq_list), freq);
@@ -3253,7 +3250,6 @@ static int mt7615_dpd_freq_idx(u16 freq, u8 bw)
 	return mt7615_find_freq_idx(freq_list, ARRAY_SIZE(freq_list), freq);
 }
 
-
 int mt7615_mcu_apply_tx_dpd(struct mt7615_phy *phy)
 {
 	struct mt7615_dev *dev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index 2e99845b9c96..39b7db871fc1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -1,3 +1,6 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 913dac5c3006..37c78ea2976d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -494,10 +494,10 @@ void mt7615_mac_cca_stats_reset(struct mt7615_phy *phy);
 void mt7615_mac_set_scs(struct mt7615_phy *phy, bool enable);
 void mt7615_mac_enable_nf(struct mt7615_dev *dev, bool ext_phy);
 void mt7615_mac_sta_poll(struct mt7615_dev *dev);
-int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
-			  struct sk_buff *skb, struct mt76_wcid *wcid,
-			  struct ieee80211_sta *sta, int pid,
-			  struct ieee80211_key_conf *key, bool beacon);
+void mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
+			   struct sk_buff *skb, struct mt76_wcid *wcid,
+			   struct ieee80211_sta *sta, int pid,
+			   struct ieee80211_key_conf *key, bool beacon);
 void mt7615_mac_set_timing(struct mt7615_phy *phy);
 int mt7615_mac_wtbl_set_key(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 			    struct ieee80211_key_conf *key,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
index 1fbc9601391d..27136ff1aac9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: ISC
 /* Copyright (C) 2019 MediaTek Inc.
  *
  * Author: Felix Fietkau <nbd@nbd.name>
@@ -13,7 +13,7 @@
 #include "mac.h"
 #include "regs.h"
 
-static int mt7663u_dma_sched_init(struct mt7615_dev *dev)
+static void mt7663u_dma_sched_init(struct mt7615_dev *dev)
 {
 	int i;
 
@@ -61,8 +61,6 @@ static int mt7663u_dma_sched_init(struct mt7615_dev *dev)
 	mt76_rmw(dev, MT_UDMA_WLCFG_0, MT_WL_RX_AGG_LMT | MT_WL_RX_AGG_TO,
 		 FIELD_PREP(MT_WL_RX_AGG_LMT, 32) |
 		 FIELD_PREP(MT_WL_RX_AGG_TO, 100));
-
-	return 0;
 }
 
 static int mt7663u_init_hardware(struct mt7615_dev *dev)
@@ -73,9 +71,7 @@ static int mt7663u_init_hardware(struct mt7615_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = mt7663u_dma_sched_init(dev);
-	if (ret)
-		return ret;
+	mt7663u_dma_sched_init(dev);
 
 	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
index cd709fd617db..36c47500eb5b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: ISC
 /* Copyright (C) 2019 MediaTek Inc.
  *
  * Author: Felix Fietkau <nbd@nbd.name>
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
