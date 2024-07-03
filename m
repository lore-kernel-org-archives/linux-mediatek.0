Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40838C3271E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TOWM2avYXo/xP6pN6yETRbPs1gdrDHvtIHr+R1SQlw=; b=ngecG5TEEIBqcVzSqED6ipXlxh
	HaMOGr2g4X9WdNIM+zWlWLbpNmXicA0HRFaf4skgOjFul19e7MkpQlZpbwwSr42f6mY/Niwn9recm
	+fYBooM35edmmUBsE9ip/LR47p1gW69mFuuxpl6a74cnh/UvYxIQWJ3vTyqiatiO0JPirC7fI61Tb
	iq+dt6FR9WdYg1GMdQ8u5kYy7n7tXXoTbIDEiuAdQQTAUrPUSoh/HVmKJX2ATxjLeVihy/bIwR3bA
	B9RIf04CetnDlVDbR4sdwywXXoVZ7diCjfUwjBzo2w1vQ4j1hQJ/0HaiZZQq7zXBTtEpPbobVftpt
	67txpv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ks-0000000BX64-42QI;
	Wed, 03 Jul 2024 21:43:10 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kq-0000000BX48-1yOp
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:09 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-700cf03febfso89118a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042987; x=1720647787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TOWM2avYXo/xP6pN6yETRbPs1gdrDHvtIHr+R1SQlw=;
        b=gY6KG+wSSl2qNTReClWoQQBsuoujA+4J78OBUSYvRYTc0Sfk364z53SmiaP/YjwwOg
         7OvfVJcFFV5jUSbqAf+mNJBqtA8QP+RcVb24Mjovbpy52+jyi6up1MkIq58IfR3tNJvI
         TXR0SnBA6rAKNYoc5VwQeOI4WwkRsKHgMkGiE8JbVTTQr00808QqitoMxsxq0Hv/kgwt
         91IFuXdDv7Ee1qVc+Utia11i1Dk0a9fQZS0RrqP8nnLwOhhrmFk91hIC46x7l674b/vL
         PhbFVTkSq82MVfequ0GlCrLnzs5KtS8QIXYO5XccMFw23C6q3bs8X4BcoUzFNuxTvUlf
         gH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUr7+wkMh5GMsd+E+SjSEnqlY5ya27a4wkj/T8dDs5Z9FmIRle4q77XsgudNiYiyq3HA5ED0uz5EkvlxCUCOM3qlh5LxbdcALrd/nTCKwsub6az
X-Gm-Message-State: AOJu0YyiorAX/9sxR17WsoeC2M2IpxcMCW+LTwoBJ5yapMy/fNNO7CIj
	le5HKvAhAb3+yRE6TkGl9ksAlxw4PihRcJY/SwLqmPJV7jgGjOnwNuRB3Syb
X-Google-Smtp-Source: AGHT+IHB+8D92ICxDGrelbsO6+AY0q19flJoPxzsqBAYCuqHkQXeoHpWCeXCgy/9CJA3vEU2E60bXg==
X-Received: by 2002:a05:6830:2007:b0:700:d1c1:e12d with SMTP id 46e09a7af769-7020775bef2mr12607744a34.3.1720042987444;
        Wed, 03 Jul 2024 14:43:07 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:05 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/29] wifi: mt76: mt7925: add mt7925_change_sta_links
Date: Wed,  3 Jul 2024 14:42:13 -0700
Message-Id: <8003cfbdec2c1357fb9d7ac8ba93af5fd0b4ec5d.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144308_538411_6BD9B370 
X-CRM114-Status: GOOD (  17.29  )
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

add mt7925_change_sta_links to change the valid links of a station,
supporting the MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 142 +++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   7 +
 2 files changed, 145 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index c9119a222427..0e554b21692e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -811,16 +811,79 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 					link_conf, link_sta, false);
 	}
 
-	ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
-				    MT76_STA_INFO_STATE_NONE);
-	if (ret)
-		return ret;
+	if (ieee80211_vif_is_mld(vif) &&
+	    link_sta == mlink->pri_link) {
+		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
+					    MT76_STA_INFO_STATE_NONE);
+		if (ret)
+			return ret;
+	} else if (ieee80211_vif_is_mld(vif) &&
+		   link_sta != mlink->pri_link) {
+		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
+					    true, MT76_STA_INFO_STATE_ASSOC);
+		if (ret)
+			return ret;
+
+		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
+					    MT76_STA_INFO_STATE_ASSOC);
+		if (ret)
+			return ret;
+	} else {
+		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
+					    MT76_STA_INFO_STATE_NONE);
+		if (ret)
+			return ret;
+	}
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
 }
 
