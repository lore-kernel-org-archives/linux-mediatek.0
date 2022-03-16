Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45266C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhOSaHa9IDz3/tNt9LnHWYTw0O6AatKt7IjeipdZgHs=; b=4RyJoJyPNS6Wap
	VSlngDolSuVVWfkCcGQ4p3FgI90i1eWwDzSZTpU2rPz0RRLk4SteZL3ryVzi9uDtCGAehK2ey076P
	jxoo1f6l0/mT6i0To+H3nUtrhwtHaP5McnXWReITeCjcyVBJdZPLqA3u2ePD4XQFWT1M2BTY4JR9S
	SYhvHxGFfVn2Ej6O9M32IM+hzzkpBGrPJyaz8gFj1gylkZ2Fzntk8CraB20DSKfhftglspxFIaRL3
	rczSBfdT7n4dw0sd1WEHfaWrZaembRF5dV4Ib9QZov1c2JAaeWL8l5ZbrdmFXc9Vmy3N0zPmc/j90
	rIvTMkKdfuctE8znVcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUOrx-00C5d8-V6; Wed, 16 Mar 2022 08:18:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUOrl-00C5YA-9t; Wed, 16 Mar 2022 08:18:46 +0000
X-UUID: 86b0443f302840f0b188198ea55c8c05-20220316
X-UUID: 86b0443f302840f0b188198ea55c8c05-20220316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2110501651; Wed, 16 Mar 2022 01:18:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 01:18:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 16:18:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 16:18:38 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yang.lee@linux.alibaba.com>
CC: <abaci@linux.alibaba.com>, <andrew-ct.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <mchehab@kernel.org>, <tiffany.lin@mediatek.com>
Subject: Re: [PATCH -next] media: platform: Remove unnecessary print function
 dev_err()
Date: Wed, 16 Mar 2022 16:18:39 +0800
Message-ID: <20220316081839.22093-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220316001411.80167-1-yang.lee@linux.alibaba.com>
References: <20220316001411.80167-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_011845_375125_643F3D90 
X-CRM114-Status: GOOD (  11.27  )
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

Hi Yang,

>The print function dev_err() is redundant because platform_get_irq()
>already prints an error.
>
>Eliminate the follow coccicheck warnings:
>./drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:119:2-9:
>line 119 is redundant because platform_get_irq() already prints an error
>./drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c:103:2-9:
>line 103 is redundant because platform_get_irq() already prints an error
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>---
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 4 +---
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c  | 4 +---
> 2 files changed, 2 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
>index 48dad9bb13d2..df7b25e9cbc8 100644
>--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
>+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
>@@ -115,10 +115,8 @@ static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
> 		return 0;
> 
> 	dev->dec_irq = platform_get_irq(pdev, 0);
>-	if (dev->dec_irq < 0) {
>-		dev_err(&pdev->dev, "failed to get irq number");
>+	if (dev->dec_irq < 0)
> 		return dev->dec_irq;
>-	}
> 

Thanks for the patch, 
Yihao has submitted a patch to fix mtk_vcodec_init_dec_resources() [1]
[1] https://lore.kernel.org/lkml/20220310023645.10082-1-hanyihao@vivo.com/

> 	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
>diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
>index 8d2a641d92f1..5f07313676bb 100644
>--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
>+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
>@@ -99,10 +99,8 @@ static int mtk_vdec_hw_init_irq(struct mtk_vdec_hw_dev *dev)
> 	int ret;
> 
> 	dev->dec_irq = platform_get_irq(pdev, 0);
>-	if (dev->dec_irq < 0) {
>-		dev_err(&pdev->dev, "Failed to get irq resource");
>+	if (dev->dec_irq < 0)
> 		return dev->dec_irq;
>-	}
> 
> 	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,

Would you mind submitting mtk_vdec_hw_init_irq() part by another patch?

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
