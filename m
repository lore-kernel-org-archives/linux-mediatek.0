Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D084CC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE3MRanS9uBZk5iyRYVZ75isIkjN+eRZmeuR+lcRDrE=; b=x71NFnORpGUmTW8coWb/O5IcPI
	9AWHk/wUiqbzvtN5g93y32jPHSKFq3MERij4mx4OiAIoAnzAs5yWPyoGrAno/AagAU2xKaWQ80r0v
	EuaFbJNKxCWH0cYNybcMXmQ17qI2dajpmT2kUVfn32pwZ0uHCUrcVAbFjlOm71MZXNvlpjMXiL2fm
	qf/JPQ9qjcaedf4kRKTyuHzEO8wXM8H/73WjTG98plkD+eZLVP63iLC5sw173c+wS+mq73MwV//MF
	WUg+tihNLIBaEBe8Uj945963v8yQ91ypfbxL+etILkQG/2PUYUHNFudCgGQlx1T3X9kELlcywSOSa
	6GHoXHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAYB-009dda-1O;
	Thu, 11 May 2023 17:57:59 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAY8-009dbX-1j
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 17:57:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-530638a60e1so1802835a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827873; x=1686419873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IE3MRanS9uBZk5iyRYVZ75isIkjN+eRZmeuR+lcRDrE=;
        b=ZV3QeS/kmnBEFoomfujqKJMQXqTB23DPZHQ+9mNPiDpOiepMc/AAEtbOwvZR10tNme
         6AJh8fgVjNCdQsxxV1bplKA/zVjMXr6lxy0c+eNFglzPF2MT1x/fzS7CmPvLHZF/qucF
         /hdf22S8N8Z/fwA7h4OfKgK+BW0+QHJpctXYzLzsY0Oz7a5lRsIeJfpyhD3OESuIhGRh
         hZRBejnENRSbj7TbeANtpYSqtEWwLObLBzaZaVDCZ7YeGxS9Z3zOlHqgvJJL0HcaB8Ek
         rBNr9Rw2yOdkWdEtkWmwSj7EnF8IFhTvkfSanoVJ9wXLWao9AmR9xmu5UQSPLZli4Eba
         zBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827873; x=1686419873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE3MRanS9uBZk5iyRYVZ75isIkjN+eRZmeuR+lcRDrE=;
        b=eHfm8A3NU5yEm6Fa6nJiJdgswTl8EtQjEixI9o9cunVMWd936ZQMMy656mkdI/r0Hm
         X8k/JBBCUxs5xWzx/tyVRdEQaikKP3UmIhV4WTTPi/5xKiu9d8e8F2vGUxdN53VHzceA
         +OUknd06Hn2TRkv/PYz+XQPYZZ/fTv6qHGMwThjtTxQigLQFuZzG9C461b5xlcAo+jhT
         ZGNBgHDkWs2VdU5LaKWwW9aMsPN8RxWjjGGOjiL7Z92LeTi3Bpo0nqm4fbiPFQ3apgVe
         sdhSMHIRK9Gw0lIEqILeOBZNsLm9XLFsCel7MRVQ88vBmYqW9HLH2LaKJ4XQS7hhgOJ2
         zgwg==
X-Gm-Message-State: AC+VfDwlxcwcNWpRwJaeAxjdbtIM2y8irb3BuZ9SM9ak9+2jp+eC6TLQ
	x4lX2LvXpcpLBcIOjBMbtBlqzQ==
X-Google-Smtp-Source: ACHHUZ4BC0yUHVwBv3jXzLEPAI6waOCTU8xCnnu3MTIrJFDcdbHI3gYdpy5HFOA0xhcQ+FiCF+rF4Q==
X-Received: by 2002:a17:902:d487:b0:1a9:9a18:346a with SMTP id c7-20020a170902d48700b001a99a18346amr29636766plg.5.1683827873229;
        Thu, 11 May 2023 10:57:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5715:c2a3:1400:98ae])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902ee5100b001a63ba28052sm6217123plo.69.2023.05.11.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:57:52 -0700 (PDT)
