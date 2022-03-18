Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F15C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3CezcQLmJdFveRSoRGVh8vaVM48qKX+1SABHHNxcSE=; b=r5lE0QfNDxJm8x
	jzgCLkJMXH5pcLJw1wz+OIdGBmFBWcAA97RvwAVa0rqz+j79DzIL4PfhxwCd4XfHuHRp61nzT+ted
	AruMiS2/RA26qVMjtQ8FKzK+VS6YHfT1LGTXgBH3oklDidrfI8NReEkM9Ba+T6/yYLEHLhU8jKtaA
	biMv+xrX9Qy9SIbGKwbRk0kAKS/rN+SpGE5TjQVuQp0qZr90i31dmjCnhBWjQuqgTirUaaxidXxbL
	2L0Lac/EmoOqKUYQeisfYPFxRluLynhgsV8Jmg+Zp4nddgEOScefjpsYWQFEzGZLWaZ/8+CmV4eWV
	hz+erR2/HxF4pXBOg2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV9qd-0018Zf-TE; Fri, 18 Mar 2022 10:28:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV9qb-0018ZG-6o
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 10:28:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BBADD1F45DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647599319;
 bh=RLh0iGI//uz1ksSyMfYq/kKVW5zQwl6rIk1/V3IyKlI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kgBQV8a2vitxThYInEsApGhTJkbu2ywe5oNv3dQpcWXlMQowFGW2k0rjeuOcL6kmS
 O6ZxllIkYiBARFIi+gW4Zn1ejhluQAVWXRdskhqgRX6m8jJcWVKkr/8hscZ26Uke6B
 cPELa3vvVg9Dz1rR0LlMlR+KrLiSg1iLIXFnAm64kVPOBgVWR3bI5rEXYEZ6QltTHR
 zt3Lpf72rvseN8a+mXeJxU542Zin4zvEYjZMsDPn22Hxm3pfkRI6Bs5SNdmctnJ1TR
 26jbMLjd1mXiLi4Xb3/5hfaAEhI6/0Svtl4A43gP+dIJq4BV73FLPaEdmf1PuxUKpT
 5CApo9pFWCo3A==
Message-ID: <89a49057-50c5-5abe-559a-744447a60774@collabora.com>
Date: Fri, 18 Mar 2022 11:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH -next] dmaengine: mediatek:Fix PM usage reference leak of
 tegra
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com
Cc: dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220318080809.22562-1-zhangqilong3@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318080809.22562-1-zhangqilong3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_032841_416251_75BC09DA 
X-CRM114-Status: GOOD (  16.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/03/22 09:08, Zhang Qilong ha scritto:
> From: zhangqilong <zhangqilong3@huawei.com>
> 
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> We fix it:
> 1) Replacing it with pm_runtime_resume_and_get to keep usage counter
>     balanced.
> 2) Add putting operation before returning error.
> 
> Fixes:9135408c3ace4 ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Hello Zhang,

I agree with this change, but the commit message is misleading, as this is not
Tegra.

Please fix it.

Regards,
Angelo

> ---
>   drivers/dma/mediatek/mtk-uart-apdma.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index 375e7e647df6..a1517ef1f4a0 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -274,7 +274,7 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
>   	unsigned int status;
>   	int ret;
>   
> -	ret = pm_runtime_get_sync(mtkd->ddev.dev);
> +	ret = pm_runtime_resume_and_get(mtkd->ddev.dev);
>   	if (ret < 0) {
>   		pm_runtime_put_noidle(chan->device->dev);
>   		return ret;
> @@ -288,18 +288,21 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
>   	ret = readx_poll_timeout(readl, c->base + VFF_EN,
>   			  status, !status, 10, 100);
>   	if (ret)
> -		return ret;
> +		goto err_pm;
>   
>   	ret = request_irq(c->irq, mtk_uart_apdma_irq_handler,
>   			  IRQF_TRIGGER_NONE, KBUILD_MODNAME, chan);
>   	if (ret < 0) {
>   		dev_err(chan->device->dev, "Can't request dma IRQ\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_pm;
>   	}
>   
>   	if (mtkd->support_33bits)
>   		mtk_uart_apdma_write(c, VFF_4G_SUPPORT, VFF_4G_SUPPORT_CLR_B);
>   
> +err_pm:
> +	pm_runtime_put_noidle(mtkd->ddev.dev);
>   	return ret;
>   }
>   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
