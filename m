Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85328C982FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9XcF/3IRZUDlfTjnlc5xrlEPXzRZ38t+QGTj72aQ/s=; b=i2+YCjQKOTU8mIjOAzVJm96BFj
	1f4n4B//AkSED0Z38EAzeHloCfAhec5AC6nljrEXdAKA/xospJnVX4T6fhETmgVENud27Eyjk1W/r
	25ne0JaEyRkR3ZPP1/oETD4XPuhGdyemD/8W2RsGddJT9f6hLmgbcia1B+r9SV+8fCE8t3eQatg+8
	eKT8xQdkmn1lLKgyOHDIy8ITbRKFg+zbTRtfoFNWtoKZaCZ7Pf9QIhHasDTLlPX6kyETG+aPAcRN5
	rIbzEUR1CASUb7hdxjw423gM+Ahw+i6FUieJ0ZNeUNCq6FIdHiZYewjm16qzM+MvP0lke8OydFrvl
	zVrtFn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MwX-00000008Ne9-05TK;
	Wed, 23 Sep 2026 13:23:25 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MwU-00000008NcE-0d0O
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 13:23:23 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1775590137.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169801; x=1790774601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9XcF/3IRZUDlfTjnlc5xrlEPXzRZ38t+QGTj72aQ/s=;
        b=WPhW7YYNh5EK6mvvWhhcPYfYOJ26yP1Rc+FAmVK4yPTY56Ma/j9NlwFQrF5kdgX2mj
         03rxFdgVkdpze6d0HP3egvGjZM+pe69fhEOTe29TZCL5DM6BnIYlcyvRfc7H7rSw/met
         Y7MvkG2kOq7sIlQHMj5GyeCnN/i+buyMVPjZmRBGLQbRpVuiIs60emTtblSdFMUuYRKO
         wntI7tudj8/eH9pFgfxQG9MmFIJccoqs0/A3T4EH8jvBPdJcQ31MpDlaqarcWc3EHdiB
         kuttGd41SC9E+1a/LyI3QznRri93Hf8SPKsYLxBF4Zw99EX+tpVUUouOARPvKYRJfJVp
         vEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169801; x=1790774601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9XcF/3IRZUDlfTjnlc5xrlEPXzRZ38t+QGTj72aQ/s=;
        b=z6RuVilQUHuiz0kO0lu9/ArY+IdD9lUQZgSlNdftCDD9urTr34U0JSd7wiDi10EiVt
         N38/95kuPtPsSG2v6gALsiF2vsOWCl0GJ4Gk+ljZhKUoUpZP1bgnZHnzKtJZ0513oUJd
         N+AoZ30FDK0zVMJvDcv074PeA6EYwNfZ+6Uvlo2IRsBt9/2subQMWLGR2TVNBgDvGbIX
         OyElWvW9TyO4gJeIPIiwVi/3Iqc9Aej/lY7HXra75IxqZ/FiFIZmQPXq7uecZyeAebGD
         Yb8GuTqKymG6wZQTklWF9/sQDU7cxA+oMqPHNZWUPgpu+jICeTc6La7itolHnH7qg0vu
         3sQA==
X-Forwarded-Encrypted: i=1; AKwUvBwG1eqQCPbAtDE1KIhleDaX9CfP4dJasAe4x0kKnZCRhT6u5wwSuzM9OBdQDEgjEqaPI8YbeANvUjP2X+nB2Q==@lists.infradead.org
X-Gm-Message-State: AFuF++lGkTXqAS7q05ubncmqSB66IQ/cTd+89bWW4S0JHhw2hflPwW5u
	d6jycy7qXWxwHQ5GY3UQlfjua5WkpgSjGIAHZ2W4RtgUKx+s7ONg5nQw
