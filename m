Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F986C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17AA20C09
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="frJg8ozR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4lKw8JW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17AA20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/r/b2Z46q7DRgC6au0zdXp4eiII4cFKce1OR/P9tOSo=; b=frJg8ozRu1F09BxNv4Q0qBHRl
	u2R4eOPU108Q42YsyWca9JKGYstqJ9TPfiLTebWrwMRDf8wdBq4UPcYSF7QNnTK0/T2LzWAiLNLF9
	jzBd8URuF+BUIQxIm+qXI7yBG/cUbNKonq3ujY0Xwt9BUSVLDsmQD1J+I9dostmeSKMhjvEK3JESm
	K9ifi6rDr8Y/QvXck0+U8E2vYMcfMkbk3uVRhOpyI94d+WiIjh5YbYsiW+T73LJzbdug4nU7fq8Dd
	YufPIUryuWKdCdYGkTwJGayo4umjnlztEeaWriwN6UI3wCCzCSYIxrAq9hvZyPgjeBVUwKoBW4XWI
	vRNthvJfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovr7-00023q-Dd; Fri, 26 Jun 2020 21:25:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovr5-000226-3q
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:52 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3739E20B1F;
 Fri, 26 Jun 2020 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206750;
 bh=B4urpNBnbqrJc3aTZLtJhAEvtRQLx1H/USypH4b6B04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R4lKw8JWMBLkj3cef0GODGfmG5aMA50icbMAPWk38f9JeK6rBT9bW9LoxfT6QK5+x
 4Bk7ajyds0wyB8V0J7AuyuspFQb9Ek7puINRAJdZrgk52K87/cneHjF4KzSYCbn5Xd
 DsypIGHCkC1tEnFS/9jsrZ3/cnxNSBlfOXtThukk=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 10/17] mt76: mt7615: wake device before pulling packets from
 mac80211 queues
Date: Fri, 26 Jun 2020 23:25:10 +0200
Message-Id: <5bd9536f6518a3b21ee0029777b4d9a84c0b44e7.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593204577.git.lorenzo@kernel.org>
References: <cover.1593204577.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Make sure the device is in full-power before pulling frames from
mac80211 queues

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  6 +++++-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 20 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index acefcc2e571a..0a16acf40cf8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1841,9 +1841,13 @@ void mt7615_pm_wake_work(struct work_struct *work)
 						pm.wake_work);
 	mphy = dev->phy.mt76;
 
-	if (mt7615_driver_own(dev))
+	if (mt7615_driver_own(dev)) {
 		dev_err(mphy->dev->dev, "failed to wake device\n");
+		goto out;
+	}
 
+	tasklet_schedule(&dev->mt76.tx_tasklet);
+out:
 	complete_all(&dev->pm.wake_cmpl);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index e63c2584b326..9c17026c541d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -635,6 +635,24 @@ static void mt7615_sta_rate_tbl_update(struct ieee80211_hw *hw,
 	spin_unlock_bh(&dev->mt76.lock);
 }
 
+static void
+mt7615_wake_tx_queue(struct ieee80211_hw *hw, struct ieee80211_txq *txq)
+{
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	struct mt7615_phy *phy = mt7615_hw_phy(hw);
+	struct mt76_phy *mphy = phy->mt76;
+
+	if (!test_bit(MT76_STATE_RUNNING, &mphy->state))
+		return;
+
+	if (test_bit(MT76_STATE_PM, &mphy->state)) {
+		queue_work(dev->mt76.wq, &dev->pm.wake_work);
+		return;
+	}
+
+	tasklet_schedule(&dev->mt76.tx_tasklet);
+}
+
 static void mt7615_tx(struct ieee80211_hw *hw,
 		      struct ieee80211_tx_control *control,
 		      struct sk_buff *skb)
@@ -1097,7 +1115,7 @@ const struct ieee80211_ops mt7615_ops = {
 	.set_key = mt7615_set_key,
 	.ampdu_action = mt7615_ampdu_action,
 	.set_rts_threshold = mt7615_set_rts_threshold,
-	.wake_tx_queue = mt76_wake_tx_queue,
+	.wake_tx_queue = mt7615_wake_tx_queue,
 	.sta_rate_tbl_update = mt7615_sta_rate_tbl_update,
 	.sw_scan_start = mt76_sw_scan,
 	.sw_scan_complete = mt76_sw_scan_complete,
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
