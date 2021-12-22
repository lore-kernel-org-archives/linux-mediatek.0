Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E655DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iFV8g00hVp19fD6hHytmxwAlnkOTFrGO4J5LPU0tZTc=; b=ZFrDz0nngGFaXN
	HQjJviD/Uvj5+rPTgKBQdScdNAClrtxre0A7NVc9P99gSGA/edSGE2/HM4MIPbVK99JnIQW25vcKt
	UhHJhfM9CBMTCSDCq1cZFdsZ9Hn3c365Kj/Z+MirXovM2rPLshTkhGyLWDDmzKWWoDNYGuPp1Qib1
	1dL6eu/ERI67W9kGSaEYzJgkwdu3hGJnuVUDhGJvXO6TYfqO4aeHvHCphaU79CxI+ohA6aCRAkzSv
	GKLYJq2MIZ6056Kw1cvyYjU8HPEUqlwRIbH5aEDByVtVweoXMz7S5+qRtbwvUqGbTZSrDRCp0kYo0
	svoE1t7fDfOFpwyP8MAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n00tp-00AIQw-Fb; Wed, 22 Dec 2021 12:39:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n00tm-00AIQR-FU
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 12:39:15 +0000
X-UUID: 3e842f9aeb424e3884db3736e9b5bc96-20211222
X-UUID: 3e842f9aeb424e3884db3736e9b5bc96-20211222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1308765013; Wed, 22 Dec 2021 05:39:08 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Dec 2021 04:29:06 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Dec 2021 20:29:04 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 22 Dec 2021 20:29:03 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix code defect
Date: Wed, 22 Dec 2021 20:29:00 +0800
Message-ID: <5806e90f8e0cf9eba7f5432082a4c0f1e9e15636.1640173851.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_043914_547841_80C8C603 
X-CRM114-Status: GOOD (  10.87  )
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

fix code defect, variable 'val' is used without initialization
in mt7915_wfsys_reset().

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 13 +++++--------
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 14 ++++++--------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 7557429..b4ff3d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -541,11 +541,12 @@ static void mt7915_init_work(struct work_struct *work)
 
 static void mt7915_wfsys_reset(struct mt7915_dev *dev)
 {
-	u32 val;
-
 #define MT_MCU_DUMMY_RANDOM	GENMASK(15, 0)
 #define MT_MCU_DUMMY_DEFAULT	GENMASK(31, 16)
+
 	if (is_mt7915(&dev->mt76)) {
+		u32 val = MT_TOP_PWR_KEY | MT_TOP_PWR_SW_PWR_ON | MT_TOP_PWR_PWR_ON;
+
 		mt76_wr(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_RANDOM);
 
 		/* change to software control */
@@ -578,14 +579,10 @@ static void mt7915_wfsys_reset(struct mt7915_dev *dev)
 
 		msleep(100);
 	} else {
-		val = mt76_rr(dev, MT_WF_SUBSYS_RST);
-
-		val |= 0x1;
-		mt76_wr(dev, MT_WF_SUBSYS_RST, val);
+		mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
 		msleep(20);
 
-		val &= ~0x1;
-		mt76_wr(dev, MT_WF_SUBSYS_RST, val);
+		mt76_clear(dev, MT_WF_SUBSYS_RST, 0x1);
 		msleep(20);
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 6500095..a6dd33f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -271,7 +271,7 @@ static u32 mt7915_reg_map_l1(struct mt7915_dev *dev, u32 addr)
 
 	dev->bus_ops->rmw(&dev->mt76, l1_remap,
 			  MT_HIF_REMAP_L1_MASK,
-		FIELD_PREP(MT_HIF_REMAP_L1_MASK, base));
+			  FIELD_PREP(MT_HIF_REMAP_L1_MASK, base));
 	/* use read to push write */
 	dev->bus_ops->rr(&dev->mt76, l1_remap);
 
@@ -575,17 +575,15 @@ int mt7915_mmio_probe(struct device *pdev,
 	if (ret)
 		goto error;
 
-	if (hif2) {
+	if (hif2 && dev_is_pci(pdev)) {
 		dev->hif2 = hif2;
 
 		mt76_wr(dev, MT_INT1_MASK_CSR, 0);
 		/* master switch of PCIe tnterrupt enable */
-		if (dev_is_pci(pdev)) {
-			if (is_mt7915(mdev))
-				mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE, 0xff);
-			else
-				mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE_MT7916, 0xff);
-		}
+		if (is_mt7915(mdev))
+			mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE, 0xff);
+		else
+			mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE_MT7916, 0xff);
 
 		ret = devm_request_irq(mdev->dev, dev->hif2->irq,
 				       mt7915_irq_handler, IRQF_SHARED,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
