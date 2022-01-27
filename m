Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g1a3QmakC3FP0JSK6XDnCIpkyLWT88kyn3VFEWEBn3o=; b=Ue3BaBm2qgxnlG
	dkvroGQeuFWVPzLYBkS4Uqpq9v0xt//4ZIJ1HIFnM57xWopP7U0byyqCTejRMxGafeAZWnVL4ZcoX
	rHdzOYB6zDIxf9TkMN5gLX48XbolJR2SITDEGpyzUjRiRKr8L2O0g3aduR40Of4nBKvjHaqVzURWo
	L6Yud2tsdRZipKPtYVPi3VuMWizew/P8hwc2KaSnxBx2eBoVVhEtuy1b8WJY0Xi24PqVCbp9swgGj
	H4K83YMnZTd+NvM4kRL1h5hheqaqGg8FQb3RrGJw5NtzU8AF3JKEazjFFSKI9TTwQvTKDSmcijDyQ
	VqbzgM90e5+rB+KJvp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD4tF-00Fua1-Se; Thu, 27 Jan 2022 13:32:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD4tD-00FuYB-3w
 for linux-mediatek@lists.infradead.org; Thu, 27 Jan 2022 13:32:40 +0000
X-UUID: 1be06cadd453459995659518f374ef26-20220127
X-UUID: 1be06cadd453459995659518f374ef26-20220127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 579891671; Thu, 27 Jan 2022 06:32:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 05:32:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 27 Jan 2022 21:32:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 27 Jan 2022 21:32:28 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, MeiChia Chiu
 <meichia.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix the nss setting in bitrates
Date: Thu, 27 Jan 2022 21:32:26 +0800
Message-ID: <20220127133226.14299-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_053239_198681_D7980AF7 
X-CRM114-Status: GOOD (  10.49  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

without this change, the fixed MCS only supports 1 Nss.

Fixes: 70fd1333cd32f ("mt76: mt7915: rework .set_bitrate_mask() to support more options")
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 66f8daf3168c..69c5ac10e114 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1420,9 +1420,12 @@ mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 			phy.sgi |= gi << (i << (_he));				\
 			phy.he_ltf |= mask->control[band].he_ltf << (i << (_he));\
 		}								\
-		for (i = 0; i < ARRAY_SIZE(mask->control[band]._mcs); i++) 	\
-			nrates += hweight16(mask->control[band]._mcs[i]);  	\
-		phy.mcs = ffs(mask->control[band]._mcs[0]) - 1;			\
+		for (i = 0; i < ARRAY_SIZE(mask->control[band]._mcs); i++) {	\
+			if (!mask->control[band]._mcs[i])			\
+				continue;					\
+			nrates += hweight16(mask->control[band]._mcs[i]);	\
+			phy.mcs = ffs(mask->control[band]._mcs[i]) - 1;		\
+		}								\
 	} while (0)
 
 	if (sta->he_cap.has_he) {
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
