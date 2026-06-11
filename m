Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91250CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 21:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a69mswo4moK+ZGq72/AwjTMqeuo/CQOQ789onPsh5dg=; b=rC2FCXmlGp+LquoJf+L3617ZpT
	hSKTfifMf+mqJB/nQzQNngjQPwBJLOx4NvMn4Q1reZZSnjVXviQ0LU21F8FlfQZ3TbiZI6HZy0soH
	TuZ2PKlNJQIm/axiMYjYx8WaxUuDaHYxqSJ+m58ESVE5SyUFYx4JkUOod+GZdLyp5t8aHcvCQ/5xl
	Cs5oHCL0osMxsu/h+eU329Z9ohaw7mp6QKeNac2ppEL/41UkoTMHq58gADUWJh5UPUWV2Z5nzTXWe
	hUhiyxvgT3bbg3Z7DPDBrQkv0klin1lQQP99cJ6u1Uqd/F20dqVXS18ukEjx1NOgfcZnittN0BNF0
	85tUOxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnP1-0000000A7YK-1fKe;
	Thu, 11 Jun 2026 21:57:31 +0000
Received: from mailgate02.uberspace.is ([185.26.156.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnOw-0000000A7Vp-33gj
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 21:57:29 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 11C801800F1
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 23:57:17 +0200 (CEST)
Received: (qmail 27404 invoked by uid 988); 11 Jun 2026 21:57:16 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Thu, 11 Jun 2026 23:57:16 +0200
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt7603: free beacon SKB on error
Date: Thu, 11 Jun 2026 23:56:56 +0200
Message-ID: <20260611215658.259324-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=WZ6/0RV6JrkCzvhVDyitGRXoseIDmTlrOiFDgXdCe/s=;
	b=dPdTPapxPuPS2rFw/gDhACjtqykW0KPKzIt8/5eWrBPAxFJUq/qXo12E7+mwbBF//IKM8aYwek
	CmU5c7WElzSM4PlIVGLy8Ng+ODHhpWNRer2uS7ybvIFqwonRCYmJQDu6BqoyYIm3qEFbtWr7UfuS
	55AgYTMFUZKyCVwfKMP3V7UxPRMTn9wCT2QoON58TNE5vK0Hi/xP0AAkIWeioH4Y7ZgsOpyqRt90
	fBITw0XfQcroaHukIq+C6wDzCw78IKd4r66S3p86z/LoBylKuisUTiERoPvL0UasiCjdNeK7pbUN
	8NHWZwQC3rQYBwnmvxB8PQOP6aQFLwNmn0fgHWadTa8OQWv95mO5iCB/SRuIJT9mAb4TtU1eszsq
	ds31fwj9wx4i+Rp7KwhxLNluj+quRntE/XqeePRU5uSATNwbDRW/orwXbK66fRRCEDTHA5rkWoq5
	PYiu/KjTwKd8USi/jLmNBLULQfvJw4fqUkOLvXlIh07EdggOU6MMxc8wi6YfZ5Cv0ovIRSqRty1x
	K5HDt4vDIk1bb2l0bnVhTiHaF+uukMnqRDV9ZRW1Jax4nogF4goTnFZA2hkIS/+fPPSHdVZAb7Iq
	xE7Yj/7Xzn1LQTNKW/xmSyb4p+TeBYhoMjqRZJ3CUL64Q3/dTJE5LnPhDuexd/dssqNkGqgYwftZ
	0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_145727_186686_7FD0A96C 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

The SKB containing the generated beacon is not freed when the beacon
queue is deected stuck and scheduled for recovery.

Fixes potential memory leaks in case the beacon queue is detected stuck.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index 300a7f9c2ef11..acca98139f92e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -56,6 +56,7 @@ mt7603_update_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 		FIELD_PREP(MT_DMA_FQCR0_TARGET_QID, MT_TX_HW_QUEUE_BCN));
 	if (!mt76_poll(dev, MT_DMA_FQCR0, MT_DMA_FQCR0_BUSY, 0, 5000)) {
 		dev->beacon_check = MT7603_WATCHDOG_TIMEOUT;
+		dev_kfree_skb(skb);
 		goto out;
 	}
 
@@ -63,6 +64,7 @@ mt7603_update_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 		FIELD_PREP(MT_DMA_FQCR0_TARGET_QID, MT_TX_HW_QUEUE_BMC));
 	if (!mt76_poll(dev, MT_DMA_FQCR0, MT_DMA_FQCR0_BUSY, 0, 5000)) {
 		dev->beacon_check = MT7603_WATCHDOG_TIMEOUT;
+		dev_kfree_skb(skb);
 		goto out;
 	}
 
-- 
2.53.0


