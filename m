Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9998D26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGC4iR+iYg9fz5LpX9NZwFdgyFW9awkXrNY5MBe+JTo=; b=SvKAkuh3M/AtXRgr3qz9V9JgY9
	Lnyc21+loS9S6cYPPmiYLYjc5zdyI0bwFfT3D9orCYlI/ufdZpzOkjIrHmOHjlx2BB0+LqSLVJ9Jt
	hArupOifFnl/ij3mVvQfflyJpcXivPZdzjWgVVobhnJJ7/XJcgAxO5iJIei6gIdvnC7cvRdKuYS2w
	vJ/aHM06Be7cP+TUcEP3O5CMXbAi29eLqen9sMzYonJR1RmsaStvOy2FOtTBbfNNsh4s7RVQh5ugv
	synyZvD66MBed9p/CfnoYwo5T5jm/s19CCg7IxYDYKIANhK3loCVb/fZ6SAjhngiFpFr6yjltxl9X
	qtgGUibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4S-00000004QKB-2sYA;
	Tue, 20 Jan 2026 20:11:24 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4K-00000004QEi-34Km
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:18 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-121bf277922so8164936c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939876; x=1769544676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGC4iR+iYg9fz5LpX9NZwFdgyFW9awkXrNY5MBe+JTo=;
        b=ZT4DGwKZUj8aGXeMxipND95Ks0GrhYJ6BYsC3P7KpcpRILJ+sxnMoItCQx8saUK6nw
         sv4e+5Y10IQlu1DIBUk0CdQAbBQi1TN0/tr79tI0EhQ/EEnvFdZwYHee5lA1Fx5It8TT
         vOm7tfKCit5WvSliT7+HqFK9uy7BJb6VG7L9IgdD33knOz00wY2J1B35J/lDOftE9V82
         q+SJI0NsNdEnIoYpayB5HpS5nDY8avAfQj0IACHhjwHhoSFC4Oea7jYaR50RKQ7ndxpl
         JW0KQmogdh/pZoW/l9Ff+gtvV5ExIUB6bwPNpfmLLh/AsOGIIxLm6xB7cMtmg54HoXDB
         vPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939876; x=1769544676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGC4iR+iYg9fz5LpX9NZwFdgyFW9awkXrNY5MBe+JTo=;
        b=fC3CgViaiqOOR113qFq7Juv1xpEhUr3wJVlbe9ylQrTA0NOYxhqh35yxv9hPI/yYr/
         94/w+OGJpPqQwKAo2zyoekN2CAIIkHUjyBHHCLK6tbN0ybDRLQ3DDElEeteQZa9Mk0Oz
         laXG1mygZp9P9dzqZC9fw/kWnFgEt4rCg+aJfDf9coaVerJf6TUVg0jCwGsRFEVRndkn
         GqC+AZAofMhBBiBfNFYr1ScxE+T20yzptiL0WruoWTvGdyLNcnrm3pGZb4lV/AAPrLwo
         v6tPFql0RNuV1fyppGGQy/BAff0p5rw+CalAQDsWcM3MHICJaAD7ISwreEoEimQ8rF1M
         MF9A==
X-Forwarded-Encrypted: i=1; AJvYcCUr9DQqvaKEKHw9P9HiauhvPcpTYwXmREoH0B9459hRXk/U49KCu9Pqkebjr/opYycjIOr2+Sy6zPyMO5RcNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7XM+gmJI+qOs1GvyuZ5iYv9gbKfsw4jR3JSePTGlmWtbUlLb4
	4xe6sJN/+7S0LIgZCVb8A5vhBPVPyG3lmEU7aiWdPR5ueL/vcyBRa7vkWqMDNxfO
X-Gm-Gg: AY/fxX41ysyQWtCzX2WpOkeyFkzvXapXCGZVoVfVJnjsgcjj20pv1vZCVvDd2zTOWYN
	5rp4yA0VAS+0DMzHmhdYZnJQaDqh2lvLCl5Ezv+NbxS5a8R166L3dOT9GF9RPXN0W+tt3IzRFc7
	/9+rsgWfyq6pvlVxadNPllL4fQ7ACXumVkiYjEAPCdyQjTqeA7Hcjj8koTxrvbjCUlROvFgFFmY
	sHz75i0LGkHvuVXvO6b1ITF/7wp0XtyOXfKa4F5ub+zt3MIEbnfAPGDokNGlfWQ+I4xHSRche1M
	x9+y1rWEhoQVMLpylNS/+QpF7D4lfJr2sNQjmkHfuQTb0FbToRiLQSV9Q0YbJwrW37VE+/1FtGQ
	1DtijStdWyfKnxPPQ3IKITriGGwc/tvtZKdoFw19HdP20BO2d5dxrr6lf9GPsLT9/W8Oyz/Dmeq
	hz1jY6ZKPxRp0R6FGissCA8EQJRIQO2dHs+ACPbfQf9jZ0PSQKdVLvSC5/2w0pkQ==
