Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A74FC54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqbAP5cT/b+ExiWVRO6du893kKfiO3WpvTJA30o7nN8=; b=aZg+eqgeFRV2jpeSLfmSnSttZ8
	I+N0g4V7BNn1TDGk9GvdcnyQRTib1xtf0D6GfP0Jdt3B8IfiT0FhVI7FBomCl+vy7D7A6R5yQIloM
	5Eu3d1WQqxIC0NDmkxzwktb8WQuDxRmyWK/6AkvlqcGe0kEVR7kF6AKEaTssvvaPLRdBTTxL5QHmU
	HUpJHAuf+P5752yl+0Dt164BUFch+tm2KP1uxtxEtcPS6vOOMSTsTHjtUXoeMQzs7+JBbJ7gnFr0h
	av9ykCcvEXWlcEfqFR+Suf6nZuMLNq+cqSHUlSvbqLRYB8YSdjq+zX6McDrmu+5g7OJFnt7oupphi
	F4PcbAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqf4-0015Y0-14; Mon, 09 Jan 2023 11:49:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqcx-00152r-0c; Mon, 09 Jan 2023 11:47:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A5D51042;
	Mon,  9 Jan 2023 03:48:12 -0800 (PST)
Received: from [10.57.77.32] (unknown [10.57.77.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8F9E3F67D;
	Mon,  9 Jan 2023 03:47:28 -0800 (PST)
Message-ID: <99695d77-e54f-3270-ee9a-9b3cbb3296e5@arm.com>
Date: Mon, 9 Jan 2023 11:47:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] iommu/iova: Fix alloc iova overflows issue
Content-Language: en-GB
To: yf.wang@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:IOMMU DMA-API LAYER" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Ning Li <Ning.Li@mediatek.com>,
 jianjiao zeng <jianjiao.zeng@mediatek.com>
References: <20230109083429.25622-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230109083429.25622-1-yf.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_034743_187237_8C72D723 
X-CRM114-Status: GOOD (  23.95  )
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

On 2023-01-09 08:34, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> In __alloc_and_insert_iova_range, there is an issue that retry_pfn
> overflows. The value of iovad->anchor.pfn_hi is ~0UL, then when
> iovad->cached_node is iovad->anchor, curr_iova->pfn_hi + 1 will
> overflow. As a result, if the retry logic is executed, low_pfn is
> updated to 0, and then new_pfn < low_pfn returns false to make the
> allocation successful.
> 
> This issue occurs in the following two situations:
> 1. The first iova size exceeds the domain size. When initializing
> iova domain, iovad->cached_node is assigned as iovad->anchor. For
> example, the iova domain size is 10M, start_pfn is 0x1_F000_0000,
> and the iova size allocated for the first time is 11M. The
> following is the log information, new->pfn_lo is smaller than
> iovad->cached_node.
> 
> Example log:
> [  223.798112][T1705487] sh: [name:iova&]__alloc_and_insert_iova_range
> start_pfn:0x1f0000,retry_pfn:0x0,size:0xb00,limit_pfn:0x1f0a00
> [  223.799590][T1705487] sh: [name:iova&]__alloc_and_insert_iova_range
> success start_pfn:0x1f0000,new->pfn_lo:0x1efe00,new->pfn_hi:0x1f08ff
> 
> 2. The node with the largest iova->pfn_lo value in the iova domain
> is deleted, iovad->cached_node will be updated to iovad->anchor,
> and then the alloc iova size exceeds the maximum iova size that can
> be allocated in the domain.
> 
> Adding judgment that retry_pfn must be greater than iovad->start_pfn
> can fix this issue.

Hmm, indeed that's a sneaky little bug - thanks for the thorough 
analysis - but couldn't we avoid the overflow entirely? I don't have the 
complete logic paged in, but superficially it seems like:

	retry_pfn = curr_iova->pfn_hi;
	...
		retry_pfn <= limit_pfn
	...
		low_pfn = retry_pfn + 1;

should still work, shouldn't it?

Thanks,
Robin.

> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>   drivers/iommu/iova.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index a44ad92fc5eb..0073206c2a95 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -209,7 +209,8 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   	} while (curr && new_pfn <= curr_iova->pfn_hi && new_pfn >= low_pfn);
>   
>   	if (high_pfn < size || new_pfn < low_pfn) {
> -		if (low_pfn == iovad->start_pfn && retry_pfn < limit_pfn) {
> +		if (low_pfn == iovad->start_pfn &&
> +		    retry_pfn >= iovad->start_pfn && retry_pfn < limit_pfn) {
>   			high_pfn = limit_pfn;
>   			low_pfn = retry_pfn;
>   			curr = iova_find_limit(iovad, limit_pfn);

