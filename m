Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86065C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKFbA8AvNLUbD9SlLtpfgdOrCFfAN9VF5LfTSQYu8Lo=; b=0wqotltjBxboubCuapWLUWb+tq
	h9yG9C4jd427JmXeN0D+oHcGXiTi8vZk1OPSNipotmIJzI5Tft+pEf0N4GRKEBy7vRaRpzdmC/5qz
	7//yNOrDdlb1HG71Qvudt9IkwhwAst8RA+ZlsiZunFYazIk7tx6kv1cJqTMjgNABhmaC4o6zuiQWl
	UzsJ1JrBowDa+4wEmUozVSL/o/xW/oNuqpX7olUXoO5Go0RtuZog+t+9v3/lzO+Pj4e0QD25lH+KA
	ayj10Fw6wxJXK38YY/KJLk42Tfu65jOdomLswjaztfFDyL0YeF4vTRUSD4fueBLRt679Rv54thD4+
	D0s1QBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNxi-0000000A6ji-1k4N;
	Wed, 13 Mar 2024 12:44:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNxe-0000000A6i9-3Rmo;
	Wed, 13 Mar 2024 12:44:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAE661007;
	Wed, 13 Mar 2024 05:44:33 -0700 (PDT)
Received: from [10.57.52.245] (unknown [10.57.52.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E38D53F762;
	Wed, 13 Mar 2024 05:43:54 -0700 (PDT)
Message-ID: <6b2fa7af-0fef-4c18-a6ff-1bf4ea16810f@arm.com>
Date: Wed, 13 Mar 2024 12:43:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] direct-dma: WARN_ON_ONCE when the page is not addressable
 by device's coherent_dma_mask
Content-Language: en-GB
To: John Hsu <john.hsu@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: surenb@google.com, Chinwen Chang <chinwen.change@mediatek.com>,
 Casper Li <casper.li@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240313121933.15839-1-john.hsu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20240313121933.15839-1-john.hsu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_054358_993804_AEF42DF8 
X-CRM114-Status: GOOD (  18.38  )
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

On 2024-03-13 12:19 pm, John Hsu wrote:
> From: JohnHsu <john.hsu@mediatek.com>
> 
> The dma_direct_alloc() may return null in some cases. For example, the
> allocated page is not addressable for the device's coherent_dma_mask,
> and the allocated page will be assigned to null.
> 
> This patch can WARN_ON_ONCE() when the returned page is null in
> dma_direct_alloc. It helps the developers position the root cause of
> allocation failure rapidly.

No. Failure to allocate a buffer can happen for any number of reasons, 
it is not specific to dma-direct, and in some cases it is even expected, 
hence why DMA_ATTR_NO_WARN exists. And either way it's still not a 
condition worthy of panicking when panic_on_warn is in use.

Sure, this may well be a handy development hack for debugging a 
particular driver which isn't handling failure correctly, but it is not 
suitable for mainline.

Thanks,
Robin.

> Signed-off-by: JohnHsu <john.hsu@mediatek.com>
> ---
>   kernel/dma/direct.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 9596ae1aa0da..a73b8ad1ef9e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -156,6 +156,8 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>   		}
>   	}
>   
> +	WARN_ON_ONCE(!page);
> +
>   	return page;
>   }
>   