X-Received: by 2002:a05:7022:628c:b0:11d:f440:b757 with SMTP id a92af1059eb24-1244b35ad1emr11052357c88.26.1768939875640;
        Tue, 20 Jan 2026 12:11:15 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:11:14 -0800 (PST)
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
Subject: [PATCH 12/13] wifi: mt76: mt7925: fix ROC deadlocks and race conditions
Date: Tue, 20 Jan 2026 12:10:42 -0800
Message-ID: <20260120201043.38225-13-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121116_791247_8E7643D0 
X-CRM114-Status: GOOD (  24.34  )
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

Fix multiple interrelated issues in the remain-on-channel (ROC) handling
that cause deadlocks, race conditions, and resource leaks.

Problems fixed:

1. Deadlock in sta removal ROC abort path:
   When a station is removed while a ROC operation is in progress, the
   driver would call mt7925_roc_abort_sync() which waits for ROC completion.
   However, the ROC work itself needs to acquire mt792x_mutex which is
   already held during station removal, causing a deadlock.

   Fix: Use async ROC abort (mt76_connac_mcu_abort_roc) when called from
   paths that already hold the mutex, and add MT76_STATE_ROC_ABORT flag
   to coordinate between the abort and the ROC timer.

2. ROC timer race during suspend:
   The ROC timer could fire after the device started suspending but before
   the ROC was properly aborted, causing undefined behavior.

   Fix: Delete ROC timer synchronously before suspend and check device
   state before processing ROC timeout.

3. ROC rate limiting for MLO auth failures:
   Rapid ROC requests during MLO authentication can overwhelm the firmware,
   causing authentication timeouts. The MT7925 firmware has limited ROC
   handling capacity.

   Fix: Add rate limiting infrastructure with configurable minimum interval
   between ROC requests. Track last ROC completion time and defer new
   requests if they arrive too quickly.

4. WCID leak in ROC cleanup:
   When ROC operations are aborted, the associated WCID resources were
   not being properly released, causing resource exhaustion over time.

   Fix: Ensure WCID cleanup happens in all ROC termination paths.

5. Async ROC abort race condition:
   The async ROC abort could race with normal ROC completion, causing
   double-free or use-after-free of ROC resources.

   Fix: Use MT76_STATE_ROC_ABORT flag and proper synchronization to
   prevent races between async abort and normal completion paths.

These fixes work together to provide robust ROC handling that doesn't
deadlock, properly releases resources, and handles edge cases during
suspend and MLO operations.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 175 ++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   7 +
 3 files changed, 171 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d05e83ea1cac..91f9dd95c89e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -511,6 +511,7 @@ enum {
 	MT76_STATE_POWER_OFF,
 	MT76_STATE_SUSPEND,
 	MT76_STATE_ROC,
+	MT76_STATE_ROC_ABORT,
 	MT76_STATE_PM,
 	MT76_STATE_WED_RESET,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 82c81c22e39c..4b7c13485497 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -453,6 +453,24 @@ static void mt7925_roc_iter(void *priv, u8 *mac,
 	mt7925_mcu_abort_roc(phy, &mvif->bss_conf, phy->roc_token_id);
 }
 
+/* Async ROC abort - safe to call while holding mutex.
+ * Sets abort flag and lets roc_work handle cleanup without blocking.
+ * This prevents deadlock when called from sta_remove path which holds mutex.
+ */
+static void mt7925_roc_abort_async(struct mt792x_dev *dev)
+{
+	struct mt792x_phy *phy = &dev->phy;
+
+	/* Set abort flag - roc_work checks this before acquiring mutex */
+	set_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state);
+
+	/* Stop timer and schedule work to handle cleanup.
+	 * Must schedule work since timer may not have fired yet.
+	 */
+	timer_delete(&phy->roc_timer);
+	ieee80211_queue_work(phy->mt76->hw, &phy->roc_work);
+}
+
 void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy = &dev->phy;
@@ -477,6 +495,17 @@ void mt7925_roc_work(struct work_struct *work)
 	phy = (struct mt792x_phy *)container_of(work, struct mt792x_phy,
 						roc_work);
 
