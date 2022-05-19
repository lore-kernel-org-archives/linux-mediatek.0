Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ynmx6R0j0jg8IptSVZngvLsyS+t40mRbaXIXa0Cds9c=; b=IRC4zu1ujMe9TJ
	IdGDDO6PcOUyOjjgC116oSpuB7/1jZKeYWoIKIwam5qJn0o+3nHR6sMFhPgSNOHDD/LuxrHpVLByk
	HM+i9DxiLb5OtpxCEBJdyP52TJmlOhgv84l9ZJgLsARN+tTugzUZcaTvG91U8YQRThY4K0lYZ+h6a
	4Bfnr3MQXPMBALIS5+befNqhbir/dhhELygzbfBX/a+bVq8jD8H20dxx/jkvEsBfiVjH+Wclx+ntP
	qm5mQbLjpKD267zyC/xP/OeudcFHyzLC+AODY81Ix1Id6h2FS4mSntJJq8L3rDymY/PDS3FO45ac1
	C/6oOZzmndAibxL/QUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nraDO-005QGL-N1; Thu, 19 May 2022 07:04:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nraDM-005QEk-HH; Thu, 19 May 2022 07:04:54 +0000
X-UUID: 1f7ae89a850e4892a772d8176d650a17-20220519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vtv2mlrRzLJ4jGL92ZIAvAkOmHntsE6DSyizxJLFSf8=; 
 b=LF4JWvXPDdopH0eZDlNK6tVqdcJQOGjvKA8q9tKIsRKQtsxiC/xGNbbw/LVAVRj2E5KbtG76MRCrnhkkw2JDgiDMb24/ZGeAvCNUwU/QNbzWdWDUEKzRRWuLSgg7FhBzrvhHTAZb7dqV5X8lYdKScl7Q1q10cUlno81Gi1Mov84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:81b4f982-1e19-4314-ad71-25ce41bf01f6, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:03eed379-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 1f7ae89a850e4892a772d8176d650a17-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1718294389; Thu, 19 May 2022 00:04:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:58:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 19 May 2022 14:58:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 14:58:18 +0800
Message-ID: <1625ec1f4cded0f825d93743d3d03fcf83cad5aa.camel@mediatek.com>
Subject: Re: [PATCH v5 2/2] iommu/mediatek: Allow page table PA up to 35bit
From: Yong Wu <yong.wu@mediatek.com>
To: <yf.wang@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Ning Li
 <ning.li@mediatek.com>, "open list:MEDIATEK IOMMU DRIVER"
 <iommu@lists.linux-foundation.org>, "moderated list:MEDIATEK IOMMU DRIVER"
 <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 19 May 2022 14:58:18 +0800
In-Reply-To: <20220516141608.11709-3-yf.wang@mediatek.com>
References: <20220516141608.11709-1-yf.wang@mediatek.com>
 <20220516141608.11709-3-yf.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_000452_626648_B3A0ED5B 
X-CRM114-Status: GOOD (  23.06  )
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

On Mon, 2022-05-16 at 22:16 +0800, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> Add the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT support, so that
> allows
> page table PA up to 35bit, not only in ZONE_DMA32.

Comment why this is needed.

e.g. For single normal zone.

