Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 05:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu42QF7Ra7oLolvm0XvniD4nEdpsTLozWRjfbdai2b4=; b=JaIFef13Sm+LPT
	azqUNuVWS2u/7j7j0MMRDd+wSW/om9sfv4skBQIUdhOLETpAw8jXiLbNWQ9nWcNYy3Args/yi328+
	3qmUxIn11IKHNfACVCOKBnXrztB1lR2TBzQmrnb6kHuKMBSoCZWPDDYv+bLjIaa3P1wiko+wt41S7
	oYBrnJolDbi+8CBePfXG0AHq2Drk6H6acPgnTqyAkHPOBqVcj7h6S4NKpxQpKWEOOFiipRMMlt1JK
	S7SBpU3EWIx0BvCjp5Xq39QMY5mCCt4nkPDrIIaCXuy1meHeHfcihM6obNOsp6knA1ZcVKmw5oY/f
	vyPmDhlmjJHC/5hivBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5LJ9-00GfQN-P3; Thu, 06 Jan 2022 05:27:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5LIx-00GfOE-LD; Thu, 06 Jan 2022 05:27:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EFDCB819A8;
 Thu,  6 Jan 2022 05:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E4AC36AE5;
 Thu,  6 Jan 2022 05:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641446832;
 bh=rPpZNR2SG7V9Wodym/Wo3u8F0vCxyZV1DllX4+kqxuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qtNRW0SEOWqyjICFBJLPnzdpDv6r34KKwX50DdmhSIS5Osgm7Pi7vc0M+JwXkpPBC
 h4okTODPOCg1vqR9xgWOBmUqFYPq4tSUcdyXGPy0yGPslxToQkUjxGWZ1ZL/ON0O06
 bHi9VuD1aQCuflOFyWf0vlVC5ZjMTpPC7oIxOZvpufqjcdtEIdGnnLz6py6zbirRni
 hpK8gz73UW3Idbn9oQa0RDJAFrLS5l2Y4AvkySDT5P9Pxf8QG98wBQwSQTiZEt2eCV
 sQ12ZTAxm809T+IJLip8gJAiMdi8UYa++QLF+CP/QOePnYhFYiXIsacAV+gpTTOvML
 SHYv2oilgl/6g==
Date: Thu, 6 Jan 2022 10:57:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: mediatek: mtk-hsdma: Use
 platform_get_irq() to get the interrupt
Message-ID: <YdZ9rDvYtdu8L8Vb@matsya>
References: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220104163519.21929-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104163519.21929-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_212715_864800_17E5BA84 
X-CRM114-Status: GOOD (  21.64  )
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

On 04-01-22, 16:35, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * No change
> ---
>  drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
> index 6ad8afbb95f2..c0fffde7fe08 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -923,13 +923,10 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  		return PTR_ERR(hsdma->clk);
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "No irq resource for %s\n",
> -			dev_name(&pdev->dev));
> -		return -EINVAL;
> -	}
> -	hsdma->irq = res->start;
> +	err = platform_get_irq(pdev, 0);

why not platform_get_irq_optional() here and 3rd patch ?

> +	if (err < 0)
> +		return err;
> +	hsdma->irq = err;
>  
>  	refcount_set(&hsdma->pc_refcnt, 0);
>  	spin_lock_init(&hsdma->lock);
> -- 
> 2.17.1

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
