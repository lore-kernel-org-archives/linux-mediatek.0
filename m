Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ECAC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXziicv2uYfxyPIhD3Zm1hNxYuWnUEu3waNVg+uvUJE=; b=s1hk+nYz8b930bminW4UE67BUR
	8g8vDHlYZisTbuiVI0iqthA6rB4yCnu03q7nxD0wb2B9qjojEKX6OqH4eZjwOK6W8Dmfbzj/MEGI6
	V0zzzYe9x/upJUUfAMgZKNBiKUs+vXBYzjEVKQq/6TDatyyHBilZqZhJS/SgkWokKP1LA7dlp/xCW
	hVeSvrtL+IWmJtWUgA5OZffn7ij48+0lpHG1X3jzm++hEFuM12H1lK+qMd7wZfAJMEqEdPPEFEnU0
	Es76/pW6nuR3Ydr7WWdUUsYJcoOKH/GNyrRLK8tEOmBG1uure8lJOLCtkYPg/8t7th2amSmD/Vdeg
	fiC9LlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcV2H-00E9dJ-0o;
	Wed, 15 Mar 2023 17:35:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcV2C-00E9bM-05
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 17:35:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id iw3so4031874plb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678901729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXziicv2uYfxyPIhD3Zm1hNxYuWnUEu3waNVg+uvUJE=;
        b=fkLlxUwfoqSQHAO6oaqAO7XW8uw0SRJENlx1a6WanyTBPduDiqnW1Flid+CdRIZen4
         npJjplws76ONO61ktvNoD/uZnlfHK5SvRoidwhwcxhPfOQz3FZBABkyvFIMImFo4i8u6
         b/r3LljfIzFMIwjhGjERRjctXBfpbVvs0N0Be425ywz3G1mO2VVyEfrWZNX83LDkjROH
         Qy7ZbXHqcqKEOaEz8mnSvLRHLsEHL4mgbIX1EjmhtpU1lv8u6vKIRV7fMtcKY5Jdrtj6
         6l0jLLtnUzQeDHA1RdSruCEoe80y0/mgHn2AKveyI2NR53TBAARSa4i/y6wLLEle2nfJ
         qESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678901729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXziicv2uYfxyPIhD3Zm1hNxYuWnUEu3waNVg+uvUJE=;
        b=CvKnf+mxWD11InkFFlIjhzcp2UoRiE3gUKbuGSS2VCoDXkcZ+nKpO9CDzIAVrhma3v
         VKTcoXgR0aWI5w+4PC1EI3lqhQPiq9YZfjSOWfEHsCC4fVcYZe3WVFCSUPbxsHWeAbgX
         ZTBuWRnogNDcv8m4ooEa8Gh6nKe77JhpaA4knRvjwvc5h84B3QIcA5S6Jng2feTFKVzi
         bzL0X6uXetD5knvTI4QVNAOsUtdp4wenDmjSZ3/Z/GHr3XEYwBwtaGv9zx2i4TWArKc3
         eEn54FwBwgKI3P03FbIL+1uRm38OKKyRXVjMl7ANSIRQXBlLNDFlYTDbJ2eJpTeRKOW4
         u2AA==
X-Gm-Message-State: AO0yUKU73Uq+GYzWyPW+sysnUYKdOATErcukJllVTdzWTzIhb/GcYgt8
	ZD99o96URLyn6n4EAvqY/VXA+A==
X-Google-Smtp-Source: AK7set9IdG4vaM5Q83M61wkjdQOyn5rQzQLAMeHMzSFiLlu8+VEy+S5l6kmmjS2QXhyoKMs5tmECtg==
X-Received: by 2002:a17:90a:34d:b0:23c:ffe0:ccf9 with SMTP id 13-20020a17090a034d00b0023cffe0ccf9mr511760pjf.39.1678901728834;
        Wed, 15 Mar 2023 10:35:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c20b:6fb4:a029:ed06])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902988d00b0019a7363e752sm3880048plp.276.2023.03.15.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:35:28 -0700 (PDT)
Date: Wed, 15 Mar 2023 11:35:26 -0600
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
Subject: Re: [PATCH v8 05/11] remoteproc: mediatek: Extract remoteproc
 initialization flow
Message-ID: <20230315173526.GB2357129@p14s>
References: <20230303083355.3378-1-tinghan.shen@mediatek.com>
 <20230303083355.3378-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303083355.3378-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_103532_074557_AC818124 
X-CRM114-Status: GOOD (  25.02  )
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

On Fri, Mar 03, 2023 at 04:33:49PM +0800, Tinghan Shen wrote:
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reuesd to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 62 ++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index a3b9bc158cd9..bdb5d87eeaa3 100644
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
> @@ -933,7 +928,6 @@ static int scp_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0), NULL,
>  					scp_irq_handler, IRQF_ONESHOT,
>  					pdev->name, scp);
> -
>  	if (ret) {
>  		dev_err(dev, "failed to request irq\n");
>  		goto remove_subdev;
> @@ -957,6 +951,34 @@ static int scp_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int scp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct mtk_scp_of_regs scp_regs;
> +	int ret;
> +

        struct device *dev = &pdev->dev;
        struct mtk_scp_of_regs scp_regs;
        struct resource *res;
        int ret;

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