> 
> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6fd75a60abd6..1b9a876ef271 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -33,6 +33,7 @@
>  
>  #define REG_MMU_PT_BASE_ADDR			0x000
>  #define MMU_PT_ADDR_MASK			GENMASK(31, 7)
> +#define MMU_PT_ADDR_2_0_MASK			GENMASK(2, 0)
>  
>  #define REG_MMU_INVALIDATE			0x020
>  #define F_ALL_INVLD				0x2
> @@ -118,6 +119,7 @@
>  #define WR_THROT_EN			BIT(6)
>  #define HAS_LEGACY_IVRP_PADDR		BIT(7)
>  #define IOVA_34_EN			BIT(8)
> +#define PGTABLE_PA_35_EN		BIT(9)
>  
>  #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
>  		((((pdata)->flags) & (_x)) == (_x))
> @@ -401,6 +403,9 @@ static int mtk_iommu_domain_finalise(struct
> mtk_iommu_domain *dom,
>  		.iommu_dev = data->dev,
>  	};
>  
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
> +		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT;
> +
>  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
>  		dom->cfg.oas = data->enable_4GB ? 33 : 32;
>  	else
> @@ -450,6 +455,7 @@ static int mtk_iommu_attach_device(struct
> iommu_domain *domain,
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>  	struct device *m4udev = data->dev;
>  	int ret, domid;
> +	u32 regval;
>  
>  	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
>  	if (domid < 0)
> @@ -472,8 +478,14 @@ static int mtk_iommu_attach_device(struct
> iommu_domain *domain,
>  			return ret;
>  		}
>  		data->m4u_dom = dom;
> -		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> -		       data->base + REG_MMU_PT_BASE_ADDR);
> +
> +		/* Bits[6:3] are invalid for mediatek platform */
> +		if (MTK_IOMMU_HAS_FLAG(data->plat_data,
> PGTABLE_PA_35_EN))
> +			regval = (dom->cfg.arm_v7s_cfg.ttbr &
> MMU_PT_ADDR_MASK) |
> +				 (dom->cfg.arm_v7s_cfg.ttbr &
> MMU_PT_ADDR_2_0_MASK);

The bits[2:0] has already handled in ARM_V7S_TTBR_35BIT_PA of
patch[1/2], we need calculate it again here?

1) Extend arm_v7s_cfg.ttbr to u64, then we could put the special ttbr
logical into our file.

2) if 1) is not allowed, We have to put this in v7s.
if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT) {
       cfg->arm_v7s_cfg.ttbr = (paddr & GENMASK(31, 7)) |
upper_32_bits(paddr);
       return &data->iop;
}

This need Robin/Will confirm.

> +		else
> +			regval = dom->cfg.arm_v7s_cfg.ttbr &
> MMU_PT_ADDR_MASK;

Save this value to our data. then we don't need calculate it again in
the resume cb.   

> +		writel(regval, data->base + REG_MMU_PT_BASE_ADDR);
>  
>  		pm_runtime_put(m4udev);
>  	}
> @@ -987,6 +999,7 @@ static int __maybe_unused
> mtk_iommu_runtime_resume(struct device *dev)
>  	struct mtk_iommu_suspend_reg *reg = &data->reg;
>  	struct mtk_iommu_domain *m4u_dom = data->m4u_dom;
>  	void __iomem *base = data->base;
> +	u32 regval;
>  	int ret;
>  
>  	ret = clk_prepare_enable(data->bclk);
> @@ -1010,7 +1023,14 @@ static int __maybe_unused
> mtk_iommu_runtime_resume(struct device *dev)
>  	writel_relaxed(reg->int_main_control, base +
> REG_MMU_INT_MAIN_CONTROL);
>  	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
>  	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
> -	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base +
> REG_MMU_PT_BASE_ADDR);
> +
> +	/* Bits[6:3] are invalid for mediatek platform */
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
> +		regval = (m4u_dom->cfg.arm_v7s_cfg.ttbr &
> MMU_PT_ADDR_MASK) |
> +			 (m4u_dom->cfg.arm_v7s_cfg.ttbr &
> MMU_PT_ADDR_2_0_MASK);
> +	else
> +		regval = m4u_dom->cfg.arm_v7s_cfg.ttbr &
> MMU_PT_ADDR_MASK;
> +	writel(regval, base + REG_MMU_PT_BASE_ADDR);
>  
>  	/*
>  	 * Users may allocate dma buffer before they call
> pm_runtime_get,
> @@ -1038,7 +1058,8 @@ static const struct mtk_iommu_plat_data
> mt2712_data = {
>  
>  static const struct mtk_iommu_plat_data mt6779_data = {
>  	.m4u_plat      = M4U_MT6779,
> -	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN,
> +	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN |
> +			 PGTABLE_PA_35_EN,
>  	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
>  	.iova_region   = single_domain,
>  	.iova_region_nr = ARRAY_SIZE(single_domain),
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
