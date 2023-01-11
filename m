Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B155C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOgbzEn3kTlo8t1d+qHc1uVXnLml6p855i7Aw77M5aQ=; b=aClVP4MtURZVQmD7st8tpQKPgz
	NJeEr7yuQhBMLoPSUNIGz1+1C3dyREuRU3bTjNJS288c8f3Y8Tsg6LY6Ub6GktybDKFKhrjwx5lwl
	TyfFUizaOlnVb0CYZHJI6a9hbPmrnJpvXqeOSWuIwTkelw70mPM27h5vWRZ1TD8ATmjrq8EuUZ0TB
	l0eE5EMrAqtwZVXdIHJ+B5P4XB2//HazJamFlI89IysBvl/t7IxzkqlzKPLPPEojiBLYiXdDZ6wK3
	yW8cuxCsGacT0MlVm0/ayxaUTbvqjbtdTbimH6vw7KwccHlKATYnLuv2ZsXBGHfPf/PINhK0BZZ49
	1qbFLj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZx8-00BCy3-D7; Wed, 11 Jan 2023 12:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZwq-00BCre-92; Wed, 11 Jan 2023 12:11:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1F2BFEC;
	Wed, 11 Jan 2023 04:11:53 -0800 (PST)
Received: from [10.57.68.138] (unknown [10.57.68.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7D313F71A;
	Wed, 11 Jan 2023 04:11:09 -0800 (PST)
Message-ID: <02f259fe-1c6f-834b-c29d-aaf2a0595adb@arm.com>
Date: Wed, 11 Jan 2023 12:11:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] iommu/iova: Fix alloc iova overflows issue
Content-Language: en-GB
To: yf.wang@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:IOMMU DMA-API LAYER" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com, stable@vger.kernel.org,
 Libo Kang <Libo.Kang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Ning Li <Ning.Li@mediatek.com>, jianjiao zeng <jianjiao.zeng@mediatek.com>
References: <20230111063801.25107-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230111063801.25107-1-yf.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_041116_438638_AEC2D2EA 
X-CRM114-Status: GOOD (  24.64  )
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

On 2023-01-11 06:38, yf.wang@mediatek.com wrote:
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
> Example log as follows:
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
> After judging that retry_pfn is less than limit_pfn, call retry_pfn+1
> to fix the overflow issue.
> 
> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Cc: <stable@vger.kernel.org> # 5.15.*

Fixes: 4e89dce72521 ("iommu/iova: Retry from last rb tree node if iova search fails")

Acked-by: Robin Murphy <robin.murphy@arm.com>

> ---
> v2: Update patch
>      1. Cc stable@vger.kernel.org
>         This patch needs to be merged stable branch,
>         add stable@vger.kernel.org in mail list.
>      2. Refer robin's suggestion to update patch.
> 
> ---
>   drivers/iommu/iova.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index a44ad92fc5eb..fe452ce46642 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -197,7 +197,7 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   
>   	curr = __get_cached_rbnode(iovad, limit_pfn);
>   	curr_iova = to_iova(curr);
> -	retry_pfn = curr_iova->pfn_hi + 1;
> +	retry_pfn = curr_iova->pfn_hi;
>   
>   retry:
>   	do {
> @@ -211,7 +211,7 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   	if (high_pfn < size || new_pfn < low_pfn) {
>   		if (low_pfn == iovad->start_pfn && retry_pfn < limit_pfn) {
>   			high_pfn = limit_pfn;
> -			low_pfn = retry_pfn;
> +			low_pfn = retry_pfn + 1;
>   			curr = iova_find_limit(iovad, limit_pfn);
>   			curr_iova = to_iova(curr);
>   			goto retry;

