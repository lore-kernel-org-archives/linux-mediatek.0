Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzH4jBHWhkOhCW4/a5O1AaPHowr+pAIsp/J/MtUsdAM=; b=iSb/SXotokNGj3
	/ba8AOFQgHdu2lTIIcJqlpzxJdiBmnt2iwCjhOojdjRFadDOauhQmy6BJCGog//JM0X3p3jYBMdRl
	Gq8vMGmPj9UwoOFFZH7EUbiPXrXUQpw4D7VjGjFtYG2J4gnU+1sZxOz0lTsQDCEebeFgGDICaIi80
	X0Twt0uFH0blu8Y9SE8YhKPLh2iuHca+H4eO2upDmAHjIn1vDgA71DsRog9JLPFl19RhJWa9rpGAb
	ZVnjSempIkX/Xnx7KrFoWqZ6IQVkj1y7xptQbz70oEL6mbq3BWJicRf5Uvkc9SXj3yi13aD4h4lnE
	ckkkdoACGL/cMY2kmQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqFty-007qrd-Rw; Thu, 25 Nov 2021 14:39:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqFtk-007qpx-65; Thu, 25 Nov 2021 14:38:54 +0000
X-UUID: e57c364515ee4bdf9b249ed6783445db-20211125
X-UUID: e57c364515ee4bdf9b249ed6783445db-20211125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365089008; Thu, 25 Nov 2021 07:38:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 06:38:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 25 Nov 2021 22:38:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 22:38:44 +0800
Message-ID: <aea1ed6da66c9ec8eaf8323f5b856feafc6de702.camel@mediatek.com>
Subject: Re: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table
 release flow
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
CC: "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "john.stultz@linaro.org" <john.stultz@linaro.org>, "labbott@redhat.com"
 <labbott@redhat.com>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "lmark@codeaurora.org"
 <lmark@codeaurora.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <kuan-ying.lee@mediatek.com>
Date: Thu, 25 Nov 2021 22:38:45 +0800
In-Reply-To: <20211125134951.62002-1-guangming.cao@mediatek.com>
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
 <20211125134951.62002-1-guangming.cao@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_063852_263122_76A14A10 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-11-25 at 21:49 +0800, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
> sg_table to free sg_table.
> Use (for_each_sg) maybe will casuse some pages can't be freed
> when send wrong nents number.

s/casuse/cause

> 
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> buf/heaps/system_heap.c
> index 23a7e74ef966..8660508f3684 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct
> dma_buf *dmabuf)
>  	int i;
>  
>  	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sgtable_sg(table, sg, i) {
>  		struct page *page = sg_page(sg);
>  
>  		__free_pages(page, compound_order(page));


If this is a fix, I think we should add Fixes: xxxx ("...") in the
commit message and Cc stable.

Thanks,
Kuan-Ying Lee



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
