Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yi9g81co7Fj5zcEln25NDo8HL0rrtiFDGEEcSBTJ0Uk=; b=FTVKJQxQxUBe1o
	N6nfCIvgLeEFGqoHCGHoNgo1d0azvjkRuY5afSUOQMMVnw9dzhyH5pMkBEg8/5qJJWst53a4tf/YM
	NV//SzA6+yVf8oJSoK881QvsIgj9kA1dKK5z8i41JV4kSTvlHjQ3r79Yh+g9AeH4L+ck6678mDAhs
	cwc/xr/WGFACQyuGV1HCQWhQQ5lSLiX77d/87jwMLfbog4wrybE81ke2bvNE1HUOZc0/1KSLMLwe6
	SzUSyCpYIChkyKnhFanIFfCHpM0Og9XJU+Jt/XWu1DnEFIJPp0V4lI65bT6ftWDxOWFjFuYCiTban
	dKUT7+hAbBQ10y4GT71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQWUo-00DTZ3-VX; Sat, 05 Mar 2022 15:39:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQWUk-00DTU7-Sz
 for linux-mediatek@lists.infradead.org; Sat, 05 Mar 2022 15:39:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E51C161372;
 Sat,  5 Mar 2022 15:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3689C340EE;
 Sat,  5 Mar 2022 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646494734;
 bh=vWYEwj9bMeocwPJKYWWG1OPngaooMgxC7H2BaRAmieE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eVSsLCS3qNS3pdc5686kMf+i7v+MwWtIJF3OGtkFzELCvRg4+RjmHwTEqQOJJAb1E
 LPkBBM/+K4DZB0AQZa+9HSd97dA7D2vxnjVgwKOrch3HxkeKTb7p8Gc5+HScWxjqVP
 on/5EdGzKJ5hnvclZrNzY6Ofx+Z26ERJeSkpyEmf1tIEvnyQaIM2rIkGwgZ9p1iKbZ
 ezjQNRorOY7IPNSGFQAcz7bD/ZatGCMgRmv0JPiMoXxP/CJsFv4q11j6E6Fc3DczWQ
 UzCzH5VA+mmD12MU84t4lAyFZ810zrOFBk8jqJ4wL/5v7dDVrQ5WlFz67TSy60m5p+
 rbAo7h+ZCT7sw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/9] mt76: mt7921: update mt7921_skb_add_usb_sdio_hdr to
 support usb
Date: Sat,  5 Mar 2022 16:38:15 +0100
Message-Id: <f2b80c7c0e268ac5e5a96e79a9d867656fe38465.1646494452.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646494452.git.lorenzo@kernel.org>
References: <cover.1646494452.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_073859_044276_1316B661 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch to add mt7921u driver support.

Tested-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h   | 10 ++++++----
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c |  2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index f8bfd987fbc9..3c7ff09a36ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -352,12 +352,14 @@ static inline void mt7921_mcu_tx_cleanup(struct mt7921_dev *dev)
 	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], false);
 }
 
-static inline void mt7921_skb_add_sdio_hdr(struct sk_buff *skb,
-					   enum mt7921_sdio_pkt_type type)
+static inline void
+mt7921_skb_add_usb_sdio_hdr(struct mt7921_dev *dev, struct sk_buff *skb,
+			    int type)
 {
-	u32 hdr;
+	u32 hdr, len;
 
-	hdr = FIELD_PREP(MT7921_SDIO_HDR_TX_BYTES, skb->len + sizeof(hdr)) |
+	len = mt76_is_usb(&dev->mt76) ? skb->len : skb->len + sizeof(hdr);
+	hdr = FIELD_PREP(MT7921_SDIO_HDR_TX_BYTES, len) |
 	      FIELD_PREP(MT7921_SDIO_HDR_PKT_TYPE, type);
 
 	put_unaligned_le32(hdr, skb_push(skb, sizeof(hdr)));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index 4fd1d4765b04..5462ab05fb13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -183,7 +183,7 @@ int mt7921s_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	pktid = mt76_tx_status_skb_add(&dev->mt76, wcid, skb);
 	mt7921s_write_txwi(dev, wcid, qid, sta, key, pktid, skb);
 
-	mt7921_skb_add_sdio_hdr(skb, MT7921_SDIO_DATA);
+	mt7921_skb_add_usb_sdio_hdr(dev, skb, MT7921_SDIO_DATA);
 	pad = round_up(skb->len, 4) - skb->len;
 
 	err = mt76_skb_adjust_pad(skb, pad);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
index 5d8af18c7026..54a5c712a3c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
@@ -36,7 +36,7 @@ mt7921s_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (cmd == MCU_CMD(FW_SCATTER))
 		type = MT7921_SDIO_FWDL;
 
-	mt7921_skb_add_sdio_hdr(skb, type);
+	mt7921_skb_add_usb_sdio_hdr(dev, skb, type);
 	pad = round_up(skb->len, 4) - skb->len;
 	__skb_put_zero(skb, pad);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
