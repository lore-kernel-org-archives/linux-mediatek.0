Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A6CECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1Qatl3TxQ1OIE2ACTUpkr+Q/YcAJJhrIyAXJZ2+iBk=; b=ehrPv9xiuyZjjr6eWSu21PIm/H
	nbnxXLdanTeOelU5vCapyvdwbg6GwO/6L4JIodaaInM4BYb3mY9SPdnRV8Xt0As2ynTLK/FrzD+jG
	m8Lia9xlzV2E4i96chCamd5Pfw8rBvMjS+KzDb8j1sq9jJwmdDd4zER11tsx9tJsqJ4sMJInGG6WQ
	YjWHGZhuAq3MuHLo5JpVMiijXJPrA9xwrW/eMA4LP4pR+OJX1eNJXenr3jOXmCSQeANwuGYzIQaMp
	4l+ZMIdJrmZith6DRZJxTRmsGMU1xjiWLp1JaKXr7gqMwHxlbVoUn74E2pVKL9LTUdDjKn5ZqDQzJ
	NUko9lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2by-002HuI-RG; Fri, 02 Sep 2022 09:05:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2bY-002HWj-9W; Fri, 02 Sep 2022 09:04:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A8486601F04;
	Fri,  2 Sep 2022 10:04:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662109486;
	bh=yvwwoBkByqJ5cx4uVKskzHBO8ILIZF3f4Da7QWytnDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jR/695CKTH7D1U/VSzyMePn4k8uuuO9xvO0kF9h1XqacwzhDi8kU+Pdi/UWb0+ioJ
	 WTXnrV968hQT4Gez+SlfnYYaiXFs1nF5BJHTNRUqgIHxax9HQuJEyu/wMfpERM/sCY
	 v6EjEdz3cbjpgWM+hH0gCwi9qj/B2kTC71pEaQK8WggY7bQdvIaPFAF/P+ySg5Daqt
	 BSmvjRUnTeZe1IeJfhFRsmp1eqGlSPBiNhAn1iWsGAeMP9rkVBcqmqbqEundF91Zft
	 wt35NUet0b656hL6r2rqQdf1fBObKsNwCYLB7HNRdi/PE/AhH7NDNJtXj442upFOrd
	 MjxKi4AFPAdPA==
Message-ID: <c6853021-e7ef-3078-9c9e-f0c6b56e566d@collabora.com>
Date: Fri, 2 Sep 2022 11:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/3] iommu/mediatek: Add MT8188 IOMMU Support
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
 <20220831125502.7818-4-chengci.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220831125502.7818-4-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_020448_538865_04492A32 
X-CRM114-Status: GOOD (  17.39  )
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

Il 31/08/22 14:55, Chengci.Xu ha scritto:
> MT8188 has 3 IOMMU, containing 2 MM IOMMUs, one is for vdo, the other
> is for vpp. and 1 INFRA IOMMU.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 48 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6fe780783ec8..98c2eae5229e 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -164,6 +164,7 @@ enum mtk_iommu_plat {
>   	M4U_MT8173,
>   	M4U_MT8183,
>   	M4U_MT8186,
> +	M4U_MT8188,
>   	M4U_MT8192,
>   	M4U_MT8195,
>   };
> @@ -1479,6 +1480,50 @@ static const struct mtk_iommu_plat_data mt8186_data_mm = {
>   	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
>   };
>   
> +static const struct mtk_iommu_plat_data mt8188_data_infra = {
> +	.m4u_plat	  = M4U_MT8188,
> +	.flags            = WR_THROT_EN | DCM_DISABLE | STD_AXI_MODE | PM_CLK_AO |
> +			    MTK_IOMMU_TYPE_INFRA | IFA_IOMMU_PCIE_SUPPORT |
> +			    CFG_IFA_MASTER_IN_ATF,
> +	.pericfg_comp_str = "mediatek,mt8188-pericfg_ao",

pericfg_comp_str is used only for IOMMU enable from Linux, but MT8188 enables it
with a SMC command, so this is unused.

Please drop it.

> +	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
> +	.banks_num	  = 1,
> +	.banks_enable     = {true},
> +	.iova_region      = single_domain,
> +	.iova_region_nr   = ARRAY_SIZE(single_domain),
> +};
> +

Regards,
Angelo


