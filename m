Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089C3C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUf3ZynPwuKduaAPJwedt0i2zfl1klZCwexj3vw8Nzg=; b=Zjt46HXh1me8sCq0G8hFpbQzfc
	Fgw3v+Tn9v0LOsFREgcWl6M5GCOZPoj1U7qGB648oc/zRVVS4DgwWOxD2corQ/tB2ULekFCP/rdpb
	TLV7KlZ1Z4xKvtsJ+jqUfNXaABEM8pAnVEt86HncjbluAWvHOB3D41YnyJ7HvvIEMrg+fNxGzxa+a
	nzjuD4z3Nw5h60Mdo9TqQNLEo2rVNcSNPvMi7pkOuq89SfImRWxChASlOdPjZ0zIh4dB76LNvO9JF
	pJuIZXOd6W4FsusF+4SWsZkKCY7ZwjD+n1I6ge/Z3TcEyPec9/WBhum607wISWfIfckRtGZHUjOyG
	L8xinTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WmG-00FgNE-CI; Wed, 15 Jun 2022 17:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wm4-00FgJP-5O; Wed, 15 Jun 2022 17:25:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99245153B;
	Wed, 15 Jun 2022 10:25:45 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 927243F73B;
	Wed, 15 Jun 2022 10:25:43 -0700 (PDT)
Message-ID: <81b55048-a6f1-660f-95b0-6798aa4efc38@arm.com>
Date: Wed, 15 Jun 2022 18:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 3/3] iommu/mediatek: Allow page table PA up to 35bit
Content-Language: en-GB
To: yf.wang@mediatek.com, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEDIATEK IOMMU DRIVER" <iommu@lists.linux-foundation.org>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Ning Li <ning.li@mediatek.com>
References: <20220615161224.6923-1-yf.wang@mediatek.com>
 <20220615161224.6923-4-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220615161224.6923-4-yf.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_102548_338777_ACD64376 
X-CRM114-Status: GOOD (  19.76  )
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

On 2022-06-15 17:12, yf.wang--- via iommu wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> Single memory zone feature will remove ZONE_DMA32 and ZONE_DMA. So add
> the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT to let level 1 and level 2
> pgtable support at most 35bit PA.

I'm not sure how this works in practice, given that you don't seem to be 
setting the IOMMU's own DMA masks to more than 32 bits, so the DMA 
mapping in io-pgtable is going to fail if you ever do actually allocate 
a pagetable page above 4GB :/

> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 3d62399e8865..4dbc33758711 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -138,6 +138,7 @@
>   /* PM and clock always on. e.g. infra iommu */
>   #define PM_CLK_AO			BIT(15)
>   #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
> +#define PGTABLE_PA_35_EN		BIT(17)
>   
>   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>   				((((pdata)->flags) & (mask)) == (_x))
> @@ -240,6 +241,7 @@ struct mtk_iommu_data {
>   struct mtk_iommu_domain {
>   	struct io_pgtable_cfg		cfg;
>   	struct io_pgtable_ops		*iop;
> +	u32				ttbr;
>   
>   	struct mtk_iommu_bank_data	*bank;
>   	struct iommu_domain		domain;
> @@ -596,6 +598,9 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
>   		.iommu_dev = data->dev,
>   	};
>   
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
> +		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT;
> +
>   	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
>   		dom->cfg.oas = data->enable_4GB ? 33 : 32;
>   	else
> @@ -684,8 +689,8 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>   			goto err_unlock;
>   		}
>   		bank->m4u_dom = dom;
> -		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> -		       bank->base + REG_MMU_PT_BASE_ADDR);
> +		bank->m4u_dom->ttbr = MTK_IOMMU_ADDR(dom->cfg.arm_v7s_cfg.ttbr);
> +		writel(bank->m4u_dom->ttbr, data->base + REG_MMU_PT_BASE_ADDR);

To add to my comment on patch #1, having to make this change here 
further indicates that you're using it the wrong way.

Thanks,
Robin.

>   
>   		pm_runtime_put(m4udev);
>   	}
> @@ -1366,8 +1371,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
>   		writel_relaxed(reg->int_control[i], base + REG_MMU_INT_CONTROL0);
>   		writel_relaxed(reg->int_main_control[i], base + REG_MMU_INT_MAIN_CONTROL);
>   		writel_relaxed(reg->ivrp_paddr[i], base + REG_MMU_IVRP_PADDR);
> -		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> -		       base + REG_MMU_PT_BASE_ADDR);
> +		writel(m4u_dom->ttbr, base + REG_MMU_PT_BASE_ADDR);
>   	} while (++i < data->plat_data->banks_num);
>   
>   	/*
> @@ -1401,7 +1405,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>   static const struct mtk_iommu_plat_data mt6779_data = {
>   	.m4u_plat      = M4U_MT6779,
>   	.flags         = HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN | WR_THROT_EN |
> -			 MTK_IOMMU_TYPE_MM,
> +			 MTK_IOMMU_TYPE_MM | PGTABLE_PA_35_EN,
>   	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
>   	.banks_num    = 1,
>   	.banks_enable = {true},

