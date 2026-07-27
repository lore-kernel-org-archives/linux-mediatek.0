Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F64CC53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HtNOUytS7spqmKL8HBRjl5j9jbmXbkSAtWYLPzNGcyw=; b=PbcGdl3MK3Ri+TzfxrRs5E1Bfc
	VX/YLsb/elUxSMp2+C0Z68XCJFUndF58hp0bzG4WoHg80yAG6B1VEVbNZYkxWmlxGOoePlsApwonx
	EPayoyWS2uSaHSn8OLROQcTqL5x59DXoXdBFIkx2/8coQzMl6bR3ZWKjGWNQ84E1JbBZuoF60jHxE
	QtFbWZWK1AP69DlhHPsSp8b1IxQpMePjA4pVTpEHNRQjKjsKnzkjlCG/klXRYWVzUEgq9N0J+Ayi/
	viMPIQYBOY2sOl4uGdPnQXD0/XtJn99UP9hTb0ETGDAwVP7+xaWUpQubn2ovgNJz0zUqFmsFHv/z9
	9w9Oiqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRUY-00000003ndU-3bMv;
	Mon, 27 Jul 2026 20:00:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRUW-00000003ncK-2Ioa
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:00:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so23177635e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 12:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785182398; x=1785787198; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:subject:cc:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtNOUytS7spqmKL8HBRjl5j9jbmXbkSAtWYLPzNGcyw=;
        b=WQbaJNr9TFncZx+h8Qz/z7sFevCiOTcDfFKwI4b3TwNrQHpt7cuWuCTP+egPerwkmr
         80wicUDYGDn6vybeIyzDt9Oo7Uj1cti1CnR4f42wOU16xhwVeR7sNGp6SDMBAh+6c64V
         Y57IZHdHo7CaGFGK1/IzlmVI1/i0F+jpENWsCGxCDMWcI2HNLlpwHS9G1cx8cTBFAVJb
         lVDGnGETva4GxhrlZZ+B1RwttMLY5DZ2HY2jPqYymQR6lptSpgtRJkykD6n74odzQ/le
         +wv2r0UioTrEkvSw2zIXMVi0a/IO+0w0VPEK/ZXycA1lSkAFlfHe769ckwVyM63xyv5g
         Q2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182398; x=1785787198;
        h=mime-version:content-transfer-encoding:content-type:subject:cc:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtNOUytS7spqmKL8HBRjl5j9jbmXbkSAtWYLPzNGcyw=;
        b=hrhB6UFsM2LHzWt2Z3ykwHyITGrHHjVftBKa1/9Hvoa0ypZt+HDRKXJgeFFkb0gY7N
         /I6oTku2tFuRmES1YUavlgJDDpDTev/4RXtdFZnUdmZ/hQQJAOqCgbns8dnn48WIoU3b
         94J57ZTs6AehZbsoPnRNVYiDyHxXaLeWwaXHMSf1+OG2gdFU9QzvQh6kFXFCozFdklfE
         IVO1iFoFWY7UZ12xu6BBpEomJs2y6jnBpc92n139Hq0HM+ApVt+NYWoYpl8+Q39auwuF
         6Ax8P7Tgt7wJllO6CM910Qde1t2RVa10p7dMZz6RzmUorzKnHxwKDD2DqwdrlI421chs
         8kLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC+uJ+mSVMkBW5PT4+loY7S1nhmNYAh3MB/IfYG1MCwNa8r3LjgRrZ6eDRq9tbF3QkdUHXOnMB6WJgxIlzng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYuBiShrI5YOiGo1h9ExAZAwQezLbAzM23mE58gAHQsft1Nndg
	sexB8FbokZQxK0fnitDzQzE7ic/30pmRBRo2ad2I8he056gqre5AhmP+
X-Gm-Gg: AR+sD11ZanzWVT3YW0K/I0b5TWjBw7Kf85e00Ag3BYJ/km5xuGvOSXKpVQzDtVyIynB
	BcHPJ0GbrMQO2v9tj0/D8SZuNQDTBcxjmakH4W8OenKWv7EeAOz+m/npRNMXXT97I73Ajnnr31u
	hPWfO9O42+tVH6O+pN1mKuCVsySs+nWORoXw3UGgcmbEjWozdQAbUVTq65nUaVWzpAKgoVB9kFk
	JC/nbq4ZrzvLOuQOkaDWLZ+CAhE5ABt6be9FR8yC5ycj8wVkt+k+0C5MZnpYYVD8OJ0NCyCySd0
	tMrbAMhmi+MTnfpsXhi4YBM5EaE9ykwEQm98M25JzPOoZQv+UB9htwNoK9ejFUgJQg+ZKrU7Pgb
	iPvYFLx9l0TYmOQlJuTMBJFbbplv3cCfW5SYcQPEmS431ix4BKXVfczcPs+jrySDf9OWkbaOMgO
	2RtPniz+CqVIeKqQ5SJKRuz6TQv8BvAZpp+ztTHjlB5goQGjPey+NpzuQs5gLoWTjsvZx4mVx6H
	bFbORRzhs0T
