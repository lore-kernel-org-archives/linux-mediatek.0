Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0169C27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jvwi7Fx3xoxbV9NOG7xyDKaLAxBj0fbFHV1JoEAsvCs=; b=Xc5zFmqQ/NwVaBOTNad/5QkPZI
	kwDCFdErAcOXekhDG4Sc6na3qu7BcoGMEKj3zeNKEq1RCrxTAjrTeQdfmF5rOCGj2Rk3smSJvYPY8
	aCCLzCJtmkIRl6p+t+oSWPY1w82iyvzr0caexXgyGTauQoDcvU3YiYxr3hpLnkAenHu1hlAM8Dtfa
	QwpcuVMEaU0ifVT/xobEfECiDsuRqCDjwvsq078zSyWMqh6KMIp6guShCE+WFsEXg2SVzw2kqtK6o
	YD7G3fDU1AxXtfFGFBYGIIIRoC1K/b+3zpJrsgxLmOQDzHYR47Cc2W3SDo1kANbJCohumWYhDfg2O
	LbI5Bkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaka-0000000Evya-1QoJ;
	Thu, 13 Jun 2024 03:03:44 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakU-0000000Evul-3TPc
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:42 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-254976d3327so77712fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247818; x=1718852618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvwi7Fx3xoxbV9NOG7xyDKaLAxBj0fbFHV1JoEAsvCs=;
        b=wrsGaQtG+i4nk0FXrCPBZpUqj3gYHxIVkNsVs/OyFb6z956vV3Naf7TyrwtXQxHeCk
         O9QYO4aV2DkO5Dzs5M3QEEfFPrtE0zcsTO4+NVQA+O8CjBBmxGPn/7Zj/pJrVn6qkdxS
         9rOLBXduaRqMuLraF545CWYH0K20NwtcxFIrA519L65LqwzYgreRwe0IjiQsV4Af7b8j
         TykAkdlfW5nl/ZLB9C35vObX94330HsJwSS0puUsz/ZvbFFaB/AG0gOr9WP5FIZzPAej
         S7v9wuuWhZ3lnPmouKhDR0zhj4fqyYCa3G++hKUTWf00XAI03r4LOjGCqYgJKG2JNxDG
         EeFw==
X-Forwarded-Encrypted: i=1; AJvYcCXE22dL6ry7VzwmrErl7cab7CetB6/r9vuC0fvEyzW46YPNTA8x6NEgJA6mBWWeo/k2PuyBngjE+tgUktbPuvzMecSWyP0ZNEzM8smVsOfBOGCT
X-Gm-Message-State: AOJu0YxRaMT+TLbpgbohSvTI7NGquStPs2yw61WAIzIM2ezvIHPyBPvM
	fWistZnfo8bhwTgJMB7vKp55pvfm221Qa7NPb7XQgr8dn2BFvBku
X-Google-Smtp-Source: AGHT+IGqKH/kAuaGnt4Ilmb7WN9NEAB6zcIR69b034yjIhxRh0d2jGBQAhKQh6F9jeIPASIXgtNNwg==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3996624eaf.0.1718247817902;
        Wed, 12 Jun 2024 20:03:37 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:36 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 24/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_update for per-link STA
Date: Wed, 12 Jun 2024 20:02:18 -0700
Message-Id: <20240613030241.5771-25-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200338_958650_4501F37E 
X-CRM114-Status: GOOD (  15.23  )
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

From: Sean Wang <sean.wang@mediatek.com>

Extend mt7925_mcu_sta_update with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  5 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  6 +--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 53 +++++++++++--------
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 16 ++++++
 5 files changed, 57 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index e6e8824c828e..2a858b1ca82e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1726,7 +1726,10 @@ enum mt76_sta_info_state {
 };
 
 struct mt76_sta_cmd_info {
-	struct ieee80211_sta *sta;
+	union {
+		struct ieee80211_sta *sta;
+		struct ieee80211_link_sta *link_sta;
+	};
 	struct mt76_wcid *wcid;
 
 	struct ieee80211_vif *vif;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index cd20b85109b9..f3a32fe9a754 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -740,7 +740,7 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
 					link_conf, sta, false);
 
