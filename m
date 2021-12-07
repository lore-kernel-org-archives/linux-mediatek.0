Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldz/IKnz/InpI4w+yP3wqfOTl3La9eH9l6lrSfSdDV0=; b=lMp6SLNeNFty+l
	hb24GAWt6S2vo6rO+yg9S7ytsTEzHpIoVSkxvi/Y5lXLAXJlDqwMiG+JEMj+RIjUxMjn9q0oG0BQL
	Bb61MyJ+86Sx4fXCAgMOzTQZi1farw+o05UdNJ1+MNig04sUe9m5zFux8bzfIg71qv51ec+/qG8Xo
	YX2+HU8MmcPM6qmu8+4VV0zj7gQVS4unfpe55xW6qxCfwa58Bga+L0b0sAtevtchVvoMGQbxuQ60y
	YNtjCnP/2Nc5g4a5AZzDfbxdElycvHsYSGPfHUlzp7i+1hLaHddk9ww3V+LyvRd7fGVHd/V0QtdxK
	+ZPPlSQvwdK8ulbNiFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muYs2-008HcS-J6; Tue, 07 Dec 2021 11:42:54 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muYrp-008HZj-Mf; Tue, 07 Dec 2021 11:42:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B96A611FB;
 Tue,  7 Dec 2021 03:42:38 -0800 (PST)
Received: from [10.57.34.58] (unknown [10.57.34.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A46E3F73B;
 Tue,  7 Dec 2021 03:42:36 -0800 (PST)
Message-ID: <c81305b0-c419-362a-073b-65150497d1d7@arm.com>
Date: Tue, 7 Dec 2021 11:42:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3] iommu/io-pgtable-arm-v7s: Add error handle for page
 table allocation failure
Content-Language: en-GB
To: yf.wang@mediatek.com, will@kernel.org
Cc: Guangming.Cao@mediatek.com, Libo.Kang@mediatek.com,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, wsd_upstream@mediatek.com, stable@vger.kernel.org
References: <20211207094817.GA31382@willie-the-truck>
 <20211207113315.29109-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211207113315.29109-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_034241_837521_1F40AE36 
X-CRM114-Status: GOOD (  20.42  )
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

On 2021-12-07 11:33, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> In __arm_v7s_alloc_table function:
> iommu call kmem_cache_alloc to allocate page table, this function
> allocate memory may fail, when kmem_cache_alloc fails to allocate
> table, call virt_to_phys will be abnomal and return unexpected phys
> and goto out_free, then call kmem_cache_free to release table will
> trigger KE, __get_free_pages and free_pages have similar problem,
> so add error handle for page table allocation failure.
> 
> Fixes: 29859aeb8a6ea ("iommu/io-pgtable-arm-v7s: Abort allocation when table address overflows the PTE")
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Cc: <stable@vger.kernel.org> # 5.10.*

Is this genuinely a realistic issue which distro users can hit? In 
practice, a system that can't allocate 2KB is already dead and almost 
certainly isn't coming back either way.

Still, v3 has managed to address my other review comments before I'd 
even finished writing them, so for the change itself,

Acked-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> ---
> v3: Update patch
>      1. Remove unnecessary log print as suggested by Will.
>      2. Remove unnecessary condition check.
> v2: Cc stable@vger.kernel.org
>      1. This patch needs to be merged stable branch, add stable@vger.kernel.org
>         in mail list.
>      2. There is No new code change in v2.
> 
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index bfb6acb651e5..be066c1503d3 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -246,13 +246,17 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
>   			__GFP_ZERO | ARM_V7S_TABLE_GFP_DMA, get_order(size));
>   	else if (lvl == 2)
>   		table = kmem_cache_zalloc(data->l2_tables, gfp);
> +
> +	if (!table)
> +		return NULL;
> +
>   	phys = virt_to_phys(table);
>   	if (phys != (arm_v7s_iopte)phys) {
>   		/* Doesn't fit in PTE */
>   		dev_err(dev, "Page table does not fit in PTE: %pa", &phys);
>   		goto out_free;
>   	}
> -	if (table && !cfg->coherent_walk) {
> +	if (!cfg->coherent_walk) {
>   		dma = dma_map_single(dev, table, size, DMA_TO_DEVICE);
>   		if (dma_mapping_error(dev, dma))
>   			goto out_free;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
