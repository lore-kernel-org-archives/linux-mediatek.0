Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA61FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q93MGBlrZBOjeHWyeHS4Gb0EPpXO9K6GJmKaHh1Su0=; b=SDzwWor1OSWkUB
	hy0m1lj6kVwJionxh2qLVgW5bQBVTwHOtu6PHMbloJZEn6oiqUIyVHnPPuILgp74GzynyWbuDqsZj
	Q/AGGqs/I/e7MWlWEokXUCqFtcy+uw2H9DzuMoO9iPVSacX5yTULc9LCCmc1h4D3SS+YpmbTYgNws
	KQ84WkusljpK2ai+D28HUoRZOLA5O922ko0wU7oXIvalr3feW0Ukdw2+eb2pGIBqcCNXZhnhMDCnn
	QPxDRT27HnFDIbqKhU44y3TWukFOCPnELboN5V4rD+fqPX4bvFrM+8eyXZ+cx9D+gCX+Z9DFHgigQ
	XkjK85AJR/bqy5ZF0ftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ8Wy-00AOUx-9N; Fri, 04 Mar 2022 14:03:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ8Wk-00AOR2-NB; Fri, 04 Mar 2022 14:03:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7893E1424;
 Fri,  4 Mar 2022 06:03:25 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E423F70D;
 Fri,  4 Mar 2022 06:03:23 -0800 (PST)
Message-ID: <906a446e-3e25-5813-d380-de699a84b6f4@arm.com>
Date: Fri, 4 Mar 2022 14:03:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] iommu/iova: Free all CPU rcache for retry when iova alloc
 failure
Content-Language: en-GB
To: yf.wang@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 stable@vger.kernel.org, Ning Li <Ning.Li@mediatek.com>
References: <20220304044635.4273-1-yf.wang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220304044635.4273-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_060326_839731_C8DCBD8E 
X-CRM114-Status: GOOD (  18.40  )
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

On 2022-03-04 04:46, yf.wang--- via iommu wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> In alloc_iova_fast function, if an iova alloc request fail,
> it will free the iova ranges present in the percpu iova
> rcaches and free global iova rcache and then retry, but
> flushing CPU iova rcaches only for each online CPU, which
> will cause incomplete rcache cleaning, and iova rcaches of
> not online CPU cannot be flushed, because iova rcaches may
> also lead to fragmentation of iova space, so the next retry
> action may still be fail.
> 
> Based on the above, so need to flushing all iova rcaches
> for each possible CPU, use for_each_possible_cpu instead of
> for_each_online_cpu like in free_iova_rcaches function,
> so that all rcaches can be completely released to try
> replenishing IOVAs.

OK, so either there's a mystery bug where IOVAs somehow get freed on 
offline CPUs, or the hotplug notifier isn't working correctly, or you've 
contrived a situation where alloc_iova_fast() is actually racing against 
iova_cpuhp_dead(). In the latter case, the solution is "don't do that".

This change should not be necessary.

Thanks,
Robin.

> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Cc: <stable@vger.kernel.org> # 5.4.*
> ---
>   drivers/iommu/iova.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index b28c9435b898..5a0637cd7bc2 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -460,7 +460,7 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
>   
>   		/* Try replenishing IOVAs by flushing rcache. */
>   		flush_rcache = false;
> -		for_each_online_cpu(cpu)
> +		for_each_possible_cpu(cpu)
>   			free_cpu_cached_iovas(cpu, iovad);
>   		free_global_cached_iovas(iovad);
>   		goto retry;
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
