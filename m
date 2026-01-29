Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A42D358DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naEzUi5T5XiWE+zV5MsLkVzO6TX0wOB54z5FQcjozZA=; b=GsIg/iu1UJ5wpdUWnW2eNRl5UQ
	ZHzvZaQGR4gkR14e+dJaiVOGQfsC5Syv5qBH4cRDOyz66pOc8LywJe0iQc266ZO9DzxpYImhZ45oz
	b1kBPVrEj/fP591EKuDpGZIN/T1m3Bzvcd8cP6vlqP1em5Xsnf2okc46NedAmRTmR0Cj/LlK9Wv1e
	k2A8dKoPssgPfKmCL8R2a1mp7F9Ip4SbBR4WqLzJfEVP5l5N0LQTb8V079BIJPi7wkeU8Er4d/WiH
	eu38mNM6+EZJIgExbxuoI2tZB/XwdF/6i3mGDZINF5gA+CK5/k5MD13kSrV/zIwSaLSLSy+oCmruq
	Jywvfqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEr-0000000HRpB-0sBd;
	Thu, 29 Jan 2026 08:18:53 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEo-0000000HRnA-0D8t
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:51 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1249b9f5703so1035277c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674729; x=1770279529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naEzUi5T5XiWE+zV5MsLkVzO6TX0wOB54z5FQcjozZA=;
        b=eujoUouzq/5CTVsGNzCoY0WYPLP/tBiDuLR3ISVHEt+BcqcoZ0Xm6gMd+dea2F9qNn
         59SId8IXzJE18yybW7ccBwROLTmBmiegaADtAW2mO8QQGWMBLUpsAh4GMdVkjubmLyvr
         /zq9LffI7AhFOgVbZ542S0eCvH/uAml2jMOBwftB6x5fCSe4BKdAZmSD3Y4pkfPxxAU7
         Z+ILc/+4Bbj/8qKsahR3iPy0dKvsvS8C2MH0kGyfApqiCWu7Dc19u12xvIrnQ/2iTveb
         GpG1FJbEwo6FnHm1gFBc4kcMbnKBOVnY66tegfrQhMaQkNjUyJtgt1cVNtOSlJ4Pd0WH
         rhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674729; x=1770279529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naEzUi5T5XiWE+zV5MsLkVzO6TX0wOB54z5FQcjozZA=;
        b=FKh/jks+/C5MuRMSNA9u7nG72NMEO9mCryhLnMKBhnX8whDGx6pAsaKluizrYenEFb
         VbdKS4z4Xy+iLZYO4jjk45URDt9mvx8RmPhwOc+1DfPAJ/y+3ndrny1+/QOPX5O1c7yD
         D5Ux6L2UZ2eXaWcd7q+9giI2/HDMMd7uD5YRwTsE9so5FZMQOm0HDwGL7Xgq7/ri48Pw
         ydsOjKGypEXxHUFCxSpHmdF/mbjGzTFPAwEUzWzVtsWPX3nvZjdDh7W9pfrIrNRakiLN
         7DYUOGXzc7GMf2SHBjPxSaINoBTMxCTbbiwlwGBn7sMvGLLlu7QtAGM5bD/trMpqSBnq
         UXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUARb8vwZss0ww6DrZHPweKvCs7yHn4Sw1+aFZLeEbFFiHmJhkwBublQjF5839eFkHQ7B4+qUwcZ8kD1XoHtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfiNRtqIs4FO9BdIwgfiYmZXznA1hA/vtYwwigXnEHUPjmCHCs
	UOlr9R1QoShKnems2/saN3CJ9xBhWtxKWDeYXmBhwoCOGIuuyhUw/H6T
X-Gm-Gg: AZuq6aLT0EY4kaoAgL8B5OGFfAVMxqFakAZewkj3DR2qBmDIrqTh39WqSuzekxXB55t
	SCr5Hvm6YaTGTY9pvUCg/0FsaIIAHI/LOIX6WCP/HVeElEJ4lMRDieDm8avKDDbA+vIsOFDN3x6
	HxvhcvTea87CcuAj/FjDzz7zeWA38rdcAX3GJALXjeGo3PCMbg0nCHQ9zqXg/WP6THwWUyJeIgg
	X8lV7ZyB27x4jAwq2q7jQRP88D0AJk5nHoxVtuRJHQlsAOo39K3oqyzSOkMITRmDUn6EuZVpv1N
	hUX6cMm72MejLji2nX2EMyGOOHlY+VRDTXsbuQbwQDkpy3lnkPbAxKdzeevq0GZuz7jai9/25nf
	HuuRgkZz9h2IF107sTZChLDSNomyeWOvgLfbp2WA7poLh0iomFnbOEXTvalGs7yLKcmvk9OwYiH
	O1lUuahsW20qKizPFBKA1iqmaf1Yl6LX5opN+3U2IL9eqP1RISxXMjcw6ZlvR+
X-Received: by 2002:a05:7022:628e:b0:124:9e46:82fb with SMTP id a92af1059eb24-124a00d183bmr4844023c88.38.1769674728985;
        Thu, 29 Jan 2026 00:18:48 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:48 -0800 (PST)
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
Subject: [PATCH v7 2/6] wifi: mt76: mt7925: add NULL pointer protection for MLO state transitions
Date: Thu, 29 Jan 2026 00:18:35 -0800
Message-ID: <20260129081839.179709-3-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
 <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001850_103158_46D3AE9E 
X-CRM114-Status: GOOD (  14.29  )
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
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 66 ++++++++++++++-----
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index fad3b1505f67..88ee90709b75 100644
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
@@ -910,28 +933,34 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
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
+	mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
+	return ret;
 }
 
 static int
@@ -1039,6 +1068,8 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	if (!mlink)
+		return;
 
 	mt792x_mutex_acquire(dev);
 
@@ -1048,12 +1079,13 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
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
@@ -1100,6 +1132,8 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return;
 
 	mt7925_roc_abort_sync(dev);
 
@@ -1113,10 +1147,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+	if (link_conf && vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
+		if (!mconf)
+			goto out;
 
 		if (ieee80211_vif_is_mld(vif))
 			mt792x_mac_link_bss_remove(dev, mconf, mlink);
@@ -1124,7 +1160,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
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


