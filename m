Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E49C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=If/Y4GtqaOeYsxQ8Psj+WlWq3bPfVikQuS57W+Ar6/Q=; b=eTQJ2LrAcgLRxo
	pkRg9WMullQNVX95OVM4gHb3rzibF1o2ozh5Y5Okjz03wXv3+P+KWwchnBJGF6nuLpXcR4wZa879v
	9pa+lAP7T+yWh2EkTqtyZKhDtVHt8g8+2rSz7fczWq5+TgUJCdtCXHVlrmR/UY/1ed/rarkNaLgIX
	t4Z/MB9AFkacfzGJlqAj5mmpODswrCFw3ywwwhSHSAQoXm38ttPma0fD47R7kZuOn7pcJQ7RRgFMd
	4mTdPl2/WWK/182Vx84SGfNqU1fQ1Uj96KV0MtvbNee7IpJdU7boPvmh+TatnGW1fpE2S6HeasqtO
	G8QEL9onv1qwxwZvh6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTQzy-0038hw-RY; Sun, 13 Mar 2022 16:23:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTQzw-0038gc-MG
 for linux-mediatek@lists.infradead.org; Sun, 13 Mar 2022 16:23:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2BF9EB80BE6;
 Sun, 13 Mar 2022 16:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC81C340E8;
 Sun, 13 Mar 2022 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647188590;
 bh=kiAGpf+4zwJ+zHiQl7xLk7QVnsQZlXGbdf0DELrdgHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+f/UZTueDzDubnUGzT+VCCxDrqxdMwCMbzLEBZOAJv8EB7p3VF+cTtOAvdAwARIm
 AXZC+V2WT8zX/QNUBg1rSx2YWnmRYEVv2BYC/Mila1YLUAiEeeZ+vuNpZpyNZ49mCx
 nheqsZsRh4yz9mK2NEx7ksWgqET1r+2eZTGkmXNwuQqNZY2l/3abvRBTE9yOfe1we2
 tSj3Nv1xtsilvQH/IJfTfv5nw8mH5Y+9aQkRhYHNk4uIxsxmQVfnBkPtCRStNVhGUO
 HWHwEi3CS6B2PCPY5UVAcG1lA3at/qeQknFrH09i76oDhk4mPNpLorwB1g6EOukV8h
 BnXo15iVw/UlQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/9] mt76: usb: add req_type to ___mt76u_rr signature
Date: Sun, 13 Mar 2022 17:22:33 +0100
Message-Id: <f7efc2f855e4756ae13accfc990e2af69a1fb3f0.1647188301.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647188301.git.lorenzo@kernel.org>
References: <cover.1647188301.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_092312_881651_7E376156 
X-CRM114-Status: GOOD (  10.65  )
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

This is a preliminary patch to add usb support to mt7921 driver.

Tested-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 0a7006c8959b..1b0435e0ea33 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -62,16 +62,15 @@ int mt76u_vendor_request(struct mt76_dev *dev, u8 req,
 }
 EXPORT_SYMBOL_GPL(mt76u_vendor_request);
 
-static u32 ___mt76u_rr(struct mt76_dev *dev, u8 req, u32 addr)
+static u32 ___mt76u_rr(struct mt76_dev *dev, u8 req, u8 req_type,
+		       u32 addr)
 {
 	struct mt76_usb *usb = &dev->usb;
 	u32 data = ~0;
 	int ret;
 
-	ret = __mt76u_vendor_request(dev, req,
-				     USB_DIR_IN | USB_TYPE_VENDOR,
-				     addr >> 16, addr, usb->data,
-				     sizeof(__le32));
+	ret = __mt76u_vendor_request(dev, req, req_type, addr >> 16,
+				     addr, usb->data, sizeof(__le32));
 	if (ret == sizeof(__le32))
 		data = get_unaligned_le32(usb->data);
 	trace_usb_reg_rr(dev, addr, data);
@@ -95,7 +94,8 @@ static u32 __mt76u_rr(struct mt76_dev *dev, u32 addr)
 		break;
 	}
 
-	return ___mt76u_rr(dev, req, addr & ~MT_VEND_TYPE_MASK);
+	return ___mt76u_rr(dev, req, USB_DIR_IN | USB_TYPE_VENDOR,
+			   addr & ~MT_VEND_TYPE_MASK);
 }
 
 static u32 mt76u_rr(struct mt76_dev *dev, u32 addr)
@@ -114,7 +114,8 @@ static u32 mt76u_rr_ext(struct mt76_dev *dev, u32 addr)
 	u32 ret;
 
 	mutex_lock(&dev->usb.usb_ctrl_mtx);
-	ret = ___mt76u_rr(dev, MT_VEND_READ_EXT, addr);
+	ret = ___mt76u_rr(dev, MT_VEND_READ_EXT,
+			  USB_DIR_IN | USB_TYPE_VENDOR, addr);
 	mutex_unlock(&dev->usb.usb_ctrl_mtx);
 
 	return ret;
@@ -177,7 +178,8 @@ static u32 mt76u_rmw_ext(struct mt76_dev *dev, u32 addr,
 			 u32 mask, u32 val)
 {
 	mutex_lock(&dev->usb.usb_ctrl_mtx);
-	val |= ___mt76u_rr(dev, MT_VEND_READ_EXT, addr) & ~mask;
+	val |= ___mt76u_rr(dev, MT_VEND_READ_EXT,
+			   USB_DIR_IN | USB_TYPE_VENDOR, addr) & ~mask;
 	___mt76u_wr(dev, MT_VEND_WRITE_EXT, addr, val);
 	mutex_unlock(&dev->usb.usb_ctrl_mtx);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
