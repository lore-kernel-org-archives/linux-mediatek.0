Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEYhCLMb4Z3VVMaEdpiwJA6j1Dr5Mj042Cg1rTplP1s=; b=ucSDvrv59XWqxe
	38s91OoK9514dXbUmyzvsR/1H/B1/BH1oTcyZ4m4hijZdRWTED2Ohe9HyH/vuZU8D+TNg+Skl5orW
	lv6VHpiRBElYg5VY2g1P+yCHcLRY5O6gIJ+zia7+PBPIvMh90YUwrbFq56hLWh9aTvFR3L2SyPMi8
	nmZ6RmYfGiVu3BmE99l9MX7OlcuA86XHBet6EFGe54M3hpOxLBFSt+fP9ZS8ZDgDE8kJ/FMoqmUyK
	o0GS/SjssETjm9olGh0LUPrr5MtnVfJqnfxv/LaRqvEaGX0MdfoNNpM4WCS3kbIDnCZSNyvDmJEky
	2757udizSlLvvQfb19ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP2zi-00Gxki-IK; Tue, 01 Mar 2022 13:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP2zV-00GxhF-UO; Tue, 01 Mar 2022 13:56:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66ABA1042;
 Tue,  1 Mar 2022 05:56:36 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA0353F70D;
 Tue,  1 Mar 2022 05:56:34 -0800 (PST)
Message-ID: <b10031aa-8e49-70b3-b498-8aa6b7021fbb@arm.com>
Date: Tue, 1 Mar 2022 13:56:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] iommu/iova: Reset max32_alloc_size after cleaning
 rcache in the fail path
Content-Language: en-GB
To: yf.wang@mediatek.com
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Libo.Kang@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ning.Li@mediatek.com, matthias.bgg@gmail.com, stable@vger.kernel.org,
 will@kernel.org
References: <20220301014246.5011-1-yf.wang@mediatek.com>
 <20220301015919.5116-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220301015919.5116-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_055638_066521_AAC64FE2 
X-CRM114-Status: GOOD (  20.99  )
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

On 2022-03-01 01:59, yf.wang--- via iommu wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> In alloc_iova_fast function, if __alloc_and_insert_iova_range fail,
> alloc_iova_fast will try flushing rcache and retry alloc iova, but
> this has an issue:
> 
> Since __alloc_and_insert_iova_range fail will set the current alloc
> iova size to max32_alloc_size (iovad->max32_alloc_size = size),
> when the retry is executed into the __alloc_and_insert_iova_range
> function, the retry action will be blocked by the check condition
> (size >= iovad->max32_alloc_size) and goto iova32_full directly,
> causes the action of retry regular alloc iova in
> __alloc_and_insert_iova_range to not actually be executed.
> 
> Based on the above, so need reset max32_alloc_size before retry alloc
> iova when alloc iova fail, that is set the initial dma_32bit_pfn value
> of iovad to max32_alloc_size, so that the action of retry alloc iova
> in __alloc_and_insert_iova_range can be executed.

Have you observed this making any difference in practice?

Given that both free_cpu_cached_iovas() and free_global_cached_iovas() 
call iova_magazine_free_pfns(), which calls remove_iova(), which calls 
__cached_rbnode_delete_update(), I'm thinking no...

Robin.

> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Cc: <stable@vger.kernel.org> # 5.10.*
> ---
> v2: Cc stable@vger.kernel.org
>      1. This patch needs to be merged stable branch, add stable@vger.kernel.org
>         in mail list.
> 
> ---
>   drivers/iommu/iova.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index b28c9435b898..0c085ae8293f 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -453,6 +453,7 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
>   retry:
>   	new_iova = alloc_iova(iovad, size, limit_pfn, true);
>   	if (!new_iova) {
> +		unsigned long flags;
>   		unsigned int cpu;
>   
>   		if (!flush_rcache)
> @@ -463,6 +464,12 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
>   		for_each_online_cpu(cpu)
>   			free_cpu_cached_iovas(cpu, iovad);
>   		free_global_cached_iovas(iovad);
> +
> +		/* Reset max32_alloc_size after flushing rcache for retry */
> +		spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> +		iovad->max32_alloc_size = iovad->dma_32bit_pfn;
> +		spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +
>   		goto retry;
>   	}
>   
> 
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
