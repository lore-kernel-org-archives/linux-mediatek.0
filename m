Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KX/P8QrLh/Y4lOVRmj4Qpi62+/IDxHtzaze5Esu65k=; b=nU2MLmhg4IPAJ6
	nTH5ffSQOKptGnEbtowXSebtlifzzEhFkBFK1nTjLYqXw9YP9vluTTAX7NRqr7EQkSKIEVkX41gjD
	3z86Y5QOm2L6ySTATViO7uHFE0mFFsxBcvv+yMVLo6NQfcmYAAKQ8XLY/xj9PaHpOjNfQcVoQHUW8
	H5B1gWNlqOpC4/c0dShdtvpAuTa2NnbBLRs3FPgoB+sAFz5Oa0bewj2IafO9o4H9NL4TV0wDlpKa6
	SZjySoS4OqP6Rnmyzu1Omsrc+ArLPs5BlFdAMcs1inCUcY87NH3SsczrYKyYZhwOjwW4Gr1wn+dIi
	SVDsRqcPDj75Y1OcGayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu8v5-00E5gs-0K; Thu, 26 May 2022 08:32:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu8us-00E5dV-NZ; Thu, 26 May 2022 08:32:24 +0000
X-UUID: 140fc247896c4e2a8637ea7d0f3872a9-20220526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Hs3+1H0RPCDl0eDAGExh74XXOCGIvnEw1u6pdfv3ohk=;
	b=ouwJ8EfdA2qjT2KWeEQsh3l/eoYZ925ZnP2WwHUh3yUveLPe7kuymTCzg+i/TDQJ+D86C6imHukTn+Oki/FwRtcGJq3mw5OeQe/Jx1lmlk10D9zhbDftKpt05PsiM1vJ0se8VwnXFOqWwjjjViX0aKSXvOCpJi18It1loNGov1Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:3262ea05-c30d-42ec-bbb8-776a56221e44,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:1f0154b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 140fc247896c4e2a8637ea7d0f3872a9-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1251790928; Thu, 26 May 2022 01:32:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 01:22:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 16:22:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 26 May 2022 16:22:14 +0800
Message-ID: <86bc853d39a0c001f5b1bbbeecaf9a6d92abfe94.camel@mediatek.com>
Subject: Re: [PATCH v2 2/7] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to infracfg
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzysztof.kozlowski@linaro.org>
Date: Thu, 26 May 2022 16:22:13 +0800
In-Reply-To: <20220518100503.37279-3-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
	 <20220518100503.37279-3-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_013222_811622_6814FBDB 
X-CRM114-Status: GOOD (  28.97  )
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
> This driver will get support for more SoCs and the list of infracfg
> compatibles is expected to grow: in order to prevent getting this
> situation out of control and see a long list of compatible strings,
> add support to retrieve a handle to infracfg's regmap through a
> new "mediatek,infracfg" phandle.
> 
> In order to keep retrocompatibility with older devicetrees, the old
> way is kept in place, but also a dev_warn() was added to advertise
> this change in hope that the user will see it and eventually update
> the devicetree if this is possible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/mtk_iommu.c | 40 +++++++++++++++++++++++++----------
> ----
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 71b2ace74cd6..d16b95e71ded 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1134,22 +1134,34 @@ static int mtk_iommu_probe(struct
> platform_device *pdev)
>  	data->protect_base = ALIGN(virt_to_phys(protect),
> MTK_PROTECT_PA_ALIGN);
>  
>  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
> -		switch (data->plat_data->m4u_plat) {
> -		case M4U_MT2712:
> -			p = "mediatek,mt2712-infracfg";
> -			break;
> -		case M4U_MT8173:
> -			p = "mediatek,mt8173-infracfg";
> -			break;
> -		default:
> -			p = NULL;
> +		infracfg = syscon_regmap_lookup_by_phandle(dev-
> >of_node, "mediatek,infracfg");
> +		if (IS_ERR(infracfg)) {
> +			dev_info(dev, "Cannot find phandle to
> mediatek,infracfg:"
> +				      " Please update your
> devicetree.\n");

Remove the log from Robin?

> +			/*
> +			 * Legacy devicetrees will not specify a
> phandle to
> +			 * mediatek,infracfg: in that case, we use the
> older
> +			 * way to retrieve a syscon to infra.
> +			 *
> +			 * This is for retrocompatibility purposes
> only, hence
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

We already use "mediatek,infracfg" property for commonizing. For the
previous SoC, I also prefer to put the string into the platform data.

After this, "->m4u_plat" could be removed. Of course, this is not the
main purpose of this patchset. it also is ok currently.

> +
> +			infracfg =
> syscon_regmap_lookup_by_compatible(p);
> +			if (IS_ERR(infracfg))
> +				return PTR_ERR(infracfg);
>  		}
>  
> -		infracfg = syscon_regmap_lookup_by_compatible(p);
> -
> -		if (IS_ERR(infracfg))
> -			return PTR_ERR(infracfg);
> -
>  		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
>  		if (ret)
>  			return ret;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
