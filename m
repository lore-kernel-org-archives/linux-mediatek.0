Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F175C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPdkVPZhUnLSdorvWXiwcbYkgcZ/4o8t+a3HJNn8//o=; b=VsMVw7R2WRqUBq
	qN1rykfuZGjRdafUpqUGLdRzUVOljyQdSbFIp3eYlFaQqmP8foVJRyxHNOVDH0RnZ+VamFJIzugP9
	L0vrsbgKxvpj1DWcXgn5lyk3SODaavrQyWIUtOpOlNieLP1E1b2b+p5rvHTZqsyYjWRh4UTJX7GAc
	pZcqcmRW5WMQhHvYHCVHkGu85A2h6FOdlfxoiy3NQQyoj+wwtbMETs6NCdEt6hBhJll9zngwWnd/d
	lyN2KDwNKK+qoG/bwQRNyf2ewTKiORVnKbzm50qnsp1mY9b/exmN7TQTndbniGb7ruKPb9gwmWiZY
	bX+y7GXxKHNG816/lAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtp5-001v6H-1C; Tue, 15 Feb 2022 09:08:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtos-001v0O-E5
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 09:08:23 +0000
X-UUID: 129fd629755a46478d8384aa9106bab3-20220215
X-UUID: 129fd629755a46478d8384aa9106bab3-20220215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 210279705; Tue, 15 Feb 2022 02:08:17 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 01:08:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 17:08:14 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 15 Feb 2022 17:08:13 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix compiler warning
Date: Tue, 15 Feb 2022 17:08:12 +0800
Message-ID: <4b7ba947d90fc12bba5da59cd448372e89438b82.1644915710.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010822_509105_54173AD0 
X-CRM114-Status: GOOD (  10.57  )
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

fix warning: variable 'temp' set but not used and
cast from pointer to integer of different size

Fixes: 91eeaef2523f ("mt76: mt7915: add support for MT7986")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 - please fold this into previous commit.
---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index fb72ab4..decf288 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -125,7 +125,7 @@ mt7986_wmac_adie_efuse_read(struct mt7915_dev *dev, u8 adie,
 		return ret;
 
 	ret = read_poll_timeout(mt76_wmac_spi_read, temp,
-				!FIELD_GET(MT_ADIE_EFUSE_KICK_MASK, val),
+				!temp && !FIELD_GET(MT_ADIE_EFUSE_KICK_MASK, val),
 				USEC_PER_MSEC, 50 * USEC_PER_MSEC, false,
 				dev, adie, MT_ADIE_EFUSE2_CTRL, &val);
 	if (ret)
@@ -1126,9 +1126,9 @@ static int mt7986_wmac_probe(struct platform_device *pdev)
 	struct mt7915_dev *dev;
 	struct mt76_dev *mdev;
 	int irq, ret;
-	u64 chip_id;
+	u32 chip_id;
 
-	chip_id = (u64)of_device_get_match_data(&pdev->dev);
+	chip_id = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
