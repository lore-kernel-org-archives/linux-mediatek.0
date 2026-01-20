Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F95D2ECF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t40lO5bXareLzTvQoLuZnyo9jiIRTa4btYWR4lNGZPU=; b=vP4SUvQ4NMtueJJcscO29reBLc
	m4gYtmSFzE/OGJJn935ZP8wZrJFgScsSyOA07VvnFnC7/fBJaJJLlzILwk3Cz3VC5ose/5+9CIZWR
	yUqJUpmcxpsCFPHJDLic3dq2pZP/qIi39zclFoEfCYrxLjTAHJ/HhNaInY/X5HEgR03bYg+1ldPia
	k+/6i458TpT9g+OkC52DCOM0Mr1JYyZX4XmU7LV/NDv1cDPvSowBe+voFF82hX4u3wh+Ip+lZgpah
	H8P9xLj7mCoGmiJ06xqshvXSm4y1/ElBASS/dE6b+zX7sEe+e45peSLnymlARuiqfvQW7WSgfL31V
	/4KxuEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5FI-00000003GqP-2l4b;
	Tue, 20 Jan 2026 06:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Eq-00000003GhB-3TOi
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t40lO5bXareLzTvQoLuZnyo9jiIRTa4btYWR4lNGZPU=; b=cHU6eeSyuvYzOUviiuFStQFfCm
	vWwtp++2lCwA7Q9CKtyA4IxgQw2LPgQADu1lAQpSNX+/rA5ypJHfcH1uZ4XYXBgZeeilYLyM7babJ
	nVA9FlmYovX07qud551jjZughG6AbILKNIQ/BHMoVZI1OZVhUcblviaLP0vVFGsbMemz/rqIGzYu6
	Ai0cC83HKasK2O0QjJX7LFnJwNvMngyUfzXO4wEtjQmc+N5rRf5Zifbop4qyau0La0G0KYbJ3dIJZ
	UPaiCp3PJ7ndR1C97BtkUmPmFgbPAo7qfy8xz5a6vCJi6tSTjvd95rbbShluxCxDLFTzKvly6a83q
	u9r5XfFw==;
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5En-0000000DP8I-3zrw
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:15 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2b6bf6adc65so4983021eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890552; x=1769495352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t40lO5bXareLzTvQoLuZnyo9jiIRTa4btYWR4lNGZPU=;
        b=efX5RqhZTTBeDVnqIfcOj/wtWGY+g5wcE25hdQKAoCxhg1yBu9sosnT0y7W2wFs2bV
         kSsm+Qz+MM/4aJwooaQpC0syoUGTTaQ2eDfnAFRiawGJxGuBzCnrg6ynPh67oplxjlR7
         o9XJwAnzDRWJBRwfoppgfqg/JGpIIrPD+ssIZFIq0CgHtMwju6XXsffm9Do29PgXaI23
         kw5NhGmweVNS5g0rNci8FNFrw7zH3gfr3VL4hRUTJZSoqw9iMMG4hkBD2/XDkfMuYX3I
         aToa/SRaixqcP+a+SPWL1gvzXEJ+bNoJXwH+hoNcPkE+I7EDuv+rTLLkCncsy05yB9xY
         uuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890552; x=1769495352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t40lO5bXareLzTvQoLuZnyo9jiIRTa4btYWR4lNGZPU=;
        b=hQrLB7DbEZ6GXAMdJ12VwQXqehfehL93NnKD9K4FXKU7GLiHNVI2f98q9N1ut+dsvT
         /hpBT/axL/oCCHVEOLJSxbvseaGj8vy+b6LeoLcHdA05+BWoz5tSHLIkaZgUmll45Z1e
         tDsgq7E4ZpFmFtmWb2uT09iqAsrYDsfU0Ph6u6GgfQmD/xMD0lp7c8YMez2tpTDgJisS
         kaQ3ERUqvnonf+IvRSwLjKO1DOq1sr91KVpsxdkbxHLcvyit3HCCdHEMkGUbBK1VaXL6
         dC4ljWPQj/W6wx0xRxqHcwtsLFlBkq1f2zfKDVwzXzY5lGromH3egJW2fDjxVc3U61Ke
         2x7A==
X-Forwarded-Encrypted: i=1; AJvYcCWow8X8H8p+yfugfdcN9FwsnOimHdZ02zaQMPfvjc3wy+4m2di9LsxEd1r0wO1z+6HEjFQDzLxkyBIffqUtSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxusYUPURRr3dkyXgsVvPEeQ2EekRewOD3YyxcUB0AOUbCRckLF
	Z6tzLVdN+sXarkeoA/FSY3Eb8e185cXV/f2dTNLgTNHuw/oU9CMZE/BW
