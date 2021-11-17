Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC70BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 14:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8927661C32
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 14:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8927661C32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hj4fUXY2e5vg/yMWAN+SljbAjpii7FGeZLppZx1+IzU=; b=p+DScraVypS0ot
	9bG8aNGaUqMEP0KZoaUj5Pul6WSwmf1YkLHX6yDr0QjUTeN4+06ref1uySdwAIKp4vGPrq6V0Em7a
	4ooMRPDfpyR7Dr/hJCF22jEoG7kPJVOY40m8m1evfaiY5rpCHNDDDu082eGNnagvbrj1HN2lqvVsj
	CaVPTTAsgukMnsKZD2P0qPYEKaPltFa5DOu2EH11yGmcCAeOISWrBl96GzvhdkM8QQnnf1q9zDSY+
	4NXXzx9xEE36jHpfkvmO7iCLZnJSWytQi9v6se4LUljasPCsdfoOoiGxNN+4YiL8xaBt9ZV42aR0F
	5/96WelHhbJpecbn6uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnM80-005BLU-Ne; Wed, 17 Nov 2021 14:41:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnM7M-005B5d-Tn
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 14:40:59 +0000
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D9B22CF;
 Wed, 17 Nov 2021 15:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637160052;
 bh=GlVxoafIkyTWNV9NuopOo/VpJXkPbHQdWMm1exK22FQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=i29wD4YPyenTFWFe0R+ff88SAocCBgEfjd11jsGsKFXmHEc3os+2ecmLe47AhNJ41
 JWhnVcnJTktP8HnHr58dUAEVBlPPvy9ma8wPS/tVtx2AcFBI2CCG3MYd/zX4adX0G0
 MOUiIomPBFyWnQkm8UQxWEMNBw6Nfk68sSM9A+HU=
MIME-Version: 1.0
In-Reply-To: <20211116014726.1452-1-vulab@iscas.ac.cn>
References: <20211116014726.1452-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] media: mtk-jpeg: Remove unnecessary print function
 dev_err()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Xu Wang <vulab@iscas.ac.cn>, bin.liu@mediatek.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, rick.chang@mediatek.com
Date: Wed, 17 Nov 2021 14:40:49 +0000
Message-ID: <163716004951.420308.9398665375877390415@Monstersaurus>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_064057_152924_2E05A94F 
X-CRM114-Status: GOOD (  12.32  )
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

Quoting Xu Wang (2021-11-16 01:47:26)
> The print function dev_err() is redundant because
> platform_get_irq() already prints an error.

This one was also reporting errors in the case of -EPROBE_DEFER, which
will now go away, so this looks like a valid change to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index af994b9913a6..f332beb06d51 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1361,10 +1361,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>         }
>  
>         jpeg_irq = platform_get_irq(pdev, 0);
> -       if (jpeg_irq < 0) {
> -               dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
> +       if (jpeg_irq < 0)
>                 return jpeg_irq;
> -       }
>  
>         ret = devm_request_irq(&pdev->dev, jpeg_irq,
>                                jpeg->variant->irq_handler, 0, pdev->name, jpeg);
> -- 
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