-	ret = mt7925_mcu_sta_update(dev, sta, vif, true,
+	ret = mt7925_mcu_sta_update(dev, &sta->deflink, vif, true,
 				    MT76_STA_INFO_STATE_NONE);
 	if (ret)
 		return ret;
@@ -773,7 +773,7 @@ void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	memset(msta->deflink.airtime_ac, 0, sizeof(msta->deflink.airtime_ac));
 
-	mt7925_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
+	mt7925_mcu_sta_update(dev, &sta->deflink, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
 	mt792x_mutex_release(dev);
 }
@@ -789,7 +789,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->deflink.wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
-	mt7925_mcu_sta_update(dev, sta, vif, false, MT76_STA_INFO_STATE_NONE);
+	mt7925_mcu_sta_update(dev, &sta->deflink, vif, false, MT76_STA_INFO_STATE_NONE);
 	mt7925_mac_wtbl_update(dev, msta->deflink.wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 9d56013b2f55..9b69b4b178de 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1628,39 +1628,46 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	if (info->sta || !info->offload_fw)
-		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif, info->sta,
+	if (info->link_sta || !info->offload_fw)
+		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
+					      info->link_sta->sta,
 					      info->enable, info->newly);
-	if (info->sta && info->enable) {
-		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->sta);
-		mt7925_mcu_sta_ht_tlv(skb, info->sta);
-		mt7925_mcu_sta_vht_tlv(skb, info->sta);
-		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->sta);
-		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->sta);
-		mt7925_mcu_sta_he_tlv(skb, info->sta);
-		mt7925_mcu_sta_he_6g_tlv(skb, info->sta);
-		mt7925_mcu_sta_eht_tlv(skb, info->sta);
-		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif, info->sta);
-		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->sta,
+	if (info->link_sta && info->enable) {
+		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_ht_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_vht_tlv(skb, info->link_sta->sta);
+		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_he_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_eht_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
+					     info->link_sta->sta);
+		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta->sta,
 					    info->vif, info->rcpi,
 					    info->state);
-		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->sta);
+		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
 	}
 
-	if (info->enable)
-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->sta);
+	if (info->enable) {
+		struct ieee80211_sta *sta = info->link_sta ?
+			info->link_sta->sta : NULL;
+
+		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, sta);
+	}
 
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
 }
 
-int mt7925_mcu_sta_update(struct mt792x_dev *dev, struct ieee80211_sta *sta,
+int mt7925_mcu_sta_update(struct mt792x_dev *dev,
+			  struct ieee80211_link_sta *link_sta,
 			  struct ieee80211_vif *vif, bool enable,
 			  enum mt76_sta_info_state state)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	int rssi = -ewma_rssi_read(&mvif->bss_conf.rssi);
 	struct mt76_sta_cmd_info info = {
-		.sta = sta,
+		.link_sta = link_sta,
 		.vif = vif,
 		.enable = enable,
 		.cmd = MCU_UNI_CMD(STA_REC_UPDATE),
@@ -1669,10 +1676,14 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev, struct ieee80211_sta *sta,
 		.rcpi = to_rcpi(rssi),
 	};
 	struct mt792x_sta *msta;
+	struct mt792x_link_sta *mlink;
 
-	msta = sta ? (struct mt792x_sta *)sta->drv_priv : NULL;
-	info.wcid = msta ? &msta->deflink.wcid : &mvif->sta.deflink.wcid;
-	info.newly = msta ? state != MT76_STA_INFO_STATE_ASSOC : true;
+	if (link_sta) {
+		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	}
+	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
+	info.newly = link_sta ? state != MT76_STA_INFO_STATE_ASSOC : true;
 
 	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index ef37951f69d5..8ec5a3a20202 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -195,7 +195,8 @@ int mt7925_run_firmware(struct mt792x_dev *dev);
 int mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
 			  struct ieee80211_bss_conf *link_conf,
 			  bool enable);
-int mt7925_mcu_sta_update(struct mt792x_dev *dev, struct ieee80211_sta *sta,
+int mt7925_mcu_sta_update(struct mt792x_dev *dev,
+			  struct ieee80211_link_sta *link_sta,
 			  struct ieee80211_vif *vif, bool enable,
 			  enum mt76_sta_info_state state);
 int mt7925_mcu_set_chan_info(struct mt792x_phy *phy, u16 tag);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9452a3592950..185d56a1db11 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -94,6 +94,7 @@ struct mt792x_link_sta {
 
 struct mt792x_sta {
 	struct mt792x_link_sta deflink; /* must be first */
+	struct mt792x_link_sta __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
 
 	struct mt792x_vif *vif;
 };
@@ -236,6 +237,21 @@ mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
 		lockdep_is_held(&mvif->phy->dev->mt76.mutex));
 }
 
+static inline struct mt792x_link_sta *
+mt792x_sta_to_link(struct mt792x_sta *msta, u8 link_id)
+{
+	struct ieee80211_vif *vif;
+
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+
+	if (!ieee80211_vif_is_mld(vif) ||
+	    link_id >= IEEE80211_LINK_UNSPECIFIED)
+		return &msta->deflink;
+
+	return rcu_dereference_protected(msta->link[link_id],
+		lockdep_is_held(&msta->vif->phy->dev->mt76.mutex));
+}
+
 static inline struct mt792x_bss_conf *
 mt792x_link_conf_to_mconf(struct ieee80211_bss_conf *link_conf)
 {
-- 
2.34.1


