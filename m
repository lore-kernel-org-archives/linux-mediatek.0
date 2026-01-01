Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B09E9410C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SE0rI5P7eKNbejouiqbb/lEDUIGRekIUepADcT1rcR4=; b=sZwZkuq9TI1x+iYvraDGM5mcP3
	foVijh9teKQ6MZAMGnWoFosa+chxy8INBEQjPlYUixSnZa2JtbuUcXqjowP9D21LhxOQgc2epeSCR
	NORMJC+tr2JHhWo1d4+Anyk0MJgpwCz117suCRLNYPQ9e2m1U08yEPNyprF+AjoXDhYlqHef9pzG/
	hJ/uazdPsbCQMEQ6rLrhcTT739HAdLszVgGWWCOWqsM9mi9TVJFsuru+WvNUJNIQEbHfGy1Sxuilq
	jNOGuXDVaMgfO6+efD1vd9JFKxDo42QmkpoIzKJPC0Ep0o3eGCJewsb9Or3KWdLP7lZhNZXXE1AXq
	xiSiqU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7g-00000006dtA-21Bv;
	Thu, 01 Jan 2026 06:25:24 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7Z-00000006drG-3u0X
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34ccb7ad166so10374362a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248717; x=1767853517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE0rI5P7eKNbejouiqbb/lEDUIGRekIUepADcT1rcR4=;
        b=htoApfyFW/0Q47VBBLNpS0VL0s4Ow8iUX2uMHe0D2fLpjb9PZAWY5bOWxG7D6MaO/X
         4BXCWtb8Hj7eZjtgRaFuWGCnQZTwOGs/hf4gIKGoOAr8Xa6dHf++rTC1HAaoIAR9pjPz
         i+/d0m70rO4cF0xIsXu4G2cAQ798uOWTPgopKvZpMINOzu6IAPFRv5eu5PBKbg1OBwbU
         jAK4mLOCyfF/w5GG9C2xRn/OYXj+MGbjge+vQlEGg4Hxm7o0qD+/NmOxhXNUbE5deaDG
         INYw2isUbkpYNgnUNjl9GeioE4QoeIeboodlPVxOGdxRMPdCiWG9E0o7vF+Kp0m9k1dz
         L5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248717; x=1767853517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SE0rI5P7eKNbejouiqbb/lEDUIGRekIUepADcT1rcR4=;
        b=pNH/Kss7tR9VLTSvlLn4MDbicZFzFcgV2vS4QFiuzytgydnfVVrGfF5d9crlqAmRJ8
         edF0lQ5pMp/5a05puo/TFhn6Kqv0WbiklRSYeNvZzKI1LDYm7HKhurHwY7qwPdLU9/jC
         7PVjkBqjijR/rzGuCKcztIdVOpc1oKGI8QMwsR598vk28uzte/GODLUJ+LUUmGzQ092U
         xBSige4ZLa6jxkvcizu7Pl5Ayk6zBTT1Vks0zazH9B7Q6Ohd7tr7et2eo9LFbJ+/Skn8
         Q319Wqyy5ke1u5omCZfaXYsx9Lw/C2uhhzSKNHhwsAjswVPmkr7YZpafM3n+rQuf0WhC
         UYNA==
X-Gm-Message-State: AOJu0YzeT0RMkjBo9bfH8q92sjD8v+fhtB2F/7BkDeco1xaDDowZ0XT4
	Dq0TmXPmShHUqQgagUlR5PqysL0XrL/xT5edGlzKHMD6pNyAtOco+pnE
