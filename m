Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8804C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcWNogCIO1JkTo3Zs+2I1uyEPDVW/ClmUHS0DVAuFNc=; b=S82nunIReyw0I6
	eR9iAfjZFl2IblryPlkpYQI9twa0WOG8kJ7elnoA+LwfmYExj12pGRUvK7/9makUUCbWG+h3LE0Rk
	MH8Lyik6Jbx5IQGzd/cSuZSWCb+6UuOF56J7QAg2EFf9WCh3yINZk96/b+ejk2MKS8cvlhDzEniEu
	pyqTuRzlXFC6gC2EfWf+VujFSid/N+JW+geMKCgFl9TgTLZofjiwj8mcU17aLGpdLP+nuv+JBJRWP
	/v6H7q7H/S+jNyqiQcdAzzI2kvcWUGoW5+sh5pFLyK5t7tX2ymHcumOx11+5RJTtGGZg2xWKtMhI7
	E+mr02DdYrW5NatcbcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0chV-001UDY-HX; Mon, 13 Jun 2022 05:33:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0chJ-001U8E-9H; Mon, 13 Jun 2022 05:33:10 +0000
X-UUID: 7cabb5ea549e4269a8533be9a6f40435-20220612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qvktQz4dYRonVIwj/SfwaTUatqz0lnZH5/+Pexq6FqA=;
	b=YfUJRBqdA2cs1+nF16n4PWbSvMZ7DBsvD+/GPEZRjcXtV0n1tpFzcqiZ52wunh9NETg8JtGpYD+yLqCg11trLglN6sPl1t09UloH3suIqUjqu9Ba0svfZ28f1DfBp2Zp9PFeHyZ9bLtZkIxzxVEG6KjdR+mlN36KuL+FKjlg7+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:aeb34054-c04a-4228-b62c-fd265a854e26,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:b94b7d37-84c0-4f9a-9fbd-acd4a0e9ad0f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 7cabb5ea549e4269a8533be9a6f40435-20220612
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1511007348; Sun, 12 Jun 2022 22:33:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 22:33:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 13:32:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 13:32:58 +0800
Message-ID: <609b356acce95e99718ef7f31fd8cc795bbc72e2.camel@mediatek.com>
Subject: Re: [PATCH v3 3/3] iommu: mtk_iommu: Add support for MT6795 Helio
 X10 M4Us
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
Date: Mon, 13 Jun 2022 13:32:57 +0800
In-Reply-To: <20220609104001.97753-4-angelogioacchino.delregno@collabora.com>
References: <20220609104001.97753-1-angelogioacchino.delregno@collabora.com>
	 <20220609104001.97753-4-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_223309_390505_1CCBF184 
X-CRM114-Status: GOOD (  15.78  )
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
> Add support for the M4Us found in the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Retitle to: iommu/mediatek: Xxx, then

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> ---
>  drivers/iommu/mtk_iommu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 8611cf8e4bd5..beca1c5a6c10 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -160,6 +160,7 @@
>  enum mtk_iommu_plat {
>  	M4U_MT2712,
>  	M4U_MT6779,
> +	M4U_MT6795,
>  	M4U_MT8167,
>  	M4U_MT8173,
>  	M4U_MT8183,
> @@ -1424,6 +1425,19 @@ static const struct mtk_iommu_plat_data
> mt6779_data = {
>  	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
>  };
>  
> +static const struct mtk_iommu_plat_data mt6795_data = {
> +	.m4u_plat     = M4U_MT6795,
> +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> +			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM |
> +			TF_PORT_TO_ADDR_MT8173,
> +	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.banks_num    = 1,
> +	.banks_enable = {true},
> +	.iova_region  = single_domain,
> +	.iova_region_nr = ARRAY_SIZE(single_domain),
> +	.larbid_remap = {{0}, {1}, {2}, {3}, {4}}, /* Linear mapping.
> */
> +};
> +
>  static const struct mtk_iommu_plat_data mt8167_data = {
>  	.m4u_plat     = M4U_MT8167,
>  	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR |
> MTK_IOMMU_TYPE_MM,
> @@ -1536,6 +1550,7 @@ static const struct mtk_iommu_plat_data
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
