Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2CEC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCCFmN/TrnXksC8NDo6RdczkIJnuvoOy3ov6xvWc8xw=; b=hbuZqludmMFKmLmZyFMNZT2H3v
	E1QP1eAEIrdBhykI+UbzrX0qOgEfUS+0AIPh81EY11kd64p6HySPLnfKmrRn9sddQzF8K1jSAcO4h
	SGuofQ4Xx32lv9A+VK6k9g3j8AkXzVsX/zxlR7Ixdi5BhpftO5YrhtMRqRvT4FjwRrvQKF1J4jftT
	M2G27ARj5kuitTzNS1twMibBW+bTTl36nDcMs7SvPW52uU9fS4yoFrpDJfd/RGnnf+qbA5C5B2fqp
	QgofqanEWTJZwGkrOsKTsNaMv6Ph9qwCMWq2kFHRMBbfdU8Vh20vBIGtWdFs3p3wPC/iM3kxPNqSt
	MIvhMXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFt6Y-00GlEg-34;
	Wed, 20 Dec 2023 09:43:06 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFt6U-00GlDg-2J;
	Wed, 20 Dec 2023 09:43:04 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VyttMeo_1703065374;
Received: from 30.97.48.56(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VyttMeo_1703065374)
          by smtp.aliyun-inc.com;
          Wed, 20 Dec 2023 17:42:55 +0800
Message-ID: <7ec7bbfd-41db-4a62-b58a-315ad244c0aa@linux.alibaba.com>
Date: Wed, 20 Dec 2023 17:43:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: page_alloc: remove duplication of free_one_page()
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: casper.li@mediatek.com, chinwen.chang@mediatek.com,
 qun-wei.lin@mediatek.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231220074757.3656-1-Kuan-Ying.Lee@mediatek.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231220074757.3656-1-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_014303_089800_B6237010 
X-CRM114-Status: GOOD (  11.84  )
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

Hi,

On 12/20/2023 3:47 PM, Kuan-Ying Lee wrote:
> Remove duplication of free_one_page().
> 
> Cc: Casper Li <casper.li@mediatek.com>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Just FYI:
There is already a same patch submitted, see: 
https://lore.kernel.org/all/20231216030503.2126130-1-yajun.deng@linux.dev/T/#u

> ---
>   mm/page_alloc.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 2f646773a934..f46af8616cac 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1262,7 +1262,6 @@ static void free_one_page(struct zone *zone,
>   static void __free_pages_ok(struct page *page, unsigned int order,
>   			    fpi_t fpi_flags)
>   {
> -	unsigned long flags;
>   	int migratetype;
>   	unsigned long pfn = page_to_pfn(page);
>   	struct zone *zone = page_zone(page);
> @@ -1277,13 +1276,7 @@ static void __free_pages_ok(struct page *page, unsigned int order,
>   	 */
>   	migratetype = get_pfnblock_migratetype(page, pfn);
>   
> -	spin_lock_irqsave(&zone->lock, flags);
> -	if (unlikely(has_isolate_pageblock(zone) ||
> -		is_migrate_isolate(migratetype))) {
> -		migratetype = get_pfnblock_migratetype(page, pfn);
> -	}
> -	__free_one_page(page, pfn, zone, order, migratetype, fpi_flags);
> -	spin_unlock_irqrestore(&zone->lock, flags);
> +	free_one_page(zone, page, pfn, order, migratetype, fpi_flags);
>   
>   	__count_vm_events(PGFREE, 1 << order);
>   }

