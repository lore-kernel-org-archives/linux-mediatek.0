Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96FAC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCIAEkv+xo6a49Qxw52m347tO8F3UsV4ScqWgSVtBQo=; b=Kk7EnGAzriKpTmHxhoTmnFUeCZ
	a0WbzduNtZS5MXxdAgqTtvFxKq1NsoTSBSrKwQoOISmKsaueeMRY8CbgM3+csgs3I/T2FVJV06pT/
	ihbEIXk9lrHSbGWe34vu5aHX+ues7OR9FnBQwARxM/0Vp9X3jZf/oDqCV8KnoYEMlJdMs825zz/K2
	czoj21fVRClsXUkL4OORXHrBVLXeySwh0ZGN7VxCp/85pNTzOFnXj9OqSDjelhpQPBFbrNM34gLqr
	0NogICfmVIJB4SR4BQwKK5nXqOTeWq+xkLXvcjz5h+2Teand3buxdcaHA7OH6TWlpQFHUxSfUfu9e
	+zGjIYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOCJ-008O7z-2b;
	Tue, 25 Jul 2023 19:59:55 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOCF-008O5H-1v
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jul 2023 19:59:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bb119be881so45067885ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690315188; x=1690919988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCIAEkv+xo6a49Qxw52m347tO8F3UsV4ScqWgSVtBQo=;
        b=qF9waU9+2RMo/5zIqF66WCIqhSsv8BKJs/OYENeuVcblNZi/YbyvAY+j7734s2X7ku
         uTLI476KfO3Czm7k0elNhrBsmPKb/ToDS9X3WFxWoSRJUg2vIM7pQJT/rGgPjkJX5rN0
         K7gyMiXy6D/BVBkmUbWhuzaIJScKRgA1kLtpDWA7tpdIvv1cVzF9KkR6bmc5nYNCfrwB
         bploaPpfjsKEo+9F7nz9vD37aTfP5m28YvI8nv5V4V2AVYMn5ezFOM9Zx0Q3OSTzCYx4
         VAMhuLcBkgK4EhdG+szZZ8wKTzhtORVAEQRkNbLRrNoh4US57B+0xo9rtwv0PTYfyPf0
         vhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690315188; x=1690919988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCIAEkv+xo6a49Qxw52m347tO8F3UsV4ScqWgSVtBQo=;
        b=j+pqGsDj3aW6hUVxskV0j4n2INW44/rH37cJ+GlKgUz02CPM6xSJUwd7sS/mkSG3uU
         8m1NSn+UPjHz0Z5/xTtBzwDB36Icep+X1VUfOcsuTFsW2qXkrUlqowExOjkj0KQ7FyQr
         k3AQvSepo5hsFfNBCq762Q4PwGzdDaz800Kt+aSoIqE2L35I3T0fZ7JWkQhFAq8lJBrw
         j2P4Bq/PVgQ2h1Gj3OWoYEoGqWA6RxVjYSZhHsImfDJ+qv7fPZwcz+2pOp2iLq3k0a9k
         nBGwe8wnCwId191oli/OKhQXbP3qbk82YAtMilagV1ES5VsUCAHdWLlwCw61vTtHPGld
         Wh8A==
X-Gm-Message-State: ABy/qLaiP9w1M4dWi+Xcc34jJJrfjguxYsxTlU32RyWlvxqgxIbzP6ny
	PCoq2Z8KrhwmypSMfUAVjPTckw==
X-Google-Smtp-Source: APBJJlF1l2EcR2KvAHiOLZNdxhN7VEpRtLbQN/aC9DJyjv6CyzU2xaQ3vc5pri03CX6P4rhkc43o6g==
X-Received: by 2002:a17:902:d2c4:b0:1bb:14e7:4fdf with SMTP id n4-20020a170902d2c400b001bb14e74fdfmr244864plc.22.1690315187915;
        Tue, 25 Jul 2023 12:59:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2116:2b1f:2fd8:ec8d])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902e9d400b001bba27d1b65sm4939667plk.85.2023.07.25.12.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:59:47 -0700 (PDT)
