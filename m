Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cj2tbfyfqQArR6gWwbM9AMsKeu318IY/5Bp3rAARvwQ=; b=U2v6nm5CFqtwde
	pa+lyXiaArun/3PjIX7UIrkdXfhKSkcEOaE4IfVHjGsOY/jv26sAjnAFdk59ZMSDL8C+PdoUTEu3a
	kU1ZSmfhEnQ+AMUyjGxGORtPpVcn/bAcYrustIEUOXIZabsimokq5lepTER2CW7lr+EuOcoIMg0Zx
	bUzgdx74qN0NKdEPLJHCufcxyoi8PtnbvSdMsW7n26beKXRX6imQG05Q6BCFZwXdhB8vy0dskREIQ
	+wNYuavV5OOkvr8liTwd6qwul4qCgOVPbPMmk//k2cNSr1LJ2bGhdJklLmvzgs7QHyuGoRO/Ax5U+
	FRlpGhcjIf9Run6qrKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cq7-001W2T-00; Mon, 13 Jun 2022 05:42:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cpu-001VxU-Qx; Mon, 13 Jun 2022 05:42:04 +0000
X-UUID: 05cf19e55b1d4f03b8f90ebf0cbf41f2-20220612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nONaeFrz3YV/Dq42Vp2+6kW44ZMOlliY6ZB93UoPywM=;
	b=VWAynwOysJePV6kErJE1SKmaayuTDHxDkoa4Dy3NqISM+/ozXiWA9sbMv4GflJc8UpkEwrgMKRAq0042bprt15RbjcEJOQVyQUrV2isT+/MQE9qLZbx996VKbcR+MxH2a7CQ6qRqiLdMOyeWCbshLI9KRpoJls0lHCzelwcQtxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:bb71dea0-0496-4097-92de-8f1973cc167b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:d79d7d37-84c0-4f9a-9fbd-acd4a0e9ad0f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 05cf19e55b1d4f03b8f90ebf0cbf41f2-20220612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1587894711; Sun, 12 Jun 2022 22:41:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 22:32:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 13:32:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 13:32:11 +0800
Message-ID: <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
Subject: Re: [PATCH v3 6/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzysztof.kozlowski@linaro.org>
Date: Mon, 13 Jun 2022 13:32:11 +0800
In-Reply-To: <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
	 <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_224202_917144_49D722E1 
X-CRM114-Status: GOOD (  26.61  )
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

On Thu, 2022-06-09 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
> On some SoCs (of which only MT8195 is supported at the time of
> writing),
> the "R" and "W" (I/O) enable bits for the IOMMUs are in the
> pericfg_ao
> register space and not in the IOMMU space: as it happened already
> with
> infracfg, it is expected that this list will grow.

Currently I don't see the list will grow. As commented before, In the
lastest SoC, The IOMMU enable bits for IOMMU will be in ATF, rather
than in this pericfg register region. In this case, Is this patch
unnecessary? or we could add this patch when there are 2 SoCs use this
setting at least?  what's your opinion?

> 
> Instead of specifying pericfg compatibles on a per-SoC basis,
> following
> what was done with infracfg, let's lookup the syscon by phandle
> instead.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/mtk_iommu.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 90685946fcbe..0ea0848581e9 100644
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
> @@ -1218,14 +1219,16 @@ static int mtk_iommu_probe(struct
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
> +		   MTK_IOMMU_HAS_FLAG(data->plat_data,
> HAS_PERI_IOMMU1_REG)) {
> +		data->pericfg = syscon_regmap_lookup_by_phandle(dev-
> >of_node, "mediatek,pericfg");
> +		if (IS_ERR(data->pericfg)) {
> +			p = "mediatek,mt8195-pericfg_ao";
> +			data->pericfg =
> syscon_regmap_lookup_by_compatible(p);

Upstream doesn't have the mt8195 iommu node currently, thus We don't
need to recover for the previous dts case. right?

> +			if (IS_ERR(data->pericfg)) {
> +				ret = PTR_ERR(data->pericfg);
> +				goto out_runtime_disable;
> +			}
>  		}
> -
> -		data->pericfg = infracfg;
>  	}
>  
>  	platform_set_drvdata(pdev, data);
> @@ -1484,8 +1487,8 @@ static const struct mtk_iommu_plat_data
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
