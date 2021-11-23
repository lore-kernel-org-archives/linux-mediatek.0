Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F298CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 05:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ecm/HrlPevZeOHAgVzeN4B9ETG5oOUZtHIp4Mtn5SK8=; b=kmCnS4Oad8heNY
	lk+Y6THpgMfBPlIxEN0bchtUs3OkgH7G2xj5Wq+lzPnoQhJ4pN3NbTT9sfoxfTOOUQS3NOdNCNO73
	R8+1uL+lKw1kmCFrTXe+paDpA8ApgWm7gDpHpdYQ27VEAY3usUpWjhfBRIjlWgrzo1+fpbTzB7l2f
	lWPSDGtbvdBW9h8cP5wk7w0TmdaISEGuMBURQ1WbE45r5IBMZo/Sqaw50dVCy9eV8YSbQhFU1597l
	ndFZqB+f+ohQR3BXcIOgW82PyiWLag5/1b2idk+UAqfxcVqoa8ZBffYPaW3Sp2it8szsFrBpZufjM
	k8mUBaVY4FZRKMeSpG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpOkM-000vx2-PE; Tue, 23 Nov 2021 05:53:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpOkI-000vv0-DR
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 05:53:37 +0000
X-UUID: 0aab60485ef44f92a91aabb6bca52e9a-20211122
X-UUID: 0aab60485ef44f92a91aabb6bca52e9a-20211122
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1038794611; Mon, 22 Nov 2021 22:53:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 21:53:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 13:53:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Nov 2021 13:53:26 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7615: fix unused tx antenna mask in testmode
Date: Tue, 23 Nov 2021 13:53:00 +0800
Message-ID: <20211123055300.27903-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_215334_490265_5F320BF6 
X-CRM114-Status: GOOD (  10.36  )
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

The mask variable is assigned but not used after testmode disabled:
if (!en)
	mask = phy->mt76->chainmask;

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/testmode.c  | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
index 59d9926..f374d89 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
@@ -185,36 +185,35 @@ mt7615_tm_set_tx_antenna(struct mt7615_phy *phy, bool en)
 	for (i = 0; i < 4; i++) {
 		mt76_rmw_field(dev, MT_WF_PHY_RFINTF3_0(i),
 			       MT_WF_PHY_RFINTF3_0_ANT,
-			       (td->tx_antenna_mask & BIT(i)) ? 0 : 0xa);
-
+			       (mask & BIT(i)) ? 0 : 0xa);
 	}
 
 	/* 2.4 GHz band */
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(3), MT_ANT_SWITCH_CON_MODE(0),
-		       (td->tx_antenna_mask & BIT(0)) ? 0x8 : 0x1b);
+		       (mask & BIT(0)) ? 0x8 : 0x1b);
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(4), MT_ANT_SWITCH_CON_MODE(2),
-		       (td->tx_antenna_mask & BIT(1)) ? 0xe : 0x1b);
+		       (mask & BIT(1)) ? 0xe : 0x1b);
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(6), MT_ANT_SWITCH_CON_MODE1(0),
-		       (td->tx_antenna_mask & BIT(2)) ? 0x0 : 0xf);
+		       (mask & BIT(2)) ? 0x0 : 0xf);
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(7), MT_ANT_SWITCH_CON_MODE1(2),
-		       (td->tx_antenna_mask & BIT(3)) ? 0x6 : 0xf);
+		       (mask & BIT(3)) ? 0x6 : 0xf);
 
 	/* 5 GHz band */
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(4), MT_ANT_SWITCH_CON_MODE(1),
-		       (td->tx_antenna_mask & BIT(0)) ? 0xd : 0x1b);
+		       (mask & BIT(0)) ? 0xd : 0x1b);
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(2), MT_ANT_SWITCH_CON_MODE(3),
-		       (td->tx_antenna_mask & BIT(1)) ? 0x13 : 0x1b);
+		       (mask & BIT(1)) ? 0x13 : 0x1b);
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(7), MT_ANT_SWITCH_CON_MODE1(1),
-		       (td->tx_antenna_mask & BIT(2)) ? 0x5 : 0xf);
+		       (mask & BIT(2)) ? 0x5 : 0xf);
 	mt76_rmw_field(dev, MT_ANT_SWITCH_CON(8), MT_ANT_SWITCH_CON_MODE1(3),
-		       (td->tx_antenna_mask & BIT(3)) ? 0xb : 0xf);
+		       (mask & BIT(3)) ? 0xb : 0xf);
 
 	for (i = 0; i < 4; i++) {
 		u32 val;
 
 		val = mt7615_rf_rr(dev, i, 0x48);
 		val &= ~(0x3ff << 20);
-		if (td->tx_antenna_mask & BIT(i))
+		if (mask & BIT(i))
 			val |= 3 << 20;
 		else
 			val |= (2 << 28) | (2 << 26) | (8 << 20);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
