Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VttAJUBsfunNtzC9yIU1Knq29Z5imfRl6IHsjQyr+Y=; b=1kvWsHmjwr4YuS
	muQsjKyhn2K1Bz9DfNuzT7eDwuapr67bNb+qTtlgLbkOJde296/Gjif8/Vz7fwfrnmo4B3FcLpIys
	jmWQiRjtz2to2DKhTkgxaB0zwZzmfK/3WxVsQKSqY/EKwN2lkvXAok73AL1jOceXD7YNuknbOrMdK
	fG3lgOY5kSnoW8dfLhfSxgJHDEvXRZFL3E9HrJltUTfiSKITRgSMzwO/KBgl9hkGT3A7FhDTZ083b
	bE7wKKNSDEVRH8xDpy8gXCK3MMyuzs2KKwtskT83Rp0GhEFU0mjWYEAD5/0UJsoLrj7sVXiLCaCK6
	+NLY05AGp9oPSjQ6WpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu8uv-00E5eM-6F; Thu, 26 May 2022 08:32:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu8us-00E5d5-BV; Thu, 26 May 2022 08:32:23 +0000
X-UUID: 8e654a5d05f54050acf0bfe279cc1b2b-20220526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8vYeNh5r8SKGzuTp3UG+WRRQu+YbnFwMNN4O3NDV+CI=;
	b=FkblzsxIOL3wr/vu69Bw2sfUula79hdfvTJEmj63a9fx5byOvlNwTiTzGizfnJT+3VjfhAAj9lKBag/iPr/HjQrtb7ojF/ErygN1McqiHi1IJKA6fJ8ZQJWAJDQVxYGkHaXps9eMpWOOv6G7lOzOXBET630tmjzx+SG0mjfROoo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ceea8839-e62d-430a-b0a4-252f71d9be4b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:1d0154b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 8e654a5d05f54050acf0bfe279cc1b2b-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2050053340; Thu, 26 May 2022 01:32:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 01:22:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 16:22:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 26 May 2022 16:22:29 +0800
Message-ID: <e3202c3ea259329faf9401b7545c7f83191d6fb7.camel@mediatek.com>
Subject: Re: [PATCH v2 3/7] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzysztof.kozlowski@linaro.org>
Date: Thu, 26 May 2022 16:22:28 +0800
In-Reply-To: <20220518100503.37279-4-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
	 <20220518100503.37279-4-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_013222_444351_8298A311 
X-CRM114-Status: GOOD (  28.57  )
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

On Wed, 2022-05-18 at 12:04 +0200, AngeloGioacchino Del Regno wrote:
> On some SoCs (of which only MT8195 is supported at the time of
> writing),
> the "R" and "W" (I/O) enable bits for the IOMMUs are in the
> pericfg_ao
> register space and not in the IOMMU space: as it happened already
> with
> infracfg, it is expected that this list will grow.
> 
> Instead of specifying pericfg compatibles on a per-SoC basis,
> following
> what was done with infracfg, let's lookup the syscon by phandle
> instead.
> Also following the previous infracfg change, add a warning for
> outdated
> devicetrees, in hope that the user will take action.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/mtk_iommu.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d16b95e71ded..090cf6e15f85 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -138,6 +138,8 @@
>  /* PM and clock always on. e.g. infra iommu */
>  #define PM_CLK_AO			BIT(15)
>  #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
> +/* IOMMU I/O (r/w) is enabled using PERICFG_IOMMU_1 register */
> +#define HAS_PERI_IOMMU1_REG		BIT(17)
>  
>  #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>  				((((pdata)->flags) & (mask)) == (_x))
> @@ -187,7 +189,6 @@ struct mtk_iommu_plat_data {
>  	u32			flags;
>  	u32			inv_sel_reg;
>  
> -	char			*pericfg_comp_str;
>  	struct list_head	*hw_list;
>  	unsigned int		iova_region_nr;
>  	const struct mtk_iommu_iova_region	*iova_region;
> @@ -1214,14 +1215,19 @@ static int mtk_iommu_probe(struct
> platform_device *pdev)
>  			goto out_runtime_disable;
>  		}
>  	} else if (MTK_IOMMU_IS_TYPE(data->plat_data,
> MTK_IOMMU_TYPE_INFRA) &&
> -		   data->plat_data->pericfg_comp_str) {
> -		infracfg = syscon_regmap_lookup_by_compatible(data-
> >plat_data->pericfg_comp_str);
> -		if (IS_ERR(infracfg)) {
> -			ret = PTR_ERR(infracfg);
> -			goto out_runtime_disable;
> -		}
> +		   MTK_IOMMU_HAS_FLAG(data->plat_data,
> HAS_PERI_IOMMU1_REG)) {
> +		data->pericfg = syscon_regmap_lookup_by_phandle(dev-
> >of_node, "mediatek,pericfg");

I'm not keen to add this property. Currently only mt8195 use this
setting. In the lastest SoC, we move this setting to ATF. thus I think
we could keep the current way, no need add a new DT property only for
mt8195.

> +		if (IS_ERR(data->pericfg)) {
> +			dev_info(dev, "Cannot find phandle to
> mediatek,pericfg:"
> +				      " Please update your
> devicetree.\n");
>  
> -		data->pericfg = infracfg;
> +			p = "mediatek,mt8195-pericfg_ao";
> +			data->pericfg =
> syscon_regmap_lookup_by_compatible(p);
> +			if (IS_ERR(data->pericfg)) {
> +				ret = PTR_ERR(data->pericfg);
> +				goto out_runtime_disable;
> +			}
> +		}
>  	}
>  
>  	platform_set_drvdata(pdev, data);
> @@ -1480,8 +1486,8 @@ static const struct mtk_iommu_plat_data
> mt8192_data = {
>  static const struct mtk_iommu_plat_data mt8195_data_infra = {
>  	.m4u_plat	  = M4U_MT8195,
>  	.flags            = WR_THROT_EN | DCM_DISABLE | STD_AXI_MODE |
> PM_CLK_AO |
> -			    MTK_IOMMU_TYPE_INFRA |
> IFA_IOMMU_PCIE_SUPPORT,
> -	.pericfg_comp_str = "mediatek,mt8195-pericfg_ao",
> +			    HAS_PERI_IOMMU1_REG | MTK_IOMMU_TYPE_INFRA
> |
> +			    IFA_IOMMU_PCIE_SUPPORT,
>  	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
>  	.banks_num	  = 5,
>  	.banks_enable     = {true, false, false, false, true},
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
