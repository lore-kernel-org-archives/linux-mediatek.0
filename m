Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOiUPiPt9MU2pd0A18nMoBJG+UK1jXiLWgpsiEG53dM=; b=e3VRrXx6f7gnYm
	rFGez7BzyY2Unur9DWLbrZJFosrx3mvhvDkfJ8+CoL2sVApJfPyd3n1JZVaYh1G8b6hHqYgDpDHjs
	la9GoJ4sDr6rYbEBuFzT+Hn/J5wNIw6sZ8cOB3PHH92EKAn4/uMFXkwL3HEnXzg/Rt404rNZVz4Xc
	OX0y2N07Q08LgL6QlxZ7GsgimK/hiQMtL8zfwBHZ6reDoSxCC0jaCTcUCzWmFu40cwjvSNgnM0mLj
	Sqv87kHrOzcWyzhmE+hwQ0lu2l0yBftjUexR8Ab35kmotF/KAZ2JmVePGJa22rgmo4JuOJG/a70t3
	c8pGo3vzJRulBuPEn/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGjw-001Jcu-HP; Wed, 18 May 2022 10:17:12 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGjt-001Jc2-N2; Wed, 18 May 2022 10:17:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s28so1875825wrb.7;
 Wed, 18 May 2022 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JDEZhGlxX3q41z2Qv8MwS9G1+Y1QFJKsUDzF/L6uQHk=;
 b=DqcZNdspyaqBHAVNilMYjZm+kFa4AMru817n+8jVHzW0BElL+LDpTda3Ji5Il/FCJM
 fQqtZPPjgg0bMjYCtLO/3GJPHY4BTrSKAU9RoaC9ooJhO4j7tXIhRZdCjv80NDNCpbB0
 cdPTa3dTI5LBOcj9Niid+ZBPaDJ/I2UuyCrgB9IpqklOOdEW7z5J4WSVOdS+l3aQL8ts
 Aur2p3ho/eYy0hogD3YUmsvTJMPJJVIfV5v/BiYxCVi2nfRriicrZ0u3xtMB4/+9ZeLh
 MDSzCEQ9M1kqpJf53btb2mwnoLmY5UMjyS6abKAV33bjU13/gjjRWR+Tdt63KjaR6ro1
 QPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JDEZhGlxX3q41z2Qv8MwS9G1+Y1QFJKsUDzF/L6uQHk=;
 b=joq3AFIXX+NBqUX8n+xjd7m5hqJQOaqZ//8/xg5QUA0PkBILIPB7Q+7yKReButM6Qq
 BurQUoj3k3VZRcGfhIb/BpJ/Iyoy6wFeasuVxirHlKZ8FVxTerkQKr+E3Mu4sL8fTydp
 vUb2lDeq41gCQKrVdrVTdVJbXOTqYOknRf3riGPTFrJI2VGy9snWIJq/XO+DAK11heKg
 qK5aSk5cQ46RwDzlO962Gwu1nEe/WIY6f3pquLd3p8P+9e4eXn3VslgGoNn++tPIZVhw
 A/uBTgvQ9BIeS+G/LMtVDQJm4J2148TJ3eXAPtT/Qqum55zuztrN5JdrCnzlR26gOuYL
 dz4A==
X-Gm-Message-State: AOAM532epXa4vJCYYThyCrUu8VOGfEBo1cF1jOH7DIuE6OTfa1hZJxCi
 8bAsJfqmKqWlDRWS7uX8Dco=
X-Google-Smtp-Source: ABdhPJz50zZNy75WZIl5SLAdw28vWdjTJPUizP3Z3rcoOxsGrTac4hDC7TuNeWeo0hTCukYSkqg5zA==
X-Received: by 2002:adf:a3c2:0:b0:20c:fecc:8885 with SMTP id
 m2-20020adfa3c2000000b0020cfecc8885mr16733860wrb.463.1652869026824; 
 Wed, 18 May 2022 03:17:06 -0700 (PDT)
