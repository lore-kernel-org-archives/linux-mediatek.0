Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6E3C2BA80
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 09:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445022084D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 09:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PC5exHme";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDwmUhEw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445022084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNqDs8hxUkG4lxE5SErqvWqZ9jQBFLEOmDl1HJ0nWVk=; b=PC5exHmeZEoMLJ
	v5yJJGfBzsEnIdu/vZHY9aSCk1GvH/ztJzeQZzFlBk5fdqbyHnixn+ncpYYcIGtoN5LJuSJgJCItE
	cgxxDLwcx9IhsiZbJrhe/H2K0tcpSIItdyiPj2C84qmwuJAziMybcLT9q/vi+cvJJ4LzoOU9oyQEo
	5jY1PBBSggkwQrW6Zhs1CDqSL/lJBt0lpaT7S27aToaC0XKJ/5DdPTnqxwmFWWFIOGWcKQ4DQrWYa
	0Ah3ycUke2zvEjtOE8Rf+PeHAU/TntamBx2hYSkEnN49nmcirrXmiWBVYbxhhxmWpVuYB7Hp2JETd
	Q3IzFKuq++ePVFk5QxkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMSpq-0000BV-9K; Thu, 09 Apr 2020 08:46:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMSpn-0000AH-Gg
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 08:46:52 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6940322206;
 Thu,  9 Apr 2020 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586422011;
 bh=SIpkwKZjrnQ6AtdZVrfLuhZQ/3hgVIcv+fqa+0b2KNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UDwmUhEwn+/gnAuRS3qNFpf50dzarY4quuePBzOhXedW+ahj3PGFVVbxLGbpFVOzy
 TCvE+synhZHe+VhfRdKZ1Rj9FZdC5nkfj02Z7wucU1IcLEDouShPwNbrGJYfe9x3ly
 oaGgWWspg5utY4ZcZLEs19ylSZ2EHwvmvcCWPUhU=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 1/2] mt76: mt7622: fix DMA unmap length
Date: Thu,  9 Apr 2020 10:46:38 +0200
Message-Id: <f46e842b580fe6e04fb2a7ff51a489832558f535.1586421673.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586421673.git.lorenzo@kernel.org>
References: <cover.1586421673.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_014651_597239_49E5455F 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 soul.huang@mediatek.com, lorenzo.bianconi@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix DMA unmap length estimation in mt7615_txp_skb_unmap_hw for mt7622
chipset

Fixes: 6aa4ed7927f1 ("mt76: mt7615: implement DMA support for MT7622")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c     | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c | 3 +--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index c4a81bde5cf9..e7db7f17c37b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -662,16 +662,16 @@ mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 		u16 len;
 
 		len = le16_to_cpu(ptr->len0);
-		last = len & MT_TXD_LEN_MSDU_LAST;
-		len &= ~MT_TXD_LEN_MSDU_LAST;
+		last = len & MT_TXD_LAST_MASK;
+		len &= ~MT_TXD_LAST_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
 				 DMA_TO_DEVICE);
 		if (last)
 			break;
 
 		len = le16_to_cpu(ptr->len1);
-		last = len & MT_TXD_LEN_MSDU_LAST;
-		len &= ~MT_TXD_LEN_MSDU_LAST;
+		last = len & MT_TXD_LAST_MASK;
+		len &= ~MT_TXD_LAST_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
 				 DMA_TO_DEVICE);
 		if (last)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index b540a8cca1e1..d9b2fdfb4c8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -258,6 +258,7 @@ enum tx_phy_bandwidth {
 
 #define MT_TXD_LEN_MSDU_LAST		BIT(14)
 #define MT_TXD_LEN_AMSDU_LAST		BIT(15)
+#define MT_TXD_LAST_MASK		GENMASK(15, 14)
 
 struct mt7615_txp_ptr {
 	__le32 buf0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index 7fba1c39060f..6dfd03a8869b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -67,8 +67,7 @@ mt7615_write_hw_txp(struct mt7615_dev *dev, struct mt76_tx_info *tx_info,
 		u16 len = tx_info->buf[i + 1].len;
 
 		if (i == nbuf - 1)
-			len |= MT_TXD_LEN_MSDU_LAST |
-			       MT_TXD_LEN_AMSDU_LAST;
+			len |= MT_TXD_LAST_MASK;
 
 		if (i & 1) {
 			ptr->buf1 = cpu_to_le32(addr);
-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
