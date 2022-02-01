Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUO3uglGeU+QfTdiEN9TZp9iktruetUPLXBHZVK8pt8=; b=cLHwU3bju6IQzl
	JOfpZSWC2KeGvG9opeKgeeAavEJTCuxcTuqOaZ17l7xhkpNT//n8mRoPcf0k1T0fhHp+wY/VHOov+
	sTKnssB3H1LlCVvQMQjyZx5DJGZ/Hcg9D1229BBzi8BIiA3SMLYMYxf4g03O0BhK5JDnlUTFvpd1b
	skDyr8s9NX9PQisxpgkzKOioEyHi+cvbFNDAfb3Oh611OvkA6c5OWT9+6bHzDq680f/+PxjECRHpv
	Cg1diEdORZ83GyYSlGzqR2H1gQyFhLWdNzUJ7tSvvGplaMi5JJjdAqnyf3YZQrJgF+m0VdES7z8Sm
	9o1QrL1Z+XtfGvot3Ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEy1T-00DNqM-Ct; Tue, 01 Feb 2022 18:36:59 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEy0n-00DNWP-GD
 for linux-mediatek@lists.infradead.org; Tue, 01 Feb 2022 18:36:20 +0000
Received: by mail-pg1-x52b.google.com with SMTP id e16so16117082pgn.4
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Feb 2022 10:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=au2QIv+E5efC5CXFBVtN3Dhp88XfEH66mYp3WFA4dy4=;
 b=OzqPatId9hYU/kdkYqwdo5N/t94vb8Ym5n0MeDAweVjIrNJGKqFDYpfOoGn4KTTXF8
 noDYko8zN7lX1ZB7fGgPTZkr0TSwJu/mew/BoFxZBhqE2IbOvlHEtl3wmg1k37OT3Fqj
 AhAVEXOhTkOr8jQOqokKKuob/1cSiiPXF8Zzc5WMDwW2veUtNn9NSPNhTqmkRlgXjV+w
 nm1z4SHN8UBQ/Knm+oWMOq6z+3ch9FiDl02rAKZIz3Jp+1VaexPZh7k8uJbeMfGVbA7B
 57nJhQELFRgndRbftgkPLN9gCUqzFhUHQmQ4UBNpu7+GNBCVo1vmiPsg8UJGU6RObBVa
 n0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=au2QIv+E5efC5CXFBVtN3Dhp88XfEH66mYp3WFA4dy4=;
 b=CuXGx1xTVpJUKmsTn87+lAUblpg00qXTt7eMT8D05uV12KvfNrXkuwPHBkIFS5g/eL
 YUOTBnr7ZL4FsoU0muzyL3bhRndInIKm+uEpB6ZTDF9Q9/BN+jBcqKdDfG7egIGOZoDO
 pRlfcPds/QjygWfMsmYBLsZVU6uSQOxmaflcurXhr62bNVT48SbAGa3p/TtKgY1CCpBX
 veyDM1mK1B9FeS/kr0wzG7GeNmXwSMTZrAbY8jSDAiyYzTZSPeqAfmBnE3CAoDI3IGnB
 zqk1G1whKZQyE+501binsCSgLAYzG7MEy0EI2hIXDUKvQC0EOXbIvTzC9qlEkOdDn4O4
 wEWA==
X-Gm-Message-State: AOAM530SdxEGXe/pYS7RPCytzWtmBecFOW/Go8zA4avFEPLyvaUjMJpM
 4Rq/L2mpVcfqJBy0YH/dzNjX9g==
X-Google-Smtp-Source: ABdhPJyXfaqwD+jsdqC62UNTBL+nVsylPRncm6pguROBuW/H6mEZXGhxRAt2QA3tJqSx++YfbZqvtg==
X-Received: by 2002:a63:6885:: with SMTP id
 d127mr12149556pgc.470.1643740575558; 
 Tue, 01 Feb 2022 10:36:15 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id k21sm22861321pff.33.2022.02.01.10.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:36:14 -0800 (PST)
Date: Tue, 1 Feb 2022 11:36:12 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH 3/3] remoteproc: mtk_scp: Use dev_err_probe() where
 possible
Message-ID: <20220201183612.GC2490199@p14s>
References: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
 <20220124120915.41292-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124120915.41292-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_103617_628598_851F27AE 
X-CRM114-Status: GOOD (  24.02  )
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

Hi Angelo,

On Mon, Jan 24, 2022 at 01:09:15PM +0100, AngeloGioacchino Del Regno wrote:
> Simplify the probe function, where possible, by using dev_err_probe().
> While at it, as to increase human readability, also remove some
> unnecessary forced void pointer casts that were previously used in
> error checking.

I am in favour of all 3 patches (please add a cover letter next time) but weary
about testing - do you have access to a Mediatek platform to try this on or
is it purely theoretical?

I would definitely feel better to see a "Tested-by" tag by someone out there
with access to the HW.

Thanks,
Mathieu

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e40706b0e015..dcddb33e9997 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -757,10 +757,8 @@ static int scp_probe(struct platform_device *pdev)
>  	int ret, i;
>  
>  	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
> -	if (!rproc) {
> -		dev_err(dev, "unable to allocate remoteproc\n");
> -		return -ENOMEM;
> -	}
> +	if (!rproc)
> +		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
>  
>  	scp = (struct mtk_scp *)rproc->priv;
>  	scp->rproc = rproc;
> @@ -770,21 +768,20 @@ static int scp_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR((__force void *)scp->sram_base)) {
> -		dev_err(dev, "Failed to parse and map sram memory\n");
> -		return PTR_ERR((__force void *)scp->sram_base);
> -	}
> +	if (IS_ERR(scp->sram_base))
> +		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
> +				     "Failed to parse and map sram memory\n");
> +
>  	scp->sram_size = resource_size(res);
>  	scp->sram_phys = res->start;
>  
>  	/* l1tcm is an optional memory region */
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
>  	scp->l1tcm_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR((__force void *)scp->l1tcm_base)) {
> -		ret = PTR_ERR((__force void *)scp->l1tcm_base);
> +	if (IS_ERR(scp->l1tcm_base)) {
> +		ret = PTR_ERR(scp->l1tcm_base);
>  		if (ret != -EINVAL) {
> -			dev_err(dev, "Failed to map l1tcm memory\n");
> -			return ret;
> +			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
>  		}
>  	} else {
>  		scp->l1tcm_size = resource_size(res);
> @@ -792,10 +789,9 @@ static int scp_probe(struct platform_device *pdev)
>  	}
>  
>  	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> -	if (IS_ERR((__force void *)scp->reg_base)) {
> -		dev_err(dev, "Failed to parse and map cfg memory\n");
> -		return PTR_ERR((__force void *)scp->reg_base);
> -	}
> +	if (IS_ERR(scp->reg_base))
> +		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
> +				     "Failed to parse and map cfg memory\n");
>  
>  	ret = scp->data->scp_clk_get(scp);
>  	if (ret)
> -- 
> 2.33.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
