Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CEAD0D146
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 23:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ow/N1ZmXxzwSWBbQdkni8/opm9FVLYZuNitVYYOiRVw=; b=pOU6OPljQfFOCcvoccykmj8pIj
	TaOEEAKntnUarKPdXgYm6cnWuStsy0q6gk0EUPWu3wLzz1vGGQ52BuI92TsgYiCLREMS3A8EllNaJ
	a9hMafJ+bhIEeblqfMj/Bg63hooGI4FaCpZ1Hs0/ghn7s3YC8L1DpaNeSb5fTkVG+RSvIQNGPAw4w
	KsjxSov2sBvTj/O2FgfFtpq4WP2yNAzoHuSrbUH7BUZNmMKCm3xdDPz2ooMy629y6qMDJI+OBI8Hf
	NdmZIDsiQqhZu0YzISxB8OoAYjs4vBN9ogq2u1c0JxAXbm5YTFTvgjGya7JkVwX1o2T2IviUFTiJq
	+Qb52xew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddQx-0000000FlJ9-16FG;
	Wed, 07 Jan 2026 23:59:23 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddQv-0000000FlIm-02MH
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 23:59:22 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so2116199eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 15:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767830359; x=1768435159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ow/N1ZmXxzwSWBbQdkni8/opm9FVLYZuNitVYYOiRVw=;
        b=h4TRi5739FbifTM0pnc7gDpGAUjGdGP5nPsdUBZxVnxnCPDyHuP1lle+CGvcB71s96
         2OZ9CdzDIk3RV+Kszl0P+glRIUTMo6UIL6lkv0+iawCoV4rV8BHZK/coCwAJFWFor/lc
         96jhKtRViW9BGThrjArfHbWFBXz/JHLCHDChf1UalTJEV49vFERv96JjbdbkfAVIJ4ub
         XO5JwPCNW9InuuJrGv3mo3B2R7EgZwMIHYODcv6sTLgIVV3gxHKj4HUCE0c819h1frzO
         kJmwOwHxRAaKrZRTAAKyZuHH4AjWWJUKcx4yGOri8aN9HdTlbH8cIqaNUaHYKW+Iq9Cn
         8U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767830359; x=1768435159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow/N1ZmXxzwSWBbQdkni8/opm9FVLYZuNitVYYOiRVw=;
        b=CWubbjtfJP1q0hgsnXx0tbf2sXtfnPAx2B+uWZ9xHb8Ko+hCumdMzPP4LfvxcxMc1Q
         rydtgpdlb4o3SzNN8wIOiHNxMTewIV0niFJegAQCBikuLfTj79dojoPLzcY9fdMPMUfN
         vz/Qs1YVhS0a4uPHWATjbZ8yacDJuE4wqqaVsfc3sSv253btAPsorqS2FJuXEli5ErfT
         7FK9wBdmnte9sBhV4XRqMK2UnAAzytG2p+GOJfMsb6bwCjLV6HGE3OrE2YDmxJAwHgwl
         eGROhRwgkN1nsXjREvWeYGUSXNhbF20+ZN2UyqXxKaZb9y/HZuT0yNNlS+nC6jPCXT++
         R+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuXTVNVcmjbBE90fA3Rk1uFJdh6qURF1X+tMu0kg8EBIuuYNJlZQfnoGANGG6SqnSHV3XzkFYnZWNGY9m1TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbrnO3x3lnXkutRIQtrSoVv2/VCWzjUOxXt89dbPow+y+KViTT
	agmWKkpQ9xZ68nM6MJw55WgIOhswoD3d/j82TgYKKOLpStgYmhiXSBqL
X-Gm-Gg: AY/fxX6VfR08z1DqlksHtduuZoOJ3GNI9hL1tU+mlj0MoJ+KgGfVcHVCQub8ieNTMYU
	mLhlI0bXUFRsaWq4S1VIWE2QHlK0sSHU2qHm4YA8EE3PFDeGk6YZl/Ng+nmaadMhmvmiRLlirsf
	oAiCod/KZ+ST6NFyCBopJKMDRAcKm8K74upSBpHr0dzDWfocd6KGLgJjSK51VfXnId1Z3Oniktb
	ocfb82aglTqSpqNGxQvHDEYwJIxVgoR9GVqJ7fbtCnUmrUSIl3vp/A0FzH9Gt0HbjP+dhi0R2uX
	1Ri7AmoJem6txb9K63DzTmIAG2ijh+/R5kYqXEfkSV6Fnr2Zyr82gzAi0srxWUGirJZLniQEJcu
	t/GPTYWI8iyD7BLvebqrCUh8qpbRqL+RXH1WstqgALuqyvng0vkyDqwE6Hu4aJ7fooQckunqN2o
	rqkkZw02kc0JcPQ+xAHwJaCuJ4HXsL71IcxWkMS+ryeZnQvJc6+n77XWbXcUgkdg==
