Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D8C2A078
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKmv9Qie7cHueSzyzaZ+QRp9Y7zf25ySeMeR1g7IWf4=; b=LCfCBVfjFVB/038/6magNEibxr
	wWOrvgEhuhRZTeMZbqj3MRBDrmMaNTZOQgRTlqUMkMR6aX4pinXCMF0u9IUIqfki6bEJcJiGH5YRl
	tf6TPIlaxICzhhA7N2/QdTG2enQ3R2JQwhlH+GKa+Psg86G3sOk3Kc/OPb4kSANDCPb7aTBh7EMiK
	akkV15NbSxXuBVphIFr2lIYbkW/aLy+SlzDe/viiGxPh6UHDSENfmGLR6Fiu8r1S2OCOYfy4Ym3Q5
	i4jRy72z4RYzgbc3xwnnd7Ug8ZWUEpMomA5movNc2y2+BMuvx1YKzjWYoMRCvHrtRUoOUxkE7anti
	pG1MtsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQz-0000000AZrs-1D0C;
	Mon, 05 Jan 2026 00:26:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQw-0000000AZpT-28Sc
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a2ea96930cso153442815ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572813; x=1768177613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKmv9Qie7cHueSzyzaZ+QRp9Y7zf25ySeMeR1g7IWf4=;
        b=hfxuxIX+He0xZb3Su7b/WuibLvumvvbWEqZvFRdlLJVhCNNtsbh+q1e+OpWFcopcBZ
         S4RC7DAgcYJDAtv277fvdXWI00m82xE9hWYmzVlir2CZfr+lANGGIOUJDFOKmUUDTlwZ
         UdBBuFo+mIwoKzZuwubf1xFrzoEP+jmgT/K1lNEBfCgYGCBA2MFtb/Irxll7rtGHaeQn
         WWmV2AWJS/DwFwTD0gP0a3tLRymMw2PVdx5/QWj/d7adnR5au8I7s5iKpxGNLXF5HJIt
         Uq7MX9kBm7FTkAniWuWKRRcUyMZPmSwaNP/MhlDK24ojdoA8qMvc1SROZG5AG1lrK6Mn
         8Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572813; x=1768177613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKmv9Qie7cHueSzyzaZ+QRp9Y7zf25ySeMeR1g7IWf4=;
        b=HC/0EL3N1vxJJCBD5L2UO1I9Z/t2RcH4TJzDAYHG90grwuvIGoQXkmoQuAyBYErrO0
         kScE/nKoZUUfrQWUcBJLo8ehZ9Ym3aSFNsrYQvKWV2gESrjZdb7OgaUQaJUD7ovYHDeb
         4A9zc0Mw7hRwe1S6iYM85tKh7wsu0SpgLTAQJiRZAuqQ5vxu8kF+Vlkalfu2IbfftJjF
         um3XenqOWi+WnUyL42FuR0PBaaWpHnKpbCVzRdo6zkqUlYWMk1XpigJv1msH/MRRHpo7
         +I751IXmr0aVecivp3PMziGo4wUU+S07KHECa8EyOhQg05/gTWvW7W22CjrwyWnAeM3r
         t8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVf7jhQxoGPDX/rm2rT/V2N5bi/XYloxW9xZNAlEharDp1PwZW2vFGMzRWjJ7aXFeg8TvgqBai3hVgpoejxVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy6X539K9rGGg7g6nghyB/L5v2NeIGkxNJ5K9h6ReBbxzZIGIO
	79M6CKXCsuVwqimkMtTrkiHbRLjZpM01p/ZZV1cSx8fmszp9SFYi2Wr/
X-Gm-Gg: AY/fxX5STtVX8rhSHnHK2Q53NTwWm2MFzzbRKxceMLQk6R5njHJbmGr82damaSu6UqO
	6zv2zSSGCnfOeUhxdcW1gOTWImcVrBYD+K1XAGHmq7CAttMK0+hb21BTCDvF429rYwJr8FamAcI
	6ixkuy0RDp8O65tAjrVxp2jpjqJ63ythwp7xfr+sO5n6oMFg0dE1UJcY6yqM3DsGWNs2mXHYfEr
	GzPgoRb7JmwlbQrB7bL5TivzhzvxTVPCNTGTTJJWStyFNDpRATdOwAa0uHKR/py5XKC45DyZ3A9
	zu1qp6uZWXiSU3XXycRxRWP0lbBZsbJ9ad/cqvQruFW+QWI5kHKDgawtNBy9p+hvmCOKA0G4SfX
	Q5gH817gLkqaJPWx7kzZxl+mAt2kIgeXcJ+jhgRNKV2huCwV7A9v6n4LtdNt+LFs1LzXXCpHkSU
	iTBXgTw4xjMsxnNiq8MncArSTtI58y0ZUYSEalOsTG+p+K6SawOElUaetJeEc4Gss=
X-Google-Smtp-Source: AGHT+IHPaxepL+KOGt5lEUs7jq6bBXnQPyHoe1Q+qdF+4qNFKzLPWnvGSkSBMjp0qzTTzzBqY19MxA==
X-Received: by 2002:a05:7022:ef0b:b0:11b:8161:5cfc with SMTP id a92af1059eb24-12172306ccfmr47077126c88.36.1767572813355;
        Sun, 04 Jan 2026 16:26:53 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:52 -0800 (PST)
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
Subject: [PATCH 03/17] wifi: mt76: mt7925: fix missing mutex protection in runtime PM and MLO PM
Date: Sun,  4 Jan 2026 16:26:24 -0800
Message-ID: <20260105002638.668723-4-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162654_604958_2972B474 
X-CRM114-Status: GOOD (  11.34  )
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

Two additional code paths iterate over active interfaces and call MCU
functions without proper mutex protection:

1. mt7925_set_runtime_pm(): Called when runtime PM settings change.
   The callback mt7925_pm_interface_iter() calls mt7925_mcu_set_beacon_filter()
   which in turn calls mt7925_mcu_set_rxfilter(). These MCU functions require
   the device mutex to be held.

2. mt7925_mlo_pm_work(): A workqueue function for MLO power management.
   The callback mt7925_mlo_pm_iter() was acquiring mutex internally, which
   is inconsistent with the rest of the driver where the caller holds the
   mutex during interface iteration.

These bugs can cause deadlocks when:
- Power management settings are changed while WiFi is active
- MLO power save state transitions occur during roaming

Move the mutex to the caller in mt7925_mlo_pm_work() for consistency
with the rest of the driver, and add mutex protection in
mt7925_set_runtime_pm().

Found through static analysis (clang-tidy) and comparison with the
MT7615 driver which correctly acquires mutex before interface iteration.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3001a62a8b67..9f17b21aef1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -751,9 +751,11 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_pm_interface_iter, dev);
+	mt792x_mutex_release(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
 }
@@ -1301,14 +1303,12 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	if (mvif->mlo_pm_state != MT792x_MLO_CHANGED_PS)
 		return;
 
-	mt792x_mutex_acquire(dev);
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
 		if (!bss_conf)
 			continue;
 		mt7925_mcu_uni_bss_ps(dev, bss_conf);
 	}
-	mt792x_mutex_release(dev);
 }
 
 void mt7925_mlo_pm_work(struct work_struct *work)
@@ -1317,9 +1317,11 @@ void mt7925_mlo_pm_work(struct work_struct *work)
 					      mlo_pm_work.work);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_mlo_pm_iter, dev);
+	mt792x_mutex_release(dev);
 }
 
 void mt7925_scan_work(struct work_struct *work)
-- 
2.51.0


