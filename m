Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C86C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9GNs6B5bu7pTah9Ud2+nU3M0TzPxJfZY98bb6SSuDs=; b=Yd3Pg7JFx9pRRYYZJnSCuN5UrU
	A9JoCUsxa4QvPGm1VT5vpoVIvcpDsl2YHG6yVHTRz0ncRPRUzQmiYuCyirNZiDZ2Kf8Q2Rsx6PoGG
	LxkkIVAcFKBgufyqayYZEMfAEE76D+rv3f25t1SxgnkZBMentqNlbBQfjEOeNF3Mpw+vjMzMyG9eE
	xVqeHpMF9SymF89wqoBfjGhFIQvvKm2r3eFSE6nvCxXSEY3Oxw93bvpLTHAJvolcTJ2L/Pt1VJpTa
	fgOrSLPjQjDH1CFDnvkjRul6mzP3mhEBJrAwRpHshOBQgrvtE9oFUQrOlCogamhsr5ltjbccnaCl0
	bnjNWGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHalC-0000000EwPr-25YG;
	Thu, 13 Jun 2024 03:04:22 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal7-0000000EwKu-0vPs
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:19 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5bad97708efso31455eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247856; x=1718852656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9GNs6B5bu7pTah9Ud2+nU3M0TzPxJfZY98bb6SSuDs=;
        b=JgGXdJOB4RpSKgS8tXMKZI0ZG+JuAYXWvDFBYXf9eqt3lqN0r/K7ys9LQuvnOYDcqi
         VH71EOTZxfEMapuyleAw4KI4R+TqIv3arn/SlYYTqvIiJ3YkCU+y8iBS7LhVv8V3uhX3
         lNXu9Pj7h1PIcWi+tm/m2tPPCXhWIg0M/LnYAg6dFRF9REm/Cf61FwpElgipqGT4irCN
         OJYjWh4x8oM8kBvnSJScXPLI26v9mU8+4bryUrljCKrCA8SEeSOpehFyOUiiGm4wcVxE
         SnsGVj5SQF+oQqtY5UEYnEG0/vP/FAtSWxLkn9gtgGpKbbvc6kj8NOwpkJ99t50GHjUV
         hJDA==
X-Forwarded-Encrypted: i=1; AJvYcCWpEBPrsMLC6fvzukL4kYQBO4mWj2rT+6c2j9mwE6ABD0YhqtpWgEPmDe//BgcbS67buBpBvzuI1lKn+GEO/12FQa7HaHkQqxxvanUo/Oz5eNoZ
X-Gm-Message-State: AOJu0YyV13fWG13gJpHnhwddj0LRwUQJqoyFFIuldPDoJN+/aNL4Naup
	7mIVFtnMNhkViVg8iSYUL7Z36KLyl+gin0U/q90job23HhLDky8F
X-Google-Smtp-Source: AGHT+IFREIYX1Sd34i8E7irY+54INGBR1bLti4tXtswuJFCTubZVEPCyBjycPUyUsBH+7NegEAREQw==
X-Received: by 2002:a4a:3101:0:b0:5ba:ca8a:6598 with SMTP id 006d021491bc7-5bb3b7b972bmr3908721eaf.0.1718247856207;
        Wed, 12 Jun 2024 20:04:16 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:15 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 44/47] wifi: mt76: mt7925: add mt7925_mac_link_sta_remove to remove per-link STA
Date: Wed, 12 Jun 2024 20:02:38 -0700
Message-Id: <20240613030241.5771-45-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200417_361248_BC362C68 
X-CRM114-Status: GOOD (  12.18  )
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

The mt7925_mac_link_sta_remove function currently removes the per-link STA.
We will extend this function when we implement the MLO functionality.

This patch only includes structural changes and does not involve any
logic changes.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 46 +++++++++++++------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b159d26303ca..ce5379c4d55d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -805,39 +805,55 @@ void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_assoc);
 
-void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-			   struct ieee80211_sta *sta)
+static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_sta *msta;
 
-	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->deflink.wcid);
+	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+
+	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
-	mt7925_mcu_sta_update(dev, &sta->deflink, vif, false, MT76_STA_INFO_STATE_NONE);
-	mt7925_mac_wtbl_update(dev, msta->deflink.wcid.idx,
+	mt7925_mcu_sta_update(dev, link_sta, vif, false,
+			      MT76_STA_INFO_STATE_NONE);
+	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
 
-	if (vif->type == NL80211_IFTYPE_STATION) {
+	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-
-		mvif->wep_sta = NULL;
-		ewma_rssi_init(&mvif->bss_conf.rssi);
-		if (!sta->tdls)
-			mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
-						link_conf, &sta->deflink, false);
+		mt7925_mcu_add_bss_info(&dev->phy,
+					mvif->bss_conf.mt76.ctx, link_conf,
+					link_sta, false);
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
-	if (!list_empty(&msta->deflink.wcid.poll_list))
-		list_del_init(&msta->deflink.wcid.poll_list);
+	if (!list_empty(&mlink->wcid.poll_list))
+		list_del_init(&mlink->wcid.poll_list);
 	spin_unlock_bh(&mdev->sta_poll_lock);
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
+
+void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta)
+{
+	mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink);
+
+	if (vif->type == NL80211_IFTYPE_STATION) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+		mvif->wep_sta = NULL;
+		ewma_rssi_init(&mvif->bss_conf.rssi);
+	}
+}
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_remove);
 
 static int mt7925_set_rts_threshold(struct ieee80211_hw *hw, u32 val)
-- 
2.34.1


