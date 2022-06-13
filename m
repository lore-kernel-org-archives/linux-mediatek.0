Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A9C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 05:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8LbVuRvLOg+U7j1p/Mv1ZCUPuwzN6E10g8bmsL2uVo=; b=cyiZG8FLWTT31Y
	2toTj2lmFgCfXmuQNg1g9QFqvHx/2UMh/RBtu1KZP0uPBdmbP+aOrodiP/81Cse5b0lvk9H+qWPmw
	oyflwS9eJVsCEq4SG03t8bARldwJtrfO6RmKme3N0+04KM4/0oBWIbOVxQWty3a1eIy9DcE9UU4wf
	BLqxyEaAmzcnl2B5yGacXeAlBlmP5vOUzhdFCiIt5oXS+PCJXYoe3euSChyxc0yu2yhmcLjJzxEA/
	xTpmb78xQVugEUkoEWnt1E5C5X23zUxRnRsZsdVvXtxpcJCUv9NnSceXGo2ya7AamtKQjS+zxKZgH
	eM/vamuD0/AGMmvW9QvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ch1-001U2r-1z; Mon, 13 Jun 2022 05:32:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cgp-001U0X-Kv; Mon, 13 Jun 2022 05:32:40 +0000
X-UUID: a36b68e919b84b879862e4d8b57f57fd-20220612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=URM+dArzd+UOv73l+L7k9m/fGWbsWJMMPyrkJvrWFuQ=;
	b=t9Z8VPW2bNcgKedixyfoxmcTbtL5swMl5bUu+25TZj408fXj7GntHvgiq3cNYMKn1pGc8h9ANzyC4QMEtNtUuyvoD0PRfuIYtpI0ErxITbcFsb+s32ZO2EmYJDVVr3giuNNmiPdkplSL5AsRoGgi24G7DKkpAbuG+u1LPkkj09U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:72d36e89-8367-4d6f-be9e-0d46bab07541,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:cc5357c6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: a36b68e919b84b879862e4d8b57f57fd-20220612
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1644193642; Sun, 12 Jun 2022 22:32:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 22:32:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 13:32:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 13:32:28 +0800
Message-ID: <aa77b49f5a2bb7fc3e6292225c400c44525536a4.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] iommu: mtk_iommu: Introduce new flag
 TF_PORT_TO_ADDR_MT8173
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <konrad.dybcio@somainline.org>,
	<marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
	<~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
	<paul.bouchara@somainline.org>
Date: Mon, 13 Jun 2022 13:32:28 +0800
In-Reply-To: <20220609104001.97753-3-angelogioacchino.delregno@collabora.com>
References: <20220609104001.97753-1-angelogioacchino.delregno@collabora.com>
	 <20220609104001.97753-3-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_223239_733955_46E22BD6 
X-CRM114-Status: GOOD (  22.14  )
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

On Thu, 2022-06-09 at 12:40 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for MT6795, add a new flag named
> TF_PORT_TO_ADDR_MT8173 and use that instead of checking for m4u_plat
> type in mtk_iommu_hw_init() to avoid seeing a long list of m4u_plat
> checks there in the future.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Retitle to: iommu/mediatek: Xxx, then

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> ---
>  drivers/iommu/mtk_iommu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ea0848581e9..8611cf8e4bd5 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -140,6 +140,7 @@
>  #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
>  /* IOMMU I/O (r/w) is enabled using PERICFG_IOMMU_1 register */
>  #define HAS_PERI_IOMMU1_REG		BIT(17)
> +#define TF_PORT_TO_ADDR_MT8173		BIT(18)
>  
>  #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>  				((((pdata)->flags) & (mask)) == (_x))
> @@ -960,7 +961,7 @@ static int mtk_iommu_hw_init(const struct
> mtk_iommu_data *data, unsigned int ban
>  	 * Global control settings are in bank0. May re-init these
> global registers
>  	 * since no sure if there is bank0 consumers.
>  	 */
> -	if (data->plat_data->m4u_plat == M4U_MT8173) {
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data,
> TF_PORT_TO_ADDR_MT8173)) {
>  		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
>  			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
>  	} else {
> @@ -1437,7 +1438,8 @@ static const struct mtk_iommu_plat_data
> mt8167_data = {
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> -			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
> +			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM |
> +			TF_PORT_TO_ADDR_MT8173,
>  	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
>  	.banks_num    = 1,
>  	.banks_enable = {true},
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
