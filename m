Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D259C3DA42
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1Y0KCWfIIgPouNmUpNwTith6gb3NivXxQnRCB1BWZk=; b=a4N2vYraaJju/DnzXHSRtVjJP7
	3kDYuxrbLACSS1ONoSQbA0ZujkCOxnfn9c8B2yIfjnizA7vcz3D0E0clXTVy8ofWT3JubkJBsmCKa
	0212+HJ95reNcUH3x5pgdNozztSly2k/XNDv0qUiSlmFSa1C1zuiTwsvg5WHA/O9f5dPIu/yL62aH
	/gH2Crq2QeuuH3J3LwWTI4lYLYYkUwQZrr2DXVoK0qtyTJvdDkwgsj2wxL01oSBDxBZrlYeEwvwZm
	kWUJCfzNSh+gB6YRo3MNBT6A6CHWQVk/XoJqKm5KV2nrNiPmyr2/7poULEqXPnqmEGcoh5trgD6FV
	ZAFDJirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mX-0000000HXjr-2rfn;
	Sat, 06 Jul 2024 08:28:33 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mV-0000000HXhr-0G4U
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:32 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-254925e6472so364155fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254510; x=1720859310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1Y0KCWfIIgPouNmUpNwTith6gb3NivXxQnRCB1BWZk=;
        b=CDNyaGMukrhKqpYjFpShn3qGQUHe146+9ziMjR7gk3TFfEMqhE6vzytQ8dvj2AmXkZ
         YkRERi8f7t7Ep5CCR/ghZwgLBoFCgWthZE3uNOkNS1M7fC0lRCtzt9kHBeAU6d25hcew
         halRrAh9VhUwqkdcs8ezCdlNHyQ62djl7JWEvV1p5gAj5pyG3zd2iH/8r58bTI0XXkns
         QkTLjPohI+/2OG5cCG3GWwP/Au1OtuTpGijPvvPPYpUIBJZ0oTjU4zBFfN+9Mvu9jiBx
         Va11bfBkyhrfGHcjEVg9x5L2joHXcfj6DFUJy7BAb2OeAI3iW/OR/P+N3VDU/6xHqeji
         qqAA==
X-Forwarded-Encrypted: i=1; AJvYcCWZj01HImnrzuyPKtTVsunDt+Y5hNeN2Gwh/zrVOE4doZb1D7h6SCIMCOJTdppzSQgPqpu1ZvtuU7DJ5CfNUXKVCOb9g/NetNFGNQQs+f66tRUo
X-Gm-Message-State: AOJu0Yzxgr1wNvaV828I2B5gyANEtPe75ieX29dZWdZfWd3jXTiUc2an
	2PAxva4G5CHACP1UBAIRpTbts6B+reqzGhcniS8/IYlcTmOM/OF5QgdA7BKs
X-Google-Smtp-Source: AGHT+IEQuqBNE4O9ygl1LhpCjiqP0kPykNMCGmW8fwh6NKVKSgPtHgb2U6ilu63Gjl43/x4WYAQ26A==
X-Received: by 2002:a05:6870:5590:b0:25e:1817:e4a8 with SMTP id 586e51a60fabf-25e2bf93ebcmr7013356fac.4.1720254509830;
        Sat, 06 Jul 2024 01:28:29 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:28 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 05/37] wifi: mt76: mt7925: add mt7925_set_link_key
Date: Sat,  6 Jul 2024 01:27:45 -0700
Message-Id: <e8cd7d37484be238a4eb9e500ef2b8aa46e43667.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012831_152108_51B3DF64 
X-CRM114-Status: GOOD (  15.99  )
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

add mt7925_set_link_key to set up the key according to the link id

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 70 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 25 ++++---
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +-
 3 files changed, 61 insertions(+), 37 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 59b1e920bb4a..7c7452729710 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -499,31 +499,28 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	return mt7925_abort_roc(phy, &mvif->bss_conf);
 }
 
-static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
-			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
-			  struct ieee80211_key_conf *key)
+static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+			       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+			       struct ieee80211_key_conf *key, int link_id)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
-	struct ieee80211_link_sta *link_sta = sta ? &sta->deflink : NULL;
-	struct mt76_wcid *wcid = &msta->deflink.wcid;
 	struct ieee80211_bss_conf *link_conf;
-	u8 *wcid_keyidx = &wcid->hw_key_idx;
+	struct ieee80211_link_sta *link_sta;
 	int idx = key->keyidx, err = 0;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_bss_conf *mconf;
