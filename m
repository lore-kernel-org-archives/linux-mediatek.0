Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD86C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCvYSt1KDinfxk7rARAHF7Sne1//ytPzSxJeJm0m75A=; b=ioyvGqL0RvYSg8
	vOV6QMak7xhO1AAY8hOp+JefWSqj+i796+u7Qn5VWgaJsu4xaT0VvRHR8CobEE+sP43TZUHgATm1h
	VS0VKPvCppX/IZWcvaRwXT8Y6z66+C9NwsszXBcc4Y3dmTyjFyEc5c5vbRBPIDeDC4n4HVC5FLYsX
	YER2qj8JhQ7az9Z5VCZVFq6wpOITxexIoZJBzVYdbBTUyPfBQnshtO3bF7YhfeItNP+3DJ6qlULep
	bZf1uMwbJJwE3tFsLfsSg6SOT6nTbdNs/I3KxQULoMT6RpNg8MBEsh8uXcg1PJtKiAyVQxqUgypcA
	tH/VeIvdqzRz+Ddgp37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrdp-008VRd-14; Mon, 11 Apr 2022 10:51:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndrd7-008V5Q-Sd; Mon, 11 Apr 2022 10:50:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98479B81212;
 Mon, 11 Apr 2022 10:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02B4C385A4;
 Mon, 11 Apr 2022 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649674241;
 bh=1IMcTxu81IxoqmzEjcmyl7feWQexXcHs/UwdYnBHOFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cqgl2mpL76yJtKhrdpaYDXcA+jGcG01yXz0QdbQPK8HB2ktpjlOk+ogNXZGvBn7qP
 JgHv1ryfvV96ezP4U16OQ+auY2DgiTL2MZaBqwEKMAT6mOx0+yNDsDqfqRoDFGqCWQ
 zKXAGTxG8gt9S55xeKWrlveNI+4XskxU8nLZ8i4Tb3oM6r1iywFxGav7rfVgq2P3/3
 dCEWX2GyzHNCx0ib5sjyACW3MJ7bvrLFyMeo4jqcZ8iwIyEYi/zCeLMA+2nPDw2RzH
 4K01hJLSCvLq68YiZ0rU5fomUj0tPwbQmpXotjm9EtDR+JnIuvcdqzLrXqFMHaLhLf
 K7TM+6V4jM3EQ==
Date: Mon, 11 Apr 2022 16:20:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: cgel.zte@gmail.com
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] drivers: dma: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Message-ID: <YlQH/WjgLgD5uVsP@matsya>
References: <20220411013504.2517012-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411013504.2517012-1-chi.minghao@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_035046_116165_30B260B9 
X-CRM114-Status: GOOD (  17.20  )
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

On 11-04-22, 01:35, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>

subsystem tag is wrong, pls see gitlog to find the appropriate one

> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code

Can you explain why it is appropriate?

> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/dma/mediatek/mtk-uart-apdma.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index 375e7e647df6..64bad5681447 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -274,11 +274,9 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
>  	unsigned int status;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(mtkd->ddev.dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(chan->device->dev);
> +	ret = pm_runtime_resume_and_get(mtkd->ddev.dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	mtk_uart_apdma_write(c, VFF_ADDR, 0);
>  	mtk_uart_apdma_write(c, VFF_THRE, 0);
> -- 
> 2.25.1

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
