Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6A8C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fF7dbw9hjOaq/kQruIH9Yh9VX6vhhlm/7O8Px4OouLw=; b=k45Z7Mh5HPwEeDBGQt/vdaldbL
	6xoonWcIAKf6d0WTNnhtytqQD4Rsaic9IjdwiefpeOfo4wUojqIXCvvIFMz3nH/wEYVtHD9GOFRLZ
	avjv7N8ZvU+r0GTHNLerQ6ia0uSq4EXF9U3yySRJ/qB3V6Y//xPk2e08Cl2I5Bq2a7KWSzXHTJlBf
	C0mcfOXhexG3fdkJItWTZuWtS4SZwjeNGSaP5Ob6Q3MD/+5/YCITpfnMpnGSrORmULp33AIfjessb
	xP0q0SaD02P117ZnXUEosgwH45c9XR54iTYEj1NJHTS97JEqOmTGfAFwPUrPk0XtccZBgoZgRJ7yZ
	P2SDAEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mu-0000000HXzP-1MjO;
	Sat, 06 Jul 2024 08:28:56 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mq-0000000HXwI-1E9H
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:54 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25e14bf05e5so95397fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254531; x=1720859331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fF7dbw9hjOaq/kQruIH9Yh9VX6vhhlm/7O8Px4OouLw=;
        b=hoGURgvufYzTw7mHp+g37k7Mcos+wy/UdUHrgiI0iVIUwI5KNRy5RNlfGo5LnwlwX9
         EJRjjtkTrUfNM6DHsnT44YbQDZw73O7FyPrUrFEYuQVVABsPPt7XNivn0gKJ2g58obpr
         H1McL3K247tHJmSEYmtJl9Vy+EkMC3kXfgDcECiWFEx2t8mSNISnNf+7xxlDz8pZlHrc
         2YkWwplj7k4aCCzbBxy7lpUm7A3V/9WfBrAmBMJl58o+xlHMxQHKvhkg49hV5czcedmW
         Phc7HglJGcm3YfjsDKmC5ri7fYHj2atJQhW25l72LSjZBicj4AcjyL9ABoQChdv3aHXH
         cAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUawjPxGSH164eMrbOKySY4BQeHKOZvhsVnoQz72m5JBQ4JkyP44jDGMS6+1j+Qfye//zIkoXTXb67Re4dB/kIhaBlXpw9EyMJAxxgb1fu3FJPD
X-Gm-Message-State: AOJu0YwYI/3Lxd0TblKgzjugDk01c8Cvg4P2LSK2RFw1YGofr2ZLBszM
	XcXT5u3m8ZAI5PsdyAEdxgS8rLqkqb8rlqIbFfTdGrA9FIq/0NBi
X-Google-Smtp-Source: AGHT+IGew+8eYSM7buBCgaK0V/uYFNLE8/3ep31gfldrh3EPHm/63YOfwRDMIgjls83fwJRHMNMVmA==
X-Received: by 2002:a05:6870:5590:b0:259:f03c:4e90 with SMTP id 586e51a60fabf-25e2bf93f31mr7368525fac.4.1720254531236;
        Sat, 06 Jul 2024 01:28:51 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:49 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 17/37] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_assoc
Date: Sat,  6 Jul 2024 01:27:57 -0700
Message-Id: <0ddf1834783b111d626b05d298478f520d7c0caa.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012852_885285_7D26E8BF 
X-CRM114-Status: GOOD (  17.95  )
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
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 104 +++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   1 +
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 938909ab8d1c..669f28a916c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -387,6 +387,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->phy = phy;
 	mvif->bss_conf.vif = mvif;
 	mvif->sta.vif = mvif;
+	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 
 	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
 	if (ret < 0)
@@ -923,6 +924,89 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
+static u16
+mt7925_mac_select_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
+{
+	unsigned long usable_links = ieee80211_vif_usable_links(vif);
+	struct  {
+		u8 link_id;
+		enum nl80211_band band;
+	} data[IEEE80211_MLD_MAX_NUM_LINKS];
+	u8 link_id, i, j, n_data = 0;
+	u16 sel_links;
+
+	if (!ieee80211_vif_is_mld(vif))
+		return 0;
+
+	if (vif->active_links == usable_links)
+		return vif->active_links;
+
+	rcu_read_lock();
+	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_bss_conf *link_conf =
+			rcu_dereference(vif->link_conf[link_id]);
+
+		if (WARN_ON_ONCE(!link_conf))
+			continue;
+
+		data[n_data].link_id = link_id;
+		data[n_data].band = link_conf->chanreq.oper.chan->band;
+		n_data++;
+	}
+	rcu_read_unlock();
+
+	for (i = 0; i < n_data; i++) {
+		if (!(BIT(data[i].link_id) & vif->active_links))
+			continue;
+
+		sel_links = BIT(data[i].link_id);
+
+		for (j = 0; j < n_data; j++) {
+			if (data[i].band != data[j].band) {
+				sel_links |= BIT(data[j].link_id);
+				break;
+			}
+		}
+
+		break;
+	}
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
@@ -937,7 +1021,11 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 
 	mt792x_mutex_acquire(dev);
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	if (ieee80211_vif_is_mld(vif)) {
+		link_conf = mt792x_vif_to_bss_conf(vif, msta->deflink_id);
+	} else {
+		link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	}
 
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_bss_conf *mconf;
@@ -961,7 +1049,18 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
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
 
@@ -1753,6 +1852,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
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


