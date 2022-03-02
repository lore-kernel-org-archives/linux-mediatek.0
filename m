Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D68C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVJ0Ff7EZd0TuoWsPkeYfPGvMy9vy5V5fTuc89hu1Vs=; b=ycRprxxX9HSl5X
	e5e79EKoXs6Fj6mEpq3NA9521It/s2Hl1TKNSvQKmnRBp4FOvPgjP48ILxzVySodP9D4sVWIHsAgQ
	1/PAM/OpVHmyt/PIwjrkM0Hi9o95jhFVXT3g4B0UZg4alXIYcgCeskbcjlqe1oTCsArF1oSXmVBtA
	Ea6xvCyfA472rVkX+51uqe+Jo40migSWQb+klp9fFbh4p9ns0jyFGDm03rVwsA2FWV532iuoNImGF
	zku60dTWIoCXi2o5nF2QHvfGB/iLvQE94SBTXApP4MvLlb5G5SjceIC4N7ScYNj54CgokCx+NyuYG
	hNadnVC9qCc/xsiORWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPRDV-003Ded-Ld; Wed, 02 Mar 2022 15:48:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPRDT-003Dcz-AA
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 15:48:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD05D61735;
 Wed,  2 Mar 2022 15:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC7DC340ED;
 Wed,  2 Mar 2022 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646236118;
 bh=asrPxwbalw10OfS9T8RXKhwTL8CE32GiK7t7yIecQGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xfab6SBSQw/fevqm4scPsTOUPAjJ3ZMoNIcOfIlkGtRjyKHW6i1yRB+YiibfI8Vyu
 rHp17yWYghJEAQ26VFhecHwnof3mn//kUFzUONOIf8Q8q4e8e2VXMmbNpBwT3FdpRk
 72Dw9Ka78TtdWidKSNtG+9NdTWymwZNThGKG2+czqCO8zcfXIM1Dw1vREhP9juPbNF
 2wiU83Ij4vtivR1ovSJWn3MVjUoZoveswRpWzo9Z4RWJmSeUsXIsvc6OAC1YiiroOy
 J+DXXkRY68t1qye0mvFUTfvYlikOHdYmAk3vLEbRJlw2UURrEhQBiNvv7lb4RemUwA
 7V6lMo69atRHg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/9] mt76: usb: add req_type to ___mt76u_wr signature
Date: Wed,  2 Mar 2022 16:48:06 +0100
Message-Id: <ea5bf3402f1894bd4901eca5a736a736dfe64c24.1646235785.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646235785.git.lorenzo@kernel.org>
References: <cover.1646235785.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_074839_414575_D6EC3F25 
X-CRM114-Status: GOOD (  11.36  )
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
