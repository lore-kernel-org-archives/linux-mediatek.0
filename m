Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C588AC761A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXNcjohZysdJFTpfz0Tp4bdKAzd73WpdyuV554RNSZw=; b=tEfAhTV7NyyLZei+MJSxKnhqm0
	zn7vnK4XD7eUN2VcySJ64nb3St7VWcoQadf3a+GUNIv/IFmCP8CV1hJiRsu6bkzYyAaWIQaWvlzdu
	vzdhb/JzT/m9XJozfZflM1ZvDP7TLbY8QdAV7KglT8o73WGBO2DvcIe38rR81tHjb2kjoXFomSjYt
	/TQ1m2V/R4My/+t4cuTP6aevE+HFTtS1v1fWz+G7TWU4UB7i2vEBr+32OtMLPpG5g64xD/zky729c
	6tbTXJaYehes6fqIp8INzStEckpHriRoGfaZiksIX/0QL8d0mLADxxSH3sB2Pn0s08SWodiRayPeJ
	yOAQgTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIno-008Kfr-2Q;
	Fri, 31 Mar 2023 17:44:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piInk-008Kdn-2j
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:44:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id c18so21931374ple.11
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680284675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VXNcjohZysdJFTpfz0Tp4bdKAzd73WpdyuV554RNSZw=;
        b=ExGm85KLhOefR0naD5/e5ZoclYAwGcnNGljHYGEIIm7cw6Blt50uY529QZCw5rjKSK
         tz+kzOKriH34/bYLdt7XVzHdiygYMt8NsKcP8cBW6F465c7HwXEAbIIoufu1l5RHyIYP
         hsdga9hL/Cz5emQyXePhwVEMuMUHXOjvvK1nhTnYozQhhCkz8qBOeHAdV7GLE9AZ3mVs
         S+jdkpW16u0TaneLV1wvF2y+XGLEDOblMiABLFO+6J54bpXjx4/x6v1dIjlfzBGsBV8Y
         wm/khn4tH7j8HStsKWEGQR6MVS4sdMyNmNq3/gYCQiYau7MMlmvAxw5BsK/S9kxthX8x
         4qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXNcjohZysdJFTpfz0Tp4bdKAzd73WpdyuV554RNSZw=;
        b=fs8rlsUfZV03ChBljEWVhBB11wlE9amTEuZ7ukVqF6TxsbwxuIUw/md5hywD+mNd9N
         ZhdsYw78qKXeYnxoOwNnMinR3LM0APnU3IOL1ffWIwn6iQ8GH2d2dy8V4n2D7Oli/K5u
         th7SueJnApMkO1o8CCHL6XKOhp9VFvZgVQ+4Z7HyrDhaHriMpAZmF7sJ5v3h70EfTAn/
         9FRBJbZxgrhwa+VJ9cSmTQahVuWPXB8Uuq8CN7sCIwB5rGlH6djgf0uz7M7TzXgIGUvE
         5lnp4Jt6N+ZlhwEyEe0Aw+7g5r3AhYguBGbmpXI2WBOvGhN/ppFxfkftNUl9aS6rFpi8
         98sA==
X-Gm-Message-State: AAQBX9cQSXeTVzUjThTJdm4cc70Ervk3XZ3biAdY9CEpa0JVbmrvc9sD
	aPbRkzTjo1vaEKwfMGEopsxoaw==
X-Google-Smtp-Source: AKy350a04fGm/Zt+9yziHzr+NnMQiLRNR11nrRqTIIbvqLXNxUwZ0/vkFHf67U5CbG9I5CLxWvU4VQ==
X-Received: by 2002:a17:903:2441:b0:1a2:7462:d674 with SMTP id l1-20020a170903244100b001a27462d674mr9996089pls.24.1680284674722;
        Fri, 31 Mar 2023 10:44:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f19d:e1b1:6a5d:8ade])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902788900b001a20b31a23fsm1816496pll.293.2023.03.31.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:44:34 -0700 (PDT)
Date: Fri, 31 Mar 2023 11:44:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v9 05/11] remoteproc: mediatek: Extract remoteproc
 initialization flow
Message-ID: <20230331174431.GA3504605@p14s>
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
 <20230328022733.29910-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328022733.29910-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_104436_885812_0D735860 
X-CRM114-Status: GOOD (  26.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 28, 2023 at 10:27:27AM +0800, Tinghan Shen wrote:
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reused to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 64 +++++++++++++++++++++++++-----------
>  1 file changed, 45 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index a3b9bc158cd9..32ecd1450c6f 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -23,6 +23,13 @@
>  #define MAX_CODE_SIZE 0x500000
>  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>  
> +struct mtk_scp_of_regs {
> +	void __iomem *reg_base;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
> +};
> +

This should represent the cluster with a list of mtk_scp instead of @cluster_cores as
introduced in the next patch.

>  /**
>   * scp_get() - get a reference to SCP.
>   *
> @@ -855,7 +862,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  	}
>  }
>  
> -static int scp_probe(struct platform_device *pdev)
> +static int scp_rproc_init(struct platform_device *pdev,
> +			  struct mtk_scp_of_regs *of_regs)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -879,6 +887,11 @@ static int scp_probe(struct platform_device *pdev)
>  	scp->data = of_device_get_match_data(dev);
>  	platform_set_drvdata(pdev, scp);
>  
> +	scp->reg_base = of_regs->reg_base;
> +	scp->l1tcm_base = of_regs->l1tcm_base;
> +	scp->l1tcm_size = of_regs->l1tcm_size;
> +	scp->l1tcm_phys = of_regs->l1tcm_phys;
> +
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(scp->sram_base))
> @@ -888,24 +901,6 @@ static int scp_probe(struct platform_device *pdev)
>  	scp->sram_size = resource_size(res);
>  	scp->sram_phys = res->start;
>  
> -	/* l1tcm is an optional memory region */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> -	scp->l1tcm_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp->l1tcm_base)) {
> -		ret = PTR_ERR(scp->l1tcm_base);
> -		if (ret != -EINVAL) {
> -			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> -		}
> -	} else {

                scp->l1tcm_base = NULL;

> -		scp->l1tcm_size = resource_size(res);
> -		scp->l1tcm_phys = res->start;
> -	}
> -
> -	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> -	if (IS_ERR(scp->reg_base))
> -		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
> -				     "Failed to parse and map cfg memory\n");
> -
>  	ret = scp->data->scp_clk_get(scp);
>  	if (ret)
>  		return ret;
> @@ -957,6 +952,37 @@ static int scp_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int scp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_scp_of_regs scp_regs;
> +	struct resource *res;
> +	int ret;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> +	scp_regs.reg_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(scp_regs.reg_base))
> +		return dev_err_probe(dev, PTR_ERR(scp_regs.reg_base),
> +				     "Failed to parse and map cfg memory\n");
> +
> +	/* l1tcm is an optional memory region */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> +	scp_regs.l1tcm_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(scp_regs.l1tcm_base)) {
> +		ret = PTR_ERR(scp_regs.l1tcm_base);
> +		if (ret != -EINVAL)
> +			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> +
> +		scp_regs.l1tcm_size = 0;
> +		scp_regs.l1tcm_phys = 0;
> +	} else {
> +		scp_regs.l1tcm_size = resource_size(res);
> +		scp_regs.l1tcm_phys = res->start;
> +	}
> +
> +	return scp_rproc_init(pdev, &scp_regs);
> +}
> +
>  static int scp_remove(struct platform_device *pdev)
>  {
>  	struct mtk_scp *scp = platform_get_drvdata(pdev);
> -- 
> 2.18.0
> 

