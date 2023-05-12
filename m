Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2F8C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9N7oS6jr5I1eNsTOfVL37WjNOJubQs2HqUtyANMDP0=; b=KejMC5iCENdr5zCCmd3X4iny2l
	tLmjgLS1Dv9SjnyEnvkjnW1Lc1XrbIOKh9fj9zxLj2JHVWdxqQtjys0NXQ2hT1N8uZTpX5a+DxW1g
	cCOXsYzWJceu3al4r9XFjGDSiOLetBPOZ5I9ZYD+rUgqTEPsUMe7jOA6CYpYa36xsvHrIpVgO/8T8
	c/UKP74ctamnOk2IdD5b9RVhDBqiNLEjzOsUrfmU6PRWYPDKX0UuawjSWiRn0mDVNzst4SH8LpI8+
	Vrm4GD3tuBJbOEGGagHzmP22CqllwRfE92CUj+TiX56Ug16otCvUJ6yeK0V326vQ6OGEebgS8iSQ6
	tGS2giow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxX0J-00CckE-2F;
	Fri, 12 May 2023 17:56:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxX0F-00CcjF-2C
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 17:56:29 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-643ac91c51fso6492879b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 May 2023 10:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683914186; x=1686506186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9N7oS6jr5I1eNsTOfVL37WjNOJubQs2HqUtyANMDP0=;
        b=e8VeAJis7BiGB80fGC9OA2dXjFxJ84RYh+orJsPRquyiCWeb/YOnxgvRH4NQ5DN+Sz
         K8zIePNL37kmIZi3LujOHN95Q4j9j8pag4WDkr/9Ztd6IeVl/mq+FLwLgzRaF5FuYYOC
         taL3EkI2ffVatTtsWqvJNfxXEuGQiP4igFIaapo2GOWDQqgdPHe0EON7ABVsRcah/pap
         NaqDMAxkgs7zK/IuYeqXLx/QNiG+AC+GgRXA/FoGxG+Bk1ZMm/DplIYxXUg7WMEXR0Sj
         OfTN2cHkaYiHjfM6BSVcJO0hylb4gfOgX8LD8q+mcs63ID5+gvWXFz2/UKg51aSuspwn
         0LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683914186; x=1686506186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9N7oS6jr5I1eNsTOfVL37WjNOJubQs2HqUtyANMDP0=;
        b=IkbOdjwT2GwYoupJtqiDpU86FeB1V7KgVxHuLZN0ld08mi7sl0C1CEzj+/U8uPm3Dx
         C7u+xNeObwMsz/nm/xe4p95wlfKzswoCxRN6YyNaDxiS+yuvbc0U8dTa9P6JOgeBbHBN
         vPV5tz86yGSaeqPSGfnlgjMQbg8zfnoTg3iMpX7eZ1vBele3yfrYzN5XjZQsD+JU3ojj
         /hvDnDLvbPIG4KbEdQmZgvuEFRg1fY3iMLoEJzycrtSTOF510vUbTzvWE+GFdPSbIsCO
         0IqDaRWg9sPLGwKKoW9CDEQz889/NSeP47d1VxCQgprzc1qZZfFS2CjWavY/6/IGJBoc
         ox5g==
X-Gm-Message-State: AC+VfDyxWP0AgNtLy3UFg25Ap6PXopimG3hV7nsG2+FKRi7EBSFMsxc/
	75F53RMXG6cFpvrmAvPAl4A8gg==
X-Google-Smtp-Source: ACHHUZ7PynoPsqxQ9BaRx3LZvfa6R+SwPfo3isHwZ5NUP1XZZEDFDgjXygEj5DaDyxccAYzMaBXPHw==
X-Received: by 2002:a05:6a20:9153:b0:101:3600:6aa5 with SMTP id x19-20020a056a20915300b0010136006aa5mr16881734pzc.3.1683914185675;
        Fri, 12 May 2023 10:56:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c53:c331:6276:810])
        by smtp.gmail.com with ESMTPSA id o4-20020a63f144000000b00513973a7014sm6946408pgk.12.2023.05.12.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 10:56:25 -0700 (PDT)
Date: Fri, 12 May 2023 11:56:22 -0600
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
Subject: Re: [PATCH v11 06/11] remoteproc: mediatek: Probe multi-core SCP
Message-ID: <ZF59xilzufy69RZh@p14s>
References: <20230510063749.5127-1-tinghan.shen@mediatek.com>
 <20230510063749.5127-7-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510063749.5127-7-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_105627_721137_92AA9172 
X-CRM114-Status: GOOD (  34.17  )
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

On Wed, May 10, 2023 at 02:37:44PM +0800, Tinghan Shen wrote:
> The difference of single-core SCP and multi-core SCP device tree is
> the presence of child device nodes described SCP cores. The SCP
> driver populates the platform device and checks the child nodes
> to identify whether it's a single-core SCP or a multi-core SCP.
> 
> Add the remoteproc instances of multi-core SCP to the SCP cluster list.
> When the SCP driver is removed, it cleanup resources by walking
> through the cluster list.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 135 ++++++++++++++++++++++++++++++-----
>  1 file changed, 117 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ff73c6dd9637..87215a0e145e 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -864,7 +864,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  }
>  
>  static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> -				      struct mtk_scp_of_cluster *scp_cluster)
> +				      struct mtk_scp_of_cluster *scp_cluster,
> +				      const struct mtk_scp_of_data *of_data)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -887,7 +888,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	scp = rproc->priv;
>  	scp->rproc = rproc;
>  	scp->dev = dev;
> -	scp->data = of_device_get_match_data(dev);
> +	scp->data = of_data;
>  	platform_device_add_data(pdev, &scp, sizeof(scp));
>  
>  	scp->reg_base = scp_cluster->reg_base;
> @@ -938,10 +939,6 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  		goto remove_subdev;
>  	}
>  
> -	ret = rproc_add(rproc);
> -	if (ret)
> -		goto remove_subdev;
> -

