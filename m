Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B4D2629E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohSMRLjuL2909kuGww04u5932kdmhx8B4cMtMffQj3Y=; b=K3Ux1uZ1NtG1gijuVi4mE6YM/o
	8ZX1So/WSySz00/STyAlhYymlKOorUOPvNdOcuynDEP+1aWDd9WkT4/JdSjftfqFj/XZEh1zuE69g
	2d4qaC6eGj9DRbH3Ryw8wROe+6lpSncwML8X+NWjrPvwxA4gYsmimcNcmM9eCaJ4FPqJXlhvD+/s8
	XfDuFSCU9hUcJPbHIpDoMNAq7NRpAshJkffGW20MKvoFZ78XPmob/fWi5b+c5t24SrDD9M/l5WdQG
	K//WzcUXQG6EwaMBMlGYK2hjHCoF/CTPDiBTsAIqcRmbrn2jKNb9im7xoPLVc5YqmtzLx6LKMxYEO
	AtT+Zcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4F-00000004QCM-0kea;
	Tue, 20 Jan 2026 20:11:11 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI44-00000004Q6y-0ojs
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:09 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-121a0bcd364so7426995c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939859; x=1769544659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohSMRLjuL2909kuGww04u5932kdmhx8B4cMtMffQj3Y=;
        b=KGLcxpu+KIep2iInyoEX3cPRToqqLPZMXg/mJBgnIJHX+nQ1dY3G2Tc2wl/58bv+Dj
         +CI/puER2Oh+6/Hh01o802GaBFQ7bHQ0k0k3m0F0lZo9c4/t4WHjAm+Bxr1OVLN/twnW
         ql6sOOvCnecSGUCZIvHTY0oB+2EEjVqwIqhlfprmLikoZBrg1jUKy7GP10IkefFJqkG8
         yEmEdyDN7ab3mHKS1bh79Jymn7K1puu6ZG72V+nQR0JVzBKzIRJuDy0XV5jJqLDsp9no
         Ovb8fL/2ICWyRhWQKBEESvYBTHj3/GZ/cKudjPa11/JpAG24VEqoJj4JYjLZ6ip1HQag
         cSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939859; x=1769544659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohSMRLjuL2909kuGww04u5932kdmhx8B4cMtMffQj3Y=;
        b=W6edrIUvKIYBd3USyaQPcX8QvmuJPk7ROA8F1YRaetC11jDyis8RIePD7wb68B+rFK
         Tigu0oDhGJhFRE8NG7pXJMTxtvS9bBGvSgkeoY025weaQxl4+9Wpl1Po+fuuX/X2Dn4k
         OFnxPIgjHDKwx2JGrbIEFbPWrByNwV3XfVzwTxcnQkKTEvqKvliiQkcFFGJEZapP8Qly
         q6eRnbzOwwp8KHKbJPTBeAlivV1/a8bxJCTTcpTOgAHDn1ln4nrvx9UBvsiwpvTBuqpS
         OtD6Qil6jMu7cj5ARrq+ZcEmYEsRawPiPPlVzBFNCcqRk590ojqEnf6u4AMNI2YLwhCF
         85cA==
X-Forwarded-Encrypted: i=1; AJvYcCUdBt0Z3ybUjE+8G6OP7LYSMMiqvO3rZJlZCk7WP0aiGcYQyAVIujM2wpVs5uqPyO8dgKyYhxLWpvfdmHS34g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMiBPzdlKH9f+MDhVpg3XBwponqJFBMq6YvoZivzqg0f0/PqNx
	Ah4nU4h2UFk+f37BJok6SbxxtWGUTtg2ZJQFO7boN13YWtpYBtX8RXc8
X-Gm-Gg: AY/fxX4CjtWa/jAQhvlQ6w43u/WKGX1mZZ+9IpQEI5DVipxBJT5zXTBQ8vMjlplmc3H
	ijAhQx9n3YZbLO36WGfCcID7R/fHHNvKSmiP72Eb0dx0KjYiwbx+54nxXna17bq2KZ1XL67BYJS
	GQCGMUXZxffYh3FhWMgE44aNEuNGsrLLX3crWPUC2c8ltIo7zgdiFrnXqkgRUnhoIUhAS4TXh5h
	EURKSxnGUypsq73/ZWKmp8gAg9+edbVtQTZJgRSKCHRDAGJ5bNIbydmIjLoTv+6vJkw1rIqhlwh
	hJFkXuJRog5YeZkNOY6n6+gJdz0LGIko8o+4N2AdVU/BKuiXTn0csDcl6y891rO0hEG9PKVTPoj
	D3s64uBvhSi+G8nDGmPjQxf72Ios0jezlG8mvzRhSDAcQweo2b76InZ7zKeQme62dPVKg5g90S3
	MhqHKnEESBml58KyYWzApaWpdAqSOVnr+mK8Eco3OrmN2sulx7a5cxy330pApiLQ==
