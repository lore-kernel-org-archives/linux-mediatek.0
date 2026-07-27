Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7632C53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDIac45RIuvLJRTWSXLnkBc2gzMGU15MkFTMnnrYVY0=; b=rN05R/kvbyJKUyOVFjVW8vDGT9
	hl0rNHFgR15XYTlTOHGSRJ1gEApNTX72l2I9RbonMrpGxKk57/FdOPzKd1nzxy1M5GYPupwqZPxcr
	hTx8fws+4FXbnXD7xB7kQptg269Tgm3XuhiEAECxPBv2ltgFiA5nc5/x5IEdAMearHzfzMtixFfhl
	SCq3Snrma6WKEP1GO+74jOMM5EgcFO4L0mJUSjsRL8yreiGqB0Vb7uYY5TacJ7WD0BZirCbfYucr/
	UUoap+PebvfixF9QuY6NZKL6glFZuSnjGUeKkQsk0navjsoo/jbdq7uTZUYpDBN1nnx9hrxTT9eA3
	deXGwodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRZH-00000003nwv-2h8K;
	Mon, 27 Jul 2026 20:04:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRZE-00000003nwJ-3nFy
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:04:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4955de8797cso19457575e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785182690; x=1785787490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDIac45RIuvLJRTWSXLnkBc2gzMGU15MkFTMnnrYVY0=;
        b=NQxWA66gCGwXvbW4PZ7MTLItHKfHWXe6GFrOrKPeg2GlN7Esa8ZCL1WfAUq024OIhw
         gjsnXp4Z2wVT791/GD5CZZPYMsf6rMl1eZI7u3DgReuMKdlOfA1/tRDnP2atyLQJQg6b
         avPkZtfA1ugFQvugkb1nqvsdhR0Y2g7Hv0IK7UQg1bl0CxNQsuGmuTitGnO7FlDjaBN0
         9w6HwNfAw+Sgw5q8KWrR87/Ugex95g+9wqPil3fSg7Qu7QDGctKmPHUaJ7Lfa+HOZDzB
         Kk4Ph28Iq+ic/Pr/F9ME4RB8FFhOG4mi+TqZyCqJtVgwCmIMwwyBaOZ0uY+Hu23O2rli
         CfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182690; x=1785787490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDIac45RIuvLJRTWSXLnkBc2gzMGU15MkFTMnnrYVY0=;
        b=Gbn4L0pXW1ec/u6JtoZRmxyEKmzgOlxxT7L7s90D+SwvUtIOQGkqs3H11RgFVAdYru
         DuDmmWD8lcf+B5PcbmTnml++zN6CLMFcDAJ7PJ9R3KWp55y2szcpvVWSQ1ljSeEM2QNr
         P+rd+jf+qCb0OYLP+feZXpCLpwgp6VLhfLR476vvwHRD2senA9lIYmYOhphWT6a7dCsJ
         h6YmSzWSyUo//WjZ1H8ktnC7pC14RwFGuxeooHfjFBIT8R1jkmxfFkBLLzptJNTsQaYe
         cPgv6tSyGAftuaRIwLJBVpsI9dEijHqX5r1fwpjMlc8esOVNIj/KSyosUCHnl/01xhY1
         xx3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrjrn8G07BT46JS8lWPgVJzX4bcVx8X/dt8a7mJbUS03RA+71VANbc/nePGqzFmcfNUvDuNMMPlSMZNl/ZrmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhzpzP4zkJAgIVxRTiETaU0rLDVgZlgCoQQvLB6wpPcfrawD1d
	cCk2hCNEWgMniepoq5VBPoW8G+pGLm2g0P6S6N3EUwk70+kfDiD8CLWrcknhURfRdg==
X-Gm-Gg: AR+sD11kytwC94sOaAisLXxSkJeqy1lrRvnTco8Nh1fsAYujcIJe0jflVrefSucN8M1
	2tAq7T5ovn6LK4V1dJCR9yqykzXs/18sKSIO3ZFyWGMIDhpwUSjnZbMGENUEthzKx4r1zXl/nRO
	UNz1/E4pR7A98z5VGOuh4IBd+BPD/fSf3Wuc+jl6jNU66KJLxmuh2Vb+6J9h1xQ06sO9nGQdLQ2
	LUpu/d3294Ho8AosgnXm7F7kgr/U6GTpjoUujWtmvaHabE/3p5qJY9pF4oMvvPGTVuLuZ5ASB1t
	npYc82XGeVt97iGNxHtiXu0y7LwJi6um3iudsS5GvGFBq2pGpeKRKPo38ICd87iPrnaMbECthuu
	JEeRpDP3/6K5KvU6TtUcVeuDn2IrobbUhXxGZ8r04DNeTRtA6AP/b4/l8L8eN2r/d9JDEWUop5X
	iCjJCAK4Igse8mRuBCdoDgcKDJqKxENsn7T1NQVJ5Ak+sZWoja5v7U/MHPDpOqowrZVFmCf9dqZ
	RM3n6WYRXV+w7NsI6Y1JuID0sEY0+UyuZ59mdSIcD8Xs5YZX6y1EDZVq+VddVGiR5HWnwigz+EE
	DNaFNYk0V2aCu9Bp4Jc=
X-Received: by 2002:a05:600c:1d0d:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-496b56ffdecmr132086755e9.16.1785182690188;
        Mon, 27 Jul 2026 13:04:50 -0700 (PDT)
Received: from dev-debian.lzampier.com (brnt-07-b2-v4wan-169820-cust69.vm7.cable.virginm.net. [81.102.32.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm18400985e9.10.2026.07.27.13.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:04:49 -0700 (PDT)
From: Lucas Zampieri <lcasmz54@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7915: keep the tx worker off the txq scheduler during hw restart
Date: Mon, 27 Jul 2026 17:04:48 -0300
Message-ID: <20260727200448.978087-1-lcasmz54@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6a67b8bd.4bd67053.2727d8.1806@mx.google.com>
References: <6a67b8bd.4bd67053.2727d8.1806@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_130452_969411_AB7CA341 
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

Resent from my own address; please disregard the earlier copy of this
patch sent from an unrelated account by mistake.

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