Date: Tue, 25 Jul 2023 13:59:44 -0600
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
Subject: Re: [PATCH v15 07/13] remoteproc: mediatek: Probe SCP cluster on
 multi-core SCP
Message-ID: <ZMApsFKHbj2WPLE8@p14s>
References: <20230721024132.6548-1-tinghan.shen@mediatek.com>
 <20230721024132.6548-8-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721024132.6548-8-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_125951_669216_AA854363 
X-CRM114-Status: GOOD (  29.27  )
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

On Fri, Jul 21, 2023 at 10:41:26AM +0800, Tinghan Shen wrote:
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 118 +++++++++++++++++++++++++++++++++--
>  1 file changed, 113 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d67dcabdab9e..34095a461e15 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -855,7 +855,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  }
>  
>  static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> -				      struct mtk_scp_of_cluster *scp_cluster)
> +				      struct mtk_scp_of_cluster *scp_cluster,
> +				      const struct mtk_scp_of_data *of_data)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -878,7 +879,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	scp = rproc->priv;
>  	scp->rproc = rproc;
>  	scp->dev = dev;
> -	scp->data = of_device_get_match_data(dev);
> +	scp->data = of_data;
>  	scp->cluster = scp_cluster;
>  	platform_set_drvdata(pdev, scp);
>  
> @@ -951,15 +952,15 @@ static void scp_free(struct mtk_scp *scp)
>  	mutex_destroy(&scp->send_lock);
>  }
>  
> -static int scp_cluster_init(struct platform_device *pdev,
> -			    struct mtk_scp_of_cluster *scp_cluster)
> +static int scp_add_single_core(struct platform_device *pdev,
> +			       struct mtk_scp_of_cluster *scp_cluster)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	struct mtk_scp *scp;
>  	int ret;
>  
> -	scp = scp_rproc_init(pdev, scp_cluster);
> +	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
>  	if (IS_ERR(scp))
>  		return PTR_ERR(scp);
>  
> @@ -975,6 +976,102 @@ static int scp_cluster_init(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int scp_add_multi_core(struct platform_device *pdev,
> +			      struct mtk_scp_of_cluster *scp_cluster)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct platform_device *cpdev;
> +	struct device_node *child;
> +	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
> +	const struct mtk_scp_of_data **cluster_of_data;
> +	struct mtk_scp *scp, *temp;
> +	int core_id = 0;
> +	int ret;
> +
> +	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> +
> +	for_each_available_child_of_node(np, child) {
> +		if (!cluster_of_data[core_id]) {
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
> +		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
> +		put_device(&cpdev->dev);
> +		if (IS_ERR(scp)) {
> +			ret = PTR_ERR(scp);
> +			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		ret = rproc_add(scp->rproc);
> +		if (ret) {
> +			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> +			of_node_put(child);
> +			scp_free(scp);
> +			goto init_fail;
> +		}
> +
> +		list_add_tail(&scp->elem, scp_list);
> +		core_id++;
> +	}
> +
> +	platform_set_drvdata(pdev, list_first_entry(scp_list, struct mtk_scp, elem));

(sigh)

Why is list_first_entry() used here rather than just @scp?  What is the purpose
of using the list API?

> +
> +	return 0;
> +
> +init_fail:
> +	list_for_each_entry_safe_reverse(scp, temp, scp_list, elem) {
> +		list_del(&scp->elem);
> +		rproc_del(scp->rproc);
> +		scp_free(scp);
> +	}
> +
> +	return ret;
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
> +static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
> +{
> +	int ret;
> +
> +	ret = scp_is_single_core(pdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		ret = scp_add_single_core(pdev, scp_cluster);
> +	else
> +		ret = scp_add_multi_core(pdev, scp_cluster);
> +
> +	return ret;
> +}
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1007,6 +1104,10 @@ static int scp_probe(struct platform_device *pdev)
>  
>  	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>  
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
> +
>  	ret = scp_cluster_init(pdev, scp_cluster);
>  	if (ret)
>  		return ret;
> @@ -1101,12 +1202,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
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