X-Received: by 2002:a05:600c:c4a3:b0:495:7538:d4ea with SMTP id 5b1f17b1804b1-496b5670622mr127824895e9.0.1785182398165;
        Mon, 27 Jul 2026 12:59:58 -0700 (PDT)
Received: from mcp-gateway.lzampier.com (brnt-07-b2-v4wan-169820-cust69.vm7.cable.virginm.net. [81.102.32.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46240c4sm17066885e9.12.2026.07.27.12.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:59:57 -0700 (PDT)
Message-ID: <6a67b8bd.4bd67053.2727d8.1806@mx.google.com>
Date: Mon, 27 Jul 2026 12:59:57 -0700 (PDT)
From: bookmailer3000@gmail.com
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7915: keep the tx worker off the txq scheduler
 during hw restart
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_130000_622123_A1B8A9F2 
X-CRM114-Status: GOOD (  13.52  )
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

mt7915_mac_full_reset() calls ieee80211_restart_hw(), whose asynchronous
mac80211 reconfiguration tears down and rebuilds every station's TXQs.
Nothing keeps the mt76 tx worker off the mac80211 txq scheduler in that
window, so it dereferences freed TXQs and panics in the mt76-tx kthread.

  mt76_txq_schedule_list <- mt76_tx_worker_run <- mt76_tx_worker

Gate the worker at its entry point instead. Add a reset_pending counter
to struct mt76_dev, raised per band in mt7915_mac_full_reset() and
released as each band's reconfig completes in mt7915_reconfig_complete().
mt76_tx_worker_run() returns immediately while the counter is nonzero,
and the worker is kicked once it drops back to zero. A run already in
flight when the reset starts is serialized by the existing
mt76_worker_disable() in mt7915_mac_restart().

The worker cannot simply be parked across the restart. Driver callbacks
invoked during the reconfiguration (mt7915_mcu_add_tx_ba(),
__mt76_set_channel()) pause and unconditionally resume it, and kthread
parking does not nest.

On MT7981 the panic reproduces within a few resets under tx load via the
sys_recovery debugfs knob. With this patch it no longer occurs, across
forced resets and two weeks of production firmware-triggered resets.

The same restart/reconfig pattern exists in mt7996.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Cc: stable@vger.kernel.org
Signed-off-by: Lucas Zampieri <lcasmz54@gmail.com>
---
 mt76.h        | 2 ++
 mt7915/mac.c  | 3 +++
 mt7915/main.c | 5 +++++
 tx.c          | 3 +++
 4 files changed, 13 insertions(+)

diff --git a/mt76.h b/mt76.h
index dda5034b..ed30768f 100644
--- a/mt76.h
+++ b/mt76.h
@@ -974,6 +974,8 @@ struct mt76_dev {
 	enum mt76_hwrro_mode hwrro_mode;
 
 	struct mt76_worker tx_worker;
+	/* nonzero while a hw restart reconfig is rebuilding the TXQs */
+	atomic_t reset_pending;
 	struct napi_struct tx_napi;
 
 	spinlock_t token_lock;
diff --git a/mt7915/mac.c b/mt7915/mac.c
index cd123253..5f459c63 100644
--- a/mt7915/mac.c
+++ b/mt7915/mac.c
@@ -1428,6 +1428,9 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 
 	dev->recovery.hw_full_reset = true;
 
+	/* released per band in mt7915_reconfig_complete() */
+	atomic_add(ext_phy ? 2 : 1, &dev->mt76.reset_pending);
+
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	wake_up(&dev->mt76.mcu.wait);
 	ieee80211_stop_queues(mt76_hw(dev));
diff --git a/mt7915/main.c b/mt7915/main.c
index 42c548a3..73479d6c 100644
--- a/mt7915/main.c
+++ b/mt7915/main.c
@@ -1833,6 +1833,11 @@ mt7915_reconfig_complete(struct ieee80211_hw *hw,
 			 enum ieee80211_reconfig_type reconfig_type)
 {
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
+	struct mt7915_dev *dev = phy->dev;
+
+	if (reconfig_type == IEEE80211_RECONFIG_TYPE_RESTART &&
+	    !atomic_dec_if_positive(&dev->mt76.reset_pending))
+		mt76_worker_schedule(&dev->mt76.tx_worker);
 
 	ieee80211_wake_queues(hw);
 	ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
diff --git a/tx.c b/tx.c
index 4507fd15..e8e86e46 100644
--- a/tx.c
+++ b/tx.c
@@ -767,6 +767,9 @@ void mt76_tx_worker_run(struct mt76_dev *dev)
 	struct mt76_phy *phy;
 	int i;
 
+	if (atomic_read(&dev->reset_pending))
+		return;
+
 	mt76_txq_schedule_all(&dev->phy);
 	for (i = 0; i < ARRAY_SIZE(dev->phys); i++) {
 		phy = dev->phys[i];
-- 
2.47.3