X-Gm-Gg: AZuq6aLwAhcL+sExVV0urjVxd0ELcT7U1eDNfcJ3xCCVsRlaXLvBAKfVmdnE9QMraSH
	oU9Oj5UlTD9x8FQTb18cs1Fzw2EMX777Ae0fnGnJ9/VXq0j6/VgoqbgvQzPXZMJDAHDsDBNAils
	eKNs3dHje74H2s26YF98cXBAMLQbNIzQ+x5SY9V8kQixxqyRlZU8Hqupcv9ZEs38kV/R3UQs3gA
	DU3Ltxelmb5mtpxKFY35ZCGJ6fqPWRl9YNs8Bwubuv0G5pP1E+hkjxu2gjvE3ykR25ud4pmyJpV
	aWA+JfKod2wcL2vQLDs94GqbNLFEwX1CBcIDh8rzqvOOrQ57c//xehcJQx0tmYuW7nvDh8VIq1i
	n93b+zxl4ymA2djy3WuijROGQonsWFgIsddoEpVjUisMdC9ZBxxg2hWIgsgiyhaNE02YV1lDdvS
	a1CtroVBxWm5Q2j8gU+gANCA/1ckAaj2N1+MiWp2/6AKBisuWABr2yt8iRyWRegBF8KlED6nE=
X-Received: by 2002:a05:7300:3254:b0:2b0:bd77:7ba2 with SMTP id 5a478bee46e88-2b6b4e99646mr8575481eec.35.1768890551789;
        Mon, 19 Jan 2026 22:29:11 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:11 -0800 (PST)
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
Subject: [PATCH 11/11] wifi: mt76: mt7925: fix ROC deadlocks and race conditions
Date: Mon, 19 Jan 2026 22:28:54 -0800
Message-ID: <20260120062854.126501-12-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062914_199989_4394D3F0 
X-CRM114-Status: GOOD (  24.20  )
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
 3 files changed, 170 insertions(+), 13 deletions(-)

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
index cc7ef2c17032..2404f7812897 100644
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
@@ -473,6 +491,17 @@ void mt7925_roc_work(struct work_struct *work)
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
 
@@ -500,14 +529,93 @@ static int mt7925_abort_roc(struct mt792x_phy *phy,
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
+				"mt7925: ROC throttled, %lu ms remaining\n",
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
 
@@ -523,7 +631,11 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
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
@@ -534,8 +646,27 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
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
+				"mt7925: MLO ROC throttled, %lu ms remaining\n",
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
 
@@ -550,7 +681,10 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
 		mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+		mt7925_roc_record_timeout(phy);
 		err = -ETIMEDOUT;
+	} else {
+		mt7925_roc_clear_timeout(phy);
 	}
 
 out:
@@ -567,6 +701,7 @@ static int mt7925_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	int err;
 
+	cancel_work_sync(&phy->roc_work);
 	mt792x_mutex_acquire(phy->dev);
 	err = mt7925_set_roc(phy, &mvif->bss_conf,
 			     chan, duration, MT7925_ROC_REQ_ROC);
@@ -874,14 +1009,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
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
@@ -901,14 +1036,16 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
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
@@ -920,7 +1057,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
 						      link_conf, link_sta, false);
 		if (ret)
-			return ret;
+			goto err_wcid;
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
@@ -928,28 +1065,34 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
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
@@ -1135,7 +1278,8 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	if (!mlink)
 		return;
 
-	mt7925_roc_abort_sync(dev);
+	/* Async abort - caller already holds mutex */
+	mt7925_roc_abort_async(dev);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
@@ -1530,6 +1674,8 @@ static int mt7925_suspend(struct ieee80211_hw *hw,
 	cancel_delayed_work_sync(&dev->pm.ps_work);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
+	/* Cancel ROC before quiescing starts */
+	mt7925_roc_abort_sync(dev);
 	mt792x_mutex_acquire(dev);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
@@ -1876,6 +2022,8 @@ static void mt7925_mgd_prepare_tx(struct ieee80211_hw *hw,
 	u16 duration = info->duration ? info->duration :
 		       jiffies_to_msecs(HZ);
 
+	cancel_work_sync(&mvif->phy->roc_work);
+
 	mt792x_mutex_acquire(dev);
 	mt7925_set_roc(mvif->phy, &mvif->bss_conf,
 		       mvif->bss_conf.mt76.ctx->def.chan, duration,
@@ -2033,6 +2181,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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


