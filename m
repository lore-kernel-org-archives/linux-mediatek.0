Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C276C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ4Djhmy79B6r/e7ZRLOEehkhIHgDAqZ3mCX7j7FrvU=; b=POrbL/DEg2G2epERa4ynKbLMG4
	AZTNb6/sSLYB6nYp7JnRAzRqWccSYArcduzv28RpEehMwMWVpENriqcWmBJn1d3gwT2CdRVWiKmQj
	GoubE8WdJ6crvOfRKPFwHPN6JwPdWRO1VkFaBnl7jp1U4GMRW8vcd2f7PhINFUYE4fTJwX1Y6XOp2
	HcZRxiqxyfEd36QXUtJ9122EMrN63uP7yQ/MQghV4RtDXrtG76kP0cEHVOz1ZqrGqbpMGvD7WLq+G
	+VFXfTh++qDoflLhbRhZFbX6ZnjpSadwGYu064UbhszDd6Mkqlth15yELwR/pmJot1tUmv9HP/gp/
	eCisctrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WbJ-00Fd4Z-14; Wed, 15 Jun 2022 17:14:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wb6-00Fd0A-Js; Wed, 15 Jun 2022 17:14:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC787153B;
	Wed, 15 Jun 2022 10:14:25 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FAB23F73B;
	Wed, 15 Jun 2022 10:14:23 -0700 (PDT)
Message-ID: <949c22c4-5f64-47cf-673c-14fcadcc1d27@arm.com>
Date: Wed, 15 Jun 2022 18:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to
 MTK_IOMMU_ADDR
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
 <20220615161224.6923-3-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220615161224.6923-3-yf.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_101428_756865_C28B3229 
X-CRM114-Status: GOOD (  14.96  )
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
> Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update MTK_IOMMU_ADDR
> definition for better generality.
> 
> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index bb9dd92c9898..3d62399e8865 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -265,8 +265,8 @@ static const struct iommu_ops mtk_iommu_ops;
>   
>   static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int bankid);
>   
> -#define MTK_IOMMU_TLB_ADDR(iova) ({					\
> -	dma_addr_t _addr = iova;					\
> +#define MTK_IOMMU_ADDR(addr) ({						\
> +	unsigned long long _addr = addr;				\

If phys_addr_t is 64-bit, then dma_addr_t is also 64-bit, so there is no 
loss of generality from using an appropriate type - IOVAs have to fit 
into dma_addr_t for iommu-dma, after all. However, since IOVAs also have 
to fit into unsigned long in the general IOMMU API, as "addr" is here, 
then this is still just as broken for 32-bit LPAE as the existing code is.

Thanks,
Robin.

>   	((lower_32_bits(_addr) & GENMASK(31, 12)) | upper_32_bits(_addr));\
>   })
>   
> @@ -381,8 +381,8 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>   			       base + data->plat_data->inv_sel_reg);
>   
> -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base + REG_MMU_INVLD_START_A);
> -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
> +		writel_relaxed(MTK_IOMMU_ADDR(iova), base + REG_MMU_INVLD_START_A);
> +		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
>   			       base + REG_MMU_INVLD_END_A);
>   		writel_relaxed(F_MMU_INV_RANGE, base + REG_MMU_INVALIDATE);
>   

