Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73D8D358E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tng3+pOB53pLZW+pGJL9iXigR2ZikgpGjqvJUqlRZU4=; b=QZXPDLQyaJ1vUuQdUh1m/UfD5B
	L4+InV0Bo686fje/OKLbI068lN37nAXC4JmFo7+ORr8H/0IfjAKiCfkXKjQcclNHlZrq7RDnMijcP
	AOagILjf30nT51Ktr+iOb6ZpTL2vsDzAXId7AfAmB6YQBjjC1h/cinIBoM7bpzXDrz0jDchHaxe9k
	P9gfoNOxhRCbJgFJgxzvENJZYxdG+DrlCw/YOqmFBGkFMRgvvSpYtL9NIay5syAXSK7KpZVHlnQnz
	ohugTn4GwxzuCxyFk7o0EygWeCYddVhVU+7EqlarO63q7JdH4pcqBDCOt51xsXjS3uCAJ+jkFZzDV
	m5JPNfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNfO-0000000HTpA-1LjD;
	Thu, 29 Jan 2026 08:46:18 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNfL-0000000HTon-1fnU
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:46:16 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1448951eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769676374; x=1770281174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tng3+pOB53pLZW+pGJL9iXigR2ZikgpGjqvJUqlRZU4=;
        b=KnCUgo5IZQtJ15XT1LXErk3WhNeHJ4D6BUmVd42sbowzwOGvE+zhs+IMOQQHiE4ZTQ
         E6YATYHjK0heOv+hmF0bYZkGN0z6XvUmbmhNYiZGSF9NnAd9z91omPy9NdcA1IemHPSS
         ZfRviOGXTV74k5p10xFidmFdt2y+n0D4fbvynp9H9HEA0saGvmeiyMnN9TA+exw6Aa0b
         4LfMQjsAm+qCYl9mfuQ36oe/L27HccOTg390gT2qpXYAMnwZUpmRZpowVA9jafPPQ+fa
         5es+mho7ypESjKjNk440SnWzUmTeGjpF6t7ZiDL+Tlg6bQ3E698Q2zRJv3+CpiVf9jJC
         nDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676374; x=1770281174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tng3+pOB53pLZW+pGJL9iXigR2ZikgpGjqvJUqlRZU4=;
        b=pLIMhag/Qp0j5/BEK0M4NZSFzlKp0u+jCa6xHKfXpTcMOUmaqGRBGS5cJugm/oik9a
         flBy86u9pIKG8FGO5WeE88+FORtsrvUcanzQ6SHpxCCBmpQ1AZH01yuEVqmn/Y8MLJKp
         9F92l5CtP/P14ZFrxpQGPr6r7OG5ORcaDciP8du6t6ta933vWzWYy9wMlayE2CYI4lae
         yT9HuW6A6rrvMySZo0JAsIExob+uC0mDEo31MXC4P9N3/3P74VQXu3QVWZ92suNuoWDl
         dN77rGOOkt/0FlA7CppvFmvoJhSL/3CUusRBHXCFRhRW0XLv2gIpMrkx1bnGKORzMtH8
         ZafQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2mGDUia2zCUWK6q1CK6CpHrsPdRwk6Oi9qILSyR1wl9ndvbMdYxOl36TZlRJ757qpKu8vFPJ3Xg8n638AYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXq6BWqzJL4UxYJeQHGQGUaD8tk3cCCooG/Mf2Dal08zJ4Usj6
	sVgZ7mCTwmcqIedSOYA1nDIMmkZiYYiq6YkQnTb3OXXYNdp/LYd5Z4n7
X-Gm-Gg: AZuq6aK5OhYTo3sFyoANToaRvAv+T/5sgXoXoCDG09uBJg6qNGLFHqhmymSBEhuvePh
	jFr2G+NmNp9ZHwDGpsqbYglI+qFINULXuyIFNTNxNJZr9l4GoKnSN7T+g9JLyDMKqbGUgRYM+eE
	di2hYioiqeDLq5nZK6d7cu+FVMDXH0FNWpQgElDS9+xkG8qye5ut6wZjBjWV1JntYpHWmRSa0wh
	wvziDWl2NG1gCj6hyxldMTjS7CqfHVkirtxtV7hsV2XtAaQYS9D5f7abVWsSuIjaYp+HMY1Tjde
	MkIYjKrAJ/wcFSOAghWb3vYyPwkpf/AHmB6eT9GnFAZc1z4DOx5DqxobXeDTe0BAkpHWkBw1cFz
	2sflE9CbaXecw/6yca6ETDUyAZUl/UfjbgEmNGyc4Xj4lhOwsbwqF8631qFWalmy4KMJ9czVD2i
	XbFz7hBJ4v9byXWHBPJ6QTfC54CNUAktvuY35Ck8eIoDlJy1OD5vn+gKZ3BRpgKMaraY4ubfSF
