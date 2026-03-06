Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4923FCB638
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOD3zRJqOCMqqpCjIadZc4fQHL5fDXCfN6bs+v14d2E=; b=WyMn7cdd6vIKOaSNyMThRRoosr
	N4SzcVSgoQ7jd0lJ2L1o6mII+Whrt8eHAxVgafQELNqcbBY0iCIBqKte2CrpMcjxRcPF7loqFDrKV
	B9DiedeblpYiF6NUArqDisDdVk3hi+NO7M/xRaJ//DW+KJRwvbPVRytrGpGTTnXQSBAQaS4KVIb6K
	MZpV6Nda9tinJOTqb3itU4INrEef9440ne3zO7XCv/ZdokmcDI299lSF+tH1dGsXsGfXyJ6hO8joU
	eXGEZuHnMvNt+XPwNGEwQOozSGZ3ZnRaq3GpiS1Ryki5l+8ow2PO2sdUxcIoqot2x94lWaSMd08Pz
	0Go/1Msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVw-00000004dUP-2EPu;
	Fri, 06 Mar 2026 23:23:25 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVu-00000004dSU-0lKX
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:23 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45f053b7b90so6409795b6e.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839401; x=1773444201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eOD3zRJqOCMqqpCjIadZc4fQHL5fDXCfN6bs+v14d2E=;
        b=Jl67xGAO2NWUVHalRRg5mlJhY0T5KJc/nzISFnAkXswhkxpGEfiQ1n9joKw6U5782b
         VrTBjjdYzLJKUyaUQUwGl2pHccVc3RBmqsYqphduXgHvHA9nB4/0aoju6qLWDWJSC/z9
         nVMmXz9UYeaRRpes1NMOIEnX/2+I8T8y4xoY9Upe3TPdnWYJfrjuNlhTyecTYBMvRmTV
         GIBEe3IQkB3zaLlw9F6SFpLDeI+QoASamNextvo6V6P1iBW/TGpm7MgKg8qPo6MPf/kf
         /ks5aGrE6hCdGeD+zwhoqb+Zi4vZhz/Fq3Jtxt7Ozh0ZQUrVrEBNOfvyHI/9sE8gY81B
         IW8w==
X-Forwarded-Encrypted: i=1; AJvYcCVGEeyE+sky8yuV+RbtJZ1LgOH1r/rwEaB3l4q8uGqOzmUthhiYcG0bNRojq53y8XPo4fhctXfRqzCZ6vhOpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQPMzlxduYdO+6b30DFPTMA7mwdBbXwz9mfaXIn2FEGmIq6g4H
	Xb4DcnqGJBLF/ojfJ/RfZ74WEt29XczJZT0+adegxvnPAxNqUXiIyh2Fz402wg==
X-Gm-Gg: ATEYQzwtg/94SsJCfTdHbuOTZh6Blgm+Jjn1jh6i/LVRIO/5FrWpyRUwci8XHN2R3zn
	IX0MGfUAHFUqH9S9It5YwUe4LwDK+smUMQcT8bmZx11OzdOxFs4aT4pnnx1Wsd8c+GECM7hrhzd
	QQbvUpkNx+pdDXe++qvH7SKJ4onML8DyOM7jt2bw2fR1zhKk/Gq4ITN+FD9sV1y2QstBUC/xwjH
	kg/2JVXzHg0Ge190Z/sAoPbSH5Od43BjcUL3ljrSGB6FkDngDHYD5sOfcnGZbtuUUlQiQoYpLSz
	QElhbUrinvHrAImvVf+0z9yIVsMqYos55dW37PWQNKrj0HrnLIo4L1Yq4aqn7uCGjD6ZzCNd8G9
	CHmfgO0jUv9QCP/seHhg+4QeDewXRsQcJymaceB83ddtnjrkNxaz3BVkZiwwyqtFn8QDXJGtNET
	AYZrLzXBtsMeL6vVqeAX56f3BGHRD6fh/w5qMRyt5sXy9gAU8=
X-Received: by 2002:a05:6808:6713:b0:462:dbf2:514f with SMTP id 5614622812f47-466dca56ff3mr2400468b6e.23.1772839401106;
        Fri, 06 Mar 2026 15:23:21 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:20 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 04/19] wifi: mt76: mt7925: pass mlink to mcu_sta_update()
Date: Fri,  6 Mar 2026 17:22:23 -0600
Message-ID: <20260306232238.2039675-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152322_232683_72141905 
X-CRM114-Status: GOOD (  12.92  )
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