X-Gm-Gg: AYBFou2LfYw92ad1d/2C4bPhS38/E1G0hmGJ1JBlmANq2dB0JFZFRNiCbG1C6ce1ibU
	cxUSeb8xfWNmpl83D9jZ/Qh+YV3r5EUbIemrpdE5F4zLSN36wv5NtRLuSyxoDp0Mz0pjCAxU5sq
	O0bFJDJlvPrHKLQmkQQDOyHuUecJVTs3TQxpFOQB1oyUJl7j70HTuXlgFk2rJis556ES2gciwlk
	kFFGc6KOCpLcOxPj3n2sPQyP0WuyfVC3/s556guJ57FwkHKWgxqsMCHHCcqEr9Yto+B9EulGhRr
	EJ8NCxavewCdeE+ZKbdidNLAX5XYAc4eTmXtsAGZ9FNCyVyFM1Cu6CVV0/VAPQggMkD/z8IW4DT
	+tyQ09KFVYwcEgrdjfjuQU1+y9LdizEIidUP4Uaz+dLPMXJe6HwZM2ezh+30eXpIPpTknAHdxTk
	1lNfFBdtCvrI32zmcJM1rf6NCG6bETymqcPQ8/zFZuh1PWl5L5A5twqFPZ/QJbkJ9432kFhjE5o
	aHAhfmio1ZKweCvcG6z+UoXkz5ROgl0wmG5OU4punjRdUQapYxroLVGhl0=
X-Received: by 2002:a05:6102:41db:b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7aaa080ee21mr4051183137.34.1790169800671;
        Wed, 23 Sep 2026 06:23:20 -0700 (PDT)
Received: from localhost.localdomain ([190.177.169.131])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm2910924241.12.2026.09.23.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:23:19 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 1/2] wifi: mt76: let a driver hold a station's tx queues
Date: Wed, 23 Sep 2026 10:22:55 -0300
Message-ID: <20260923132257.8729-2-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923132257.8729-1-pcristian292@gmail.com>
References: <20260923132257.8729-1-pcristian292@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_062322_197594_2653C6FA 
X-CRM114-Status: GOOD (  12.91  )
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

Some drivers know how many frames a station has inside the hardware
better than AQL does. mt7603 completes a frame to mac80211 as soon as
DMA has copied it, so AQL releases its airtime right away while the
hardware may keep hundreds of frames for the station.

Add MT_WCID_FLAG_TX_HOLD. While it is set, the tx scheduler leaves the
station's queues alone, like it does for a station at the non-AQL limit,
and stops a burst that filled the hardware. The driver clears the flag
and schedules the queues again when the hardware has drained.

No functional change for drivers that do not set the flag.

Assisted-by: LLM
Signed-off-by: Cristian Papa <pcristian292@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 drivers/net/wireless/mediatek/mt76/tx.c   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 62b41c8bb..d03e66c2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -362,6 +362,7 @@ enum mt76_wcid_flags {
 	MT_WCID_FLAG_4ADDR,
 	MT_WCID_FLAG_HDR_TRANS,
 	MT_WCID_FLAG_TDLS_PEER,
+	MT_WCID_FLAG_TX_HOLD,
 };
 
 #define MT76_N_WCIDS 1088
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3707ee19e..e16a380c6 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -534,6 +534,10 @@ mt76_txq_send_burst(struct mt76_phy *phy, struct mt76_queue *q,
 		if (stop || mt76_txq_stopped(q))
 			break;
 
+		/* The previous frame may have filled the hardware. */
+		if (test_bit(MT_WCID_FLAG_TX_HOLD, &wcid->flags))
+			break;
+
 		skb = mt76_txq_dequeue(phy, mtxq);
 		if (!skb)
 			break;
@@ -605,6 +609,9 @@ mt76_txq_schedule_list(struct mt76_phy *phy, enum mt76_txq_id qid)
 
 		if (atomic_read(&wcid->non_aql_packets) >= MT_MAX_NON_AQL_PKT)
 			continue;
+		/* The driver schedules the queues again when it lifts the hold. */
+		if (test_bit(MT_WCID_FLAG_TX_HOLD, &wcid->flags))
+			continue;
 		if (dev->queue_ops->tx_cleanup &&
 		    q->queued + 2 * MT_TXQ_FREE_THR >= q->ndesc) {
 			dev->queue_ops->tx_cleanup(dev, q, false);
-- 
2.47.3