X-Received: by 2002:a05:693c:3017:b0:2b0:52cc:fe69 with SMTP id 5a478bee46e88-2b78d86845dmr4198171eec.5.1769676374355;
        Thu, 29 Jan 2026 00:46:14 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe92dsm5947583eec.17.2026.01.29.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:46:13 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 2/6] wifi: mt76: mt7925: add NULL pointer protection for MLO state transitions
Date: Thu, 29 Jan 2026 00:46:11 -0800
Message-ID: <20260129084611.187744-1-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_004615_446237_16A53CDD 
X-CRM114-Status: GOOD (  14.38  )
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

Add NULL pointer checks for functions that return pointers to link-related
structures throughout the mt7925 driver. During MLO state transitions,
these functions can return NULL when link configuration is not synchronized.

Functions protected:
- mt792x_vif_to_bss_conf(): Returns link BSS configuration
- mt792x_vif_to_link(): Returns driver link state
- mt792x_sta_to_link(): Returns station link state

Key changes:

1. mt7925_set_link_key():
   - Check link_conf, mconf, mlink before use
   - During MLO roaming, allow key removal to succeed if link is already gone

2. mt7925_mac_link_sta_add():
   - Check mlink and mconf before WCID allocation
   - Check link_conf before BSS info update
   - Add proper WCID cleanup on error paths (err_wcid label)
   - Check MCU return values and propagate errors

3. mt7925_mac_link_sta_assoc():
   - Check mlink before use
   - Check link_conf and mconf before BSS info update

4. mt7925_mac_link_sta_remove():
   - Check mlink before use
   - Check link_conf and mconf before cleanup operations

Prevents crashes during:
- BSSID roaming transitions
- MLO setup and teardown
- Hardware reset operations

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 67 ++++++++++++++-----
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index fad3b1505f67..1400633712b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -612,6 +612,17 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	link_sta = sta ? mt792x_sta_to_link_sta(vif, sta, link_id) : NULL;
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	mlink = mt792x_sta_to_link(msta, link_id);
+
+	if (!link_conf || !mconf || !mlink) {
+		/* During MLO roaming, link state may be torn down before
+		 * mac80211 requests key removal. If removing a key and
+		 * the link is already gone, consider it successfully removed.
+		 */
+		if (cmd != SET_KEY)
+			return 0;
+		return -EINVAL;
+	}
+
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
 
@@ -864,12 +875,17 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return -EINVAL;
+
+	mconf = mt792x_vif_to_link(mvif, link_id);
+	if (!mconf)
+		return -EINVAL;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
-	mconf = mt792x_vif_to_link(mvif, link_id);
 	mt76_wcid_init(&mlink->wcid, 0);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
@@ -888,21 +904,28 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
-		return ret;
+		goto err_wcid;
 
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	if (!link_conf) {
+		ret = -EINVAL;
+		goto err_wcid;
+	}
 
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		if (ieee80211_vif_is_mld(vif))
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, link_sta != mlink->pri_link);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta,
+						      link_sta != mlink->pri_link);
 		else
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, false);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta, false);
+		if (ret)
+			goto err_wcid;
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
@@ -910,28 +933,35 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
 					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
-			return ret;
+			goto err_wcid;
 	} else if (ieee80211_vif_is_mld(vif) &&
 		   link_sta != mlink->pri_link) {
 		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
 					    true, MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
-			return ret;
+			goto err_wcid;
 
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
 					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
-			return ret;
+			goto err_wcid;
 	} else {
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
 					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
-			return ret;
+			goto err_wcid;
 	}
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
+
+err_wcid:
+	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
+	mt76_wcid_cleanup(&dev->mt76, wcid);
+	mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
+	return ret;
 }
 
 static int
@@ -1039,6 +1069,8 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	if (!mlink)
+		return;
 
 	mt792x_mutex_acquire(dev);
 
@@ -1048,12 +1080,13 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 		link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
 	}
 
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+	if (link_conf && vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
-		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-					link_conf, link_sta, true);
+		if (mconf)
+			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						link_conf, link_sta, true);
 	}
 
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
@@ -1100,6 +1133,8 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return;
 
 	mt7925_roc_abort_sync(dev);
 
@@ -1113,10 +1148,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+	if (link_conf && vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
+		if (!mconf)
+			goto out;
 
 		if (ieee80211_vif_is_mld(vif))
 			mt792x_mac_link_bss_remove(dev, mconf, mlink);
@@ -1124,7 +1161,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 						link_sta, false);
 	}
-
+out:
 	spin_lock_bh(&mdev->sta_poll_lock);
 	if (!list_empty(&mlink->wcid.poll_list))
 		list_del_init(&mlink->wcid.poll_list);
-- 
2.52.0