This should have been done in the previous patch.

>  	return scp;
>  
>  remove_subdev:
> @@ -956,19 +953,116 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	return ERR_PTR(ret);
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
> +static int scp_is_single_core(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct device_node *child;
> +
> +	child = of_get_next_available_child(np, NULL);
> +	if (!child)
> +		return dev_err_probe(dev, -ENODEV, "No child node\n");
> +
> +	of_node_put(child);
> +	return of_node_name_eq(child, "cros-ec-rpmsg");
> +}
> +
>  static int scp_cluster_init(struct platform_device *pdev)
>  {
> -	struct mtk_scp *scp;
> +	struct mtk_scp *scp, *temp;
>  	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
>  	struct list_head *cluster = &scp_cluster->mtk_scp_cluster;
>  
> -	scp = scp_rproc_init(pdev, scp_cluster);
> -	if (IS_ERR(scp))
> -		return PTR_ERR(scp);
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct platform_device *cpdev;
> +	struct device_node *child;
> +	const struct mtk_scp_of_data **cluster_of_data;
> +	int core_id = 0;
> +	int ret;
> +
> +	ret = scp_is_single_core(pdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret) {
> +		dev_dbg(dev, "single-core scp\n");
> +
> +		/* When using the SCP node phandle on exported SCP APIs, the drvdata
> +		 * is expected to be the mtk_scp object, and as a result, it is intended
> +		 * to be overwritten for single-core SCP usage.
> +		 */

Is this comment still relevant?

> +		scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
> +		if (IS_ERR(scp))
> +			return PTR_ERR(scp);
> +
> +		list_add_tail(&scp->elem, cluster);

This is getting messy.  Please add two new functions, i.e scp_add_single_core()
and scp_add_multi_core().

> +	} else {
> +		dev_dbg(dev, "multi-core scp\n");
> +
> +		cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> +
> +		for_each_available_child_of_node(np, child) {
> +			if (!cluster_of_data[core_id]) {
> +				ret = -EINVAL;
> +				dev_err(dev, "Not support core %d\n", core_id);
> +				of_node_put(child);
> +				goto init_fail;
> +			}
> +
> +			cpdev = of_find_device_by_node(child);
> +			if (!cpdev) {
> +				ret = -ENODEV;
> +				dev_err(dev, "Not found platform device for core %d\n", core_id);
> +				of_node_put(child);
> +				goto init_fail;
> +			}
> +
> +			scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
> +			if (IS_ERR(scp)) {
> +				dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> +				put_device(&cpdev->dev);
> +				of_node_put(child);
> +				goto init_fail;
> +			}
> +			list_add_tail(&scp->elem, cluster);
> +			put_device(&cpdev->dev);
> +
> +			core_id++;
> +		}
> +	}
>  
> -	list_add_tail(&scp->elem, cluster);
> +	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
> +		ret = rproc_add(scp->rproc);

Call rproc_add() in the for_each_available_child_of_node() loop above.  That way
it if fails you can call scp_rproc_free() right away and jump to init_fail to
deal with the other cores on the list.

> +		if (ret)
> +			goto add_fail;
> +	}
>  
>  	return 0;
> +
> +add_fail:
> +	list_for_each_entry_continue(scp, cluster, elem) {
> +		rproc_del(scp->rproc);
> +	}
> +init_fail:
> +	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
> +		list_del(&scp->elem);
> +		scp_rproc_free(scp);
> +	}
> +

There are a serious problems with the code in both labels above.  I will let you
think about that and I will stop here for this revision.

Mathieu

> +	return ret;
>  }
>  
>  static int scp_probe(struct platform_device *pdev)
> @@ -1005,6 +1099,10 @@ static int scp_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&scp_cluster->mtk_scp_cluster);
>  	platform_set_drvdata(pdev, scp_cluster);
>  
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
> +
>  	ret = scp_cluster_init(pdev);
>  	if (ret)
>  		return ret;
> @@ -1016,17 +1114,11 @@ static int scp_remove(struct platform_device *pdev)
>  {
>  	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
>  	struct mtk_scp *scp, *temp;
> -	int i;
>  
>  	list_for_each_entry_safe_reverse(scp, temp, &scp_cluster->mtk_scp_cluster, elem) {
>  		list_del(&scp->elem);
>  		rproc_del(scp->rproc);
> -		scp_remove_rpmsg_subdev(scp);
> -		scp_ipi_unregister(scp, SCP_IPI_INIT);
> -		scp_unmap_memory_region(scp);
> -		for (i = 0; i < SCP_IPI_MAX; i++)
> -			mutex_destroy(&scp->ipi_desc[i].lock);
> -		mutex_destroy(&scp->send_lock);
> +		scp_rproc_free(scp);
>  	}
>  
>  	return 0;
> @@ -1106,12 +1198,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
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

