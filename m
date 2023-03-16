Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728FDC74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 21:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rv/0vFeqO+WM3FB2+Xg0vo1owyWk3WXOVffunsdpWY=; b=QTg4p/mKU80G2vVeQ1/mzcDnDb
	Ce3ZWaZA+KGftODNvB7XKGWNDANMYAGSzQValgScI/QYFx7bTCMxNEIQX/igezWdaDFLOFk6gib8W
	MoSZDDXiXHdwoeYBgdGfQXoscJ4wdqDMY2NVi1TtyZa4hV6G1sDir7aBy2veYTnj0/7kM8IUYPy0u
	a+NXN/DQDQR7ZqZk1qtKe7Gk2ZtmOeCFM5k6GZ1MvYA30n2os23XTqpIidTbjA+Cho/stZ9172XNj
	GfbWdvnoYbrD01/gawpbD20831uQ3iaaK604AOFbqycgxhjFZDGQxl2XCdCSNgeblw45M8XjUyy+G
	r3E/0fuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcupB-00Habb-39;
	Thu, 16 Mar 2023 21:07:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcup7-00HaZP-39
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Mar 2023 21:07:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id i5so3183837pla.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Mar 2023 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679000860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rv/0vFeqO+WM3FB2+Xg0vo1owyWk3WXOVffunsdpWY=;
        b=S79hVXRjjm0FjIHbeVjOcF1LYDfYW1lLvbJcQum3olyNU0JXkcNgLB0RvF6oz3dO3j
         ixDzzQp3r4ED7pGmKVBc08073+HUtGiyo8xnnKSh4k66tSBz40tK+sZmfOvvMDlY6A1k
         h2bCv4Y95J37BALnbLsKkUidKj82/50ex/VJs88wAaq+fMtNfFEES1hdHh4+s1tSZlF7
         p6Zh6GJBIHc8XRCkXHltkbWZZnuOBw2MoFmjta0Ri4wNtJHIzMj2IHEldQfVi6+E+Q32
         Jsy133AntJtxVZl2PtwhTJnS+Ty3fBaiLFLvJAL87/97ZP82bGskGsWlg5u+Gh4kRPFY
         fgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679000860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rv/0vFeqO+WM3FB2+Xg0vo1owyWk3WXOVffunsdpWY=;
        b=VhxnyaPQ91DGfJeFswrpVV76fCPSAMk9+oXrH4kbqTOfqjijDPpHY2Jw/FvhhC629t
         DG7utAfNa7AESfMG2FCay2aZ44JVsHwTwzIysaxnXzNx+2LajCzoARspmGSwcqFZy6gU
         sbXDBIlEz5UgdKbvKsejmdr/f68hcbQg86Dy3puRh2/T+g0+3eL84yYYHMneXqtEEgFq
         fQ49+w6MMMi8sh3JkolXzQI3mQ3Gnt1qxzw0PmcXRf7LwAIwZDSiSJw1ryxyiQjjd1bX
         1NeIv8gcKg6s835VzA7N5T6EWTGC8HWwNC5edWrNUXAW/5n84TRw3E0pVlviify03qby
         uQmg==
X-Gm-Message-State: AO0yUKX6rlY/Z9zSa5JzHwNAC8PO7Qo7bqrP3uej5tqy3QySD3siu19J
	uprObW+81boZj/iFdayizFgssg==
X-Google-Smtp-Source: AK7set+iNK/k9w9PkilPKa0Z/I9W1xZiD+fEjA7oHYkL4Y5Db47Gcw+1ny+9e/XRcQz418ZlT3Fmpg==
X-Received: by 2002:a17:90b:164f:b0:23f:1210:cea4 with SMTP id il15-20020a17090b164f00b0023f1210cea4mr5369606pjb.18.1679000860495;
        Thu, 16 Mar 2023 14:07:40 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5997:2b9a:5757:d5f4])
        by smtp.gmail.com with ESMTPSA id j36-20020a635524000000b00502f1540c4asm77061pgb.81.2023.03.16.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:07:39 -0700 (PDT)
