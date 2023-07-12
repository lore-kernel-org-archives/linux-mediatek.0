Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DB5EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTQ8Q2thfWAfcL5Ck5oeBseIeiNj0gT5+ucM2ZzcSW8=; b=PLyWTHk7PPV+RvDnIeiAem2VrA
	2H8Hy2SNTpgy1ZB/yiYg6id3qWBYSS6d8cfLrT0UCfys1MzQgGvxxUZ2iNeszW40i3IwampRWCbsQ
	iNE02fMWsbi4k/vFiaQNUar+ePDGH5grvC22RyWjg/bDd4hp4GpbGoARGnzVqOyGgeP/lAWu8HnON
	XFguVf871NMrXdgJiJmyHlvHl8bzytPvVeLeSG7cEQHXVuPMMrLr63mtQwnBUrLiG3/Af09ulTQig
	g02klJ5NJvkM/ooGYkDVlRyrLiYBM0p017PmGt4n/yulIpOHM5fHlb1GwVMlV7pVRGMCTjLfqbHF4
	BBnlTCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJge6-001Can-2f;
	Wed, 12 Jul 2023 20:41:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJge3-001CYz-0m
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 20:41:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b8a44ee159so39578275ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689194462; x=1691786462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTQ8Q2thfWAfcL5Ck5oeBseIeiNj0gT5+ucM2ZzcSW8=;
        b=E7KBfQ+ADb+vOC9lwKfy4GUPzNoADOdXa1tyUiOMFGAbEqDesg/7DPyIpZ04rRG7SS
         CI9Pxxm0DFCqsHFxySFgF2dscOX9++DJ7MGSAjAqFHOqPZgaixGZBm/9WKShJNt9fE9x
         zfmNnNzud93xdBIjvhYbLR2XoaN5mGeNfskAZjJhEypJ55Ni/Lk/oIVcm96605h4guWA
         IdSR7+H3NSpHOImmI1UK2ApZDe63UQBySTEbIR7SqPSPAgWQaldLuwG515ON+gR6X2zh
         7JBO6tQDN88HFs91cQ2YmfiTamIT4PHQrRw4PNdhDhBhh6m/m/UQkz9ZdV+ITDgnk4MA
         PmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689194462; x=1691786462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTQ8Q2thfWAfcL5Ck5oeBseIeiNj0gT5+ucM2ZzcSW8=;
        b=WAyUe3D0Lb6HroX50HG+zD2uImZg6sTxczh2/h9d9JlBVaBcj3oW+c4wytUYN+jhMb
         eAnS2bbc7oizL/TGoBOa9x1WqsQriBDk2rbg2Je7pGWM2e1eIzR920bFIQc1djZrBf8S
         Uev0NGK8to0nwZFlP55j0Kajr8RJLuYjd0d4CLs2M3oTs3DYjom6C4q2yPT9PVei2/fe
         qaC/1um5GbPgSpDzkj7OQpcZTOjty+p2SiOWSOSCVjcIEOB4+a79gqHhyao/afl2veO+
         J45O56bGy+zQ4NCc90cm0mtubKYIRDf4+xOssg6o1rWZf9oo+7f0Fwd1LyyA8Srok6sf
         32kQ==
X-Gm-Message-State: ABy/qLYBZs/SZEBDTLqFkyqs5GEhiCaT0cV05ESggvCiZDYbzGr4F56Y
	hpdtR53KCLaSV+FlA6ScXARA5Q==
X-Google-Smtp-Source: APBJJlHwE0pVMBV73p3yQVDBY+sz7V2ACI+xlVqOGxoxCpaCEw8GFmGebdDC8OiamYOddWM0OJatOg==
X-Received: by 2002:a17:902:ed44:b0:1b8:a3a0:d9b3 with SMTP id y4-20020a170902ed4400b001b8a3a0d9b3mr15434979plb.47.1689194462561;
        Wed, 12 Jul 2023 13:41:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:70ea:7145:ddf8:7208])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902b09000b001b8422f1000sm4386306plr.201.2023.07.12.13.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 13:41:02 -0700 (PDT)
Date: Wed, 12 Jul 2023 14:40:59 -0600
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
Subject: Re: [PATCH v14 05/12] remoteproc: mediatek: Introduce cluster on
 single-core SCP
Message-ID: <ZK8P25K2RaxdAKHh@p14s>
References: <20230707052612.27521-1-tinghan.shen@mediatek.com>
 <20230707052612.27521-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707052612.27521-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_134107_344678_6E896193 
X-CRM114-Status: GOOD (  39.30  )
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

From an overall perspective this patchset looks good.  Now that we can clearly
see what is going on there are a few things to improve on.  Please see below. 

