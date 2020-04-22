Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C760DC55186
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 08:48:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACB820656
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 08:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWYqRW6C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYz+bT9x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ACB820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3mdycTSMb+e3G6XeioOB9ipWloc26WABf74LI+o8lI=; b=iWYqRW6C8p+Zpu
	E2dEXZctOgcmDczMGe2L9fKdB+t7L28drt0DjPw3u68CX1LMnz7cWWzDdFAIxkq5SESv5RsGq/sZ+
	zwakh5GpbQBZvX9YAu+S2lJCz5EjhgAvCI0aL/ZpJaPzUiD2b8Mhk1yFiYXjhAKQzcPWZPIrzkgB1
	JCCMh/9PL2bv1g23Ks0yShoAM14EEjpBRLqFPcwE0aWDOGYwjkJawiuGbr1egjXWFZ3tektggiAho
	gXTrlA6rT9bzv0sPYZbSus1Skq5yzvn+oDryk3gw0/zlfvDzs+GTORgv2EVkTFaBUGqTis+BKo/1i
	X0zzZSV7eBVKLpfaBgXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRB2q-0000ox-9y; Wed, 22 Apr 2020 08:47:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRB2n-0000ml-5i
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 08:47:46 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C25CF206E9;
 Wed, 22 Apr 2020 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587545264;
 bh=VD/d7xnxoigicRP8uPAQVI4GjINnObaSoIi01c0lugM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uYz+bT9xgyZAle/c0iUTrWPa7wUEh9Ki+9uaftmlrM3rM6acqdjlko72JjkVglf1X
 6cNxqcYhl1dC3tynwPTM/fHnBAbppj7/syoVC/2FJ6WER0Zm/oz53Vf4+3SZ4M3XCM
 BklYbHmlb9rzD2RlhtEW5+XercFiMskqLvRJBX3c=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 1/2] mt76: mt7615: rework mt7615_mac_sta_poll for usb code
Date: Wed, 22 Apr 2020 10:47:23 +0200
Message-Id: <0b853a4e075d4308fc4e0cf6193a7c6c7fae4c3c.1587545092.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <cover.1587545092.git.lorenzo@kernel.org>
References: <cover.1587545092.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_014745_234036_E266BF2B 
X-CRM114-Status: GOOD (  10.24  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since usb code can't access device registers in interrupt context, move
rcu_read_lock/rcu_read_unlock in mt7615_poll_tx routine. Moreover loop
over a local msta list in mt7615_mac_sta_poll since mt7663u driver will
not be able to complete the inner while loop before sta_poll_list list
is refilled by mt7615_mac_add_txs/mt7615_mac_fill_rx

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |  2 ++
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 20 ++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
index b0ba0e7807bf..5cdbe3747901 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
@@ -121,7 +121,9 @@ static int mt7615_poll_tx(struct napi_struct *napi, int budget)
 
 	mt7615_tx_cleanup(dev);
 
+	rcu_read_lock();
 	mt7615_mac_sta_poll(dev);
+	rcu_read_unlock();
 
 	tasklet_schedule(&dev->mt76.tx_tasklet);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 3dab07d3eb1d..396f11e1bbf6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -724,22 +724,20 @@ void mt7615_mac_sta_poll(struct mt7615_dev *dev)
 	struct ieee80211_sta *sta;
 	struct mt7615_sta *msta;
 	u32 addr, tx_time[4], rx_time[4];
+	struct list_head sta_poll_list;
 	int i;
 
-	rcu_read_lock();
+	INIT_LIST_HEAD(&sta_poll_list);
+	spin_lock_bh(&dev->sta_poll_lock);
+	list_splice_init(&dev->sta_poll_list, &sta_poll_list);
+	spin_unlock_bh(&dev->sta_poll_lock);
 
-	while (true) {
+	while (!list_empty(&sta_poll_list)) {
 		bool clear = false;
 
-		spin_lock_bh(&dev->sta_poll_lock);
-		if (list_empty(&dev->sta_poll_list)) {
-			spin_unlock_bh(&dev->sta_poll_lock);
-			break;
-		}
-		msta = list_first_entry(&dev->sta_poll_list,
-					struct mt7615_sta, poll_list);
+		msta = list_first_entry(&sta_poll_list, struct mt7615_sta,
+					poll_list);
 		list_del_init(&msta->poll_list);
-		spin_unlock_bh(&dev->sta_poll_lock);
 
 		addr = mt7615_mac_wtbl_addr(dev, msta->wcid.idx) + 19 * 4;
 
@@ -779,8 +777,6 @@ void mt7615_mac_sta_poll(struct mt7615_dev *dev)
 						       rx_cur);
 		}
 	}
-
-	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_sta_poll);
 
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