Received: from [192.168.0.36] ([5.225.216.194])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c479300b003942a244edbsm1525822wmo.32.2022.05.18.03.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 03:17:06 -0700 (PDT)
Message-ID: <33ef032c-8233-6f01-a064-e0564df0258d@gmail.com>
Date: Wed, 18 May 2022 12:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/8] iommu: mtk_iommu: Lookup phandle to retrieve syscon
 to pericfg
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-5-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220517132107.195932-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_031709_820234_5149F6DB 
X-CRM114-Status: GOOD (  25.32  )
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



On 17/05/2022 15:21, AngeloGioacchino Del Regno wrote:
> On some SoCs (of which only MT8195 is supported at the time of writing),
> the "R" and "W" (I/O) enable bits for the IOMMUs are in the pericfg_ao
> register space and not in the IOMMU space: as it happened already with
> infracfg, it is expected that this list will grow.
> 
> Instead of specifying pericfg compatibles on a per-SoC basis, following
> what was done with infracfg, let's lookup the syscon by phandle instead.
> Also following the previous infracfg change, add a warning for outdated
> devicetrees, in hope that the user will take action.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index cfaaa98d2b50..c7e2d836199e 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -138,6 +138,8 @@
>   /* PM and clock always on. e.g. infra iommu */
>   #define PM_CLK_AO			BIT(15)
>   #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
> +/* IOMMU I/O (r/w) is enabled using PERICFG_IOMMU_1 register */
> +#define HAS_PERI_IOMMU1_REG		BIT(17)
>   
>   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>   				((((pdata)->flags) & (mask)) == (_x))
> @@ -187,7 +189,6 @@ struct mtk_iommu_plat_data {
>   	u32			flags;
>   	u32			inv_sel_reg;
>   
> -	char			*pericfg_comp_str;
>   	struct list_head	*hw_list;
>   	unsigned int		iova_region_nr;
>   	const struct mtk_iommu_iova_region	*iova_region;
> @@ -1214,14 +1215,19 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   			goto out_runtime_disable;
>   		}
>   	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
> -		   data->plat_data->pericfg_comp_str) {
> -		infracfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
> -		if (IS_ERR(infracfg)) {
> -			ret = PTR_ERR(infracfg);
> -			goto out_runtime_disable;
> -		}
> +		   MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_PERI_IOMMU1_REG)) {
> +		data->pericfg = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,pericfg");
> +		if (IS_ERR(data->pericfg)) {
> +			dev_warn(dev, "Cannot find phandle to mediatek,pericfg:"
> +				      " Please update your devicetree.\n");
>   
> -		data->pericfg = infracfg;
> +			p = "mediatek,mt8195-pericfg_ao";
> +			data->pericfg = syscon_regmap_lookup_by_compatible(p);
> +			if (IS_ERR(data->pericfg)) {
> +				ret = PTR_ERR(data->pericfg);
> +				goto out_runtime_disable;
> +			}
> +		}
>   	}
>   
>   	platform_set_drvdata(pdev, data);
> @@ -1480,8 +1486,8 @@ static const struct mtk_iommu_plat_data mt8192_data = {
>   static const struct mtk_iommu_plat_data mt8195_data_infra = {
>   	.m4u_plat	  = M4U_MT8195,
>   	.flags            = WR_THROT_EN | DCM_DISABLE | STD_AXI_MODE | PM_CLK_AO |
> -			    MTK_IOMMU_TYPE_INFRA | IFA_IOMMU_PCIE_SUPPORT,
> -	.pericfg_comp_str = "mediatek,mt8195-pericfg_ao",
> +			    HAS_PERI_IOMMU1_REG | MTK_IOMMU_TYPE_INFRA |
> +			    IFA_IOMMU_PCIE_SUPPORT,
>   	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
>   	.banks_num	  = 5,
>   	.banks_enable     = {true, false, false, false, true},

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
