Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72FAC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 12:56:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34322078B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 12:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EB/vh82e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wLn/EUvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34322078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HlGnLi4vjJbwCQjlmG53kSlDQEgq5XBhw11Y8TrKXyM=; b=EB/vh82eCjux1+yLUKPXeW0WB
	gax7ZosbwNCJ56POo4HZhJLZ2DEez6seNKdLlKGz6kBC5OFrqFyfqwJeLvh3v1sGhMVm+saUXI4lt
	1GXDOTsgiNi61rokLVWz4M9Xvw0RftXA28M9HCeQQQzjM1uHx0U5dwK45fP4ysPVvysBVOBLAfpEq
	aYEJVAnTqSSOxbg0QT7SoUz9gKkUCWNC2D3SQFcNjd172fRTcUgODdP8jfpe8PEEqIQEYm5cpfZI+
	WcD5DSqJ0KotazJTiryVxhj0sCHj4yXmNoSBVORzdLvn6KPm2YRIPjeLQFBipk4bfBnS2vn7jh1Af
	SPE0nq2hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtsZz-00073U-AT; Fri, 10 Jul 2020 12:56:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtsZx-00072M-1T
 for linux-mediatek@lists.infradead.org; Fri, 10 Jul 2020 12:56:37 +0000
Received: from localhost.localdomain.com (unknown [151.48.133.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CFD620772;
 Fri, 10 Jul 2020 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594385796;
 bh=INrxJce8wnjRmOKZo8VgPo9cOequhPcM5DfO4gr3Y+U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wLn/EUvRTd7fdTtvFvE86CQ9C6wR9QKRiOifJOybB0QLR3bbSrxYFRWK2/UWAAlLh
 OP4f3EvzFgdUY82zrqCX3ByHR6FGKOYDQaNxpXEQQbvulEXJI2y2/RHCku2toOef9C
 iX4UeAfhYzkqz8wGnKCR+Z14h1VR5oTXUd9zk2BQ=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/6] mt76: mt76u: add mt76_skb_adjust_pad utility routine
Date: Fri, 10 Jul 2020 14:56:16 +0200
Message-Id: <a68408cc6dcb838a16c40f6a4207141ed76a6c6e.1594384887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1594384887.git.lorenzo@kernel.org>
References: <cover.1594384887.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_085637_217254_6169DF93 
X-CRM114-Status: GOOD (  14.62  )
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

Introduce mt76_skb_adjust_pad to reuse the code adding sdio support to
mt7615 driver and remove code duplication. Move 4B header configuration
for usb devices out of mt76_skb_adjust_pad

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  8 +++--
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |  3 +-
 .../wireless/mediatek/mt76/mt76x02_usb_core.c |  3 +-
 drivers/net/wireless/mediatek/mt76/tx.c       | 29 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/usb.c      | 29 -------------------
 6 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index c6e44283bd5f..e6a402c0f5eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1024,7 +1024,7 @@ mt76u_bulk_msg(struct mt76_dev *dev, void *data, int len, int *actual_len,
 	return usb_bulk_msg(udev, pipe, data, len, actual_len, timeout);
 }
 
-int mt76u_skb_dma_info(struct sk_buff *skb, u32 info);
+int mt76_skb_adjust_pad(struct sk_buff *skb);
 int mt76u_vendor_request(struct mt76_dev *dev, u8 req,
 			 u8 req_type, u16 val, u16 offset,
 			 void *buf, size_t len);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index 1f1578895ed5..aba926f1eeb5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -252,7 +252,8 @@ mt7663u_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 {
 	struct mt7615_sta *msta = container_of(wcid, struct mt7615_sta, wcid);
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
+	struct sk_buff *skb = tx_info->skb;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 
 	if ((info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) &&
 	    !msta->rate_probe) {
@@ -262,9 +263,10 @@ mt7663u_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				     msta->rates);
 		spin_unlock_bh(&dev->mt76.lock);
 	}
-	mt7663u_mac_write_txwi(dev, wcid, qid, sta, tx_info->skb);
+	mt7663u_mac_write_txwi(dev, wcid, qid, sta, skb);
 
-	return mt76u_skb_dma_info(tx_info->skb, tx_info->skb->len);
+	put_unaligned_le32(skb->len, skb_push(skb, sizeof(skb->len)));
+	return mt76_skb_adjust_pad(skb);
 }
 
 static bool mt7663u_tx_status_data(struct mt76_dev *mdev, u8 *update)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