On Fri, Jul 07, 2023 at 01:26:05PM +0800, Tinghan Shen wrote:
> This is the preliminary step for probing multi-core SCP.
> The initialization procedure for remoteproc is similar for both
> single-core and multi-core architectures and is reusing to avoid
> redundant code.
> 
> Rewrite the probing flow of single-core SCP to adapt with the 'cluster'
> concept needed by probing the multi-core SCP. The main differences
> are,
> - the SCP core object(s) is maintained at the cluster list instead of at
>   the platform device driver data property.
> - save the cluster information at the platform device driver data property.
> - In order to keep the compatibility of exported SCP APIs which getting
>   the SCP core object by SCP node phandle, move the SCP core object
>   pointers to the platform device platform data property.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |   2 +
>  drivers/remoteproc/mtk_scp.c    | 151 +++++++++++++++++++++++---------
>  2 files changed, 112 insertions(+), 41 deletions(-)
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
> index 48e759c2d486..3a8c8bcfa46b 100644
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
> +	struct list_head mtk_scp_list;
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
> @@ -809,14 +817,14 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
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
> @@ -824,7 +832,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
>  static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
>  			unsigned int len, unsigned int wait)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>  
>  	return scp_ipi_send(scp, id, buf, len, wait);
>  }
> @@ -854,7 +862,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  	}
>  }
>  
> -static int scp_probe(struct platform_device *pdev)
> +static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> +				      struct mtk_scp_of_cluster *scp_cluster)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -866,52 +875,42 @@ static int scp_probe(struct platform_device *pdev)
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

Using platform_device_add_data() doesn't work because it creates a duplicate
copy of @scp.  To fix this I suggest to:

1. Change mtk_scp_of_cluster::l2tcm_lock to mtk_scp_of_cluster::cluster_lock
2. Add a struct mtk_scp_of_cluster *cluster to struct mtk_scp
3. Don't call platform_set_drvdata(pdev, scp_cluster) in scp_probe()
4. Above do scp->cluster = scp_cluster and call platform_set_drvdata(pdev, scp)
instead of platform_device_add_data().
5. Every time you are modifying scp->cluster, scp->cluster->cluster_lock must be
held.

> +
> +	scp->reg_base = scp_cluster->reg_base;
> +	scp->l1tcm_base = scp_cluster->l1tcm_base;
> +	scp->l1tcm_size = scp_cluster->l1tcm_size;
> +	scp->l1tcm_phys = scp_cluster->l1tcm_phys;


Fields reg_base, l1tcm_base, l1tcm_size and l1tcm_phy don't belong in the
mtk_scp struct anymore but in the mtk_scp_of_cluster struct.  With the above
changes they should be available in the same way.

Thanks,
Mathieu

>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp->sram_base))
> -		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
> -				     "Failed to parse and map sram memory\n");
> +	if (IS_ERR(scp->sram_base)) {
> +		dev_err(dev, "Failed to parse and map sram memory\n");
> +		return ERR_CAST(scp->sram_base);
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
> @@ -938,11 +937,7 @@ static int scp_probe(struct platform_device *pdev)
>  		goto remove_subdev;
>  	}
>  
> -	ret = rproc_add(rproc);
> -	if (ret)
> -		goto remove_subdev;
> -
> -	return 0;
> +	return scp;
>  
>  remove_subdev:
>  	scp_remove_rpmsg_subdev(scp);
> @@ -953,15 +948,13 @@ static int scp_probe(struct platform_device *pdev)
>  		mutex_destroy(&scp->ipi_desc[i].lock);
>  	mutex_destroy(&scp->send_lock);
>  
> -	return ret;
> +	return ERR_PTR(ret);
>  }
>  
> -static void scp_remove(struct platform_device *pdev)
> +static void scp_free(struct mtk_scp *scp)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
>  	int i;
>  
> -	rproc_del(scp->rproc);
>  	scp_remove_rpmsg_subdev(scp);
>  	scp_ipi_unregister(scp, SCP_IPI_INIT);
>  	scp_unmap_memory_region(scp);
> @@ -970,6 +963,82 @@ static void scp_remove(struct platform_device *pdev)
>  	mutex_destroy(&scp->send_lock);
>  }
>  
> +static int scp_cluster_init(struct platform_device *pdev)
> +{
> +	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
> +	struct list_head *cluster = &scp_cluster->mtk_scp_list;
> +	struct mtk_scp *scp;
> +	int ret;
> +
> +	scp = scp_rproc_init(pdev, scp_cluster);
> +	if (IS_ERR(scp))
> +		return PTR_ERR(scp);
> +
> +	ret = rproc_add(scp->rproc);
> +	if (ret) {
> +		dev_err(dev, "Failed to add rproc\n");
> +		scp_free(scp);
> +		return ret;
> +	}
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
> +	scp_cluster = devm_kzalloc(dev, sizeof(*scp_cluster), GFP_KERNEL);
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
> +	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
> +	platform_set_drvdata(pdev, scp_cluster);
> +
> +	ret = scp_cluster_init(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void scp_remove(struct platform_device *pdev)
> +{
> +	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp, *temp;
> +
> +	list_for_each_entry_safe_reverse(scp, temp, &scp_cluster->mtk_scp_list, elem) {
> +		list_del(&scp->elem);
> +		rproc_del(scp->rproc);
> +		scp_free(scp);
> +	}
> +}
> +
>  static const struct mtk_scp_of_data mt8183_of_data = {
>  	.scp_clk_get = mt8183_scp_clk_get,
>  	.scp_before_load = mt8183_scp_before_load,
> -- 
> 2.18.0
> 

