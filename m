Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B2C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kRM6UuNP3BG3QrSs8Cvz8s01x6eFkHI5qzaPchw3Hs=; b=Wt0DgxdtU/dXTh
	bZZ9XZg42dnnfYLRjp7vRbmnEdXLpsctZ6fsH5HIS8GhIfsoj28K71YYLpUOp34xoaNsV16KbXE4J
	O30kBWXjZwiuhVwZ4bPZxXrlJ+g1BqlxWO0N1tMC31Q/3ndiaj6/MYhD7UAtHwyYKLIWdTVJNBLYy
	NYwl9usYUIMYABbDLau07JRJn5ZhTKSPTUpMfxX7HWyMiarYmu82ZQeWn3mpIQ5YI8y9yho9lXpeE
	VQdf96ZEOPeKlcAyWbgZgwNM1QWSBpy/fO0gMtph3OB6XI7uOPV7TUiXQxHZfx1ymLpd4gxziuy2I
	KHA7XJiaXReQIGHo2fYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18G2-00A6ad-Pz; Tue, 14 Jun 2022 15:15:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18Fz-00A6ZT-EB; Tue, 14 Jun 2022 15:15:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id h19so8496898wrc.12;
        Tue, 14 Jun 2022 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IXuDe0y1N7g0HQ+gRNGCz3TLBK6SHrrUtGI9qXS70nI=;
        b=pNE5vPgqmLRxJYRUwLn2HygBM6ytJdDox1fo8PavsqAlLYbvUXKHMA7QW/EKefImgn
         vCsmD6HVBAt1GjEMoJvYBgbfgyAcZBE9j+BAjgaRHWxosTq/rTgYCpc81ougivQSnSdo
         MQrnA/hMkYQ0J3u4SGpJxbsKjp0OZpX3yjrZ0xGxhZPOG3Ltop5iqtB9VcRT1Wy3GfK9
         IEQarUkCk6Or41YYY1+vKUsT2qQLqaMG2LJXsL0baMqYWDGHgxxz1wjVelA8DEq+YcTf
         0iNIa9bByS4Ue98OyUC31rOtmb+CHhqr3S9W3EGxGkxx/V85oRMN2Mrdp9DUCwhFAhYe
         MP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IXuDe0y1N7g0HQ+gRNGCz3TLBK6SHrrUtGI9qXS70nI=;
        b=DjskqDmpV403MUsf3UmqE7Uw7P4HxhT9aGTl8mJYoG1mSXojTL0c0ZxG9CMLNFARgk
         4JyFl9fyTDPCNnpHyhxgLvM2bJswVDl1C0XjjhYnw6A3AJEeSmGRhohKu22GlWUoDZaJ
         1GdUtyQGH4Nxta+rc0760ZQHSJCr5L9074Dk6kTVtXURWYt8vgEwiw1pkhcSqzsXu199
         xQb490RMx9zJv0V9TRkuPx3CyG5LcFIVD617wQ819L5N4h9Na4/ncnfSve7RaqnIoDRf
         w5Nt/2g1T9C4DPSmktS16IEHto3OwS5d0L+JpHQXMbLNPVEY+0jJtFwh7UZZ77M1UJ/8
         M2lg==
X-Gm-Message-State: AJIora+BsB3ZQgMbVHVur3nELGPAvD1/3G1quFSZlFT2og8TH238Qjok
	Qwor8NIrs4RvFwKkPmoQal8=
X-Google-Smtp-Source: AGRyM1vbq7YuSWWy21Fn37KJrbY6DIxBAJG8TbMUpC1uDPhvtrmHbIIb6r7vg7XBmdrSGnOv4jXjCw==
X-Received: by 2002:a5d:40c7:0:b0:210:3135:e662 with SMTP id b7-20020a5d40c7000000b002103135e662mr5240739wrq.280.1655219700487;
        Tue, 14 Jun 2022 08:15:00 -0700 (PDT)
Received: from [192.168.0.36] ([37.223.143.134])
        by smtp.gmail.com with ESMTPSA id h206-20020a1c21d7000000b0039746638d6esm13745526wmh.33.2022.06.14.08.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 08:14:59 -0700 (PDT)
Message-ID: <da05a10b-dd4d-6d93-0cd3-e4695d9b767e@gmail.com>
Date: Tue, 14 Jun 2022 17:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to infracfg
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
 <20220609100802.54513-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220609100802.54513-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_081503_549030_9DD23C23 
X-CRM114-Status: GOOD (  22.70  )
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



On 09/06/2022 12:07, AngeloGioacchino Del Regno wrote:
> This driver will get support for more SoCs and the list of infracfg
> compatibles is expected to grow: in order to prevent getting this
> situation out of control and see a long list of compatible strings,
> add support to retrieve a handle to infracfg's regmap through a
> new "mediatek,infracfg" phandle.
> 
> In order to keep retrocompatibility with older devicetrees, the old
> way is kept in place.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 38 ++++++++++++++++++++++++--------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index bb9dd92c9898..90685946fcbe 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1140,22 +1140,32 @@ static int mtk_iommu_probe(struct platform_device *pdev)
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