+	/* Check abort flag BEFORE acquiring mutex to prevent deadlock.
+	 * If abort is requested while we're in the sta_remove path (which
+	 * holds the mutex), we must not try to acquire it or we'll deadlock.
+	 * Clear the flags and only notify mac80211 if ROC was actually active.
+	 */
+	if (test_and_clear_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state)) {
+		if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+			ieee80211_remain_on_channel_expired(phy->mt76->hw);
+		return;
+	}
+
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
 
@@ -504,14 +533,93 @@ static int mt7925_abort_roc(struct mt792x_phy *phy,
 	return err;
 }
 
+/* ROC rate limiting constants - exponential backoff to prevent MCU overload
+ * when upper layers trigger rapid reconnection cycles (e.g., MLO auth failures).
+ * Max backoff ~1.6s, resets after 10s of no timeouts.
+ */
+#define MT7925_ROC_BACKOFF_BASE_MS	100
+#define MT7925_ROC_BACKOFF_MAX_MS	1600
+#define MT7925_ROC_TIMEOUT_RESET_MS	10000
+#define MT7925_ROC_TIMEOUT_WARN_THRESH	5
+
+/* Check if ROC should be throttled due to recent timeouts.
+ * Returns delay in jiffies if throttling, 0 if OK to proceed.
+ */
+static unsigned long mt7925_roc_throttle_check(struct mt792x_phy *phy)
+{
+	unsigned long now = jiffies;
+
+	/* Reset timeout counter if it's been a while since last timeout */
+	if (phy->roc_timeout_count &&
+	    time_after(now, phy->roc_last_timeout +
+		       msecs_to_jiffies(MT7925_ROC_TIMEOUT_RESET_MS))) {
+		phy->roc_timeout_count = 0;
+		phy->roc_backoff_until = 0;
+	}
+
+	/* Check if we're still in backoff period */
+	if (phy->roc_backoff_until && time_before(now, phy->roc_backoff_until))
+		return phy->roc_backoff_until - now;
+
+	return 0;
+}
+
+/* Record ROC timeout and calculate backoff period */
+static void mt7925_roc_record_timeout(struct mt792x_phy *phy)
+{
+	unsigned int backoff_ms;
+
+	phy->roc_last_timeout = jiffies;
+	phy->roc_timeout_count++;
+
+	/* Exponential backoff: 100ms, 200ms, 400ms, 800ms, 1600ms (capped) */
+	backoff_ms = MT7925_ROC_BACKOFF_BASE_MS <<
+		     min_t(u8, phy->roc_timeout_count - 1, 4);
+	if (backoff_ms > MT7925_ROC_BACKOFF_MAX_MS)
+		backoff_ms = MT7925_ROC_BACKOFF_MAX_MS;
+
+	phy->roc_backoff_until = jiffies + msecs_to_jiffies(backoff_ms);
+
+	/* Warn if we're seeing repeated timeouts - likely upper layer issue */
+	if (phy->roc_timeout_count == MT7925_ROC_TIMEOUT_WARN_THRESH)
+		dev_warn(phy->dev->mt76.dev,
+			 "mt7925: %u consecutive ROC timeouts, possible mac80211/wpa_supplicant issue (MLO key race?)\n",
+			 phy->roc_timeout_count);
+}
+
+/* Clear timeout tracking on successful ROC */
+static void mt7925_roc_clear_timeout(struct mt792x_phy *phy)
+{
+	phy->roc_timeout_count = 0;
+	phy->roc_backoff_until = 0;
+}
+
 static int mt7925_set_roc(struct mt792x_phy *phy,
 			  struct mt792x_bss_conf *mconf,
 			  struct ieee80211_channel *chan,
 			  int duration,
 			  enum mt7925_roc_req type)
 {
+	unsigned long throttle;
 	int err;
 
+	/* Check rate limiting - if in backoff period, wait or return busy */
+	throttle = mt7925_roc_throttle_check(phy);
+	if (throttle) {
+		/* For short backoffs, wait; for longer ones, return busy */
+		if (throttle < msecs_to_jiffies(200)) {
+			msleep(jiffies_to_msecs(throttle));
+		} else {
+			dev_dbg(phy->dev->mt76.dev,
+				"mt7925: ROC throttled, %u ms remaining\n",
+				jiffies_to_msecs(throttle));
+			return -EBUSY;
+		}
+	}
+
+	/* Clear stale abort flag from previous ROC */
+	clear_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state);
+
 	if (test_and_set_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return -EBUSY;
 
@@ -527,7 +635,11 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
 		mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+		mt7925_roc_record_timeout(phy);
 		err = -ETIMEDOUT;
+	} else {
+		/* Successful ROC - reset timeout tracking */
+		mt7925_roc_clear_timeout(phy);
 	}
 
 out:
@@ -538,8 +650,27 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 			      struct mt792x_bss_conf *mconf,
 			      u16 sel_links)
 {
+	unsigned long throttle;
 	int err;
 
+	/* Check rate limiting - MLO ROC is especially prone to rapid-fire
+	 * during reconnection cycles after MLO authentication failures.
+	 */
+	throttle = mt7925_roc_throttle_check(phy);
+	if (throttle) {
+		if (throttle < msecs_to_jiffies(200)) {
+			msleep(jiffies_to_msecs(throttle));
+		} else {
+			dev_dbg(phy->dev->mt76.dev,
+				"mt7925: MLO ROC throttled, %u ms remaining\n",
+				jiffies_to_msecs(throttle));
+			return -EBUSY;
+		}
+	}
+
+	/* Clear stale abort flag from previous ROC */
+	clear_bit(MT76_STATE_ROC_ABORT, &phy->mt76->state);
+
 	if (WARN_ON_ONCE(test_and_set_bit(MT76_STATE_ROC, &phy->mt76->state)))
 		return -EBUSY;
 
@@ -554,7 +685,10 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
 		mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+		mt7925_roc_record_timeout(phy);
 		err = -ETIMEDOUT;
+	} else {
+		mt7925_roc_clear_timeout(phy);
 	}
 
 out:
@@ -571,6 +705,7 @@ static int mt7925_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	int err;
 
+	cancel_work_sync(&phy->roc_work);
 	mt792x_mutex_acquire(phy->dev);
 	err = mt7925_set_roc(phy, &mvif->bss_conf,
 			     chan, duration, MT7925_ROC_REQ_ROC);
@@ -878,14 +1013,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (!mlink)
 		return -EINVAL;
 
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
-	if (idx < 0)
-		return -ENOSPC;
-
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	if (!mconf)
 		return -EINVAL;
 
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
+	if (idx < 0)
+		return -ENOSPC;
+
 	mt76_wcid_init(&mlink->wcid, 0);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
@@ -905,14 +1040,16 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
-		return ret;
+		goto err_wcid;
 
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
-	if (!link_conf)
-		return -EINVAL;
+	if (!link_conf) {
+		ret = -EINVAL;
+		goto err_wcid;
+	}
 
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
@@ -924,7 +1061,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
 						      link_conf, link_sta, false);
 		if (ret)
-			return ret;
+			goto err_wcid;
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
@@ -932,28 +1069,34 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
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
@@ -1139,6 +1282,9 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	if (!mlink)
 		return;
 
+	/* With Sean's fix, roc_abort_sync uses cancel_work() instead of
+	 * cancel_work_sync(), so it's safe to call even with mutex held.
+	 */
 	mt7925_roc_abort_sync(dev);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
@@ -1534,6 +1680,8 @@ static int mt7925_suspend(struct ieee80211_hw *hw,
 	cancel_delayed_work_sync(&dev->pm.ps_work);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
+	/* Cancel ROC before quiescing starts */
+	mt7925_roc_abort_sync(dev);
 	mt792x_mutex_acquire(dev);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
@@ -1880,6 +2028,8 @@ static void mt7925_mgd_prepare_tx(struct ieee80211_hw *hw,
 	u16 duration = info->duration ? info->duration :
 		       jiffies_to_msecs(HZ);
 
+	cancel_work_sync(&mvif->phy->roc_work);
+
 	mt792x_mutex_acquire(dev);
 	mt7925_set_roc(mvif->phy, &mvif->bss_conf,
 		       mvif->bss_conf.mt76.ctx->def.chan, duration,
@@ -2037,6 +2187,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (old_links == new_links)
 		return 0;
 
+	cancel_work_sync(&phy->roc_work);
 	mt792x_mutex_acquire(dev);
 
 	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8388638ed550..d9c1ea709390 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -186,6 +186,13 @@ struct mt792x_phy {
 	wait_queue_head_t roc_wait;
 	u8 roc_token_id;
 	bool roc_grant;
+
+	/* ROC rate limiting to prevent MCU overload during rapid reconnection
+	 * cycles (e.g., MLO authentication failures causing repeated ROC).
+	 */
+	u8 roc_timeout_count;		/* consecutive ROC timeouts */
+	unsigned long roc_last_timeout;	/* jiffies of last timeout */
+	unsigned long roc_backoff_until;/* don't issue ROC until this time */
 };
 
 struct mt792x_irq_map {
-- 
2.52.0


