Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD82C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9kvkMNQZJfKKvQK7tDUoS0xH9UH3Y8tmXhj9jq8e5k=; b=mpfTR776F08ukj
	fZbINFtCnU0bES64+zYP+7KlFy0PqLc9k6PSlbCdGpne8voII/eEqJKfstc+Go8zOR7rpt3hkqblF
	yTqhXo673o5zUjcDCuHZbHmwF35RJUPpkiWL59SLYfl1z1L1cSt02dYI4xqni96Fv9GYeTNYubtR5
	/L3Cw/TS6S7Lh/ws5no7ezuevoa4LJqdPt/QPNYICfvShsBLEPjq7Vt4Jenxhl94rDXMftdo9FbzC
	W6JIOeiQnHLjXxSEFB7twK2ijbCRsvSjWGjCct3kV5RffDnvJZ+Na3IHbjlRboTY6KuwmaC7QpjNP
	Zsb8epP/+k0aY4cZXgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqFQE-007lja-II; Thu, 25 Nov 2021 14:08:22 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqFQ0-007ley-GZ; Thu, 25 Nov 2021 14:08:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26E6A1FB;
 Thu, 25 Nov 2021 06:08:07 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 777393F66F;
 Thu, 25 Nov 2021 06:08:04 -0800 (PST)
Message-ID: <eb6cc56d-cbe0-73d5-d4f5-0aa2b76272a4@arm.com>
Date: Thu, 25 Nov 2021 14:08:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table release
 flow
Content-Language: en-GB
To: guangming.cao@mediatek.com
Cc: Brian.Starkey@arm.com, benjamin.gaignard@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 john.stultz@linaro.org, labbott@redhat.com, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lmark@codeaurora.org, matthias.bgg@gmail.com, sumit.semwal@linaro.org,
 wsd_upstream@mediatek.com
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
 <20211125134951.62002-1-guangming.cao@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211125134951.62002-1-guangming.cao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_060808_633425_1C732F31 
X-CRM114-Status: GOOD (  15.03  )
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

On 2021-11-25 13:49, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
> sg_table to free sg_table.
> Use (for_each_sg) maybe will casuse some pages can't be freed
> when send wrong nents number.

It's still worth spelling out that this is fixing a bug where the 
current code should have been using table->orig_nents - it's just that 
switching to the sgtable helper is the best way to make the fix, since 
it almost entirely removes the possibility of making that (previously 
rather common) mistake.

If it helps, for the change itself:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/heaps/system_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..8660508f3684 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>   	int i;
>   
>   	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sgtable_sg(table, sg, i) {
>   		struct page *page = sg_page(sg);
>   
>   		__free_pages(page, compound_order(page));
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