+static int
+mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+			 struct ieee80211_sta *sta, unsigned long new_links)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt76_wcid *wcid;
+	unsigned int link_id;
+	int err = 0;
+
+	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct mt792x_link_sta *mlink;
+
+		if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED) {
+			mlink = &msta->deflink;
+			msta->deflink_id = link_id;
+		} else {
+			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink), GFP_KERNEL);
+			if (!mlink) {
+				err = -ENOMEM;
+				break;
+			}
+
+			wcid = &mlink->wcid;
+			ewma_signal_init(&wcid->rssi);
+			rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
+			mt76_wcid_init(wcid);
+			ewma_avg_signal_init(&mlink->avg_ack_signal);
+			memset(mlink->airtime_ac, 0,
+			       sizeof(msta->deflink.airtime_ac));
+		}
+
+		msta->valid_links |= BIT(link_id);
+		rcu_assign_pointer(msta->link[link_id], mlink);
+		mlink->sta = msta;
+		mlink->pri_link = &sta->deflink;
+
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta);
+	}
+
+	return err;
+}
+
 int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
@@ -915,6 +978,48 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
+static int
+mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, unsigned long old_links)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt76_dev *mdev = &dev->mt76;
+	struct mt76_wcid *wcid;
+	unsigned int link_id;
+
+	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct mt792x_link_sta *mlink;
+
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		if (!link_sta)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		if (!mlink)
+			continue;
+
+		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta);
+
+		wcid = &mlink->wcid;
+		rcu_assign_pointer(msta->link[link_id], NULL);
+		msta->valid_links &= ~BIT(link_id);
+		mlink->sta = NULL;
+		mlink->pri_link = NULL;
+
+		if (link_sta != mlink->pri_link) {
+			mt76_wcid_cleanup(mdev, wcid);
+			mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
+			mt76_wcid_mask_clear(mdev->wcid_phy_mask, wcid->idx);
+		}
+
+		if (msta->deflink_id == link_id)
+			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+	}
+
+	return 0;
+}
+
 void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
@@ -1650,6 +1755,34 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return err;
 }
 
+static int
+mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			struct ieee80211_sta *sta, u16 old_links, u16 new_links)
+{
+	unsigned long add = new_links & ~old_links;
+	unsigned long rem = old_links & ~new_links;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	int err = 0;
+
+	if (old_links == new_links)
+		return 0;
+
+	mt792x_mutex_acquire(dev);
+
+	err = mt7925_mac_sta_remove_links(dev, vif, sta, rem);
+	if (err < 0)
+		goto out;
+
+	err = mt7925_mac_sta_add_links(dev, vif, sta, add);
+	if (err < 0)
+		goto out;
+
+out:
+	mt792x_mutex_release(dev);
+
+	return err;
+}
+
 const struct ieee80211_ops mt7925_ops = {
 	.tx = mt792x_tx,
 	.start = mt7925_start,
@@ -1709,6 +1842,7 @@ const struct ieee80211_ops mt7925_ops = {
 	.vif_cfg_changed = mt7925_vif_cfg_changed,
 	.link_info_changed = mt7925_link_info_changed,
 	.change_vif_links = mt7925_change_vif_links,
+	.change_sta_links = mt7925_change_sta_links,
 };
 EXPORT_SYMBOL_GPL(mt7925_ops);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9a7443a8a951..af9a103dc7f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -92,6 +92,10 @@ struct mt792x_link_sta {
 	unsigned long last_txs;
 
 	struct mt76_connac_sta_key_conf bip;
+
+	struct mt792x_sta *sta;
+
+	struct ieee80211_link_sta *pri_link;
 };
 
 struct mt792x_sta {
@@ -99,6 +103,9 @@ struct mt792x_sta {
 	struct mt792x_link_sta __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
 
 	struct mt792x_vif *vif;
+
+	u16 valid_links;
+	u8 deflink_id;
 };
 
 DECLARE_EWMA(rssi, 10, 8);
-- 
2.25.1