Date: Thu, 11 May 2023 11:57:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v11 05/11] remoteproc: mediatek: Introduce cluster on
 single-core SCP
Message-ID: <ZF0snh07gRNfEoMQ@p14s>
References: <20230510063749.5127-1-tinghan.shen@mediatek.com>
 <20230510063749.5127-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510063749.5127-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_105756_579162_8C9FC57A 
X-CRM114-Status: GOOD (  32.75  )
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

Good day,

On Wed, May 10, 2023 at 02:37:43PM +0800, Tinghan Shen wrote:
> This is the preliminary step for probing multi-core SCP.
> The initialization procedure for remoteproc is similar for both
> single-core and multi-core architectures and is reusing to avoid
> redundant code.
> 
> Adapt the probing flow of single-core SCP to incorporate the 'cluster'
> concept required for probing multi-core SCP.The main differences are,
> 
>   - the SCP core object is maintained in the cluster list,
>     instead of in the driver data property.
>   - the cluster information is saved in the driver data property.
>   - To maintain compatibility with exported SCP APIs that get
>     the SCP core object by SCP node phandle, the SCP core object pointers
>     are moved to the platform data property.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |   2 +
>  drivers/remoteproc/mtk_scp.c    | 143 ++++++++++++++++++++++----------
>  2 files changed, 103 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index c0905aec3b4b..56395e8664cb 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -128,6 +128,8 @@ struct mtk_scp {
>  	size_t dram_size;
>  
>  	struct rproc_subdev *rpmsg_subdev;
> +
> +	struct list_head elem;
>  };
>  
>  /**
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d66822dad943..6c4da7332896 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -23,6 +23,14 @@
>  #define MAX_CODE_SIZE 0x500000
>  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>  
> +struct mtk_scp_of_cluster {
> +	void __iomem *reg_base;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
> +	struct list_head mtk_scp_cluster;

struct list_head mtk_scp_list;

> +};
> +
>  /**
>   * scp_get() - get a reference to SCP.
>   *
> @@ -51,7 +59,7 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
>  		return NULL;
>  	}
>  
> -	return platform_get_drvdata(scp_pdev);
> +	return *(struct mtk_scp **)dev_get_platdata(&scp_pdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(scp_get);
>  
> @@ -810,14 +818,14 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
>  static int scp_register_ipi(struct platform_device *pdev, u32 id,
>  			    ipi_handler_t handler, void *priv)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>  
>  	return scp_ipi_register(scp, id, handler, priv);
>  }
>  
>  static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>  
>  	scp_ipi_unregister(scp, id);
>  }
> @@ -825,7 +833,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
>  static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
>  			unsigned int len, unsigned int wait)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>  
>  	return scp_ipi_send(scp, id, buf, len, wait);
>  }
> @@ -855,7 +863,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  	}
>  }
>  
> -static int scp_probe(struct platform_device *pdev)
> +static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> +				      struct mtk_scp_of_cluster *scp_cluster)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -867,52 +876,42 @@ static int scp_probe(struct platform_device *pdev)
>  
>  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>  	if (ret < 0 && ret != -EINVAL)
> -		return ret;
> +		return ERR_PTR(ret);
>  
>  	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
> -	if (!rproc)
> -		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
> +	if (!rproc) {
> +		dev_err(dev, "unable to allocate remoteproc\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	scp = rproc->priv;
>  	scp->rproc = rproc;
>  	scp->dev = dev;
>  	scp->data = of_device_get_match_data(dev);
> -	platform_set_drvdata(pdev, scp);
> +	platform_device_add_data(pdev, &scp, sizeof(scp));
> +
> +	scp->reg_base = scp_cluster->reg_base;
> +	scp->l1tcm_base = scp_cluster->l1tcm_base;
> +	scp->l1tcm_size = scp_cluster->l1tcm_size;
> +	scp->l1tcm_phys = scp_cluster->l1tcm_phys;
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp->sram_base))
> -		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
> -				     "Failed to parse and map sram memory\n");
> +	if (IS_ERR(scp->sram_base)) {
> +		dev_err(dev, "Failed to parse and map sram memory\n");
> +		return ERR_PTR(PTR_ERR(scp->sram_base));
> +	}
>  
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
> -		return ret;
> +		return ERR_PTR(ret);
>  
>  	ret = scp_map_memory_region(scp);
>  	if (ret)
> -		return ret;
> +		return ERR_PTR(ret);
>  
>  	mutex_init(&scp->send_lock);
>  	for (i = 0; i < SCP_IPI_MAX; i++)
> @@ -943,7 +942,7 @@ static int scp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto remove_subdev;
>  
> -	return 0;
> +	return scp;
>  
>  remove_subdev:
>  	scp_remove_rpmsg_subdev(scp);
> @@ -954,21 +953,81 @@ static int scp_probe(struct platform_device *pdev)
>  		mutex_destroy(&scp->ipi_desc[i].lock);
>  	mutex_destroy(&scp->send_lock);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +static int scp_cluster_init(struct platform_device *pdev)
> +{
> +	struct mtk_scp *scp;
> +	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
> +	struct list_head *cluster = &scp_cluster->mtk_scp_cluster;
> +
> +	scp = scp_rproc_init(pdev, scp_cluster);
> +	if (IS_ERR(scp))
> +		return PTR_ERR(scp);
> +
> +	list_add_tail(&scp->elem, cluster);
> +
> +	return 0;
> +}
> +
> +static int scp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_scp_of_cluster *scp_cluster;
> +	struct resource *res;
> +	int ret;
> +
> +	scp_cluster = devm_kzalloc(&pdev->dev, sizeof(*scp_cluster), GFP_KERNEL);

Please use @dev the same way it was done for dev_err_probe() and
devm_ioremap_resource() below.

More comments to come tomorrow.

Thanks,
Mathieu

> +	if (!scp_cluster)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> +	scp_cluster->reg_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(scp_cluster->reg_base))
> +		return dev_err_probe(dev, PTR_ERR(scp_cluster->reg_base),
> +				     "Failed to parse and map cfg memory\n");
> +
> +	/* l1tcm is an optional memory region */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> +	scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(scp_cluster->l1tcm_base)) {
> +		ret = PTR_ERR(scp_cluster->l1tcm_base);
> +		if (ret != -EINVAL)
> +			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> +
> +		scp_cluster->l1tcm_base = NULL;
> +	} else {
> +		scp_cluster->l1tcm_size = resource_size(res);
> +		scp_cluster->l1tcm_phys = res->start;
> +	}
> +
> +	INIT_LIST_HEAD(&scp_cluster->mtk_scp_cluster);
> +	platform_set_drvdata(pdev, scp_cluster);
> +
> +	ret = scp_cluster_init(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  static void scp_remove(struct platform_device *pdev)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp, *temp;
>  	int i;
>  
> -	rproc_del(scp->rproc);
> -	scp_remove_rpmsg_subdev(scp);
> -	scp_ipi_unregister(scp, SCP_IPI_INIT);
> -	scp_unmap_memory_region(scp);
> -	for (i = 0; i < SCP_IPI_MAX; i++)
> -		mutex_destroy(&scp->ipi_desc[i].lock);
> -	mutex_destroy(&scp->send_lock);
> +	list_for_each_entry_safe_reverse(scp, temp, &scp_cluster->mtk_scp_cluster, elem) {
> +		list_del(&scp->elem);
> +		rproc_del(scp->rproc);
> +		scp_remove_rpmsg_subdev(scp);
> +		scp_ipi_unregister(scp, SCP_IPI_INIT);
> +		scp_unmap_memory_region(scp);
> +		for (i = 0; i < SCP_IPI_MAX; i++)
> +			mutex_destroy(&scp->ipi_desc[i].lock);
> +		mutex_destroy(&scp->send_lock);
> +	}
>  }
>  
>  static const struct mtk_scp_of_data mt8183_of_data = {
> -- 
> 2.18.0
> 

