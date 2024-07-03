Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA74C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDtWWoGxNXsA+VUrVMlH9NUVtfOdfQhzGFLU7KDEjg4=; b=sfZDbF8Kpqu+NqHlDv3Ak89WhU
	9R/zeI/4tFqVIw8dA44mW9mdPPyrVSED6t+OEtWJEGtnLfSN9L1tM1/9VCzbDoZNEk8bMCIl8K/Mc
	N6KdGAC4qWTDPIKgunYdpC9fo3+HN1xMCLz3S/bu2AQEQJB16GJHjOF56AAuuMsa7F9K9hT56qrHd
	iHSzjbDdZZ5lc4yA6NpVTBo3hsURqzf3/D8bjkk7QNAKgG0g8l+jQWfesIJc+WkM6zZxFl4Qij+PB
	JGX6IZfhC5CmfyvTNPIRjl7clfy/07OCtvAlbdUlTLIt7IjarwY+NNeWw/S466qhwZbEZAu9r5IBe
	kWoeSLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lB-0000000BXHM-2S09;
	Wed, 03 Jul 2024 21:43:29 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l8-0000000BXEo-01WQ
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:27 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25cd49906aeso3975fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043005; x=1720647805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDtWWoGxNXsA+VUrVMlH9NUVtfOdfQhzGFLU7KDEjg4=;
        b=IHLLzbstoUUqnH4OhnF3yXZhruQ125Xqy78qIgnlPLQJCIpLtNo+SZY5SlLwN1CNy/
         3HJjQ+/Dd0rrE+GnpOReXW2qgek7rheHoX53B0U+TYBmVgjw+1heK2GYrja7jsiGwcsl
         fzRPnEQOWRvEq821jUtCysRsW9tVYMpxTORoORrZkubPZ9MMCd05mo7Gv206HySTPtsV
         JZjn53AXjBTs4KGmnqG1e0julFC9RwZ6qqLH3+nViGiPiehk3KzhsA39ZGrvx6Iju0oq
         eQomWYWC/hP9mVRwtWzirNn9M7NlC1AhQUr+MIARX8bGDhCphEjIkrWxtwGoiq8gUjcf
         t95A==
X-Forwarded-Encrypted: i=1; AJvYcCUKDU7U/06+k+9XNtzs2HXvX/xzQKqgaBWSufIZfjFKn3bIflFjOLwrV40fJ+zPBnmeXpPlr4h7FXD+5HVc6sFhLwEO0nathC4gR1S4TlEWz/ZS
X-Gm-Message-State: AOJu0Yy4VBDon+BaitlBhJDh2wKEyzKREj2gbnrAYFJq89axosYPQD0m
	dYf3oCxA13wNqb9Tjqtk29S+b9M2brHpHdYNp+IVtJ1v7mArXL5v
X-Google-Smtp-Source: AGHT+IHHL00osxe9L6uV/ZIfVF6TzeBtZZdxa46wI52tc5jjTe51dQO8lcXzLe69OaHVmiNHiz2Wcw==
X-Received: by 2002:a05:6870:55d4:b0:25e:dce:491b with SMTP id 586e51a60fabf-25e0dce4b4amr2524322fac.1.1720043005063;
        Wed, 03 Jul 2024 14:43:25 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:23 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 17/29] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_assoc
Date: Wed,  3 Jul 2024 14:42:22 -0700
Message-Id: <b8ba083687b58cc5eae839376f4a0e3cde7a0383.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144326_121228_89E9FC7F 
X-CRM114-Status: GOOD (  16.18  )
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

add links handling in mt7925_mac_sta_assoc

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 90 ++++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 46ce23c7ec27..3a9d526f8085 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -387,6 +387,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->phy = phy;
 	mvif->bss_conf.vif = mvif;
 	mvif->sta.vif = mvif;
+	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 
 	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
 	if (ret < 0)
@@ -925,6 +926,75 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
+static u16
+mt7925_mac_select_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
+{
+	unsigned long usable_links = ieee80211_vif_usable_links(vif);
+	struct  {
+		enum nl80211_band band;
+	} data[IEEE80211_MLD_MAX_NUM_LINKS];
+	u16 sel_links = 0;
+	u8  link_id;
+	int i = -1;
+
+	if (vif->active_links == usable_links)
+		return vif->active_links;
+
+	rcu_read_lock();
+	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_bss_conf *link_conf =
+			rcu_dereference(vif->link_conf[link_id]);
+
+		if (!link_conf)
+			continue;
+
+		if (!(BIT(link_id) & vif->active_links))
+			continue;
+
+		if (i == -1 || data[i].band != link_conf->chanreq.oper.chan->band) {
+			i = i + 1;
+			data[i].band = link_conf->chanreq.oper.chan->band;
+			sel_links |= link_id;
+		}
+	}
+	rcu_read_unlock();
+
+	return sel_links;
+}
+
+static void
+mt7925_mac_set_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
+{
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct ieee80211_bss_conf *link_conf =
+		mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
+	struct cfg80211_chan_def *chandef = &link_conf->chanreq.oper;
+	enum nl80211_band band = chandef->chan->band, secondary_band;
+
+	u16 sel_links = mt7925_mac_select_links(mdev, vif);
+	u8 secondary_link_id = __ffs(~BIT(mvif->deflink_id) & sel_links);
+
+	if (!ieee80211_vif_is_mld(vif) || hweight16(sel_links) < 2)
+		return;
+
+	link_conf = mt792x_vif_to_bss_conf(vif, secondary_link_id);
+	secondary_band = link_conf->chanreq.oper.chan->band;
+
+	if (band == NL80211_BAND_2GHZ ||
+	    (band == NL80211_BAND_5GHZ && secondary_band == NL80211_BAND_6GHZ)) {
+		mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
+
+		mt792x_mutex_acquire(dev);
+
+		mt7925_set_mlo_roc(mvif->phy, &mvif->bss_conf, sel_links);
+
+		mt792x_mutex_release(dev);
+	}
+
+	ieee80211_set_active_links_async(vif, sel_links);
+}
+
 static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_link_sta *link_sta)
@@ -940,7 +1010,11 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 
 	mt792x_mutex_acquire(dev);
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	if (ieee80211_vif_is_mld(vif)) {
+		link_conf = mt792x_vif_to_bss_conf(vif, msta->deflink_id);
+	} else {
+		link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	}
 
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
 		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
@@ -960,7 +1034,18 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			  struct ieee80211_sta *sta)
 {
-	mt7925_mac_link_sta_assoc(mdev, vif, &sta->deflink);
+	if (ieee80211_vif_is_mld(vif)) {
+		struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+		struct ieee80211_link_sta *link_sta;
+
+		link_sta = mt792x_sta_to_link_sta(vif, sta, msta->deflink_id);
+
+		mt7925_mac_set_links(mdev, vif);
+
+		mt7925_mac_link_sta_assoc(mdev, vif, link_sta);
+	} else {
+		mt7925_mac_link_sta_assoc(mdev, vif, &sta->deflink);
+	}
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_assoc);
 
@@ -1751,6 +1836,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
 		if (!old_links) {
+			mvif->deflink_id = link_id;
 			mconf = &mvif->bss_conf;
 			mlink = &mvif->sta.deflink;
 		} else {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index af9a103dc7f4..5ede24116748 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -131,6 +131,7 @@ struct mt792x_vif {
 
 	struct mt792x_phy *phy;
 	u16 valid_links;
+	u8 deflink_id;
 };
 
 struct mt792x_phy {
-- 
2.25.1


