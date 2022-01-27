Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37073C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Tj0qjrtMLjXqNHc8Jd4jdYO7rgkXGW/s1X7X0/AbKE=; b=Jmt+j+r29mw+x1GjSqoX3JSX7m
	zFSYNCCrhz5tjSQsX9oGIgSncqPUumMDml8YIY/AXONJM7AYaDb4fB/TtfpLlj5zWknVtI8MhqSQv
	lJzSJqj6lxan80UKElrqtK/MdxgWssfwCrr5dvhMMamLTybYPq5LAIQiA+TRUdMa2sFz+eWxJvg4Z
	kuNOAZ8TzTEfkboZILf1K4DYXvjlgEqfKeIo+xT96CuKn9zvhZNgEleSYC//NUINKQ5ZGyUrVE/ux
	4UEdKnLW5PnEfxUi2w1/ndW64haBBTu2HktyNMORD74sL6A5Hq9D+hllqoxDjm+PBx+8g666C0PXv
	UemZOhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2Xw-00FHsb-0d; Thu, 27 Jan 2022 11:02:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2Xd-00FHlO-Nu; Thu, 27 Jan 2022 11:02:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 484FA1F45063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643281332;
 bh=y7Q22FYn8FoxG+Q7a9gHib0Iq0zzREi7aiuVl2foqxg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LBoJzGDUMVKX/gSf3SIgVY/ZJKUJvgV0EfVS5PiKs6FAyMFU88KJCNZHbtzmGFgVW
 gicw+2P8E7/gwjAFTRxW9k8eECDChSpaPtbtyLsQFK+vNVAjBEJD40pf8lpgklenY2
 WqVtlopRIn4O42kbfyCUMs9fC4qtEniYdaupWno8nKxKK+/RqaBWpcgmwXpEuZ1W0K
 tcqxnUZVd5tHcpGhdL1BXymy7MvRGt3ff77giKXyibWzeDi+GxCbtPOrfDrjSFIiVt
 gcoKhn/NlXMKLMEuy2tRvJw8IHcce6jMZUuB+NR/9kRI5CHgUKQuRtK/UmmTclCVuG
 BOeN7Nwg0V+QQ==
Subject: Re: [PATCH v4 06/35] iommu/mediatek: Add mutex for m4u_group and
 m4u_dom in data
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-7-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <62d2a231-3d05-5008-fae2-335c4ad853bd@collabora.com>
Date: Thu, 27 Jan 2022 12:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-7-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030214_013167_50F812B5 
X-CRM114-Status: GOOD (  25.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/01/22 09:56, Yong Wu ha scritto:
> Add a mutex to protect the data in the structure mtk_iommu_data,
> like ->"m4u_group" ->"m4u_dom". For the internal data, we should
> protect it in ourselves driver. Add a mutex for this.
> This could be a fix for the multi-groups support.
> 
> Fixes: c3045f39244e ("iommu/mediatek: Support for multi domains")
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 13 +++++++++++--
>   drivers/iommu/mtk_iommu.h |  2 ++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index ec2c387abf60..095736bfb7b4 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -464,15 +464,16 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>   		dom->data = data;
>   	}
>   
> +	mutex_lock(&data->mutex);
>   	if (!data->m4u_dom) { /* Initialize the M4U HW */
>   		ret = pm_runtime_resume_and_get(m4udev);
>   		if (ret < 0)
> -			return ret;
> +			goto data_unlock;

In order to enhance human readability, I would rather propose:

			goto err_unlock;

Apart from this,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   
>   		ret = mtk_iommu_hw_init(data);
>   		if (ret) {
>   			pm_runtime_put(m4udev);
> -			return ret;
> +			goto data_unlock;
>   		}
>   		data->m4u_dom = dom;
>   		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> @@ -480,9 +481,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>   
>   		pm_runtime_put(m4udev);
>   	}
> +	mutex_unlock(&data->mutex);
>   
>   	mtk_iommu_config(data, dev, true, domid);
>   	return 0;
> +
> +data_unlock:
> +	mutex_unlock(&data->mutex);
> +	return ret;
>   }
>   
>   static void mtk_iommu_detach_device(struct iommu_domain *domain,
> @@ -592,6 +598,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>   	if (domid < 0)
>   		return ERR_PTR(domid);
>   
> +	mutex_lock(&data->mutex);
>   	group = data->m4u_group[domid];
>   	if (!group) {
>   		group = iommu_group_alloc();
> @@ -600,6 +607,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>   	} else {
>   		iommu_group_ref_get(group);
>   	}
> +	mutex_unlock(&data->mutex);
>   	return group;
>   }
>   
> @@ -874,6 +882,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	}
>   
>   	platform_set_drvdata(pdev, data);
> +	mutex_init(&data->mutex);
>   
>   	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
>   				     "mtk-iommu.%pa", &ioaddr);
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index f81fa8862ed0..f413546ac6e5 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -80,6 +80,8 @@ struct mtk_iommu_data {
>   
>   	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
>   
> +	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
> +
>   	struct list_head		list;
>   	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
>   };
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