Drop the mt792x_sta_to_link() lookup in mt7925_mcu_sta_update() and
pass the resolved mlink from the caller instead. The link context is
already known at the call site, making the lookup redundant.

This keeps the helper lookup-free and makes WCID selection explicit.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  3 ++-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 27 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 12 +++------
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  4 ++-
 4 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 82eedd80f694..139c2a7871fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1285,7 +1285,8 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 	if (vif->type == NL80211_IFTYPE_AP) {
 		mt76_connac_mcu_uni_add_bss(dev->phy.mt76, vif, &mvif->sta.deflink.wcid,
 					    true, NULL);
-		mt7925_mcu_sta_update(dev, NULL, vif, true,
+		mt7925_mcu_sta_update(dev, NULL, vif,
+				      &mvif->sta.deflink, true,
 				      MT76_STA_INFO_STATE_NONE);
 		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif, true);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 353461f0e169..c65e32a14c01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -919,23 +919,31 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	if (ieee80211_vif_is_mld(vif) &&
 	    link_sta == mlink->pri_link) {
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
+		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
+					    mlink, true,
 					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
 			return ret;
 	} else if (ieee80211_vif_is_mld(vif) &&
 		   link_sta != mlink->pri_link) {
+		struct mt792x_link_sta *pri_mlink;
+
+		pri_mlink = mt792x_sta_to_link(msta, mlink->pri_link->link_id);
+
 		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
-					    true, MT76_STA_INFO_STATE_ASSOC);
+					    pri_mlink, true,
+					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
 			return ret;
 
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
+		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
+					    mlink, true,
 					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
 			return ret;
 	} else {
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
+		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
+					    mlink, true,
 					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
 			return ret;
@@ -1075,7 +1083,8 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	memset(mlink->airtime_ac, 0, sizeof(mlink->airtime_ac));
 
-	mt7925_mcu_sta_update(dev, link_sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
+	mt7925_mcu_sta_update(dev, link_sta, vif, mlink, true,
+			      MT76_STA_INFO_STATE_ASSOC);
 
 	mt792x_mutex_release(dev);
 }
@@ -1119,7 +1128,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
-	mt7925_mcu_sta_update(dev, link_sta, vif, false,
+	mt7925_mcu_sta_update(dev, link_sta, vif, mlink, false,
 			      MT76_STA_INFO_STATE_NONE);
 	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -1744,7 +1753,8 @@ mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (err)
 		goto out;
 
-	err = mt7925_mcu_sta_update(dev, NULL, vif, true,
+	err = mt7925_mcu_sta_update(dev, NULL, vif,
+				    &mvif->sta.deflink, true,
 				    MT76_STA_INFO_STATE_NONE);
 out:
 	mt792x_mutex_release(dev);
@@ -1887,7 +1897,8 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 	mt792x_mutex_acquire(dev);
 
 	if (changed & BSS_CHANGED_ASSOC) {
-		mt7925_mcu_sta_update(dev, NULL, vif, true,
+		mt7925_mcu_sta_update(dev, NULL, vif,
+				      &mvif->sta.deflink, true,
 				      MT76_STA_INFO_STATE_ASSOC);
 		mt7925_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7582a8c48607..fa4915b65fcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2036,7 +2036,9 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 
 int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 			  struct ieee80211_link_sta *link_sta,
-			  struct ieee80211_vif *vif, bool enable,
+			  struct ieee80211_vif *vif,
+			  struct mt792x_link_sta *mlink,
+			  bool enable,
 			  enum mt76_sta_info_state state)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
@@ -2051,14 +2053,8 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		.offload_fw = true,
 		.rcpi = to_rcpi(rssi),
 	};
-	struct mt792x_sta *msta;
-	struct mt792x_link_sta *mlink;
 
-	if (link_sta) {
-		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
-	}
-	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
+	info.wcid = &mlink->wcid;
 	info.newly = state != MT76_STA_INFO_STATE_ASSOC;
 
 	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 0f0eff748bb7..95f29dae4d9d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -250,7 +250,9 @@ int mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
 			  bool enable);
 int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 			  struct ieee80211_link_sta *link_sta,
-			  struct ieee80211_vif *vif, bool enable,
+			  struct ieee80211_vif *vif,
+			  struct mt792x_link_sta *mlink,
+			  bool enable,
 			  enum mt76_sta_info_state state);
 int mt7925_mcu_set_chan_info(struct mt792x_phy *phy, u16 tag);
 int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_bss_conf *bss_conf);
-- 
2.43.0


