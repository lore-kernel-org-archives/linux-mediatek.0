Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E67C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DB5206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1EPz1xh5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOD0XSZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DB5206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KNuuIhmelsajoahXYZlTsGs6uTxmqmkD5jCvX6l6jko=; b=1EPz1xh5J/j6nd7IoIoGAcwZR
	fidxoSJSYNnzzrDIlLO9aWRovCNDSAlhAxpYdJxmBDi0VRDDHIgr2fI/KoYSs8CvJfNWVTVAEpgbW
	G+bDdN7awgQPSQImNRJEO39cPXmo/Eus5NwqbF5HE89nFvQBpk4tdo8/TTlSu6Dqlc6RgUQz6w4PY
	iKrNkQ+AMElsvUEZUS/o0ersd2Qup47JMJ+poKE+cGL32JJo9JRMs5LAOaDKvBYd7R+LbLXLJCBeb
	FE7iBt5E8rInpStqbbJIC2uShLNGbro1wijMiyzTxu5M08TmCYMftBFYsGYk+eYM2lt9ZlKyov6I7
	qmvqwKOqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsU-0006JO-38; Fri, 03 Jul 2020 08:16:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsI-00067g-HA
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:47 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A03E5207DA;
 Fri,  3 Jul 2020 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764206;
 bh=wKywMJcjNF6e2YAhradyZPmRGgNZ6TNJaJoCFUTvbt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hOD0XSZcJ1gf7K13TMuuTXOch5PFSheEGpNLJTwasrDvFo2WRNoZiHVMb06g8IcXP
 oqiTTkH9jehQNmmDPu4rPImqPMAeuX16jWy+TzuV2FRGA/I2mNNRnR1TGQTyyYPv5Z
 cfBwQHIVA/zRT5BbGmJfgjMzJGI9x/Ih1dfufKIw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 14/22] mt76: mt7615: wake device before pulling packets
 from mac80211 queues
Date: Fri,  3 Jul 2020 10:15:53 +0200
Message-Id: <8352fe8983d7308fd332cfc6579993e5d8054566.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041646_678277_3750F0C1 
X-CRM114-Status: GOOD (  12.12  )
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
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
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
index f62e7de81bd5..e3dbbf957426 100644
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
index 47dca270150d..3ff387f31659 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -638,6 +638,24 @@ static void mt7615_sta_rate_tbl_update(struct ieee80211_hw *hw,
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
@@ -1134,7 +1152,7 @@ const struct ieee80211_ops mt7615_ops = {
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
