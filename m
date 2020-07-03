Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EB2C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:18:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525C8206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="atesaF4h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pq9HE1DS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 525C8206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUqYsgcNeewobilGLmVXuduTMjIpYXTlkeFnY0/F3sA=; b=atesaF4hm+DarAZ4vjFZ9x8MDj
	yiGZhS9ZA+EgeAR79+nfmW/lQKkocVb6mHZZYAjIgLMLu3uNGJ7LOmR4FD2jc3HHiRoAxQBcpNfra
	ZjQcr2scVdAO4O/4bTtH6IcC6EX/nUUovqJ3fpGH3DCGL/e2/J6W76QopFPTdaCIDr476a3Dr59E8
	CEiDn1r+c6dbgny1nlMRFQmSshZ3CpX7LqnUCEZR8YtfiXb5YrWcXe4hVxmsARmcYD/uebnWsaNs4
	rlvkU35CGv79OGF77FCgdjUrxIZxEbFm2Ma/9wdZYP1aIeNWmCwf2TgYogXJwLc4FiPzOdloNxHIf
	rBLL55FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGtS-0006oR-Nd; Fri, 03 Jul 2020 08:17:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGtQ-0006mH-6k
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:17:57 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DB3C206A1;
 Fri,  3 Jul 2020 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764275;
 bh=I83+zEt9PNzwzVhZZPeJ02tG1GEPLO9/SyXaDTLKZh4=;
 h=From:To:Cc:Subject:Date:From;
 b=pq9HE1DSlz7cQsu0DJS/QDNnYXcBLd2iPoX2RdcqRX2Cmy17ASpeS/+u7zu4icuQF
 5cHf3qXkk9Ic/LWJViLkH94PWNGsCUtNGfG6QF57VHd3L9Lkj2BI3ScL4H4lyBsXKp
 5mVCAR/wku/yaP+2yoK+6FjEzr+AozBBh1iL3D0M=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7663u: sync probe sampling with rate configuration
Date: Fri,  3 Jul 2020 10:17:35 +0200
Message-Id: <b55eed7dee4a8f0b1814a4b253e0c21c0066f5ec.1593763616.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041756_420288_2FF7CCE4 
X-CRM114-Status: GOOD (  12.13  )
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

On usb device rate configuration for sampling is performed relying on a
workqueue since it is not possible to access the device in the interrupt
context. Move the configuration of the probe_rate flag in the workqueue
in order to keep probe sampling in sync with actual rate configuration

Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  5 +++-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  4 +--
 .../wireless/mediatek/mt76/mt7615/pci_mac.c   |  1 -
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 28 +++++++++++--------
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index fa7a4148ab07..ea9128b4ae09 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -917,6 +917,9 @@ mt7615_mac_queue_rate_update(struct mt7615_phy *phy, struct mt7615_sta *sta,
 	struct mt7615_dev *dev = phy->dev;
 	struct mt7615_wtbl_desc *wd;
 
+	if (work_pending(&dev->wtbl_work))
+		return -EBUSY;
+
 	wd = kzalloc(sizeof(*wd), GFP_ATOMIC);
 	if (!wd)
 		return -ENOMEM;
@@ -1023,6 +1026,7 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 
 	sta->rate_count = 2 * MT7615_RATE_RETRY * n_rates;
 	sta->wcid.tx_info |= MT_WCID_TX_INFO_SET;
+	sta->rate_probe = !!probe_rate;
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_set_rates);
 
@@ -1231,7 +1235,6 @@ static bool mt7615_fill_txs(struct mt7615_dev *dev, struct mt7615_sta *sta,
 				phy = dev->mt76.phy2->priv;
 
 			mt7615_mac_set_rates(phy, sta, NULL, sta->rates);
-			sta->rate_probe = false;
 		}
 		spin_unlock_bh(&dev->mt76.lock);
 	} else {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index b1cfae7c4b55..79453c890f20 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -683,10 +683,8 @@ static void mt7615_sta_rate_tbl_update(struct ieee80211_hw *hw,
 			break;
 	}
 	msta->n_rates = i;
-	if (!test_bit(MT76_STATE_PM, &phy->mt76->state)) {
+	if (!test_bit(MT76_STATE_PM, &phy->mt76->state))
 		mt7615_mac_set_rates(phy, msta, NULL, msta->rates);
-		msta->rate_probe = false;
-	}
 	spin_unlock_bh(&dev->mt76.lock);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index 7ec91c0856f5..2d67f9a148cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -155,7 +155,6 @@ int mt7615_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		spin_lock_bh(&dev->mt76.lock);
 		mt7615_mac_set_rates(phy, msta, &info->control.rates[0],
 				     msta->rates);
-		msta->rate_probe = true;
 		spin_unlock_bh(&dev->mt76.lock);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index a780127377bf..feda5d0c171e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -140,6 +140,8 @@ __mt7663u_mac_set_rates(struct mt7615_dev *dev,
 
 	mt76_wr(dev, addr + 27 * 4, w27);
 
+	sta->rate_probe = sta->rateset[rate->rateset].probe_rate.idx != -1;
+
 	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_MODE); /* TSF read */
 	val = mt76_rr(dev, MT_LPON_UTTR0);
 	sta->rate_set_tsf = (val & ~BIT(0)) | rate->rateset;
@@ -196,17 +198,21 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
 void mt7663u_wtbl_work(struct work_struct *work)
 {
 	struct mt7615_wtbl_desc *wd, *wd_next;
+	struct list_head wd_list;
 	struct mt7615_dev *dev;
 
 	dev = (struct mt7615_dev *)container_of(work, struct mt7615_dev,
 						wtbl_work);
 
-	mt7615_mutex_acquire(dev);
+	INIT_LIST_HEAD(&wd_list);
+	spin_lock_bh(&dev->mt76.lock);
+	list_splice_init(&dev->wd_head, &wd_list);
+	spin_unlock_bh(&dev->mt76.lock);
 
-	list_for_each_entry_safe(wd, wd_next, &dev->wd_head, node) {
-		spin_lock_bh(&dev->mt76.lock);
+	list_for_each_entry_safe(wd, wd_next, &wd_list, node) {
 		list_del(&wd->node);
-		spin_unlock_bh(&dev->mt76.lock);
+
+		mt7615_mutex_acquire(dev);
 
 		switch (wd->type) {
 		case MT7615_WTBL_RATE_DESC:
@@ -216,10 +222,11 @@ void mt7663u_wtbl_work(struct work_struct *work)
 			__mt7663u_mac_set_key(dev, wd);
 			break;
 		}
+
+		mt7615_mutex_release(dev);
+
 		kfree(wd);
 	}
-
-	mt7615_mutex_release(dev);
 }
 
 static void
@@ -236,17 +243,16 @@ mt7663u_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		       struct ieee80211_sta *sta,
 		       struct mt76_tx_info *tx_info)
 {
+	struct mt7615_sta *msta = container_of(wcid, struct mt7615_sta, wcid);
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
 
-	if (info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) {
-		struct mt7615_sta *msta;
-
-		msta = container_of(wcid, struct mt7615_sta, wcid);
+	if ((info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) &&
+	    !msta->rate_probe) {
+		/* request to configure sampling rate */
 		spin_lock_bh(&dev->mt76.lock);
 		mt7615_mac_set_rates(&dev->phy, msta, &info->control.rates[0],
 				     msta->rates);
-		msta->rate_probe = true;
 		spin_unlock_bh(&dev->mt76.lock);
 	}
 	mt7663u_mac_write_txwi(dev, wcid, qid, sta, tx_info->skb);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