X-Received: by 2002:a05:7022:1288:b0:119:e56c:189d with SMTP id a92af1059eb24-1244a71415emr11839754c88.5.1768939858961;
        Tue, 20 Jan 2026 12:10:58 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:10:57 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 05/13] wifi: mt76: mt7921: fix deadlock in sta removal and suspend ROC abort
Date: Tue, 20 Jan 2026 12:10:35 -0800
Message-ID: <20260120201043.38225-6-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121100_239133_7C1875E6 
X-CRM114-Status: GOOD (  14.37  )
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

Fix deadlock scenarios in mt7921 ROC (Remain On Channel) abort paths:

1. Suspend path deadlock (pci.c, sdio.c):
   - Previous fix (b74d48c46f) added mutex around mt7921_roc_abort_sync
   - But roc_work acquires mutex, so cancel_work_sync can deadlock
   - Fix: Remove mutex wrappers since mt7921_roc_abort_sync doesn't
     actually need them (it only calls timer_delete_sync, cancel_work_sync,
     and ieee80211_iterate_interfaces which handles its own locking)

2. sta_remove path deadlock:
   - mt7921_mac_sta_remove is called from mt76_sta_remove which holds mutex
   - Calling mt7921_roc_abort_sync → cancel_work_sync can deadlock if
     roc_work is waiting for the mutex
   - Fix: Add mt7921_roc_abort_async (matching mt7925 pattern) that sets
     abort flag and schedules work instead of blocking
   - Add abort flag checking in mt7921_roc_work to handle async abort

The fix mirrors the mt7925 implementation which already handles these
scenarios correctly.

Fixes: b74d48c46f ("wifi: mt76: mt7921: fix mutex handling in multiple paths")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 29 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 --
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  2 --
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 196fcb1e2e94..f3941a25fd6f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -367,17 +367,24 @@ static void mt7921_roc_iter(void *priv, u8 *mac,
 	mt7921_mcu_abort_roc(phy, mvif, phy->roc_token_id);
 }
 
+/* Async ROC abort - safe to call while holding mutex.
+ * Sets abort flag and schedules roc_work for cleanup.
+ */
+static void mt7921_roc_abort_async(struct mt792x_dev *dev)
+{
+	struct mt792x_phy *phy = &dev->phy;
+
+	set_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state);
+	timer_delete(&phy->roc_timer);
+	ieee80211_queue_work(phy->mt76->hw, &phy->roc_work);
+}
+
 void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy = &dev->phy;
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
-	/* Note: caller must hold mutex if ieee80211_iterate_interfaces is
-	 * needed for ROC cleanup. Some call sites (like mt7921_mac_sta_remove)
-	 * already hold the mutex via mt76_sta_remove(). For suspend paths,
-	 * the mutex should be acquired before calling this function.
-	 */
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		ieee80211_iterate_interfaces(mt76_hw(dev),
 					     IEEE80211_IFACE_ITER_RESUME_ALL,
@@ -392,6 +399,15 @@ void mt7921_roc_work(struct work_struct *work)
 	phy = (struct mt792x_phy *)container_of(work, struct mt792x_phy,
 						roc_work);
 
+	/* Check abort flag before acquiring mutex to prevent deadlock.
+	 * Only send expired callback if ROC was actually active.
+	 */
+	if (test_and_clear_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state)) {
+		if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+			ieee80211_remain_on_channel_expired(phy->mt76->hw);
+		return;
+	}
+
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
 
@@ -888,7 +904,8 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 
-	mt7921_roc_abort_sync(dev);
+	/* Async abort - caller already holds mutex */
+	mt7921_roc_abort_async(dev);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->deflink.wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 9f76b334b93d..ec9686183251 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -426,9 +426,7 @@ static int mt7921_pci_suspend(struct device *device)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
-	mt792x_mutex_acquire(dev);
 	mt7921_roc_abort_sync(dev);
-	mt792x_mutex_release(dev);
 
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 92ea2811816f..3421e53dc948 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -219,9 +219,7 @@ static int mt7921s_suspend(struct device *__dev)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
-	mt792x_mutex_acquire(dev);
 	mt7921_roc_abort_sync(dev);
-	mt792x_mutex_release(dev);
 
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
-- 
2.52.0


