Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807E2C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0me5G25Y1yTMJN5H2bnqDaIoBcVPcs4I++oQ9B34G1U=; b=AKXX3QFbn+ocRmsG4EpqOdDIfH
	JmorAS4bHE/S3VuTq8rwmBTigAk3tk7NhdqgEYG5LE0zlUvsQb+u0lLrbtKRdm9f8htJbAdjJ6Rah
	5JJ8yYOunhE1aSBgw/9v0Zubr+NBK+cGpKRZssf7uJoO5fJW9vd0kRNNDperfelpLEGIywLRdbFE5
	llKLR2B3L7EfJsU7/CYPWirXUIy8FVBPuQoJ4hDud+95NyymG5lsbgiQHFru86ha6gTbCfjNx9qJL
	OfEz4MpP9vdB3Eej2iiAxnJZ12a+Ib2kj12efLvCJyokQ05PqqoVS3GTTIYyEhKEueQez1dWgOfDf
	K4GFoAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRoGr-00AnFd-38;
	Mon, 22 Jan 2024 06:59:01 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRoGn-00AnC8-1g;
	Mon, 22 Jan 2024 06:58:59 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0W.3HVKO_1705906727;
Received: from 30.97.48.66(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W.3HVKO_1705906727)
          by smtp.aliyun-inc.com;
          Mon, 22 Jan 2024 14:58:48 +0800
Message-ID: <8583a965-82ae-42fe-b22a-e84ddda11ae5@linux.alibaba.com>
Date: Mon, 22 Jan 2024 14:59:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/compaction: add check mechanism to avoid cma alloc
 fail
To: Haiqiang Gong <Haiqiang.Gong@mediatek.com>, linux-kernel@vger.kernel.org
Cc: mike.zhang@mediatek.com, Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240122022317.30091-1-Haiqiang.Gong@mediatek.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240122022317.30091-1-Haiqiang.Gong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_225858_072485_5975E4A3 
X-CRM114-Status: GOOD (  24.40  )
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


On 1/22/2024 10:23 AM, Haiqiang Gong wrote:
> cma alloc may fail when we doing cma alloc/free test on kernel 5.10/5.15.

Do you have a real use case for the cma alloc issue? And have you tried 
it on the new kernel?

> We found that the next memory cannot be migrated because of the alloc of
> fs as next backtrace:
> __alloc_pages_nodemask
> pagecache_get_page
> grow_dev_page
> __getblk_gfp
> ext4_sb_breadahead_unmovable
> __ext4_get_inode_loc
> __ext4_iget
> ext4_lookup
> __lookup_slow
> walk_component
> path_lookupat
> filename_lookup
> vfs_statx
> This kind of unmovable memory is not placed in the cma buffer when kernel
> memory alloc but is migrated in by kcompactd when the kernel migration.
> It will cause memory can't be migrate when cma alloc.

Why the CMA memory can not be migrated? Could you describe in more 
detail the reasons for the CMA memory migration failure?

> Add check mechanism in the compaction_alloc() where kcompaced alloc for
> memory. Will return NULL and give up this memory migration if the
> allocated memory is in the cma buffer and the memory is unmovable.
> 
> Signed-off-by: Haiqiang Gong <Haiqiang.Gong@mediatek.com>
> ---
>   mm/compaction.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 27ada42924d5..29c0661adc22 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -25,6 +25,11 @@
>   #include <linux/psi.h>
>   #include "internal.h"
>   
> +#ifdef CONFIG_CMA
> +#include <linux/cma.h>
> +#include "cma.h"
> +#endif
> +
>   #ifdef CONFIG_COMPACTION
>   /*
>    * Fragmentation score check interval for proactive compaction purposes.
> @@ -1758,6 +1763,33 @@ static void isolate_freepages(struct compact_control *cc)
>   	split_map_pages(freelist);
>   }
>   
> +#ifdef CONFIG_CMA
> +static bool is_in_cma_range(struct folio *folio)
> +{
> +	int i;
> +	unsigned long pfn = 0;
> +	struct page *page = folio_page(folio, 0);
> +
> +	pfn = page_to_pfn(page);
> +	for (i = 0; i < cma_area_count; i++) {
> +		struct cma *cma = &cma_areas[i];
> +
> +		if (cma->base_pfn <= pfn && (cma->base_pfn + cma->count) > pfn)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool forbid_move_to_cma_range(struct folio *src, struct folio *dst)
> +{
> +	if (folio_mapping(src) && is_in_cma_range(dst))
> +		return true;
> +
> +	return false;
> +}
> +#endif
> +
>   /*
>    * This is a migrate-callback that "allocates" freepages by taking pages
>    * from the isolated freelists in the block we are migrating to.
> @@ -1775,6 +1807,12 @@ static struct folio *compaction_alloc(struct folio *src, unsigned long data)
>   	}
>   
>   	dst = list_entry(cc->freepages.next, struct folio, lru);
> +#ifdef CONFIG_CMA
> +	if (forbid_move_to_cma_range(src, dst)) {
> +		pr_notice("kcompactd: could not move non-cma memory to cma buffer\n");
> +		return NULL;
> +	}
> +#endif
>   	list_del(&dst->lru);
>   	cc->nr_freepages--;
>   

