Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C30D2ECF7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLLa5fZdpzWHQDj1zzbC4zgrpjcPTG+wEA6kFtMuqxE=; b=eZ+/df2ynEczz66wukENkh2KUu
	VHv5RWBZTw6mnsJaHXeyMyw3chtTMSwskan7jkhNAwNQ/u8i4vZoO6X0HS6GQghVn700H0M3N1io7
	RJYQnuQzUunMSWvL9INYAAeXkE+CKqoT7V1UNkTb6r/uRGDKXgM08KOegea3XPvCtbkvMAoKm2RQs
	Ih2ThWxjSy6QxngkWl8n8q8T40yIj3WCiNsJlzTosqOYpE/BUZu4TI16+kbTpm/m7Fg22Hk2GInXM
	SemPug3B7vfTJScJidruR5xz9AC59o6T/yDdlnN9TxdsZ7g/Z+oaGNRVTA4WADmVLVGb/Hu7uvK7o
	BJ8wpKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ep-00000003Gfz-1lG9;
	Tue, 20 Jan 2026 06:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Eh-00000003GbY-0j9b
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oLLa5fZdpzWHQDj1zzbC4zgrpjcPTG+wEA6kFtMuqxE=; b=Kb2YFpxtZembO3Fq8l9ydNZ1fL
	kMvwuC6deKJ+NRb07xx/dEwolC31EoyhQQhlRiQ/8ICyxVqHNNDHbjt2uQIimElMSPD50egxgS7vl
	AyV4mtnkTtgHk/FOoSC9OcUaNIj3lObwEr0HYJzfKz+ugjiULHXZ/NpFXSwsR3m79wVbQiAmxoQgq
	uFi8Ih3SX+Tya+5QM71McjSwMg1+dZWBmNaDlWD1APdxpa1y1bwhD0WEuegzIYgON9J2Az/vH0g4I
	itMhynQtgJFN/EpY3QZUceg0LDpjTbY24jv4YucNXeMFu7KLQaS+bYqlq3ogPrEW//muQ5vTOD5BO
	vTwvLT4w==;
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ee-0000000DP6H-1pPi
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:06 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso5984517eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890542; x=1769495342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLLa5fZdpzWHQDj1zzbC4zgrpjcPTG+wEA6kFtMuqxE=;
        b=R/B6lu+Wjvm8lwXumO7Sx4Auxiln+cm/ZGGz8a1+XYwg4RU84gZ171ItBIObalyZlN
         Z65UGaS8rMGdC9fPlmV6G/2ft41ekKw7FbDIF1gFpcpmZLlBTkcap1B/UTif03hHmVgg
         /QUolGklLWJhz97TU35KAJzhj4VS+E/tHgc6GLCiJKOJlYQMBI5j719rUlyZlk+sZ44G
         lOkj1VueW9BxhurRZQ8gLgJGUDbfOy8pD2zjI3/IukEMuwNeDZUccq0yGB6KrtTkq9DW
         EoS79TaVNLxhw3TO670UWgnXC7RCcZnEwbaCKBv/smuL3p0B0Xtu0/e4P7cib9wyJvZS
         aoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890542; x=1769495342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLLa5fZdpzWHQDj1zzbC4zgrpjcPTG+wEA6kFtMuqxE=;
        b=epgZ8CwZQyKUEieizjfpP1LdTgOaTHJw6IssAy5C7V6LxbzSWTLQXYNy4MVn3XktIz
         9Kyxocl5SM85wBlDcihRjBiyClOpxpqrNbwC7ufxI/Nuwezz3oscYK0TCRfWB9ibsmOy
         fNxr+spzmhpDecn6t3I1jyfOXet2+SylLVtOzT9m2xKvrDWBkPTzNhvsU0vzS6odx9Ya
         z5+j5spcPW23RfLveLrRFOhZUoHu9vQ/VSOBIqLzP+ab6A+bwlAhAk1lgyzmFrIAWTjA
         ZPyFfeM6PZzF0Y2J2EnnrgKH/08W0IIpuw0PWFcbI1UVUqBtS5GTyyeEyp3NG4wTdGgX
         FuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRpxkNzL14zh6rgKsN9n+2jHhizR+AGkckvMOAZge0FF+5dzsDTFSQB3CYfeOACnUCgtGulA1RWgaZjLY7Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhW3GRolBhTuCd0Qa0bnbt3HR40yAeMvJyjf78/YkWLLx8r/nM
	o5BvP3lJztCBCC6yZSNMd/5qyHzNzzEsr0FLInJorrcrCSBN9a/6TQ49
X-Gm-Gg: AZuq6aIR/QfXnndtBrc9OhZsxT+0h6Az2WAkPPhe8vHHCQdOowS5J0MioJuuEeKV5h1
	8+UKTOIfCVQ/XFLVpRsXiCmZCAUez8yXTrqXd7Y0IeEtS3DXTJ7BG9uk+A3o+ptrJstDo7mN3rW
	hyd1o6yCj4yKDKGVQMax/nSN7Edb7+lnTyUV5ZwziAwWgkLnvG5uCHlb8AEcjJP7Cu8TsiNQenq
	L83IiXZXzTVDkkMyMNsTf2tX1qr1eZz75BHWUnuF6ZfCYblejk5maFg3OuCJuiYvFFpXly+ouWp
	/mNtocEVUrIpMz11/OC5J/AfG3fnpdNYLdyQWT76otron2n1emAVMCz2kRwy59nWnfedrbe4CnA
	x4t41u9ZsnWd+kAiEINqHDYJEnXughXVSQsP7WhwkAyEJlCvT1QdBvSS9x/BaXddtu6qM2Jd3wT
	LxNbTUQT53uEH9cM05a4Wk5TMkSU7SuAN/N/aisDcuRxgSke6HKSMGB08cse/m
X-Received: by 2002:a05:7301:5f85:b0:2ae:5af4:7d65 with SMTP id 5a478bee46e88-2b6b410b608mr10898547eec.31.1768890542196;
        Mon, 19 Jan 2026 22:29:02 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:01 -0800 (PST)
From: Zac <zac@zacbowling.com>
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
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH 04/11] wifi: mt76: mt7921: fix deadlock in sta removal and suspend ROC abort
Date: Mon, 19 Jan 2026 22:28:47 -0800
Message-ID: <20260120062854.126501-5-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062904_615836_20033CFF 
X-CRM114-Status: GOOD (  14.18  )
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
index 9315dbdf8880..07d1d0d497f1 100644
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
 
@@ -887,7 +903,8 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
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


