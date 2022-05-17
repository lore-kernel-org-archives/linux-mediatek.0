Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2b/d3jmNb7KfTip96eSKEi8fSKHGbagtdvD1WFCeH0=; b=q6s/6zEJ3UMhdR
	l6qerI7MfEzqmdH6pZK50Xb6xX2r/+Dbjv/d+/KIG1BF6m+Fg/E33Y0fLwCc5OgpR38UEZ7TTcaWy
	oN2nFfkoPcL0kpuBTbWKpALwIT6z3/Cbmwi2b1ZTQpWq7SqA7M1s9RN1ZhwjmwBRciav7pxkSZXWE
	qCNDtsFV/HMudFZ4L/tWDrQkzpop2TwnANZ/JOy4ZdlROetLqi/Gb+R1KblvsEuB++R+CfpApmATF
	fZepg1BKGYSO0O6VzubM3ezcFJl3EgXjZwrQeaEDEaKgFlZ86mCgsgqOMN1kzSHBeLrg3n/yYREWT
	Mx4F1J2DZEdvAEFCBRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxwd-00EFVM-Vk; Tue, 17 May 2022 14:13:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxw0-00EFBg-5P; Tue, 17 May 2022 14:12:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B2B1042;
 Tue, 17 May 2022 07:12:22 -0700 (PDT)
Received: from [10.57.82.55] (unknown [10.57.82.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C113F718;
 Tue, 17 May 2022 07:12:20 -0700 (PDT)
Message-ID: <16fb07d9-28d8-5c73-1eb5-ec13544d22e5@arm.com>
Date: Tue, 17 May 2022 15:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/8] iommu: mtk_iommu: Lookup phandle to retrieve syscon
 to infracfg
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-3-angelogioacchino.delregno@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220517132107.195932-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_071224_369106_EC4ED586 
X-CRM114-Status: GOOD (  29.31  )
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

On 2022-05-17 14:21, AngeloGioacchino Del Regno wrote:
> This driver will get support for more SoCs and the list of infracfg
> compatibles is expected to grow: in order to prevent getting this
> situation out of control and see a long list of compatible strings,
> add support to retrieve a handle to infracfg's regmap through a
> new "mediatek,infracfg" phandle.
> 
> In order to keep retrocompatibility with older devicetrees, the old
> way is kept in place, but also a dev_warn() was added to advertise
> this change in hope that the user will see it and eventually update
> the devicetree if this is possible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/iommu/mtk_iommu.c | 40 +++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 71b2ace74cd6..cfaaa98d2b50 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1134,22 +1134,34 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
>   
>   	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
> -		switch (data->plat_data->m4u_plat) {
> -		case M4U_MT2712:
> -			p = "mediatek,mt2712-infracfg";
> -			break;
> -		case M4U_MT8173:
> -			p = "mediatek,mt8173-infracfg";
> -			break;
> -		default:
> -			p = NULL;
> +		infracfg = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,infracfg");
> +		if (IS_ERR(infracfg)) {
> +			dev_warn(dev, "Cannot find phandle to mediatek,infracfg:"
> +				      " Please update your devicetree.\n");

Is this really a dev_warn-level problem? There's no functional impact, 
given that we can't stop supporting the original binding any time soon, 
if ever, so I suspect this is more likely to just annoy users and CI 
systems than effect any significant change.

> +			/*
> +			 * Legacy devicetrees will not specify a phandle to
> +			 * mediatek,infracfg: in that case, we use the older
> +			 * way to retrieve a syscon to infra.
> +			 *
> +			 * This is for retrocompatibility purposes only, hence
> +			 * no more compatibles shall be added to this.
> +			 */
> +			switch (data->plat_data->m4u_plat) {
> +			case M4U_MT2712:
> +				p = "mediatek,mt2712-infracfg";
> +				break;
> +			case M4U_MT8173:
> +				p = "mediatek,mt8173-infracfg";
> +				break;
> +			default:
> +				p = NULL;
> +			}
> +
> +			infracfg = syscon_regmap_lookup_by_compatible(p);

Would it not make sense to punt this over to the same mechanism as for 
pericfg, such that it simplifies down to something like:

	if (IS_ERR(infracfg) && plat_data->infracfg) {
		infracfg = syscon_regmap_lookup_by_compatible(plat_data->infracfg);
		...
	}

?

TBH if we're still going to have a load of per-SoC data in the driver 
anyway then I don't see that we really gain much by delegating one 
aspect of it to DT, but meh. I would note that with the phandle 
approach, you still need some *other* flag in the driver to know whether 
a phandle is expected to be present or not, whereas a NULL vs. non-NULL 
string is at least neatly self-describing.

Robin.

> +			if (IS_ERR(infracfg))
> +				return PTR_ERR(infracfg);
>   		}
>   
> -		infracfg = syscon_regmap_lookup_by_compatible(p);
> -
> -		if (IS_ERR(infracfg))
> -			return PTR_ERR(infracfg);
> -
>   		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
>   		if (ret)
>   			return ret;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
