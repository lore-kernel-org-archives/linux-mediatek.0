Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn8xlwse46QbmMa1vJdBpHD+8XprL+Rh4qtneyviCJo=; b=uvNIvS3NfnGVV2D+PEJzTYdnJ7
	NUtiZw/n0qxjeY4flk97CM+SSDYCa0VaBmzgWReFH0W8EQBh4PPufRaOV1G309XgaPdnuMgGwP4E0
	bYqD7B53YhdBBLGatidPEzE2l/pfr74lTrHC4yGc7pGAeRwFH4XKDnE8LqLTuuo+RGesJXPFMhJyt
	8atClrO7ZclO3BD92eU5U0ooFvG1sx7QG6WaiPxX8HrkrtzgP15pEN4j5Kj7oklUwyaJoI7Z03i1h
	2VDl5Wm5DDSDAxk+Jh3MTS4plqNwYAqp4rTOjdEtdS2iGEAK3l00THos/EefOzKkka/DVyXvmHk6j
	RRPaK5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mJb-00C9vl-Tu; Tue, 04 Jan 2022 16:05:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9W-00C4iB-Ve; Tue, 04 Jan 2022 15:55:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0AD2E1F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311709;
 bh=3smna2rui85hd0ub3WLoyVobn8DHHP5eQqp8Q9TuRHo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fqocVfDSEzNSK52a1s2yP91kT0QXrE28aLrYgLgVVnizYZzYBoHRC2lC+TVQDCOIe
 Kz/qm0Giepgg9FQ/4K4GvgpSGVaLLfvKI5HIzdcKxPm3F55DCVGI9LMwRTNfZd8UK+
 NvEMzUrqVmUOQq/DAbZWexY6h8ORgfusoKnRryDXpwAbyPmx9eRnZrTFORJNXtWkWY
 K+XxN6vU06x1aNKWnUfWN89rFgo1OHflAJW+9/wEVjJMzmYCvMepROSGRUKb2PpMkF
 QJfGCz3JyVqNMEiGDtSb+/rFXoMK2sD+jhT5m+lrC3iHDjA7319nckiAz8zh7T0wKR
 TM5MCOR2+FQBw==
Subject: Re: [PATCH v3 13/33] iommu/mediatek: Remove the power status checking
 in tlb flush all
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-14-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1cb7458d-a012-2e84-82bd-7e4f30ed9162@collabora.com>
Date: Tue, 4 Jan 2022 16:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-14-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075511_227941_74393DE4 
X-CRM114-Status: GOOD (  27.81  )
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> To simplify the code, Remove the power status checking in the
> tlb_flush_all, remove this:
>     if (pm_runtime_get_if_in_use(data->dev) <= 0)
> 	    continue;
> 
> After this patch, the mtk_iommu_tlb_flush_all will be called from
> a) isr
> b) pm runtime resume callback
> c) tlb flush range fail case
> d) iommu_create_device_direct_mappings
>     -> iommu_flush_iotlb_all
> In first three cases, the power and clock always are enabled; d) is direct
> mapping, the tlb flush is unnecessay since we already have tlb_flush_all
> in the pm_runtime_resume callback. When the iommu's power status is
> changed to active, the tlb always is clean.
> 
> In addition, there still are 2 reasons that don't add PM status checking
> in the tlb flush all:
> a) Write tlb flush all register also is ok even though the HW has no
> power and clocks. Write ignore.

Do you mean that the register write seemingly succeeds but the hardware
discards it?
Please, reword the `a` sentence to be clearer.

> b) pm_runtime_get_if_in_use(m4udev) is 0 when the tlb_flush_all
> is called frm pm_runtime_resume cb. From this point, we can not add
> this code above in this tlb_flush_all.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e9e94944ed91..4a33b6c6b1db 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -204,10 +204,14 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
>   	return container_of(dom, struct mtk_iommu_domain, domain);
>   }
>   
> -static void mtk_iommu_tlb_do_flush_all(struct mtk_iommu_data *data)
> +static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
>   {
>   	unsigned long flags;
>   
> +	/*
> +	 * No need get power status since the HW PM status nearly is active
> +	 * when entering here.

Please reword this comment to explain the entire situation.

> +	 */
>   	spin_lock_irqsave(&data->tlb_lock, flags);
>   	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>   		       data->base + data->plat_data->inv_sel_reg);
> @@ -216,16 +220,6 @@ static void mtk_iommu_tlb_do_flush_all(struct mtk_iommu_data *data)
>   	spin_unlock_irqrestore(&data->tlb_lock, flags);
>   }
>   
> -static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
> -{
> -	if (pm_runtime_get_if_in_use(data->dev) <= 0)
> -		return;
> -
> -	mtk_iommu_tlb_do_flush_all(data);
> -
> -	pm_runtime_put(data->dev);
> -}
> -
>   static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   					   struct mtk_iommu_data *data)
>   {
> @@ -263,7 +257,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   		if (ret) {
>   			dev_warn(data->dev,
>   				 "Partial TLB flush timed out, falling back to full flush\n");
> -			mtk_iommu_tlb_do_flush_all(data);
> +			mtk_iommu_tlb_flush_all(data);
>   		}
>   
>   		if (has_pm)
> @@ -993,7 +987,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
>   	 *
>   	 * Thus, Make sure the tlb always is clean after each PM resume.
>   	 */
> -	mtk_iommu_tlb_do_flush_all(data);
> +	mtk_iommu_tlb_flush_all(data);
>   
>   	/*
>   	 * Uppon first resume, only enable the clk and return, since the values of the
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
