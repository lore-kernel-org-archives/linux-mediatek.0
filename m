Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506ABD47CAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSp+N+GShRL+uxhqPaPfFr1j/zGqGJL8NPvnP5M25W4=; b=WcBjUs7THE/dKjRISoKzZSAZLB
	3d9HzvBGqzgqK9WlS4ePpJUNSwqAsSct15UD48XkK5jCXxNNLE5M4jIdn7PrLPP71S1POh9yCMfdM
	FsoBdMeLSkQxUrTk35Awy6719UHBusfZNVYjXIxIJuP3rN2GBq4axT/+kg16zykKL+WDRM3q/y0Tx
	fQIAAKS4NpRrETLLfrjrlKPI8P9PlaaAYSp7VQEu8KdQu5/Zfa46NOG0TVPVh2eM9q8MaPRXhRprX
	XL1cT13GDUsMsajztSSclvoTSUtMqQcspKWVD0qw4uzOu48S+UBDaRBJ6nhH4v7V4Es5oPfy1aGZo
	MCmrxlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHV-0000000DOVs-1Wzs;
	Fri, 16 Jan 2026 01:05:41 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHL-0000000DOQM-3Tfd
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:34 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2b6a93d15ddso1055694eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525531; x=1769130331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSp+N+GShRL+uxhqPaPfFr1j/zGqGJL8NPvnP5M25W4=;
        b=H5Z27OAYl7Ihu6Xk1vd4NgmGgk3nnO8/BctKjx7Kl6J7DY3G5TvMIshroDLqZ96Hu1
         /H67mArEznbTb10F3LyOS9+baf+ja41hTqCV/toGJlPvYygReTRh9LWmZR2rkMZgrK2r
         fWkGvRKOvc0pOEIRC4U0JuRKBeWtFL7ZZN7Q9cn5MjrCRuqQoY/1iDbpP2lKBcQCKvm2
         CxNEKY0Ne9dShkAVO/xnzCxayCodIFsrTxSg7iBISkyP2nCWTH/82/hO5pjAG6Yick54
         THCDSXMqwGJzIikZT1SHe769n/BuQiqYc75vgplgbMTDl7G6MRKhCfkENmTvCIxoAT7j
         BrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525531; x=1769130331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSp+N+GShRL+uxhqPaPfFr1j/zGqGJL8NPvnP5M25W4=;
        b=aZfEPrPiZkzkodlRKXNCrg6AlGxLCRvk9AyOtws95mU8QMzs02/MCXsbfI8778Jja9
         q7XwmRvapbotHUQJFe6iXd+BTWSls/LpKn2QR64AHjGqb+FXhH2uqxhZSUkfAaSMZKvp
         ja8nVIXlEzLMOYcOyp7X1CqQV+q9gWNF0G44UxsaqURsUO0HU1UcXYVp3zi9MLIzzqEi
         vy7qO4USkUHGhpOImhYRfAgYI5Xfid+yVGZiDi7VTeKFY4TRBPXY8ikSdm+/YEj5MH6/
         jLkdWuzf1iXNEsaJ1W6C+l00s8vXnUz+CbN4KVkVLkDBiTee540ndSgpGnfCBhRqIeeG
         dcYw==
X-Forwarded-Encrypted: i=1; AJvYcCV+92EEi6vtC+/kH7WmzK3nGMLzdIDpNBRmWUuv+tsYB375waw4q5Sar1HG+BwpxhM+pv4X2YjItVgLp3ytBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjWRXsohv8qU0aZL9ULr4ZRNlI8kDWSHraPCqRPrRbu2XF11/4
	bSKRF76KbG40hNLGBRWYH5hsGdCcrrROAyPBfeNCwi1nW4wQSlC2QDWh
X-Gm-Gg: AY/fxX5m9oFd8oWEowEW/z786J7kYcnn6zxYL2RELFNrMvlaIPehfey5+P3mOz35g5t
	Q4aLx9jHRn3cRi1Zs54m9VaA1VxtnKM5mjTNZ/fVR74LosHZoSFLHNuLqeniSS3GJ0VmXshAlZs
	Ggv8WWj5JAM/OuRGE1OI/aLCuV/vnCsKjZ4rDYaZgQ2dPwCo4y3FlGukwPwerZlfL6rsOMXzu5g
	nxCCMY2eY5hKfSESFVBRre8tpUMFIBuWQnaMBfgInQ2AI0eT8MVrAuZzZs3nVWnCkyWqcTkKV6+
	wI1zzwf+RJ0dJB+kfFt2ClHmybYhWyQtxrNJN1rUTlZ9jdvqK4O1Siam/XJ0VHmWpbQxBbr98i0
	jU5tkdnRLD6U0yP1iPkHo5VnMCYzTChwlfae3EZIM/LH8ADWLg+grtpbcl1rFTjhCbPLYQQRmbM
	Y/5Fdnn2h8C7san40LxwZKPU4FwZoD6ejWTqvMnH/LjwW+MUtzOQ3WcN6BFwiYSQ==
X-Received: by 2002:a05:7300:549:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b6b3ecb06dmr1089037eec.1.1768525530659;
        Thu, 15 Jan 2026 17:05:30 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:30 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 05/21] wifi: mt76: mt7925: add NULL checks for link_conf and mlink in main.c
Date: Thu, 15 Jan 2026 17:05:03 -0800
Message-ID: <20260116010519.37001-6-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170532_647665_009052B9 
X-CRM114-Status: GOOD (  13.83  )
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

From: Zac Bowling <zbowling@gmail.com>

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
index 9f17b21aef..7d3322461b 100644
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
2.52.0