Date: Thu, 16 Mar 2023 15:07:37 -0600
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
Subject: Re: [PATCH v8 06/11] remoteproc: mediatek: Probe multi-core SCP
Message-ID: <20230316210737.GA2428370@p14s>
References: <20230303083355.3378-1-tinghan.shen@mediatek.com>
 <20230303083355.3378-7-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303083355.3378-7-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_140746_037533_A070C075 
X-CRM114-Status: GOOD (  35.77  )
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

On Fri, Mar 03, 2023 at 04:33:50PM +0800, Tinghan Shen wrote:
> The difference of single-core SCP and multi-core SCP device tree is
> the presence of child device nodes described SCP cores. The SCP
> driver populates the platform device and checks the child nodes
> to identify whether it's a single-core SCP or a multi-core SCP.
> 
> The resource structure of the multi-core SCP is a list of remoteproc
> instances which is different to the single-core SCP. The corresponding
> resource releasing action is based on the type of SCP.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |   4 +
>  drivers/remoteproc/mtk_scp.c    | 177 +++++++++++++++++++++++++++++---
>  2 files changed, 166 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index c0905aec3b4b..c088149e3dcc 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -128,6 +128,10 @@ struct mtk_scp {
>  	size_t dram_size;
>  
>  	struct rproc_subdev *rpmsg_subdev;
> +
> +	struct list_head elem;
> +	struct list_head cluster_cores;
> +	struct list_head *cluster;
>  };
>  
>  /**
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index bdb5d87eeaa3..84103a70f426 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -863,7 +863,9 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  }
>  
>  static int scp_rproc_init(struct platform_device *pdev,
> -			  struct mtk_scp_of_regs *of_regs)
> +			  struct mtk_scp_of_regs *of_regs,
> +			  const struct mtk_scp_of_data *of_data,
> +			  bool is_multi_core)

The @is_multi_core variable is a hack and needs to be removed.

>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -884,7 +886,7 @@ static int scp_rproc_init(struct platform_device *pdev,
>  	scp = (struct mtk_scp *)rproc->priv;
>  	scp->rproc = rproc;
>  	scp->dev = dev;
> -	scp->data = of_device_get_match_data(dev);
> +	scp->data = of_data;
>  	platform_set_drvdata(pdev, scp);
>  
>  	scp->reg_base = of_regs->reg_base;
> @@ -933,9 +935,11 @@ static int scp_rproc_init(struct platform_device *pdev,
>  		goto remove_subdev;
>  	}
>  
> -	ret = rproc_add(rproc);
> -	if (ret)
> -		goto remove_subdev;
> +	if (!is_multi_core) {
> +		ret = rproc_add(rproc);
> +		if (ret)
> +			goto remove_subdev;
> +	}

This is also a hack.  The same code should be used to do the initialization of a
remotre processor, whether it is unique or part of a cluster.

>  
>  	return 0;
>  
> @@ -951,9 +955,123 @@ static int scp_rproc_init(struct platform_device *pdev,
>  	return ret;
>  }
>  
> +static void scp_rproc_free(struct mtk_scp *scp)
> +{
> +	int i;
> +
> +	scp_remove_rpmsg_subdev(scp);
> +	scp_ipi_unregister(scp, SCP_IPI_INIT);
> +	scp_unmap_memory_region(scp);
> +	for (i = 0; i < SCP_IPI_MAX; i++)
> +		mutex_destroy(&scp->ipi_desc[i].lock);
> +	mutex_destroy(&scp->send_lock);
> +}
> +
> +static void scp_rproc_exit(struct platform_device *pdev)
> +{
> +	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +
> +	rproc_del(scp->rproc);
> +	scp_rproc_free(scp);
> +}
> +
> +static int scp_cluster_init(struct platform_device *pdev,
> +			    struct mtk_scp_of_regs *of_regs)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct platform_device *cpdev;
> +	struct device_node *child;
> +	const struct mtk_scp_of_data **cluster_of_data;
> +	struct list_head *cluster = NULL;
> +	struct mtk_scp *scp, *temp;
> +	int core_id = 0, num_cores;
> +	int ret;
> +
> +	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> +
> +	for (num_cores = 0; cluster_of_data[num_cores]; num_cores++)
> +		;

Definitely remove.  Either use ARRAY_SIZE() or of_get_available_child_count().

> +
> +	for_each_available_child_of_node(np, child) {
> +		if (core_id >= num_cores) {
> +			ret = -EINVAL;
> +			dev_err(dev, "Not support core %d\n", core_id);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		cpdev = of_find_device_by_node(child);
> +		if (!cpdev) {
> +			ret = -ENODEV;
> +			dev_err(dev, "Not found platform device for core %d\n", core_id);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		ret = scp_rproc_init(cpdev, of_regs, cluster_of_data[core_id], true);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> +			put_device(&cpdev->dev);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		scp = platform_get_drvdata(cpdev);
> +		put_device(&cpdev->dev);
> +		if (core_id == 0) {
> +			INIT_LIST_HEAD(&scp->cluster_cores);
> +			cluster = &scp->cluster_cores;
> +			platform_set_drvdata(pdev, cluster);
> +		}

This should go in scp_probe().

> +
> +		list_add_tail(&scp->elem, cluster);
> +		scp->cluster = cluster;
> +
> +		of_node_put(child);

Is this needed?

> +		core_id++;
> +	}
> +
> +	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
> +		ret = rproc_add(scp->rproc);

This code is complex and hard to read because rproc_add() is called in two
different context.  From a code perspective single core remote processors should
be treated as a one core cluster.

I am done reviewing this patchset.

Thanks,
Mathieu

> +		if (ret)
> +			goto add_fail;
> +	}
> +
> +	return 0;
> +
> +add_fail:
> +	list_for_each_entry_continue(scp, cluster, elem) {
> +		rproc_del(scp->rproc);
> +	}
> +init_fail:
> +	if (cluster) {
> +		list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
> +			list_del(&scp->elem);
> +			scp_rproc_free(scp);
> +		}
> +	}
> +	return ret;
> +}
> +
> +static void scp_cluster_exit(struct platform_device *pdev)
> +{
> +	struct list_head *cluster = platform_get_drvdata(pdev);
> +	struct platform_device *cpdev;
> +	struct mtk_scp *scp, *temp;
> +
> +	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
> +		list_del(&scp->elem);
> +		cpdev = to_platform_device(scp->dev);
> +		scp_rproc_exit(cpdev);
> +	}
> +}
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *core_node;
>  	struct resource *res;
>  	struct mtk_scp_of_regs scp_regs;
>  	int ret;
> @@ -976,21 +1094,43 @@ static int scp_probe(struct platform_device *pdev)
>  		scp_regs.l1tcm_phys = res->start;
>  	}
>  
> -	return scp_rproc_init(pdev, &scp_regs);
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
> +
> +	core_node = of_get_child_by_name(np, "scp");
> +	of_node_put(core_node);

Please use of_get_available_child_count()

> +
> +	if (!core_node) {
> +		dev_info(dev, "single-core scp\n");
> +
> +		ret = scp_rproc_init(pdev, &scp_regs, of_device_get_match_data(dev), false);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to initialize single-core scp\n");
> +	} else {
> +		dev_info(dev, "multi-core scp\n");
> +
> +		ret = scp_cluster_init(pdev, &scp_regs);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to initialize scp cluster\n");
> +	}
> +
> +	return 0;
>  }
>  
>  static int scp_remove(struct platform_device *pdev)
>  {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> -	int i;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *core_node;
>  
> -	rproc_del(scp->rproc);
> -	scp_remove_rpmsg_subdev(scp);
> -	scp_ipi_unregister(scp, SCP_IPI_INIT);
> -	scp_unmap_memory_region(scp);
> -	for (i = 0; i < SCP_IPI_MAX; i++)
> -		mutex_destroy(&scp->ipi_desc[i].lock);
> -	mutex_destroy(&scp->send_lock);
> +	core_node = of_get_child_by_name(np, "scp");
> +	of_node_put(core_node);
> +
> +	if (!core_node)
> +		scp_rproc_exit(pdev);
> +	else
> +		scp_cluster_exit(pdev);
>  
>  	return 0;
>  }
> @@ -1069,12 +1209,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
>  	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
>  };
>  
> +static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
> +	&mt8195_of_data,
> +	&mt8195_of_data_c1,
> +	NULL
> +};
> +
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
>  	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
> +	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> -- 
> 2.18.0
> 

