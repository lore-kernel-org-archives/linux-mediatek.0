Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F91EC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NzI/3Svt5nKR9S5JNhOp4JyOfvczYOuXsQ/r5jRRds=; b=2LPxz6SY92NWUgMxHjoDiZZsSL
	lA0iPODpQHDFRSq6fUEtnfdaxP0efEJbpSayPB7u1D663/9DJQbOUaqnRbSNUjB+R3ASlJUkPBzzC
	OPj+CTMJPZtx+vP7fkGhMZ42P51b4Pv2lYAeFo260Bf4vMSYyuEpUPIPAO59F/O7Kxk+zfo0k4lqM
	bBa0Z6sR/RsFm3xPfecIwkUYH/RS6nCsIspRJ2rYhC7d8fH4k+KOJlf9Vo3ncSBglrHtsPMfmK7B4
	yindu2Bbc08WQBlM+BhkhNV6eJIDuUCHerSsMGqO9elSOsj+fYnhllnbshBoUxOF8iCvS4gpx6/Gm
	L2yMP36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIaSg-009M5M-Jg; Mon, 01 Aug 2022 18:48:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIaST-009Lfs-Cx; Mon, 01 Aug 2022 18:48:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAE8F139F;
	Mon,  1 Aug 2022 11:48:01 -0700 (PDT)
Received: from [10.57.10.23] (unknown [10.57.10.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EFDF3F67D;
	Mon,  1 Aug 2022 11:47:58 -0700 (PDT)
Message-ID: <15735fab-e53d-e95d-84f8-ae2e435dbb78@arm.com>
Date: Mon, 1 Aug 2022 19:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-debug: Fix overflow issue in bucket_find_contain
Content-Language: en-GB
To: yf.wang@mediatek.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 Ning Li <Ning.Li@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 jianjiao zeng <jianjiao.zeng@mediatek.com>
References: <20220730114146.32669-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220730114146.32669-1-yf.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_114805_609082_46693C51 
X-CRM114-Status: GOOD (  22.45  )
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

On 2022-07-30 12:41, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> There are two issue:
> 1. If max_rang is set to 0xFFFF_FFFF, and __hash_bucket_find always
> returns NULL, the rang will be accumulated. When rang is accumulated
> to 0xFFFF_E000, after executing rang += (1 << HASH_FN_SHIFT) again,
> rang will overflow to 0, making it impossible to exit the while loop.
> 2. dev_addr reduce maybe overflow.
> 
> So, add range and dev_addr check to avoid overflow.
> 
> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>   kernel/dma/debug.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index ad731f7858c9..9d7d54cd4c63 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -352,6 +352,7 @@ static struct dma_debug_entry *bucket_find_contain(struct hash_bucket **bucket,
>   
>   	unsigned int max_range = dma_get_max_seg_size(ref->dev);
>   	struct dma_debug_entry *entry, index = *ref;
> +	unsigned int shift = (1 << HASH_FN_SHIFT);
>   	unsigned int range = 0;
>   
>   	while (range <= max_range) {
> @@ -360,12 +361,15 @@ static struct dma_debug_entry *bucket_find_contain(struct hash_bucket **bucket,
>   		if (entry)
>   			return entry;
>   
> +		if (max_range - range < shift || index.dev_addr < shift)
> +			return NULL;

This seems a bit clunky since the first condition here effectively makes 
the loop condition redundant.

FWIW I found the whole "range" business here rather hard to make sense 
of - personally I'd calculate a lower bound for the address then just 
iterate down to that, but maybe that's just me :/

Otherwise, at the very least we should be capping max_range so that the 
loop doesn't go beyond HASH_SIZE iterations and pointlessly search the 
same buckets more than once - it's stupid to even *get* to the point of 
having to worry about that overflowing. Whether we really care about 
dev_addr underflow is then another matter.

Really it would seem even more logical to make this a lower-level 
function that can walk round the dma_entry_hash array directly and not 
have to monkey about with the fake "index" entry at all, but cleaning up 
the almost-unnecessary amount of internal abstractions here is maybe 
more work than it's worth at this point.

Robin.

> +
>   		/*
>   		 * Nothing found, go back a hash bucket
>   		 */
>   		put_hash_bucket(*bucket, *flags);
> -		range          += (1 << HASH_FN_SHIFT);
> -		index.dev_addr -= (1 << HASH_FN_SHIFT);
> +		range          += shift;
> +		index.dev_addr -= shift;
>   		*bucket = get_hash_bucket(&index, flags);
>   	}
>   