X-Gm-Gg: AY/fxX7+fcmAfyuKYgphn1JHneFduW7FkHl+embMVheD5VWPNS/r4DohGtCHZwlqLlT
	NvtyGlQ3dpzM1gHfW7Ou7/gWRsI/l4QQAYfeqy5XLi6sQquXMWrCeeSra3lR48MaAq1QV15/+iv
	3bb21X3qRKku4esf6DWueYzVM7nKpvpqsYmT2G103jkpbZOMzR7b9TnzmJipDMcMzQAvabO4rxY
	NugdaMJY+cLgrDFTpUjo/3PJVdxBgxH3WxPsxtl9iKlIRXgRRpO1OiTgod6bfx66WOHFo6ekkhT
	d4tRaff9tIeK9jLs7sW9Q0S6C/VRyoC++WLaS0LrtFzCaV3pzjCkoaD4rdbyBOF3HO3lkDInJa+
	yLDSgyyoUmKXvNIPS3dyuKZAIoeDp27J0E6n6uUbGpd4XJaZO7UGyfLc445YLGU/v0rXGSJtP7e
	VBXrHs65VwYFlAJLLBDCOUKxka7xoteyWNOeEadnzGM7KHWgJkK6nINRuOqr1geg==
X-Google-Smtp-Source: AGHT+IGRnYMQUKgIm6YN48+hICeeanP0w+GQDI9J6UXpl+np4+nuvCPHeQpD6aFl/O7XmVnhvN3Beg==
X-Received: by 2002:a05:7022:3c06:b0:119:e569:f258 with SMTP id a92af1059eb24-121721acc08mr31579034c88.1.1767248716890;
        Wed, 31 Dec 2025 22:25:16 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm147035158c88.17.2025.12.31.22.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:16 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add NULL checks for link_conf and mlink in main.c
Date: Wed, 31 Dec 2025 22:25:13 -0800
Message-ID: <20260101062514.186040-2-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101062514.186040-1-zbowling@gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
 <20260101062514.186040-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222520_374697_AF2EEB6A 
X-CRM114-Status: GOOD (  13.56  )
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

From: Zac Bowling <zac@zacbowling.com>

Add NULL pointer checks throughout main.c for functions that call
mt792x_vif_to_bss_conf(), mt792x_vif_to_link(), and mt792x_sta_to_link()
without verifying the return value before dereferencing.

Functions fixed:
- mt7925_set_key(): Check link_conf, mconf, and mlink before use
- mt7925_mac_link_sta_add(): Check link_conf before BSS info update
- mt7925_mac_link_sta_assoc(): Check mlink and link_conf before use
- mt7925_mac_link_sta_remove(): Check mlink and link_conf, add goto
  label for proper cleanup path
- mt7925_change_vif_links(): Check link_conf before adding BSS

These functions can receive NULL when the link configuration in mac80211
is not yet synchronized with the driver's link tracking during MLO
operations or state transitions.

Without these checks, the driver will crash with NULL pointer
dereferences during station add/remove/association operations.

Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 9f17b21aef1c..7d3322461bcf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -604,6 +604,10 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	link_sta = sta ? mt792x_sta_to_link_sta(vif, sta, link_id) : NULL;
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	mlink = mt792x_sta_to_link(msta, link_id);
+
+	if (!link_conf || !mconf || !mlink)
+		return -EINVAL;
+
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
 
@@ -889,6 +893,8 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	if (!link_conf)
+		return -EINVAL;
 
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
@@ -1034,6 +1040,8 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	if (!mlink)
+		return;
 
 	mt792x_mutex_acquire(dev);
 
@@ -1043,12 +1051,13 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
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
@@ -1095,6 +1104,8 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return;
 
 	mt7925_roc_abort_sync(dev);
 
@@ -1108,10 +1119,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+	if (link_conf && vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
+		if (!mconf)
+			goto out;
 
 		if (ieee80211_vif_is_mld(vif))
 			mt792x_mac_link_bss_remove(dev, mconf, mlink);
@@ -1119,6 +1132,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 						link_sta, false);
 	}
+out:
 
 	spin_lock_bh(&mdev->sta_poll_lock);
 	if (!list_empty(&mlink->wcid.poll_list))
@@ -2031,6 +2045,11 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mlink = mlinks[link_id];
 		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
+		if (!link_conf) {
+			err = -EINVAL;
+			goto free;
+		}
+
 		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
 		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
 
-- 
2.51.0


