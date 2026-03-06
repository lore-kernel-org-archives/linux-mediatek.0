Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94707FCB638
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eTGWet6XyoMFJ4Chh4Z8OqxtwPFIFWbrK9UEPtAnUo=; b=1pvPYMvcELWGWdJn/cJc4W2wqE
	r7ZWRAA3lreGUQ4BkFoarqL9/V5fwetlaEtirIogm3vMxABABRNK9xcMACDojhPd603VJnjWSYBSH
	Kw4QD4bd91Ac6F8spOZ4u+YqugFggMXuHeajGIrrM0JKJE6X90dCcXHbjD1/++s66CandqLouX7CB
	aENc0QOPnuRMljMbmXcAyzWJ9IYBEvs/1s2UHrsgdj9zC85TLKzMdKPgUJ8/h+UqlgBhKsEqnbTtx
	7NWvDEhLbNV4ZMKI1FsC8rnciXAeCYc8v4cBKrQ63MYTdBM30FR/T+BOD7LGVK95FBZwcdVK1TmJS
	zHe/IPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVs-00000004dRe-2g7z;
	Fri, 06 Mar 2026 23:23:20 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVq-00000004dQo-0aWE
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:19 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-463a0e14b4cso4057519b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839397; x=1773444197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+eTGWet6XyoMFJ4Chh4Z8OqxtwPFIFWbrK9UEPtAnUo=;
        b=hhTpefg+n6eOt8k7XZo10LRb+F3JSHk98T1UsX52C/esq1OG66MqPU4Y7ixgPwDzcD
         JsP0Hsako84kj1wOI7LZLs38yVfxYWSWusUX2ufaPPp5NOCvWFO9gw6Uwlo9ZzXfu1Ku
         6P8At2BjmDk104WFVO8GCvJAFf/lWl7p5Egs0FVli3RZNcsamw7qeF+EuTJcw+Kn4tad
         YaECldNUdGcLxDW7Orq0qNMQGnm09yGSkeuMbEK1GnE9C36EbthNWvpza5iOedDcTnVZ
         T/7t9IeM5RiXhJE+LQZmRORMSVoL8rPXTtjGI8V1I6BSgNgsyTfP1AbZzaXcpOKDPmE+
         /YUA==
X-Forwarded-Encrypted: i=1; AJvYcCVlkXBe6WjTuJxprbn2ihTOgc2zwGH2nLbGq0fFTbXQnS0TR2839MbWywyfhqIUETpcmxMJCxqrTNvyhRWmQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89GfULnMimqaZBSGbdDdMupORjDB2wewnDTFL7bSQ6JL9YM7G
	RVShFfzfaYP3g++1d4MHkmPFBas5gIBOwgDToVODyYOo9NXUsSYAjFHw
X-Gm-Gg: ATEYQzyIKp6kAK+tx3DiCEZq4xnd5lX9Z2IXNRJrlNq3kKmxj7HDdi+oZT5xg8ns2na
	YFs7tqGMgvXKw4nxCjUZonaOhNwWMryc2MvxsgoIEDiOAs5PKEmZ8opoBfQJPuaf5LGhwZANH1B
	B3acLG5lURooR4OFxXM1ZPBsh21RXPbuZRL1EXAwUIgZOblR82gsDBgpm/TdV7sLfneizInMXXx
	M90UpAIexpmWcTWuIptz3PJmtMRISxmW0VRy+k5tWAZTD89XFyjtOvcDHytf2x/DTOTuDF55En3
	iB77oS1hMqA+cACAFQAS9mZvPug43gC+VixLki9jLT6nkSuvLoaIpXTExu47zHgIwrNC2pWg5sw
	JUT7Pw5bEvhkvyPF+d0tzM9CHLPqMuKiptRsHO22lrMlRIic2HWW7Vd2mYXbRoxlFCZRjBVWYo0
	doiGgYTyw/7HM2mXJw0QTFOhF72n3hLlfHF3g+j6IsbjL/mZQ=
X-Received: by 2002:a05:6808:344b:b0:463:4f2e:c50b with SMTP id 5614622812f47-466dcb193demr1996398b6e.41.1772839396937;
        Fri, 06 Mar 2026 15:23:16 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:16 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 02/19] wifi: mt76: mt7925: pass WCID indices to bss_basic_tlv()
Date: Fri,  6 Mar 2026 17:22:21 -0600
Message-ID: <20260306232238.2039675-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152318_212172_7FC0F33D 
X-CRM114-Status: GOOD (  13.71  )
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

Drop the mt792x_sta_to_link() lookup in mt7925_mcu_bss_basic_tlv() and
pass the resolved WCID indices from the caller instead. The link
context is already known, so the lookup is redundant.

This makes link ownership explicit and keeps the helper lookup-free.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 34 +++++++---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 68 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  7 ++
 3 files changed, 73 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index afcc0fa4aa35..353461f0e169 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -850,20 +850,22 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
-				   struct ieee80211_link_sta *link_sta)
+				   struct ieee80211_link_sta *link_sta,
+				   struct mt792x_link_sta *mlink)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
 	struct mt792x_bss_conf *mconf;
 	u8 link_id = link_sta->link_id;
-	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 	struct mt76_wcid *wcid;
 	int ret, idx;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	mlink = mt792x_sta_to_link(msta, link_id);
