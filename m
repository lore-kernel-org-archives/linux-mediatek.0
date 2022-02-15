Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fm5noK5SOssP4xHm4JlUCD8wQzfigtMVMvkIblonP9Q=; b=LwEhTSCx1kvqzH
	G4NoQX7UELKxuaqWJ00rVOynuSJdS0mKhNBNjMfvqXVu1fcmb/QJ0ovvhUm4r2q+Zyz3SRonCFinH
	b5Z/FJtq11fT3WbSsH8XeaXv+7W3aYs0TtN8a4VmVquNjYLBJPsSrj2BoBHW/5Xe4wmue3zokJvFE
	HLThvVARRzJs7KmvqwZJfQ3P90B88kTkfvXkIeOjUvTSX8IsfrMMzUXLADvvKKLPNiXbCxuq30bKI
	LNxS0PY7MwSAFQ0znl2hXO+AAoPtg6/A1x5qTD6mSpwS0Pzyb3vztvwQPtvzoTQmpQ2TOihDKG4RS
	9hil0CzA9d8Icc7jBfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtrz-001w6s-66; Tue, 15 Feb 2022 09:11:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtrd-001vys-T9
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 09:11:15 +0000
X-UUID: c61c895f96cf42c29380ba1c434d0e2d-20220215
X-UUID: c61c895f96cf42c29380ba1c434d0e2d-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 25448758; Tue, 15 Feb 2022 02:11:11 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 01:08:47 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 17:08:29 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 15 Feb 2022 17:08:29 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix logic error and remove the unused member of
 mt7915_dev
Date: Tue, 15 Feb 2022 17:08:27 +0800
Message-ID: <73401df842523a426c9c223217a4273cace2ab4b.1644915711.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <4b7ba947d90fc12bba5da59cd448372e89438b82.1644915710.git.Bo.Jiao@mediatek.com>
References: <4b7ba947d90fc12bba5da59cd448372e89438b82.1644915710.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_011114_000133_7FE488CC 
X-CRM114-Status: GOOD (  11.99  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

fix logic error and remove the unused member 'adie' of mt7915_dev.

Fixes: 91eeaef2523f ("mt76: mt7915: add support for MT7986")
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 - please fold this into previous commit.
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6a4fb4c..6b3749b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -589,10 +589,10 @@ static void mt7915_wfsys_reset(struct mt7915_dev *dev)
 
 		msleep(100);
 	} else if (is_mt7986(&dev->mt76)) {
-		mt7986_wmac_enable(dev);
+		mt7986_wmac_disable(dev);
 		msleep(20);
 
-		mt7986_wmac_disable(dev);
+		mt7986_wmac_enable(dev);
 		msleep(20);
 	} else {
 		mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 3ffee35..6db0db1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -322,9 +322,6 @@ struct mt7915_dev {
 	struct reset_control *rstc;
 	void __iomem *dcm;
 	void __iomem *sku;
-
-	/* adie is inaccessible after wfsys poweron */
-	u32 adie;
 };
 
 enum {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
