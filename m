Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97210C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI4f/YQCBrX2jvEX6OSm54TKyf51N83ApXmjX58ovoA=; b=UGxrSVAKPKRTO7
	8rrxBo6ZGWs1m6wUeYcULWZZpMhygrlL3Qf9Msh4TKHWeJOgZ5UXfjqNErxHP20sl/DjLZ4AVC3vY
	F+dw7qAxyPEgyBA5PcbO04ZgGVi54KfoBHfijUfIgTtt+4Pzx/a3//soxhT9kNmwRjFx3ywom/JZ2
	pneZ+5SA49sUfIOtgOAwzl86vSQwkUPqG8TycviKiQfFjVxxgzh4dUr5JBuQe9hINhqZug+Dk2qG6
	+wz6JdNQo8XdJCaIRbmcnO/FtOzkJ3bnByOvDTaKreR6aHodl3We14BY7O8pyVl/59bmf1F6vKo5k
	03cr1OgodkIsMGA9+A8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQWUg-00DTTx-7x; Sat, 05 Mar 2022 15:38:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQWUd-00DTT3-E6
 for linux-mediatek@lists.infradead.org; Sat, 05 Mar 2022 15:38:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02CB6B80C76;
 Sat,  5 Mar 2022 15:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D2EC004E1;
 Sat,  5 Mar 2022 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646494728;
 bh=7ghIDG7930tgRqC4mgjloK/gSp+YSv4hNVjtC4qVZ9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NNnG/gc0YH6gmEnlPgEgijojtim8ciwYZVSnRZ6oC7c2eiDgHHKxVqxxlgTFMQ5k7
 MvqMZJt+Lq+Ao1utthjPyrfV0Ghue62ojU2qWPgjCeP635LsaO+r3a6ClozSGwCeV2
 Z5l5nHihgCJKm79WHB2ouaR3g191g1VN+AT/ORycqX+p9rvxXzPnPZ4YysN5X8bCMr
 AG+51AcIHxGVytuJgKdwFw2D8TzhHUsTrmdmzebWTyVJCbCCmAisK4iPAjJ0E2pVTP
 Jban404sJDAHDjM+JQJ2/aDyqL3OYIbFGL+mHZo7y7yQ5raGDj+0tzwj3skh4OVdoQ
 Pj4wQep2Ln/YQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/9] mt76: usb: add req_type to ___mt76u_wr signature
Date: Sat,  5 Mar 2022 16:38:12 +0100
Message-Id: <8e36680d6f280108d264a0166957f3f12b2c731f.1646494452.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646494452.git.lorenzo@kernel.org>
References: <cover.1646494452.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_073851_655621_3FB4F15E 
X-CRM114-Status: GOOD (  10.76  )
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
 drivers/net/wireless/mediatek/mt76/usb.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 1b0435e0ea33..4b7a816f1b93 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -121,16 +121,14 @@ static u32 mt76u_rr_ext(struct mt76_dev *dev, u32 addr)
 	return ret;
 }
 
-static void ___mt76u_wr(struct mt76_dev *dev, u8 req,
+static void ___mt76u_wr(struct mt76_dev *dev, u8 req, u8 req_type,
 			u32 addr, u32 val)
 {
 	struct mt76_usb *usb = &dev->usb;
 
 	put_unaligned_le32(val, usb->data);
-	__mt76u_vendor_request(dev, req,
-			       USB_DIR_OUT | USB_TYPE_VENDOR,
-			       addr >> 16, addr, usb->data,
-			       sizeof(__le32));
+	__mt76u_vendor_request(dev, req, req_type, addr >> 16,
+			       addr, usb->data, sizeof(__le32));
 	trace_usb_reg_wr(dev, addr, val);
 }
 
@@ -146,7 +144,8 @@ static void __mt76u_wr(struct mt76_dev *dev, u32 addr, u32 val)
 		req = MT_VEND_MULTI_WRITE;
 		break;
 	}
-	___mt76u_wr(dev, req, addr & ~MT_VEND_TYPE_MASK, val);
+	___mt76u_wr(dev, req, USB_DIR_OUT | USB_TYPE_VENDOR,
+		    addr & ~MT_VEND_TYPE_MASK, val);
 }
 
 static void mt76u_wr(struct mt76_dev *dev, u32 addr, u32 val)
@@ -159,7 +158,8 @@ static void mt76u_wr(struct mt76_dev *dev, u32 addr, u32 val)
 static void mt76u_wr_ext(struct mt76_dev *dev, u32 addr, u32 val)
 {
 	mutex_lock(&dev->usb.usb_ctrl_mtx);
-	___mt76u_wr(dev, MT_VEND_WRITE_EXT, addr, val);
+	___mt76u_wr(dev, MT_VEND_WRITE_EXT,
+		    USB_DIR_OUT | USB_TYPE_VENDOR, addr, val);
 	mutex_unlock(&dev->usb.usb_ctrl_mtx);
 }
 
@@ -180,7 +180,8 @@ static u32 mt76u_rmw_ext(struct mt76_dev *dev, u32 addr,
 	mutex_lock(&dev->usb.usb_ctrl_mtx);
 	val |= ___mt76u_rr(dev, MT_VEND_READ_EXT,
 			   USB_DIR_IN | USB_TYPE_VENDOR, addr) & ~mask;
-	___mt76u_wr(dev, MT_VEND_WRITE_EXT, addr, val);
+	___mt76u_wr(dev, MT_VEND_WRITE_EXT,
+		    USB_DIR_OUT | USB_TYPE_VENDOR, addr, val);
 	mutex_unlock(&dev->usb.usb_ctrl_mtx);
 
 	return val;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
