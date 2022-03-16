Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 00:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ONIzEKSwtlkX03TFqAtZgDxy2YIPy0Y0zZTg5ue4UNU=; b=P0FItvhJb+hduJ
	jejvfhu95VzcbpTwgak0r86VZA0RxSz0IR3f/qydWI1jK0DmPzizWVN+jqfgv5PYiuRutxYSQ6FVn
	xWl8grNvi4vDAbc0PeraMG0DNIeM7a5egFT0Jdtu4BD9f/6gIqX1xa3luunpRz3R+jc+0eEzzpbcm
	2AgR2CAhHIxw5Je48FelIfM4UAj3GeTa8JQyn1zC67xohiiMRDpZJwN5b37cpoOPDTMlfyr6F9VkU
	UaFxFfsfZv/A/Re3PMa1J2O2zX98ugQ8KYNaLToYLo15gtjVf1CJi796oN6hKc87lZxOVKgFSfA6i
	7Z500lqpII2r+H1kXpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUHJ7-00AyYx-4p; Wed, 16 Mar 2022 00:14:29 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUHIu-00AyW1-U2; Wed, 16 Mar 2022 00:14:18 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0V7JcKdl_1647389652; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V7JcKdl_1647389652) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Mar 2022 08:14:13 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mchehab@kernel.org
Cc: matthias.bgg@gmail.com, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: platform: Remove unnecessary print function
 dev_err()
Date: Wed, 16 Mar 2022 08:14:11 +0800
Message-Id: <20220316001411.80167-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_171417_158508_6E769248 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

Eliminate the follow coccicheck warnings:
./drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:119:2-9:
line 119 is redundant because platform_get_irq() already prints an error
./drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c:103:2-9:
line 103 is redundant because platform_get_irq() already prints an error

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 4 +---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 48dad9bb13d2..df7b25e9cbc8 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -115,10 +115,8 @@ static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
 		return 0;
 
 	dev->dec_irq = platform_get_irq(pdev, 0);
-	if (dev->dec_irq < 0) {
-		dev_err(&pdev->dev, "failed to get irq number");
+	if (dev->dec_irq < 0)
 		return dev->dec_irq;
-	}
 
 	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index 8d2a641d92f1..5f07313676bb 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -99,10 +99,8 @@ static int mtk_vdec_hw_init_irq(struct mtk_vdec_hw_dev *dev)
 	int ret;
 
 	dev->dec_irq = platform_get_irq(pdev, 0);
-	if (dev->dec_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get irq resource");
+	if (dev->dec_irq < 0)
 		return dev->dec_irq;
-	}
 
 	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
-- 
2.20.1.7.g153144c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