+
+	if (WARN_ON_ONCE(!mlink))
+		return -EINVAL;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
@@ -898,12 +900,21 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
-		if (ieee80211_vif_is_mld(vif))
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, link_sta != mlink->pri_link);
-		else
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, false);
+		struct mt792x_link_sta *mlink_bc;
+
+		mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
+
+		if (ieee80211_vif_is_mld(vif)) {
+			mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
+						    link_conf, link_sta,
+						    mlink_bc->wcid.idx, mlink->wcid.idx,
+						    link_sta != mlink->pri_link);
+		} else {
+			mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
+						    link_conf, link_sta,
+						    mlink_bc->wcid.idx, mlink->wcid.idx,
+						    false);
+		}
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
@@ -965,7 +976,7 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		mlink->wcid.def_wcid = &msta->deflink.wcid;
 
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
-		mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta);
+		mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta, mlink);
 	}
 
 	return err;
@@ -989,7 +1000,8 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 		err = mt7925_mac_sta_add_links(dev, vif, sta, sta->valid_links);
 	} else {
-		err = mt7925_mac_link_sta_add(mdev, vif, &sta->deflink);
+		err = mt7925_mac_link_sta_add(mdev, vif, &sta->deflink,
+					      &msta->deflink);
 	}
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa5f79004a6e..0d5519e5dc4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2476,7 +2476,9 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 			 struct ieee80211_bss_conf *link_conf,
 			 struct ieee80211_link_sta *link_sta,
 			 struct ieee80211_chanctx_conf *ctx,
-			 struct mt76_phy *phy, u16 wlan_idx,
+			 struct mt76_phy *phy,
+			 u16 bmc_tx_wlan_idx,
+			 u16 sta_wlan_idx,
 			 bool enable)
 {
 	struct ieee80211_vif *vif = link_conf->vif;
@@ -2485,7 +2487,6 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 						  &link_conf->chanreq.oper;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_connac_bss_basic_tlv *basic_req;
-	struct mt792x_link_sta *mlink;
 	struct tlv *tlv;
 	int conn_type;
 	u8 idx;
@@ -2509,20 +2510,9 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band, link_sta);
 	basic_req->bcn_interval = cpu_to_le16(link_conf->beacon_int);
 	basic_req->dtim_period = link_conf->dtim_period;
-	basic_req->bmc_tx_wlan_idx = cpu_to_le16(wlan_idx);
+	basic_req->bmc_tx_wlan_idx = cpu_to_le16(bmc_tx_wlan_idx);
 	basic_req->link_idx = mconf->mt76.idx;
-
-	if (link_sta) {
-		struct mt792x_sta *msta;
-
-		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
-
-	} else {
-		mlink = &mconf->vif->sta.deflink;
-	}
-
-	basic_req->sta_idx = cpu_to_le16(mlink->wcid.idx);
+	basic_req->sta_idx = cpu_to_le16(sta_wlan_idx);
 	basic_req->omac_idx = mconf->mt76.omac_idx;
 	basic_req->band_idx = mconf->mt76.band_idx;
 	basic_req->wmm_idx = mconf->mt76.wmm_idx;
@@ -2829,16 +2819,16 @@ void mt7925_mcu_del_dev(struct mt76_dev *mdev,
 			  &dev_req, sizeof(dev_req), true);
 }
 
-int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
-			    struct ieee80211_chanctx_conf *ctx,
-			    struct ieee80211_bss_conf *link_conf,
-			    struct ieee80211_link_sta *link_sta,
-			    int enable)
+int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
+				struct ieee80211_chanctx_conf *ctx,
+				struct ieee80211_bss_conf *link_conf,
+				struct ieee80211_link_sta *link_sta,
+				u16 bmc_tx_wlan_idx,
+				u16 sta_wlan_idx,
+				int enable)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_dev *dev = phy->dev;
-	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
@@ -2846,11 +2836,9 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
-
 	/* bss_basic must be first */
 	mt7925_mcu_bss_basic_tlv(skb, link_conf, link_sta, ctx, phy->mt76,
-				 mlink_bc->wcid.idx, enable);
+				 bmc_tx_wlan_idx, sta_wlan_idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
@@ -2871,6 +2859,36 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
+int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
+			    struct ieee80211_chanctx_conf *ctx,
+			    struct ieee80211_bss_conf *link_conf,
+			    struct ieee80211_link_sta *link_sta,
+			    int enable)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct mt792x_link_sta *mlink_bc;
+	struct mt792x_link_sta *mlink;
+	u16 sta_wlan_idx;
+
+	sta_wlan_idx = mvif->sta.deflink.wcid.idx;
+
+	mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
+
+	if (link_sta) {
+		struct mt792x_sta *msta = (void *)link_sta->sta->drv_priv;
+
+		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+		if (WARN_ON(!mlink))
+			return -1;
+	} else {
+		mlink = &mconf->vif->sta.deflink;
+	}
+
+	return mt7925_mcu_add_bss_info_sta(phy, ctx, link_conf, link_sta,
+					   mlink_bc->wcid.idx, mlink->wcid.idx, enable);
+}
+
 int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 {
 	struct mt76_dev *mdev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index e09e0600534a..56e2772f3ffe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -693,6 +693,13 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_bss_conf *link_conf,
 			    struct ieee80211_link_sta *link_sta,
 			    int enable);
+int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
+				struct ieee80211_chanctx_conf *ctx,
+				struct ieee80211_bss_conf *link_conf,
+				struct ieee80211_link_sta *link_sta,
+				u16 bmc_tx_wlan_idx,
+				u16 sta_wlan_idx,
+				int enable);
 int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 			  struct ieee80211_bss_conf *link_conf);
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable);
-- 
2.43.0


