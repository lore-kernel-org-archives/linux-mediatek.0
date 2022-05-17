Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12569C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSMsewQIReqGxnXVTVvfS4DnaDeihxD+UVJJW0NdY08=; b=lRqH4hlkoJH7Kf
	v/kR6hhcAf01S2Gbsirn/4PBzgmJVzcQ91lBVG9tOwzANlH+8JJ2xogCrMuDI/ya4UGn+qHwmCAb0
	MrIFGTTVY/4sGwd69XNmXSdI94gL3LdAdLHAwby9TGVkRDF+vGKvQ0BEt97LBu8YHhzbf1RfXkR+v
	DHsJ4QAsORzsDWPdWil9S91XJcWJyA963fxwlLIglrTA7Plk54kQmo5oqrhkR8QmQ31gpU7okUP6M
	TuRT6aOdeTcU4Nhy1n3LJYX4AHkpCmcalUQKdVaikyqCX3dSKoMYc+uiQycCOhlpo5BPULdagOjjF
	IOJ3gW1aCLVOcrIJ3/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtCG-00CfS0-8J; Tue, 17 May 2022 09:08:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtC3-00CfP6-2U; Tue, 17 May 2022 09:08:42 +0000
X-UUID: 035f5408033a424eb76d9ccc9a6e22c5-20220517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CeUAFQR2Jl0yW2MfJf/6sAbIZljf4aRYL9GHNo8AiJ8=; 
 b=tF28NBbKSTDkKiYC71D7uZNxr3hP+drhtSS49xXDKKEndnzU3758Ygxf7Ek8HoDBIxit7UgBcD8nk17Fr7piKzNDZiMf8cVf2aLuGem2pBsFjpJt5O9zKW8GTjAxDZVL/mPi5xVAlfEaxIkzx0ddZlhUkIWteoHoor0x+/VhD8Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:ef93aba2-aebd-4db6-bd5f-e9abacd40e60, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:3d2d7ae2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 035f5408033a424eb76d9ccc9a6e22c5-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 431500759; Tue, 17 May 2022 02:08:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 02:08:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 17 May 2022 17:08:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 17 May 2022 17:08:27 +0800
Message-ID: <38e38006662b52631a2145228444b9d70f9eb2c6.camel@mediatek.com>
Subject: Re: [PATCH 2/2] iommu: mtk_iommu: Add support for MT6795 Helio X10
 M4Us
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <konrad.dybcio@somainline.org>,
 <marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <paul.bouchara@somainline.org>, <yf.wang@mediatek.com>,
 <mingyuan.ma@mediatek.com>
Date: Tue, 17 May 2022 17:08:26 +0800
In-Reply-To: <20220513151411.395744-3-angelogioacchino.delregno@collabora.com>
References: <20220513151411.395744-1-angelogioacchino.delregno@collabora.com>
 <20220513151411.395744-3-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_020839_169632_B4CD3278 
X-CRM114-Status: GOOD (  21.44  )
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

On Fri, 2022-05-13 at 17:14 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the M4Us found in the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/mtk_iommu.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 71b2ace74cd6..3d802dd3f377 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -157,6 +157,7 @@
>  enum mtk_iommu_plat {
>  	M4U_MT2712,
>  	M4U_MT6779,
> +	M4U_MT6795,
>  	M4U_MT8167,
>  	M4U_MT8173,
>  	M4U_MT8183,
> @@ -953,7 +954,8 @@ static int mtk_iommu_hw_init(const struct
> mtk_iommu_data *data, unsigned int ban
>  	 * Global control settings are in bank0. May re-init these
> global registers
>  	 * since no sure if there is bank0 consumers.
>  	 */
> -	if (data->plat_data->m4u_plat == M4U_MT8173) {
> +	if (data->plat_data->m4u_plat == M4U_MT6795 ||
> +	    data->plat_data->m4u_plat == M4U_MT8173) {
>  		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
>  			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
>  	} else {
> @@ -1138,6 +1140,9 @@ static int mtk_iommu_probe(struct
> platform_device *pdev)
>  		case M4U_MT2712:
>  			p = "mediatek,mt2712-infracfg";
>  			break;
> +		case M4U_MT6795:
> +			p = "mediatek,mt6795-infracfg";
> +			break;
>  		case M4U_MT8173:
>  			p = "mediatek,mt8173-infracfg";
>  			break;
> @@ -1404,6 +1409,18 @@ static const struct mtk_iommu_plat_data
> mt6779_data = {
>  	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
>  };
>  
> +static const struct mtk_iommu_plat_data mt6795_data = {
> +	.m4u_plat     = M4U_MT6795,
> +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> +			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
> +	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.banks_num    = 1,
> +	.banks_enable = {true},
> +	.iova_region  = single_domain,
> +	.iova_region_nr = ARRAY_SIZE(single_domain),
> +	.larbid_remap = {{0}, {1}, {2}, {3}, {4}}, /* Linear mapping.
> */
> +};

This is nearly same with mt8173_data. mt8173 has one more larb than
mt6795, its larbid_remap is also ok for mt6795.

thus it looks we could use mt8173 as the backward compatible.
    compatible = "mediatek,mt6795-m4u",
                 "mediatek,mt8173-m4u";

After this, the only thing is about "mediatek,mt6795-infracfg". we have
to try again with mediatek,mt6795-infracfg after mediatek,mt8173-
infracfg fail. I think we should allow the backward case in 4GB mode
judgment if we have.

What's your opinion? or some other suggestion?
Thanks.

> +
>  static const struct mtk_iommu_plat_data mt8167_data = {
>  	.m4u_plat     = M4U_MT8167,
>  	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR |
> MTK_IOMMU_TYPE_MM,
> @@ -1515,6 +1532,7 @@ static const struct mtk_iommu_plat_data
> mt8195_data_vpp = {
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
>  	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
> +	{ .compatible = "mediatek,mt6795-m4u", .data = &mt6795_data},
>  	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
