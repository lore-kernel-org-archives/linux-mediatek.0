Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD12C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:29:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB2820E65
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB2820E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z09Cdp2E9XOceBnD69f+MjeS8/NaxBXChM0w38j1dAk=; b=P/ALa1dU7iDyvjP2bZ87hVbz8
	S77bdDWVzkVMgvMCFjQIF68Du/DX37Ja4hCtpZea7g0Jg//RHtAdED7yQPBIYVrIKBaj8II8s5wZz
	C7MujHpOZ3LeQBVthixt3Zz0PW/c10hJq8lEsfX4ESinD24GIrHZNME2/ElVT3yxY4nIYFRAYz5h+
	nbJDD3FZ3/fbhuAojy88uXfP1VvKcttI4J8PZf2yr+YU8Z9DdJlTpamC0MURc9HQWbvGIRkdXxIZs
	Rk2VY3rVlTmVh4lxLInT6WcaERJuTJYJcwJm3fgokw61RdI3TKUkFxbTHo+YQuoS7by460+NVYY1Q
	9Ea4nesbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzWG-0004FL-ET; Wed, 23 Dec 2020 08:29:16 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzWC-0004DC-M5
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 08:29:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id b5so2816810pjl.0
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Dec 2020 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MtRevYqK8sqR14rLsfzjE387SZOyOC0INohDVQpnu/o=;
 b=eniRj4JCG7HSOxKs+Xv2XOqjiq/o9XyHjwzWVHjAT3jWwP+ldVc0+eWag0AsvRdgC0
 gKt/Phk8yoX6YxQFXZMQfH1IOhgrBGo6PcH7enCXeYyfCdjyr6uDtBLoNshhAEf5stpk
 DtCpy9+9pzrpuXJidDrgorvS03FVLv3M7FSto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MtRevYqK8sqR14rLsfzjE387SZOyOC0INohDVQpnu/o=;
 b=CKF7zjYFSgEEEEQ2Klx/5+DIPYVvirY5O66GW4OrNzzrsNh6QwWD9QHceLGluqZ9Pe
 Pi7SKCZbo1xR3kyR1JDivR34k/q4sgI1RWIoH7fCTR6bOa/9kyIYDIovH9DB56YoTe34
 vcg3fOzdCBTa0RertDjmoY35HU2VoBCOHrhzwr4nO1MMbBaqO45pMkkwniHWoOBTTLkJ
 3eLSkEogd4RarU4YIiZvbdSvNuI8a6RxcmY2iNNAkv3JIA0+pGOOQgV2nz80Lzy6kmCg
 8cCUORTzs9VkJ1SLv3gXpWfnE28TwkSaGT+z7vHrKtByK8087fHuupqp2s9dLWWH/DQq
 L8jQ==
X-Gm-Message-State: AOAM531vaKaxKVddOsaNSk+AM7kAp6XVTKmP0i867Egndb/nTfgmv6XD
 eepCfDasgtAkPWdrOHMobXZMKw==
X-Google-Smtp-Source: ABdhPJxwhDWa65ztRldJLKunkdsaTgTcsOr8hUNnOAXF3Z/ppin9ltztXhGaIKLe03R/ZD2nPu+1vw==
X-Received: by 2002:a17:90b:90f:: with SMTP id
 bo15mr25095694pjb.148.1608712150675; 
 Wed, 23 Dec 2020 00:29:10 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
 by smtp.gmail.com with ESMTPSA id p17sm11910519pfn.52.2020.12.23.00.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 00:29:09 -0800 (PST)
Date: Wed, 23 Dec 2020 17:29:04 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 16/27] iommu/mediatek: Add device link for smi-common
 and m4u
Message-ID: <X+L/0E6p9t+a/l5w@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-17-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-17-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_032912_787357_815C36A6 
X-CRM114-Status: GOOD (  28.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 09, 2020 at 04:00:51PM +0800, Yong Wu wrote:
> In the lastest SoC, M4U has its special power domain. thus, If the engine
> begin to work, it should help enable the power for M4U firstly.
> Currently if the engine work, it always enable the power/clocks for
> smi-larbs/smi-common. This patch adds device_link for smi-common and M4U.
> then, if smi-common power is enabled, the M4U power also is powered on
> automatically.
> 
> Normally M4U connect with several smi-larbs and their smi-common always
> are the same, In this patch it get smi-common dev from the first smi-larb
> device(i==0), then add the device_link only while m4u has power-domain.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 30 ++++++++++++++++++++++++++++--
>  drivers/iommu/mtk_iommu.h |  1 +
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 09c8c58feb78..5614015e5b96 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -706,7 +707,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  		return larb_nr;
>  
>  	for (i = 0; i < larb_nr; i++) {
> -		struct device_node *larbnode;
> +		struct device_node *larbnode, *smicomm_node;
>  		struct platform_device *plarbdev;
>  		u32 id;
>  
> @@ -732,6 +733,26 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  
>  		component_match_add_release(dev, &match, release_of,
>  					    compare_of, larbnode);
> +		if (i != 0)
> +			continue;

How about using the last larb instead and moving the code below outside
of the loop?

> +		smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
> +		if (!smicomm_node)
> +			return -EINVAL;
> +
> +		plarbdev = of_find_device_by_node(smicomm_node);
> +		of_node_put(smicomm_node);
> +		data->smicomm_dev = &plarbdev->dev;
> +	}
> +
> +	if (dev->pm_domain) {
> +		struct device_link *link;
> +
> +		link = device_link_add(data->smicomm_dev, dev,
> +				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +		if (!link) {
> +			dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
> +			return -EINVAL;
> +		}
>  	}
>  
>  	platform_set_drvdata(pdev, data);
> @@ -739,7 +760,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
>  				     "mtk-iommu.%pa", &ioaddr);
>  	if (ret)
> -		return ret;
> +		goto out_link_remove;
>  
>  	iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
>  	iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
> @@ -763,6 +784,9 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	iommu_device_unregister(&data->iommu);
>  out_sysfs_remove:
>  	iommu_device_sysfs_remove(&data->iommu);
> +out_link_remove:
> +	if (dev->pm_domain)
> +		device_link_remove(data->smicomm_dev, dev);
>  	return ret;
>  }
>  
> @@ -777,6 +801,8 @@ static int mtk_iommu_remove(struct platform_device *pdev)
>  		bus_set_iommu(&platform_bus_type, NULL);
>  
>  	clk_disable_unprepare(data->bclk);
> +	if (pdev->dev.pm_domain)
> +		device_link_remove(data->smicomm_dev, &pdev->dev);
>  	devm_free_irq(&pdev->dev, data->irq, data);
>  	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
>  	return 0;
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index d0c93652bdbe..5e03a029c4dc 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -68,6 +68,7 @@ struct mtk_iommu_data {
>  
>  	struct iommu_device		iommu;
>  	const struct mtk_iommu_plat_data *plat_data;
> +	struct device			*smicomm_dev;
>  
>  	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
>  
> -- 
> 2.18.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
