Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FD8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl7tJvLg+rePt/ATlpSk1Ryk28DbmYxJJ3uCYhHo9rE=; b=n/epwVc1fkkTRb
	mBcy+Gf5AlD/BrSE/t4de2pgmhCKzSEwIr8KegHNrFD/l+hcUIsEvK2qsaTfrYKUZdugabZkoKFqm
	vETtyV91uPW1kVPB7nV9hWgABVaGGOPXCLBmdXRveTC/PuH3Da/c6h91ibrnsIFJ15sN/+P9ZNXLH
	XFzErlWehGV6Rn4bg9q5dzo74QPwjSPyLVRr26+CCW1I52a7aIkYburCCZ7r5h/OZ2z3koswUol0S
	6P3yqzKRxGQU1Bas44RJ8Hk7kiLnh46NTts30wGnkAykNw7O7WKb2XZfs3kuAFs72PLaO75h2fA9y
	YE3DY7uEOvwlgK+KTNoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7GAc-00GDpt-FR; Tue, 11 Jan 2022 12:22:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7GAZ-00GDoX-5N
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 12:22:32 +0000
X-UUID: 493f543c21f147a09cb8ae56cf472c6f-20220111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BNNF6qDYfNgCwZ8WLenUlu5cnfh2wJaVijp1qVihFG4=; 
 b=emn9b47ZyQ4FV3MCGurte1FyoFKdKoc+rCiOD9NVuHHvWpWivBPwoyL3ftCkrcENOto1T0hwZqRmT0i/1niKdAmuHCARRvNKqXDsDbIlv8e4WKvi9xdNIN64Cb7f14yKnbDUe213tNbiwkhs3oJWInGTFIZPvJ+nacRgJOEz1IY=;
X-UUID: 493f543c21f147a09cb8ae56cf472c6f-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1499063612; Tue, 11 Jan 2022 05:22:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 04:22:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 11 Jan 2022 20:22:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Jan 2022 20:22:23 +0800
Message-ID: <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
From: Yong Wu <yong.wu@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Douglas Anderson
 <dianders@chromium.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, Russell King
 <rmk+kernel@arm.linux.org.uk>, Saravana Kannan <saravanak@google.com>,
 <linux-mediatek@lists.infradead.org>
Date: Tue, 11 Jan 2022 20:22:23 +0800
In-Reply-To: <20220106214556.2461363-26-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_042231_236517_34AAC002 
X-CRM114-Status: GOOD (  23.47  )
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

Hi Stephen,

Thanks for helping update here.

On Thu, 2022-01-06 at 13:45 -0800, Stephen Boyd wrote:
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to
> all
> the component devices that make up the aggregate device.
> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

When I test this on mt8195 which have two IOMMU HWs(calling
component_aggregate_regsiter twice), it will abort like this. Then what
should we do if we have two instances?
Thanks.

[    2.652424] Error: Driver 'mtk_iommu_agg' is already registered,
aborting...
[    2.654033] mtk-iommu: probe of 1c01f000.iommu failed with error -16
[    2.662034] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000020
...
[    2.672413] pc : aggregate_device_match+0xa8/0x1c8
[    2.673027] lr : aggregate_device_match+0x68/0x1c8
...
[    2.683091] Call trace:
[    2.683403]  aggregate_device_match+0xa8/0x1c8
[    2.683970]  __device_attach_driver+0x38/0xd0
[    2.684526]  bus_for_each_drv+0x68/0xd0
[    2.685015]  __device_attach+0xec/0x148
[    2.685503]  device_attach+0x14/0x20
[    2.685960]  bus_rescan_devices_helper+0x50/0x90
[    2.686545]  bus_for_each_dev+0x7c/0xd8
[    2.687033]  bus_rescan_devices+0x20/0x30
[    2.687542]  __component_add+0x7c/0xa0
[    2.688022]  component_add+0x14/0x20
[    2.688479]  mtk_smi_larb_probe+0xe0/0x120