X-Google-Smtp-Source: AGHT+IGfrkkE0hYmjK0ILmh3K/kZejxlXODxyO34FTc9ytt1XAcCPbGCLVKjTQvst9SPM2SDCxwEXQ==
X-Received: by 2002:a05:7301:22a6:b0:2a4:630b:c789 with SMTP id 5a478bee46e88-2b17d32138emr2505418eec.37.1767830359322;
        Wed, 07 Jan 2026 15:59:19 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d60b1sm7959708eec.31.2026.01.07.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:59:18 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zbowling@gmail.com
Subject: Hi Sean,
Date: Wed,  7 Jan 2026 15:56:30 -0800
Message-ID: <20260107235912.105028-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_155921_114986_BC736B6B 
X-CRM114-Status: GOOD (  15.77  )
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

This is a backport of the mutex protection fixes from the MT7925 driver to the
older MT7921 chipset. The MT7921 driver has the same mutex protection bugs
because MT7925 was forked from MT7921 and inherited these issues.

I don't have this chipset yet but I ordered it but someone else tested
this patch and solves a crash they had.

This patch addresses the same root cause as patches 2, 3, and 16 in my MT7925
patch series (v3 00/17) - missing mutex protection around interface iteration
when callbacks invoke MCU functions.

The key fix here is moving the mutex protection inside `mt7921_roc_abort_sync()`
rather than at call sites, to avoid nested mutex acquisition deadlocks in
suspend paths. This matches the corrected approach used in the MT7925 patches.

I hope you can find time to review the other 17 patches for the newer MT7925
chipset.

Thanks,
Zac

From 98175b0fa30d17f3afa3ca393cf6422e8587e033 Mon Sep 17 00:00:00 2001
From: Zac Bowling <zbowling@gmail.com>
Date: Wed, 31 Dec 2025 21:29:32 -0800
Subject: [PATCH] wifi: mt76: mt7921: fix missing mutex protection in
 multiple paths

The MT7921 driver has the same mutex protection bugs as MT7925 - they were
inherited when MT7925 was forked from MT7921. Several code paths iterate
over active interfaces and call MCU functions without proper mutex protection.

Add mutex protection in the following locations:

1. mt7921_set_runtime_pm() in main.c:
   Called when runtime PM settings change. The callback
   mt7921_pm_interface_iter() calls MCU functions that require
   the device mutex to be held.

2. mt7921_regd_set_6ghz_power_type() in main.c:
   Called during VIF add/remove for 6GHz power type determination.
   Uses ieee80211_iterate_active_interfaces() without mutex.

3. mt7921_mac_reset_work() in mac.c:
   After firmware recovery, iterates interfaces to reconnect them.
   The mt7921_vif_connect_iter() callback calls MCU functions.

4. mt7921_roc_abort_sync() in main.c:
   The function iterates interfaces and calls MCU functions via
   mt7921_roc_iter() callback. The mutex must be held during
   the iteration, not at call sites, to avoid nested mutex
   acquisition deadlocks in suspend paths.

These bugs can cause system hangs during:
- Power management state transitions
- WiFi reset/recovery
- Suspend/resume cycles
- 6GHz regulatory power type changes

The fix follows the same pattern used in the MT7925 patches, with
the mutex protection moved inside mt7921_roc_abort_sync() to avoid
deadlocks when called from suspend paths that already hold the mutex.

Note: Suspend paths (pci.c, sdio.c) that currently wrap mt7921_roc_abort_sync()
with mutex should be updated to remove the outer mutex to avoid deadlock,
since mt7921_roc_abort_sync() now handles mutex internally.

Signed-off-by: Zac Bowling <zbowling@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 6 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db73f..f5c882e45bbe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -693,9 +693,11 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	clear_bit(MT76_RESET, &dev->mphy.state);
 	pm->suspended = false;
 	ieee80211_wake_queues(hw);
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_vif_connect_iter, NULL);
+	mt792x_mutex_release(dev);
 	mt76_connac_power_save_sched(&dev->mt76.phy, pm);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 5fae9a6e273c..05793a786644 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -619,9 +619,11 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_pm_interface_iter, dev);
+	mt792x_mutex_release(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt76_connac_mcu_set_deep_sleep(&dev->mt76, pm->ds_enable);
 }
@@ -765,9 +767,11 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 	struct mt792x_dev *dev = phy->dev;
 	u32 valid_vif_num = 0;
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(mt76_hw(dev),
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_calc_vif_num, &valid_vif_num);
+	mt792x_mutex_release(dev);
 
 	if (valid_vif_num > 1) {
 		phy->power_type = MT_AP_DEFAULT;
@@ -370,9 +370,11 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy = &dev->phy;
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state)) {
+		mt792x_mutex_acquire(dev);
 		ieee80211_iterate_interfaces(mt76_hw(dev),
 					     IEEE80211_IFACE_ITER_RESUME_ALL,
 					     mt7921_roc_iter, (void *)phy);
+		mt792x_mutex_release(dev);
+	}
 }
 EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
 
-- 
2.51.0


