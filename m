Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30991C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 05:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E448B6023B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 05:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E448B6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odQTl7pGydlzAZaqaGwc0lvyxezOhPUbM4LsGWyR6D8=; b=J1eIVWgD6xGqS7
	/8hMGYzLfTMO+HEODt4IRG60IqVZZ0Ul1hOxKnSF0VkSOUfw5cAVZmLmJaIuyh0i0SrXq1k707rmo
	NA1q19LAe/LH/w1C3uqwqsch5GJLQinY+j/ZKgLzeeUjQnmR9deDHGx+LF6GYOHKnG0Y+ZYMhUYJj
	at2+YhDHjVPE2s9IUrJ5Y70lP9jto+/AblvmJDvh1tgIjoh1/m9PBxf45oOv51ZHKupfD0aVUjsy/
	1t+T+OBA80+58Z/FAtKByi5W8XTqoauJez44Nkr7E3dYFRxieARa5WKDqbNyQNbQNWLT3O8yWaxgs
	KBcjx4J/rHOSPdm4W59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfyOC-006wHQ-65; Thu, 28 Oct 2021 05:55:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfyNm-006w9n-I4; Thu, 28 Oct 2021 05:55:24 +0000
X-UUID: 0c2a7f849aeb41119eb3a83f100ca19d-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Nr8c5aHXlwibVnUmW5WuIOgCi8SwSdCWVI3tM+6NXBo=; 
 b=i3RgqrlnGo13bJizqF/Vxt+fpiid41r9ZRpPd9N481LpjQlc5LppxpWGdmNqku/PbhBUkWTdty5Oe+MGABO1I2f51ux4rndXnZHzdTalWHjQjWgRJ2bIjy59XXLSX9eR5W7AqreMpq5nYE6ASXQpBQv5vMJ4cJabPXxzEP6QWvI=;
X-UUID: 0c2a7f849aeb41119eb3a83f100ca19d-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1619101237; Wed, 27 Oct 2021 22:55:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 22:54:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Oct 2021 13:54:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Oct 2021 13:54:12 +0800
Message-ID: <facef42345435d82600aca87d9b020fa073506ce.camel@mediatek.com>
Subject: Re: [PATCH] mmc: mediatek: move cqhci init behind ungate clock
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>, Yong Mao <yong.mao@mediatek.com>,
 <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <stable@vger.kernel.org>
Date: Thu, 28 Oct 2021 13:54:12 +0800
In-Reply-To: <20211028022049.22129-1-wenbin.mei@mediatek.com>
References: <20211028022049.22129-1-wenbin.mei@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_225522_622594_E3DBA20F 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, 2021-10-28 at 10:20 +0800, Wenbin Mei wrote:
> We must enable clock before cqhci init, because crypto needs
> read information from CQHCI registers, otherwise, it will hang
> in MediaTek mmc host controller.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
  Acked-by: Chaotian Jing <chaotian.jing@mediatek.com>
> Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
> Cc: stable@vger.kernel.org
> ---
>  drivers/mmc/host/mtk-sd.c | 38 +++++++++++++++++++----------------
> ---
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b124cfee05a1..943940b44e83 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2656,6 +2656,25 @@ static int msdc_drv_probe(struct
> platform_device *pdev)
>  		host->dma_mask = DMA_BIT_MASK(32);
>  	mmc_dev(mmc)->dma_mask = &host->dma_mask;
>  
> +	host->timeout_clks = 3 * 1048576;
> +	host->dma.gpd = dma_alloc_coherent(&pdev->dev,
> +				2 * sizeof(struct mt_gpdma_desc),
> +				&host->dma.gpd_addr, GFP_KERNEL);
> +	host->dma.bd = dma_alloc_coherent(&pdev->dev,
> +				MAX_BD_NUM * sizeof(struct
> mt_bdma_desc),
> +				&host->dma.bd_addr, GFP_KERNEL);
> +	if (!host->dma.gpd || !host->dma.bd) {
> +		ret = -ENOMEM;
> +		goto release_mem;
> +	}
> +	msdc_init_gpd_bd(host, &host->dma);
> +	INIT_DELAYED_WORK(&host->req_timeout, msdc_request_timeout);
> +	spin_lock_init(&host->lock);
> +
> +	platform_set_drvdata(pdev, mmc);
> +	msdc_ungate_clock(host);
> +	msdc_init_hw(host);
> +
>  	if (mmc->caps2 & MMC_CAP2_CQE) {
>  		host->cq_host = devm_kzalloc(mmc->parent,
>  					     sizeof(*host->cq_host),
> @@ -2676,25 +2695,6 @@ static int msdc_drv_probe(struct
> platform_device *pdev)
>  		mmc->max_seg_size = 64 * 1024;
>  	}
>  
> -	host->timeout_clks = 3 * 1048576;
> -	host->dma.gpd = dma_alloc_coherent(&pdev->dev,
> -				2 * sizeof(struct mt_gpdma_desc),
> -				&host->dma.gpd_addr, GFP_KERNEL);
> -	host->dma.bd = dma_alloc_coherent(&pdev->dev,
> -				MAX_BD_NUM * sizeof(struct
> mt_bdma_desc),
> -				&host->dma.bd_addr, GFP_KERNEL);
> -	if (!host->dma.gpd || !host->dma.bd) {
> -		ret = -ENOMEM;
> -		goto release_mem;
> -	}
> -	msdc_init_gpd_bd(host, &host->dma);
> -	INIT_DELAYED_WORK(&host->req_timeout, msdc_request_timeout);
> -	spin_lock_init(&host->lock);
> -
> -	platform_set_drvdata(pdev, mmc);
> -	msdc_ungate_clock(host);
> -	msdc_init_hw(host);
> -
>  	ret = devm_request_irq(&pdev->dev, host->irq, msdc_irq,
>  			       IRQF_TRIGGER_NONE, pdev->name, host);
>  	if (ret)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
