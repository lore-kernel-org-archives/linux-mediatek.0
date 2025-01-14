Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB9C02180
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 02:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O7tVda83kgsvcWofCoQwXTUD8V5WuoqGzphevzyeA7k=; b=IB0VwDdKzaB4E7jpa06xNrkyjg
	NDJk/4Acdv2OG3/ZWJNqoX2UfLhROQHO8s1PFD1AHf61msO9eseAtJMCduuUoZzBJLOCC4hBtWiBr
	SFZO4+e3w8S7zU/+o8/Q2IkIpcWitEF8QH96TA4siKTYXuair3szeROFaQb4LC85ylOfiEq8bIuif
	QkkIOx6nwCA/K4Gzg1I4pfy/dRboIGKc7CRpK0gzoZv8UoWTzhwr4/qnmLzXm5dHpfgvowOilthRq
	Xq8AWSS9Lp5bNaXKe9AgOztNnS4rsbWuQYgDWaA3qxUyBcpjm7f1dNrYAk0kFD37VU0LbQrIO/ZXA
	m/P8m2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWLg-00000007D2d-2ida;
	Tue, 14 Jan 2025 02:08:08 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWKt-00000007CxI-1fQP
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 02:07:20 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f32fab5de9so1278447eaf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 18:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736820438; x=1737425238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7tVda83kgsvcWofCoQwXTUD8V5WuoqGzphevzyeA7k=;
        b=QazD0jXXibHFO7qUDo0MURAHAIH/Fy9BjF4EVl4MuriFXJaQdjwTHedlxQJvF/RRPM
         fpkandHIVH/djhstR1KAq00O0HsoVheZIqzQ161k3oZpoGgQ1UvfXbyQXUnU2au1Qo7T
         SUF1h7mjXcHOdjr8rx+npMOVLZVwqC2oQPkYNfGCGUwIesZTs5lwUrIjvHDeXwZleLk8
         qqXveNuxK1JEA+T7ZiHeg/SC9fTIwdiI8GyuoMc9E0rR2YgGRZ5bEBowAW2UPK9319CG
         VmPsdJADNa58OWKv2bmuRZF68fRE5cTUx+GYs+y2kMjzaMu+xmePvgk8q40b9r9ySooG
         d/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIKhO4MA3qbMWpFbVMcDVxyHHPccHto32VmnygAFbh1jqprlxzg5jSjIrnH3Ke3A/ZSOGHqXlQRir1B5+kEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIJYq+7/wvB7XqY3gL6xEwL+VMyZMrYA0PdM5R3lrrY0+jhxvt
	w6bxy7iJtCA03UMpT31ObwL+NzGxdUGhpd2owiV7RF94WkHm3NKI
X-Gm-Gg: ASbGncvv8SzHC15yQwvfSThBwQXOIKjPmzbC8Gia4ztQ49iQ7CP9gY6P/GV+MNEIiyf
	zDFjadZRyIX9gFhMJD+WmrHcIOuDmp0HdaxRj65eT2kp+RruXHnejttzDS8chbT96gNow53NM2s
	Lf+syWpt+ymJo2A5CEAJ1ieZQjU6qWwEiIvkB28OxeTydwTxMe95SgJUN9EEaX8E9k2CSa3/PHi
	hbDiQNvDXcnkV1TbEHHqCIHGxtcQZ64g0lT7glXt8DIl/MESgbjiWpJlNiVBXr+JUXunqo2QA==
X-Google-Smtp-Source: AGHT+IFFsoFl8vMd43GjQz6AqSSIGc3fZpTQeUhKk2BElyCxz6X5aD74tmtuhUdgRnb6+idqpMQRNw==
X-Received: by 2002:a05:6820:88b:b0:5f6:e337:9fd with SMTP id 006d021491bc7-5f7308e1a67mr14219984eaf.2.1736820437677;
        Mon, 13 Jan 2025 18:07:17 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882755172sm3915340eaf.27.2025.01.13.18.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 18:07:16 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/6] Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"
Date: Mon, 13 Jan 2025 18:07:07 -0800
Message-Id: <20250114020712.704254-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_180719_440042_0F8E1458 
X-CRM114-Status: GOOD (  13.57  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

For MLO, mac80211 will send the BA action for each link to
the driver, so the driver does not need to handle it itself.
Therefore, revert this patch.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>

---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 10 ++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 50 ++++---------------
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 -
 3 files changed, 14 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 99b4879d9a5d..2082e3904d76 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1289,22 +1289,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
 				   params->buf_size);
-		mt7925_mcu_uni_rx_ba(dev, vif, params, true);
+		mt7925_mcu_uni_rx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
-		mt7925_mcu_uni_rx_ba(dev, vif, params, false);
+		mt7925_mcu_uni_rx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7925_mcu_uni_tx_ba(dev, vif, params, true);
+		mt7925_mcu_uni_tx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
+		mt7925_mcu_uni_tx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->deflink.wcid.ampdu_state);
@@ -1313,7 +1313,7 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
+		mt7925_mcu_uni_tx_ba(dev, params, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 15815ad84713..d1506ee977a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -576,10 +576,10 @@ void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 
 static int
 mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
-		  struct mt76_wcid *wcid,
 		  struct ieee80211_ampdu_params *params,
 		  bool enable, bool tx)
 {
+	struct mt76_wcid *wcid = (struct mt76_wcid *)params->sta->drv_priv;
 	struct sta_rec_ba_uni *ba;
 	struct sk_buff *skb;
 	struct tlv *tlv;
@@ -607,60 +607,28 @@ mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
 
 /** starec & wtbl **/
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_link_sta *mlink;
-	struct mt792x_bss_conf *mconf;
-	unsigned long usable_links = ieee80211_vif_usable_links(vif);
-	struct mt76_wcid *wcid;
-	u8 link_id, ret;
-
-	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		mconf = mt792x_vif_to_link(mvif, link_id);
-		mlink = mt792x_sta_to_link(msta, link_id);
-		wcid = &mlink->wcid;
-
-		if (enable && !params->amsdu)
-			mlink->wcid.amsdu = false;
+	struct mt792x_vif *mvif = msta->vif;
 
-		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
-					enable, true);
-		if (ret < 0)
-			break;
-	}
+	if (enable && !params->amsdu)
+		msta->deflink.wcid.amsdu = false;
 
-	return ret;
+	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
+				 enable, true);
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_link_sta *mlink;
-	struct mt792x_bss_conf *mconf;
-	unsigned long usable_links = ieee80211_vif_usable_links(vif);
-	struct mt76_wcid *wcid;
-	u8 link_id, ret;
-
-	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		mconf = mt792x_vif_to_link(mvif, link_id);
-		mlink = mt792x_sta_to_link(msta, link_id);
-		wcid = &mlink->wcid;
-
-		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
-					enable, false);
-		if (ret < 0)
-			break;
-	}
+	struct mt792x_vif *mvif = msta->vif;
 
-	return ret;
+	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
+				 enable, false);
 }
 
 static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 8707b5d04743..fd5f9d4ea4a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -263,11 +263,9 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 				 struct ieee80211_vif *vif,
 				 bool enable);
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 void mt7925_scan_work(struct work_struct *work);
-- 
2.25.1