index 39cd7dd95c9c..0b33df3e3bfe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
@@ -28,7 +28,8 @@ mt7663u_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	else
 		ep = MT_EP_OUT_AC_BE;
 
-	ret = mt76u_skb_dma_info(skb, skb->len);
+	put_unaligned_le32(skb->len, skb_push(skb, sizeof(skb->len)));
+	ret = mt76_skb_adjust_pad(skb);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
index 0180b6200b17..37321e656776 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
@@ -56,8 +56,9 @@ int mt76x02u_skb_dma_info(struct sk_buff *skb, int port, u32 flags)
 	 */
 	info = FIELD_PREP(MT_TXD_INFO_LEN, round_up(skb->len, 4)) |
 	       FIELD_PREP(MT_TXD_INFO_DPORT, port) | flags;
+	put_unaligned_le32(info, skb_push(skb, sizeof(info)));
 
-	return mt76u_skb_dma_info(skb, info);
+	return mt76_skb_adjust_pad(skb);
 }
 
 int mt76x02u_tx_prepare_skb(struct mt76_dev *mdev, void *data,
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 5adf92d7a9f3..3afd89ecd6c9 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -677,3 +677,32 @@ u8 mt76_ac_to_hwq(u8 ac)
 	return wmm_queue_map[ac];
 }
 EXPORT_SYMBOL_GPL(mt76_ac_to_hwq);
+
+int mt76_skb_adjust_pad(struct sk_buff *skb)
+{
+	struct sk_buff *iter, *last = skb;
+	u32 pad;
+
+	/* Add zero pad of 4 - 7 bytes */
+	pad = round_up(skb->len, 4) + 4 - skb->len;
+
+	/* First packet of a A-MSDU burst keeps track of the whole burst
+	 * length, need to update length of it and the last packet.
+	 */
+	skb_walk_frags(skb, iter) {
+		last = iter;
+		if (!iter->next) {
+			skb->data_len += pad;
+			skb->len += pad;
+			break;
+		}
+	}
+
+	if (skb_pad(last, pad))
+		return -ENOMEM;
+
+	__skb_put(last, pad);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt76_skb_adjust_pad);
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 84e2fd0a4fc1..5f19f9e51d9c 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -904,35 +904,6 @@ mt76u_tx_setup_buffers(struct mt76_dev *dev, struct sk_buff *skb,
 	return urb->num_sgs;
 }
 
-int mt76u_skb_dma_info(struct sk_buff *skb, u32 info)
-{
-	struct sk_buff *iter, *last = skb;
-	u32 pad;
-
-	put_unaligned_le32(info, skb_push(skb, sizeof(info)));
-	/* Add zero pad of 4 - 7 bytes */
-	pad = round_up(skb->len, 4) + 4 - skb->len;
-
-	/* First packet of a A-MSDU burst keeps track of the whole burst
-	 * length, need to update length of it and the last packet.
-	 */
-	skb_walk_frags(skb, iter) {
-		last = iter;
-		if (!iter->next) {
-			skb->data_len += pad;
-			skb->len += pad;
-			break;
-		}
-	}
-
-	if (skb_pad(last, pad))
-		return -ENOMEM;
-	__skb_put(last, pad);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mt76u_skb_dma_info);
-
 static int
 mt76u_tx_queue_skb(struct mt76_dev *dev, enum mt76_txq_id qid,
 		   struct sk_buff *skb, struct mt76_wcid *wcid,
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
