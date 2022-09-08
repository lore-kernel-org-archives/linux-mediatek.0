Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECB2C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OtqXaIWZ6RVGIDA1jcSd7SZp685DXwkQtdgGcw5XKI=; b=hhi49Iwe7xF4qLbeVCsARaBK5A
	U7qs4cIChAh1kLjEOiVEb+lnFwMMTOiePOtKsjzJ5NS0r+32utng3nQaOQ6dl4YqVmFnWyaSufdmd
	lX7cVgzDFi/QzqjFp2NpWLOfd0mr4wUojUGZWrGhIP1hRcY2F6NXL+RL5+FNELjbwL2ce5IXGD1vR
	E6Cx1Apj6d2pGAY+l5aCoPHhlX62ztC2o1cF64eilGiDMM9B5TlF1OhyJhcqOPn7dIha+RSuE8nS4
	UCOc2aO07SYYuF0nsAOh267UoORiDZfYahUHcMexz9gZvzf7q91j1lWw4ywjdIsQYqHl7aBpmKO1E
	QQtwBHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWEJC-00235d-Qr; Thu, 08 Sep 2022 09:58:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWEIx-00221T-5n; Thu, 08 Sep 2022 09:58:41 +0000
X-UUID: 9ba776fdc9f24e9abcc6ed3c998c9b88-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8OtqXaIWZ6RVGIDA1jcSd7SZp685DXwkQtdgGcw5XKI=;
	b=O1j+ChS6yh5Kuw+KbfWfNEtLF5sm7ahHdZA7wtTD79zcCH51TCexLP9EI0d0tRUK4eDptJd2fVfx4zOsHX+oKcKHIKCQkjcJ/jGlqaHYWCog6CghTYeSGw5As3H1Qy5GAHt81cXrCAsBWQWImoLlvhIDcCZm1OCnoMLBWzJSsLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5baad5c0-5ac6-465f-9605-049355a55e6e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:c192085d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9ba776fdc9f24e9abcc6ed3c998c9b88-20220908
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 875423654; Thu, 08 Sep 2022 02:57:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 17:57:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 8 Sep 2022 17:57:19 +0800
Message-ID: <d3ed0ed813270285cfd1319368d8943668ba3c4b.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] iommu/mediatek: Add MT8188 IOMMU Support
From: Chengci.Xu <chengci.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Yong Wu" <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 8 Sep 2022 17:57:19 +0800
In-Reply-To: <c6853021-e7ef-3078-9c9e-f0c6b56e566d@collabora.com>
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
	 <20220831125502.7818-4-chengci.xu@mediatek.com>
	 <c6853021-e7ef-3078-9c9e-f0c6b56e566d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_025839_231038_42075C7D 
X-CRM114-Status: GOOD (  21.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-09-02 at 11:04 +0200, AngeloGioacchino Del Regno wrote:
> Il 31/08/22 14:55, Chengci.Xu ha scritto:
> > MT8188 has 3 IOMMU, containing 2 MM IOMMUs, one is for vdo, the
> > other
> > is for vpp. and 1 INFRA IOMMU.
> > 
> > Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 48
> > +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 48 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 6fe780783ec8..98c2eae5229e 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -164,6 +164,7 @@ enum mtk_iommu_plat {
> >   	M4U_MT8173,
> >   	M4U_MT8183,
> >   	M4U_MT8186,
> > +	M4U_MT8188,
> >   	M4U_MT8192,
> >   	M4U_MT8195,
> >   };
> > @@ -1479,6 +1480,50 @@ static const struct mtk_iommu_plat_data
> > mt8186_data_mm = {
> >   	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
> >   };
> >   
> > +static const struct mtk_iommu_plat_data mt8188_data_infra = {
> > +	.m4u_plat	  = M4U_MT8188,
> > +	.flags            = WR_THROT_EN | DCM_DISABLE | STD_AXI_MODE |
> > PM_CLK_AO |
> > +			    MTK_IOMMU_TYPE_INFRA |
> > IFA_IOMMU_PCIE_SUPPORT |
> > +			    CFG_IFA_MASTER_IN_ATF,
> > +	.pericfg_comp_str = "mediatek,mt8188-pericfg_ao",
> 
> pericfg_comp_str is used only for IOMMU enable from Linux, but MT8188
> enables it
> with a SMC command, so this is unused.
> 
> Please drop it.

Thanks for your review.

Yes. For MT8188, pericfg_comp_str is unused and should be dropped.
But deleting it simply will lead to INFRA IOMMU probe fail because
following code flow.

	line 1236:
		p = data->plat_data->pericfg_comp_str;
		data->pericfg = syscon_regmap_lookup_by_compatible(p);
		if (IS_ERR(data->pericfg)) {
			ret = PTR_ERR(data->pericfg);
			goto out_runtime_disable;
		}

So we will update probe flow(patch 2/3) and then drop it(patch 3/3) in
the next version. 

> 
> > +	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
> > +	.banks_num	  = 1,
> > +	.banks_enable     = {true},
> > +	.iova_region      = single_domain,
> > +	.iova_region_nr   = ARRAY_SIZE(single_domain),
> > +};
> > +
> 
> Regards,
> Angelo
> 
> 


