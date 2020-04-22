Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B72C55186
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 08:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DCA20656
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 08:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W5d38xrs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="elpSWPNN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5DCA20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LcHxwAIIaaHRkB7fk/SAZXcr3x6i/wet3516CFgClI=; b=W5d38xrsWmItPy
	HFISEANOevl0hiYBMx2pCAzvXz3bR7X0z7xZFd6ZK6LZqYgTtpsQwUTbqfHokWLBEFEFe+PnTKyBE
	+WdYDAs1x+ULvDhc11bGClFqJmdCsz/PtjvbAxFqgjmFnRflM3bzB2Wm8KYCI3qcIVHsw5H6WOMPn
	OkEzSixUoWgi8LroXergHzFi1j5ciwR0R9zNnIKvY4qD6zEmvF43frT0s/j/braqfdmhiIoCztZEX
	Oxt0U402X26ECTQejzxsKMgP7Rl2+CnVEIDz1OWGbbj18bwWX4+4s/oXV8OJkRCDd+oLBuAzN6dWm
	i/KgfUrgttqMfVeCsqNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRB2r-0000qC-R7; Wed, 22 Apr 2020 08:47:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRB2p-0000oZ-MQ
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 08:47:48 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4270920656;
 Wed, 22 Apr 2020 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587545267;
 bh=H+iCK6yRR6BYhkAGIf3uVrgrioSvnJIwKWkSrcWcVQg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=elpSWPNNMUARCovPL3c+iLT8kAeZq339Hi5i9ejLVyPA0bjuqxde5NLosPSnj5h6c
 UwlLi88Ipz9olNuqHv6w3S88OUziRshFao5B6c1mcLXAL/d+/Nt1Ggc5Q3q7UuSoL6
 BGEVHK821uftiu94x1PpWAMrth6qxPl1oTB9MMzs=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/2] mt76: mt7663u: enable AirTimeFairness
Date: Wed, 22 Apr 2020 10:47:24 +0200
Message-Id: <dd383b994e5f5ca64f924e12a4e250da40784853.1587545092.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <cover.1587545092.git.lorenzo@kernel.org>
References: <cover.1587545092.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_014747_749223_63287544 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

Initialize tx_status_data pointer in order to enable Air Time Fairness
for mt7663u chipset

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/usb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index ad5219006987..eee6f820959f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -249,6 +249,17 @@ mt7663u_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	return mt76u_skb_dma_info(tx_info->skb, tx_info->skb->len);
 }
 
+static bool mt7663u_tx_status_data(struct mt76_dev *mdev, u8 *update)
+{
+	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
+
+	mutex_lock(&dev->mt76.mutex);
+	mt7615_mac_sta_poll(dev);
+	mutex_unlock(&dev->mt76.mutex);
+
+	return 0;
+}
+
 static int mt7663u_probe(struct usb_interface *usb_intf,
 			 const struct usb_device_id *id)
 {
@@ -257,6 +268,7 @@ static int mt7663u_probe(struct usb_interface *usb_intf,
 		.drv_flags = MT_DRV_RX_DMA_HDR,
 		.tx_prepare_skb = mt7663u_tx_prepare_skb,
 		.tx_complete_skb = mt7663u_tx_complete_skb,
+		.tx_status_data = mt7663u_tx_status_data,
 		.rx_skb = mt7615_queue_rx_skb,
 		.sta_ps = mt7615_sta_ps,
 		.sta_add = mt7615_mac_sta_add,
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
