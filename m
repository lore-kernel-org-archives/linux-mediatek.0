Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A1CC2A074
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgqDXjaM/W6rmb9gEVa1xwOmm1cgdSOfo0YYoA6k0dI=; b=YNB8LvlQCqtAmJuITyzIY3WgsF
	SEJePL/x+lnlrnEiB06OslSYeYwR+m/en6hwQwf8Ig6VFsnAXibKDP0r1ccRBGaGosHzo93qlRMF5
	kOBLoKjS34C9+ksE7aphyOQ8p/Whw1Gp1CrmAmsx31h6FFc255U/wtwz+XH63IIMI2cWJedAuveE6
	A+7acFI8H2npt/A1J6tFZ1JkQjc2eX6hGe8g50akrsQCg89xBCW4YS4d+zikIINzCU+JwQDz+e79D
	B9WLuW+CalRY1iBN2or0Y0bI8qHVC8AHfT1adP6zvQmz/Td8UKjVDZKp8rbyCaxTSaz7kMl18Q9h+
	U9e6nq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR2-0000000AZuZ-0Ady;
	Mon, 05 Jan 2026 00:27:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQy-0000000AZqi-3Bo5
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a099233e8dso113555385ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572816; x=1768177616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgqDXjaM/W6rmb9gEVa1xwOmm1cgdSOfo0YYoA6k0dI=;
        b=AqH6ECTvpRlMjFjeghttZlVYfUHoKpvyW7ythoopVzTxks5JtN+7hMDYS8wcUIbvRA
         Q5oXnZ5/ipaIrGPjUpda1otSAqLyaBisJ8ux8WX9kEqeDK9pcE3WsdpfecNAw2FK8/pD
         Oi3WEZsPRt0EJAR7Ah2Sacruk/rOqtLjtVQCNx8MPqS5N52rzBUJY0QetIWdKVT+hIQv
         mPKBZnaivyYwNsCjiaLuCrs4OTMuBDpkPF0SIQakW1tjc92uz77IAouFlGpJ0aLdE+Lh
         PVAk7MfcQ2Mr5z2PCINvFugOLLv5QUFYlyDbHfLYY+d7QVwZ7RJKaR8YD79gZhP6a75q
         dpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572816; x=1768177616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgqDXjaM/W6rmb9gEVa1xwOmm1cgdSOfo0YYoA6k0dI=;
        b=JvH6RCOR6CalWS2j7kiQI3EajIZ8Y2szT8YUIDYmR2qVMrWtau3dQAmbNjQcp9ojwn
         jKp2WQoC58t4qcGqCC5ASGNL/Q95tROJvueSuPSFhoV/p7bzpj+/GWT/fvUhjDmfG/Hi
         J4w2UW7CbQH+N4FKAY9Perjx5O8JtoylQpc7XHK2+1zxETaasarNsKgXBn2IQOtkutWU
         5dLkZ/PQMV+PtWBPxkOjKGEYLa57iwPg+kUfJddXi3VdaSsctDkqR6K2Au32Gq0bOkjk
         ZZf+ovleOUMbG7PWUJU/NSbe7XXes4kwGq/lp8e1yMESmZr34ogASvFRkSNd/VK+K1TK
         eV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbSEMszt71PE1p38Vy8sOFKMiFcHncOHF+AjSQ1GW0ynUTtFSkqXls1sJ+I96lUaT+PnlD9EtMFcGjNESGzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAiMz9nYrb5zQtl4YhkM07facMqzcCCQAipbgRawcoi4ivOX/u
	02sl34ZmfUKgTc4LsygD/7LdkS9WBZoUeNitox6tDthv6ZHqLJDvTutd
X-Gm-Gg: AY/fxX4sueWUnaVQVOUj2cqG/wJOOlwRtR3oIDmOAnQHV8IsFm2h6EBFLKOqw43ycMG
	NRchwnKa5LHfs6qAQLSULCzSTi5hqnKKOqJVtuf2LLuA5f6swp+BNrLjsHtN90ZN3bjWM6c9fe2
	mdfJIm1lTdOlweSdflioGSneoPE5mFUd5KGB0jcAP1HgfGNjq5GBft0DhRDGmzcBj8hrWcVJLzY
	OBbzCkb2ihQ2pLCvvt5e9q/M2AczlE+5MmnPSWSvjk/4NGTLNYyEkB/JA5C4JubE+dtoyXj9+bJ
	lfEV+H38qg7QnAUhtupWe5q00fmaBAjrPcoeLJFw2ZDUMnkMM2ZCtfoSJpcXvqw+URg3UnrG36w
	w8FJ/NsFhLqkuhH+8chx9ErKR1nFkdmBX9xNVT+SkOocEs/V20pMeMk2sbJmrlBOO0pVnqmrkBP
	Lk5ognRnRjwMK/T+8Jz1+9Bi2d1XXe1vB4miy/XVlR4JCViGM1YaSkIoApV+cZpNc=
X-Google-Smtp-Source: AGHT+IGbpxhkkCFfYLFi2pkEmN+VY/Htmin9lmOYyGyF+HoewIO2bfL2isyMIVIopnCZQfJHgUOXEA==
X-Received: by 2002:a05:701a:ca08:b0:11b:9386:825b with SMTP id a92af1059eb24-12172302a23mr38510813c88.48.1767572815709;
        Sun, 04 Jan 2026 16:26:55 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:55 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 05/17] wifi: mt76: mt7925: add NULL checks for link_conf and mlink in main.c
Date: Sun,  4 Jan 2026 16:26:26 -0800
Message-ID: <20260105002638.668723-6-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162656_805383_03BD77CE 
X-CRM114-Status: GOOD (  14.01  )
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

Without these checks, the driver crashes during station add/remove/
association operations with NULL pointer dereference:

  BUG: kernel NULL pointer dereference, address: 0000000000000010
  Call Trace:
   mt7925_mac_link_sta_add+0x...
   ...

Found through static analysis and triggered during BSSID roaming on
systems with multiple access points.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
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