+	struct mt76_wcid *wcid;
+	u8 *wcid_keyidx;
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
-
-	/* The hardware does not support per-STA RX GTK, fallback
-	 * to software mode for these.
-	 */
-	if ((vif->type == NL80211_IFTYPE_ADHOC ||
-	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
-	    (key->cipher == WLAN_CIPHER_SUITE_TKIP ||
-	     key->cipher == WLAN_CIPHER_SUITE_CCMP) &&
-	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
-		return -EOPNOTSUPP;
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	link_sta = sta ? mt792x_sta_to_link_sta(vif, sta, link_id) : NULL;
+	mconf = mt792x_vif_to_link(mvif, link_id);
+	mlink = mt792x_sta_to_link(msta, link_id);
+	wcid = &mlink->wcid;
+	wcid_keyidx = &wcid->hw_key_idx;
 
 	/* fall back to sw encryption for unsupported ciphers */
 	switch (key->cipher) {
@@ -547,13 +544,11 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		return -EOPNOTSUPP;
 	}
 
-	mt792x_mutex_acquire(dev);
-
-	if (cmd == SET_KEY && !mvif->bss_conf.mt76.cipher) {
+	if (cmd == SET_KEY && !mconf->mt76.cipher) {
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
-		mvif->bss_conf.mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
-		mt7925_mcu_add_bss_info(phy, mvif->bss_conf.mt76.ctx, link_conf,
+		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
+		mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
 					link_sta, true);
 	}
 
@@ -567,9 +562,9 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mt76_wcid_key_setup(&dev->mt76, wcid,
 			    cmd == SET_KEY ? key : NULL);
 
-	err = mt7925_mcu_add_key(&dev->mt76, vif, &msta->deflink.bip,
+	err = mt7925_mcu_add_key(&dev->mt76, vif, &mlink->bip,
 				 key, MCU_UNI_CMD(STA_REC_UPDATE),
-				 &msta->deflink.wcid, cmd);
+				 &mlink->wcid, cmd, msta);
 
 	if (err)
 		goto out;
@@ -578,9 +573,32 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	    key->cipher == WLAN_CIPHER_SUITE_WEP40)
 		err = mt7925_mcu_add_key(&dev->mt76, vif, &mvif->wep_sta->deflink.bip,
 					 key, MCU_WMWA_UNI_CMD(STA_REC_UPDATE),
-					 &mvif->wep_sta->deflink.wcid, cmd);
-
+					 &mvif->wep_sta->deflink.wcid, cmd, msta);
 out:
+	return err;
+}
+
+static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+			  struct ieee80211_key_conf *key)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	int err;
+
+	/* The hardware does not support per-STA RX GTK, fallback
+	 * to software mode for these.
+	 */
+	if ((vif->type == NL80211_IFTYPE_ADHOC ||
+	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
+	    (key->cipher == WLAN_CIPHER_SUITE_TKIP ||
+	     key->cipher == WLAN_CIPHER_SUITE_CCMP) &&
+	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+		return -EOPNOTSUPP;
+
+	mt792x_mutex_acquire(dev);
+
+	err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+
 	mt792x_mutex_release(dev);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index ba91c8e37dff..1db81cf4d71d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -961,13 +961,12 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 		       struct mt76_connac_sta_key_conf *sta_key_conf,
 		       struct sk_buff *skb,
 		       struct ieee80211_key_conf *key,
-		       enum set_key_cmd cmd)
+		       enum set_key_cmd cmd,
+		       struct mt792x_sta *msta)
 {
-	struct mt792x_link_sta *mlink = container_of(wcid, struct mt792x_link_sta, wcid);
-	struct mt792x_sta *msta = container_of(mlink, struct mt792x_sta, deflink);
-	struct sta_rec_sec_uni *sec;
 	struct mt792x_vif *mvif = msta->vif;
 	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, wcid->link_id);
+	struct sta_rec_sec_uni *sec;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct tlv *tlv;
@@ -990,12 +989,16 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 		sec->tx_key = 1;
 		sec->key_type = 1;
 		link_sta = mt792x_sta_to_link_sta(vif, sta, wcid->link_id);
-		memcpy(sec->peer_addr, link_sta->addr, ETH_ALEN);
+
+		if (link_sta)
+			memcpy(sec->peer_addr, link_sta->addr, ETH_ALEN);
 	} else {
 		struct ieee80211_bss_conf *link_conf;
 
 		link_conf = mt792x_vif_to_bss_conf(vif, wcid->link_id);
-		memcpy(sec->peer_addr, link_conf->bssid, ETH_ALEN);
+
+		if (link_conf)
+			memcpy(sec->peer_addr, link_conf->bssid, ETH_ALEN);
 	}
 
 	if (cmd == SET_KEY) {
@@ -1040,18 +1043,20 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 int mt7925_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 		       struct mt76_connac_sta_key_conf *sta_key_conf,
 		       struct ieee80211_key_conf *key, int mcu_cmd,
-		       struct mt76_wcid *wcid, enum set_key_cmd cmd)
+		       struct mt76_wcid *wcid, enum set_key_cmd cmd,
+		       struct mt792x_sta *msta)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, wcid->link_id);
 	struct sk_buff *skb;
 	int ret;
 
-	skb = __mt76_connac_mcu_alloc_sta_req(dev, mvif, wcid,
+	skb = __mt76_connac_mcu_alloc_sta_req(dev, &mconf->mt76, wcid,
 					      MT7925_STA_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	ret = mt7925_mcu_sta_key_tlv(wcid, sta_key_conf, skb, key, cmd);
+	ret = mt7925_mcu_sta_key_tlv(wcid, sta_key_conf, skb, key, cmd, msta);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 8ec5a3a20202..7750049c42f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -304,7 +304,8 @@ int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 int mt7925_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 		       struct mt76_connac_sta_key_conf *sta_key_conf,
 		       struct ieee80211_key_conf *key, int mcu_cmd,
-		       struct mt76_wcid *wcid, enum set_key_cmd cmd);
+		       struct mt76_wcid *wcid, enum set_key_cmd cmd,
+		       struct mt792x_sta *msta);
 int mt7925_mcu_set_rts_thresh(struct mt792x_phy *phy, u32 val);
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
-- 
2.25.1


