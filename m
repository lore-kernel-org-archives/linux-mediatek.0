Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070AEECAAD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WFmINn2sl5JngZHJplcZ9zC/zO7ASUoqQqiaavpizc=; b=zjQUiZZQKrft5nmDAFgwfWlOd9
	haYTenv77AbpsWGea3aqrjWl2F2UqGe1hh9cSZXPgqc4k8hJf/WPig0KHIxtvXuHC/gMLwYWAyG8+
	Az2BYZ+u1JD0IFfXDip7bT/IYZkGvyANadXGpk3K5+Fx5ksr5nNg5qu8cganc6KG6Ak/fD0x371U7
	7R4TGrTbcFsMfKYfOnuOS+qO6Y+nudQQ0Ftbta5gSN1jcxfhWi7sYwLBO7cNczLeHndE6/oG8nNWx
	rzLO1pncFII1rsW7eSD4btnYx9408ylBhuO1S1VBr4e1YCHyKQZFYfdE+opkyiAPC0I2rV0Rm/lc2
	br59Em1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwPC-00F74D-LO; Tue, 30 Aug 2022 08:15:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwOc-00F6pe-ER; Tue, 30 Aug 2022 08:14:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB0FA6601E8E;
	Tue, 30 Aug 2022 09:14:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661847292;
	bh=+3rbZqqmv73wMbeInDkzjcrs5wRlRORGTvNqVpAV+0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PKsbGKjnzDW63fZqu8LsimuIi2gEpXHevnR6JOQMKXGeuVL1Ku7moeVX+5gvAJbVx
	 B+fcVa6ZbShM6bl2bW6Q/smdTRXmIQmJDOrAlqn3G6wOyuwFNgJLwvm2jZy2b0RK+U
	 Ooe+T551J4Of6uq3fT9QJ2T9TSMthdDRftUZ4Q0oMX+KKxemkc8i8iCaJX4cJZh0qu
	 PGUPQ7+x8ccE5y8kXsXo9RSB58sq5Eg1JtZ0m/AL5imr+uzomNK2C5ZjyhU+VrN75x
	 6yrAhUqPFJ8yhVC7a2VvIrlwAs+QwDmGQ1CRVjGpDFSRIcVrGW4cpQhRGODGPDEepT
	 TNpOMaTdldV2A==
Message-ID: <f0cc5ea8-9fd8-dc77-e595-33973e315d28@collabora.com>
Date: Tue, 30 Aug 2022 10:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 3/6] iommu/mediatek: Add error path for loop of
 mm_dts_parse
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220824064306.21495-1-yong.wu@mediatek.com>
 <20220824064306.21495-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220824064306.21495-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_011456_220439_D5626679 
X-CRM114-Status: GOOD (  28.70  )
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

Il 24/08/22 08:43, Yong Wu ha scritto:
> The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
> larb is parsed fail, we should put_device for the 0..i larbs.
> 
> There are two places need to comment:
> 1) The larbid may be not linear mapping, we should loop whole
>     the array in the error path.
> 2) I move this line position: "data->larb_imu[id].dev = &plarbdev->dev;"
>     That means set data->larb_imu[id].dev before the error path.
>     then we don't need "platform_device_put(plarbdev)" again while
>     probe_defer case. All depend on "put_device" in the error path in error
>     cases.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 9c5902207bef..f63d4210043d 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1053,8 +1053,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   		u32 id;
>   
>   		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
> -		if (!larbnode)
> -			return -EINVAL;
> +		if (!larbnode) {
> +			ret = -EINVAL;
> +			goto err_larbdev_put;
> +		}
>   
>   		if (!of_device_is_available(larbnode)) {
>   			of_node_put(larbnode);
> @@ -1067,14 +1069,16 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   
>   		plarbdev = of_find_device_by_node(larbnode);
>   		of_node_put(larbnode);
> -		if (!plarbdev)
> -			return -ENODEV;
> +		if (!plarbdev) {
> +			ret = -ENODEV;
> +			goto err_larbdev_put;
> +		}
> +		data->larb_imu[id].dev = &plarbdev->dev;
>   
>   		if (!plarbdev->dev.driver) {
> -			platform_device_put(plarbdev);
> -			return -EPROBE_DEFER;
> +			ret = -EPROBE_DEFER;
> +			goto err_larbdev_put;
>   		}
> -		data->larb_imu[id].dev = &plarbdev->dev;
>   
>   		component_match_add(dev, match, component_compare_dev, &plarbdev->dev);
>   		platform_device_put(plarbdev);
> @@ -1082,8 +1086,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   
>   	/* Get smi-(sub)-common dev from the last larb. */
>   	smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
> -	if (!smi_subcomm_node)
> -		return -EINVAL;
> +	if (!smi_subcomm_node) {
> +		ret = -EINVAL;
> +		goto err_larbdev_put;
> +	}
>   
>   	/*
>   	 * It may have two level smi-common. the node is smi-sub-common if it
> @@ -1097,8 +1103,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   
>   	pcommdev = of_find_device_by_node(smicomm_node);
>   	of_node_put(smicomm_node);
> -	if (!pcommdev)
> -		return -EINVAL;
> +	if (!pcommdev) {
> +		ret = -EINVAL;
> +		goto err_larbdev_put;
> +	}
>   	data->smicomm_dev = &pcommdev->dev;
>   
>   	link = device_link_add(data->smicomm_dev, dev,
> @@ -1106,9 +1114,19 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   	platform_device_put(pcommdev);
>   	if (!link) {
>   		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_larbdev_put;
>   	}
>   	return 0;
> +
> +err_larbdev_put:
> +	/* id may be not linear mapping, loop whole the array */
> +	for (i = 0; i < MTK_LARB_NR_MAX; i++) {

Since there may be a case in which the mapping is linear and we're doing teardown,
I think it would be sensible to loop the other way around instead, from
MTK_LARB_NR_MAX to 0.

Everything else looks good to me.

Cheers,
Angelo

> +		if (!data->larb_imu[i].dev)
> +			continue;
> +		put_device(data->larb_imu[i].dev);
> +	}
> +	return ret;
>   }
>   
>   static int mtk_iommu_probe(struct platform_device *pdev)


