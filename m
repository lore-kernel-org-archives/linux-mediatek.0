Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5145AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ri/6UCm+Hq3lKBMzqzX0rrewvniNJQkthjSycVQkmYw=; b=1gzZ0d3D4v3uHj
	3QWYsDfrVAX7YxOlTnIWRIfq8dvdcAeLW/a+sIZBwLaUg4rovAUTxi/CkoL4KG5TUTTRaD6PWx6+x
	X3YD1jRtkRywFegrDwjmtuRUNvcGQdiIEsLx6c074dyD96u98Qk+7qB2B0qWccGvGx5vNo8R7skh9
	D88SfbcUoBwdk6ls+F/am8UffB0Hh/zwflgSU25IFwpkMQfOXuOw+yGH1v8unxn5QDLif1rCvQTYj
	kQ8/+jl1RrcWORCoRkfhocMg3yhgSKQirK1K5WdvNQj6BsM9B5/RUuUhEiy3vLFR39pOaewcEP8iY
	q//23IXupVNax1FUAokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfOP-00CIol-3c; Mon, 28 Feb 2022 12:44:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOf1C-00C9I7-R2; Mon, 28 Feb 2022 12:20:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j17so15213245wrc.0;
 Mon, 28 Feb 2022 04:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O2NOZlmqA7RgvZF4C7hoJG5AVQ4LzwSODZXV8jIzeG0=;
 b=ZrWnP68mmzEBBgBVYEcIMymr/Sic0PyF33XFAz9HwOzwsBwZSOuL3daxzw192vv/yw
 u4w9FmdrHcw/PUi+GQ3t4PATV1xvnxjv6Smph9MQWR3lcWgSEnXcgJvVb/fBvB+TZfuj
 du1RNrmOYaQLwN04wqseYfnrJ0nmogX55HvCgjyKWKOdjqa3EzFBEzSj8N6vQi/Q8uTt
 ppPYhdQWebpq/I6OuDQR8QbhVSFigTg5a7FIvUlXnFaVWKGLtkhKF7dqKgJCRy7py8zV
 nDMJPSDcKTrDsx+Q3721fQSebTDT7LJHc8EIVL2qkjzOCzv2F14YcsZVXVhT5MdlZFvF
 5/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O2NOZlmqA7RgvZF4C7hoJG5AVQ4LzwSODZXV8jIzeG0=;
 b=o5aU/TG71c8gB4vHyCCGTDVnbbC+CuFOiFNsV5XGyWIrHuZZug3MdD6Xhcw/j7RDYL
 +VaSK5Bz6+fFgYGFPF905XVNi8DOukk5/1CXPc4MY1mxGAGLc+HUqyjlQZuVIfumLW1S
 GVbr8STSpEts12icLRjLdE+GSkoJwDsd/Vxc/AO+9gDOoK7XpwxLFjh1GyNckIIIpPpw
 ji/sAo6wu4A7len4mXcUIJ4V/NZu/XYk2xqqth+Ij1csMtWhpM70MublftrLoHyfbYni
 69zXKEl+drMlzLWh6xwlnaUP3YU4YqAw/PfyMBFDQBVtW3tIl3dHgtLOI5VhYngqAgyc
 H5fQ==
X-Gm-Message-State: AOAM532B6zd/gL4yKeXpCz2V7jDMKN9pnrzNGRyr/IAm3L/1iLifWsGc
 iUw1g3+/9U1wAX3SH7GutuE=
X-Google-Smtp-Source: ABdhPJwLaVfMPHuk8PUaO5u3HtsyXrViUDwFSuAZmGbc36/B95ADkzmeSzxSbvAicTIRVC/nO9f3Lg==
X-Received: by 2002:a5d:6d83:0:b0:1ef:d78a:41fb with SMTP id
 l3-20020a5d6d83000000b001efd78a41fbmr2817571wrs.355.1646050845207; 
 Mon, 28 Feb 2022 04:20:45 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 a3-20020adfe5c3000000b001e68a5e1c20sm10460233wrn.4.2022.02.28.04.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:20:44 -0800 (PST)
Message-ID: <d4c5b734-1a29-8359-e5fa-b53fc58dd3e5@gmail.com>
Date: Mon, 28 Feb 2022 13:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] iommu/mediatek: Add mt8186 iommu support
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com
References: <20220223072402.17518-1-yong.wu@mediatek.com>
 <20220223072402.17518-3-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220223072402.17518-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_042046_960110_0E85DAE2 
X-CRM114-Status: GOOD (  15.75  )
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



On 23/02/2022 08:24, Yong Wu wrote:
> Add mt8186 iommu supports.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d9ca9ffe404c..174a2f3bd68a 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -160,6 +160,7 @@ enum mtk_iommu_plat {
>   	M4U_MT8167,
>   	M4U_MT8173,
>   	M4U_MT8183,
> +	M4U_MT8186,
>   	M4U_MT8192,
>   	M4U_MT8195,
>   };
> @@ -1438,6 +1439,21 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>   	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
>   };
>   
> +static const struct mtk_iommu_plat_data mt8186_data_mm = {
> +	.m4u_plat       = M4U_MT8186,
> +	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
> +			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE |
> +			  MTK_IOMMU_TYPE_MM,
> +	.larbid_remap   = {{0}, {1, MTK_INVALID_LARBID, 8}, {4}, {7}, {2}, {9, 11, 19, 20},
> +			   {MTK_INVALID_LARBID, 14, 16},
> +			   {MTK_INVALID_LARBID, 13, MTK_INVALID_LARBID, 17}},
> +	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
> +	.banks_num      = 1,
> +	.banks_enable   = {true},
> +	.iova_region    = mt8192_multi_dom,
> +	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
> +};
> +
>   static const struct mtk_iommu_plat_data mt8192_data = {
>   	.m4u_plat       = M4U_MT8192,
>   	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
> @@ -1507,6 +1523,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
>   	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>   	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>   	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
> +	{ .compatible = "mediatek,mt8186-iommu-mm",    .data = &mt8186_data_mm}, /* mm: m4u */
>   	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
>   	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
>   	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