> ---
>  drivers/iommu/mtk_iommu.c    | 14 +++++++++-----
>  drivers/iommu/mtk_iommu.h    |  6 ++++--
>  drivers/iommu/mtk_iommu_v1.c | 14 +++++++++-----
>  3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 25b834104790..8e722898cbe2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -752,9 +752,13 @@ static int mtk_iommu_hw_init(const struct
> mtk_iommu_data *data)
>  	return 0;
>  }
>  
> -static const struct component_master_ops mtk_iommu_com_ops = {
> -	.bind		= mtk_iommu_bind,
> -	.unbind		= mtk_iommu_unbind,
> +static struct aggregate_driver mtk_iommu_aggregate_driver = {
> +	.probe		= mtk_iommu_bind,
> +	.remove		= mtk_iommu_unbind,
> +	.driver		= {
> +		.name	= "mtk_iommu_agg",
> +		.owner	= THIS_MODULE,
> +	},
>  };
>  
>  static int mtk_iommu_probe(struct platform_device *pdev)
> @@ -895,7 +899,7 @@ static int mtk_iommu_probe(struct platform_device
> *pdev)
>  			goto out_list_del;
>  	}
>  
> -	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops,
> match);
> +	ret = component_aggregate_register(dev,
> &mtk_iommu_aggregate_driver, match);
>  	if (ret)
>  		goto out_bus_set_null;
>  	return ret;
> @@ -928,7 +932,7 @@ static int mtk_iommu_remove(struct
> platform_device *pdev)
>  	device_link_remove(data->smicomm_dev, &pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	devm_free_irq(&pdev->dev, data->irq, data);
> -	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
> +	component_aggregate_unregister(&pdev->dev,
> &mtk_iommu_aggregate_driver);
>  	return 0;
>  }
>  
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index f81fa8862ed0..064fd4f4eade 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -94,15 +94,17 @@ static inline void release_of(struct device *dev,
> void *data)
>  	of_node_put(data);
>  }
>  
> -static inline int mtk_iommu_bind(struct device *dev)
> +static inline int mtk_iommu_bind(struct aggregate_device *adev)
>  {
> +	struct device *dev = adev->parent;
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  
>  	return component_bind_all(dev, &data->larb_imu);
>  }
>  
> -static inline void mtk_iommu_unbind(struct device *dev)
> +static inline void mtk_iommu_unbind(struct aggregate_device *adev)
>  {
> +	struct device *dev = adev->parent;
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  
>  	component_unbind_all(dev, &data->larb_imu);
> diff --git a/drivers/iommu/mtk_iommu_v1.c
> b/drivers/iommu/mtk_iommu_v1.c
> index be22fcf988ce..5fb29058a165 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -534,9 +534,13 @@ static const struct of_device_id
> mtk_iommu_of_ids[] = {
>  	{}
>  };
>  
> -static const struct component_master_ops mtk_iommu_com_ops = {
> -	.bind		= mtk_iommu_bind,
> -	.unbind		= mtk_iommu_unbind,
> +static struct aggregate_driver mtk_iommu_aggregate_driver = {
> +	.probe		= mtk_iommu_bind,
> +	.remove		= mtk_iommu_unbind,
> +	.driver		= {
> +		.name	= "mtk_iommu_agg",
> +		.owner	= THIS_MODULE,
> +	},
>  };
>  
>  static int mtk_iommu_probe(struct platform_device *pdev)
> @@ -624,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device
> *pdev)
>  			goto out_dev_unreg;
>  	}
>  
> -	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops,
> match);
> +	ret = component_aggregate_register(dev,
> &mtk_iommu_aggregate_driver, match);
>  	if (ret)
>  		goto out_bus_set_null;
>  	return ret;
> @@ -650,7 +654,7 @@ static int mtk_iommu_remove(struct
> platform_device *pdev)
>  
>  	clk_disable_unprepare(data->bclk);
>  	devm_free_irq(&pdev->dev, data->irq, data);
> -	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
> +	component_aggregate_unregister(&pdev->dev,
> &mtk_iommu_aggregate_driver);
>  	return 0;
>  }
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
