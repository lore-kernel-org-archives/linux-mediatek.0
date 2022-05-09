Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv83DkAuxgO55jG6yaI+ma/P16Sq2ITfnnFWMZ19DhM=; b=ZZhf3hQ5X9RjrV
	0w3UCee4f7jv3phc9xymYYWRlTbgTWq0flWsLPFcqb1LMdAXjXDQ97V6ttc088wDI0kYbqWUBZyZ6
	CAwC4H559L1Wcz0O1he7LGCQj2EWBShZRQVOvePDLYCo++Iq108EycM8dqoXRuerhJuetfqCYR+va
	7b3Yb0DQkHKoTqPqWxfxOyEkfcPI9RPJoZflR2+ImmuLCTlcX8QTImClNbSvHJrTCesg5rweiUlfS
	/7Wqlqpor1wTs53yAHWWVtmEmp2A6J9BhTiFQ5lJbX2l4Pkxp4GSzFyTT4UwMI4VvDb7utQ5+yj4O
	bvzDGSo3W1uTThiOhCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnzba-00DP6A-Ie; Mon, 09 May 2022 09:23:02 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnzbP-00DP0s-1a; Mon, 09 May 2022 09:22:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00EA71480;
 Mon,  9 May 2022 02:22:48 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B0153F66F;
 Mon,  9 May 2022 02:22:44 -0700 (PDT)
Message-ID: <de0befa1-8376-6891-abe8-12cd898fa5ab@arm.com>
Date: Mon, 9 May 2022 10:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] iommu/dma: Fix iova map result check bug
Content-Language: en-GB
To: yf.wang@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Ning Li <Ning.Li@mediatek.com>,
 stable@vger.kernel.org
References: <20220507085204.16914-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220507085204.16914-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_022251_227765_5D8BBE02 
X-CRM114-Status: GOOD (  25.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-05-07 09:52, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> The data type of the return value of the iommu_map_sg_atomic
> is ssize_t, but the data type of iova size is size_t,
> e.g. one is int while the other is unsigned int.
> 
> When iommu_map_sg_atomic return value is compared with iova size,
> it will force the signed int to be converted to unsigned int, if
> iova map fails and iommu_map_sg_atomic return error code is less
> than 0, then (ret < iova_len) is false, which will to cause not
> do free iova, and the master can still successfully get the iova
> of map fail, which is not expected.
> 
> Therefore, we need to check the return value of iommu_map_sg_atomic
> in two cases according to whether it is less than 0.

Heh, it's always a fun day when I have to go back to the C standard to 
remind myself of the usual arithmetic conversions. But indeed this seems 
correct, and even though the double comparisons look a little 
non-obvious on their own I can't think of an objectively better 
alternative, so:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Cc: <stable@vger.kernel.org> # 5.15.*
> ---
>   drivers/iommu/dma-iommu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 09f6e1c0f9c0..2932281e93fc 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -776,6 +776,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
>   	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
>   	struct page **pages;
>   	dma_addr_t iova;
> +	ssize_t ret;
>   
>   	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
>   	    iommu_deferred_attach(dev, domain))
> @@ -813,8 +814,8 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
>   			arch_dma_prep_coherent(sg_page(sg), sg->length);
>   	}
>   
> -	if (iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt->orig_nents, ioprot)
> -			< size)
> +	ret = iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt->orig_nents, ioprot);
> +	if (ret < 0 || ret < size)
>   		goto out_free_sg;
>   
>   	sgt->sgl->dma_address = iova;
> @@ -1209,7 +1210,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   	 * implementation - it knows better than we do.
>   	 */
>   	ret = iommu_map_sg_atomic(domain, iova, sg, nents, prot);
> -	if (ret < iova_len)
> +	if (ret < 0 || ret < iova_len)
>   		goto out_free_iova;
>   
>   	return __finalise_sg(dev, sg, nents, iova);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
