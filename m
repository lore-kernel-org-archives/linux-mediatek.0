Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7294DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsjAMKYu9QO6Aya5UVheeBrX0TmKLqokWFq5IxZWqIg=; b=C5IRm6skSejLxm
	Z8FWXCOVQFOAXxmYi25DC2c9q3/R2H75jkJqAqux+XAMaT2zOFUInVWL2HJYNLqmCZFu+DVTaZ5d1
	tsro0DAAMkyScSLtNfNF4WLkKNxA39Fv6Qj4ZycMKA/mPch56o4vd7k183HQyopmJS0hp5QmwBUVD
	WvBkY+d5A+nvr2cOBkXJABgZz25a8KVO8uUv7PcJZ5QFwYZy6cAJPfDBXm/lC3BprKiRUbmUCb0TQ
	NaZGV2n2J6EXGC1moC+g8cxBc0AqBzrrn2LtJm5tN3nUImSI8SNiBNdUJ8TgIfnC+7M2rQAbG1p3t
	SWaTBm3xYh7c0RQraacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqEo1-007f76-7o; Thu, 25 Nov 2021 13:28:53 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqEnn-007f2z-0X; Thu, 25 Nov 2021 13:28:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22A2E1FB;
 Thu, 25 Nov 2021 05:28:37 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3E993F66F;
 Thu, 25 Nov 2021 05:28:34 -0800 (PST)
Message-ID: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
Date: Thu, 25 Nov 2021 13:28:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] dma_heap: use sg_table.orig_nents in sg_table release flow
Content-Language: en-GB
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com
References: <20211125124626.60068-1-guangming.cao@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211125124626.60068-1-guangming.cao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_052839_155363_D30037C9 
X-CRM114-Status: GOOD (  13.07  )
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

On 2021-11-25 12:46, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (sg_table.orig_nents) rather than (sg_table.nents) to traverse
> sg_table to free sg_table.
> Use (sg_table.nents) maybe will casuse some pages can't be freed.

...and this sort of bug is precisely why we have the 
for_each_sgtable_sg() helper ;)

Robin.

> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/heaps/system_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..ce10d4eb674c 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>   	int i;
>   
>   	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sg(table->sgl, sg, table->orig_nents, i) {
>   		struct page *page = sg_page(sg);
>   
>   		__free_pages(page, compound_order(page));
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
