Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBD9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2/RZdpeRaEc7Ax3x+Uo+s68DF8agRXWacactka84i0=; b=lNeGJ9MQGLwszDlm5AcoeCH2Dh
	TAVVLrDMz8i/UH9xoJ2tKo7sgS9m/906ny2hQSZ4jqb47SInc2EirAJeVg+JsWA+sU82K1dt7W5Gi
	dzXMbzKFrf7Dd9XZy+VcDHuLcVyo/YXYYBcCpi+lRsnsSryE5tjLdMeRZf8kEXzuylPXVN/jEkzzn
	6Irr1inCqvHnyz+QtqEKwiC0dCVHvmdLXaSsurnhOZqqHZcdwUwFx7/st3z7rcWldNdTmPsiNsJzj
	+OE2n0X0Z8ZMfwnbTsWUeLjxo9O0RHPXP9NJcyKhAgYN0vOXiseX/w8c4KyoSkVd4Tqc++AcRJC0R
	PFF4Nk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2xJ-00FRp6-GM; Thu, 27 Jan 2022 11:28:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2wl-00FRbM-4p; Thu, 27 Jan 2022 11:28:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 934561F44D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643282889;
 bh=tRSGAn+K5lE0jIyL6d10FGdtoQ5plQ6Gd8gK6e70TDc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QMQ2KMFmQ8Muyj4PD+nsEkDusL+3Le1HAf+PyV0B5LaEpDOS9yuBN3tX3/48jgh51
 1vVHJTkxsWlTJZhgAudQo4NlkD0l03EmQTjY7XoljShFAx7/ZtKCEjqFsaPwIN8Y43
 uiiHLXbvldGhLSNdoKCATEHwKiQjiTc6mX2qIG/srxslY9lfO4p92sRAUbPik7+OKt
 +LykDgTGRNu4x3XaexjayQpkIA8EKtXIvKhfqYpC0TWe7RbYSBLPBhLQiGyJIORepk
 L0F0/Bq+k+o5W5QZRWnvkGqZNHd4wBG6B6bAQm8kmR3j5O9brpuBlNzKDY/T/XkWb0
 ozfpATJ5aBJtg==
Subject: Re: [PATCH 2/2] iommu/mediatek: Add mt8186 iommu support
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
References: <20220125093244.18230-1-yong.wu@mediatek.com>
 <20220125093244.18230-3-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b52a1df8-58f4-baa2-cfb6-9c56244caa0f@collabora.com>
Date: Thu, 27 Jan 2022 12:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125093244.18230-3-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_032811_417067_1E891E1B 
X-CRM114-Status: GOOD (  16.67  )
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

Il 25/01/22 10:32, Yong Wu ha scritto:
> Add mt8186 iommu supports.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index be36e73e4bcc..a3124f48f9e1 100644
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
> @@ -1401,6 +1402,21 @@ static const struct mtk_iommu_plat_data mt8183_data = {
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
> @@ -1470,6 +1486,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
>   	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>   	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>   	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
> +	{ .compatible = "mediatek,mt8186-iommu-mm", .data = &mt8186_data_mm},

Hello!

Is there any particular reason why this compatible is not "mediatek,mt8186-m4u"?

Thanks,
Angelo

>   	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
>   	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
>   	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
