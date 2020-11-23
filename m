Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6189C64EBC
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 12:33:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD5720721
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 12:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aGkaSB0X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wRhhY5oD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD5720721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uP9Wop2ihrLMz7bAqCuWfwOwBNvPRzMiN+91DYDIkFQ=; b=aGkaSB0XDSptAN5Lwiy7v/715
	RWcfgLTu5RXnQAeXQedTexzRBW46Il+lMbKdRK3eh/oqlOGUXodatucbnnCV8rS18ANGJHQsClRkj
	kOSTZrg7b6HYNUUwslLphZ2biU9fn/vq5754HiWts9vvY/BT2Hz5yPHAh2MZAZLNYyIE9a0MCaTxa
	cS+hZr/1gct8I2GGt6NnUzltprZb/kyiclFRRlgqAklXyhjoQNSNMfufsXKUITbq5F+jOOPXz61iF
	sk9zLA57dzyC8Kn/X7rK6/AQOu93LlJAPHwt5VkzyxA3xQKGjWipnahy1AlGVQD1X8S5OgDAaz7mN
	lXmmgpPGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khB1q-00081n-Oc; Mon, 23 Nov 2020 12:33:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khB1m-00080X-4c; Mon, 23 Nov 2020 12:33:07 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 769942076E;
 Mon, 23 Nov 2020 12:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606134785;
 bh=0QSv09rGW0WuAiAunEEQ7oj/27dyFGEZgt+e6cLrLtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wRhhY5oDR9O6SI4elKUy6j4JiYwRnLeUIusACXuaJrzeN9ZZiguwygT+Vh+BIK5bn
 1QQ4VhGF8+m8rzx/29h0VjrBkQpBujH/X1jgFMI76jBaK+oDdnmWyGqrWuW6MUTBOc
 5iEqZjkGYXfposO9rTtzNODSeMyzzsozvxw40LXc=
Date: Mon, 23 Nov 2020 12:32:58 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] iommu: Improve the performance for direct_mapping
Message-ID: <20201123123258.GC10233@willie-the-truck>
References: <20201120090628.6566-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120090628.6566-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_073306_325711_FE3E9E30 
X-CRM114-Status: GOOD (  25.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 05:06:28PM +0800, Yong Wu wrote:
> Currently direct_mapping always use the smallest pgsize which is SZ_4K
> normally to mapping. This is unnecessary. we could gather the size, and
> call iommu_map then, iommu_map could decide how to map better with the
> just right pgsize.
> 
> From the original comment, we should take care overlap, otherwise,
> iommu_map may return -EEXIST. In this overlap case, we should map the
> previous region before overlap firstly. then map the left part.
> 
> Each a iommu device will call this direct_mapping when its iommu
> initialize, This patch is effective to improve the boot/initialization
> time especially while it only needs level 1 mapping.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/iommu.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index df87c8e825f7..854a8fcb928d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -737,6 +737,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
>  	/* We need to consider overlapping regions for different devices */
>  	list_for_each_entry(entry, &mappings, list) {
>  		dma_addr_t start, end, addr;
> +		size_t unmapped_sz = 0;

I think "unmapped" is the wrong word here, as this variable actually
represents the amount we want to map! I suggest "map_size" instead.

>  		if (domain->ops->apply_resv_region)
>  			domain->ops->apply_resv_region(dev, domain, entry);
> @@ -752,10 +753,25 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
>  			phys_addr_t phys_addr;
>  
>  			phys_addr = iommu_iova_to_phys(domain, addr);
> -			if (phys_addr)
> +			if (phys_addr == 0) {
> +				unmapped_sz += pg_size; /* Gather the size. */
>  				continue;
> +			}
>  
> -			ret = iommu_map(domain, addr, addr, pg_size, entry->prot);
> +			if (unmapped_sz) {
> +				/* Map the region before the overlap. */
> +				ret = iommu_map(domain, start, start,
> +						unmapped_sz, entry->prot);
> +				if (ret)
> +					goto out;
> +				start += unmapped_sz;

I think it's a bit confusing to update start like this. Can we call
iommu_map(domain, addr - map_size, addr - map_size, map_size, entry->prot)
instead?

> +				unmapped_sz = 0;
> +			}
> +			start += pg_size;
> +		}
> +		if (unmapped_sz) {
> +			ret = iommu_map(domain, start, start, unmapped_sz,
> +					entry->prot);

Can you avoid this hunk by changing your loop check to something like:

	if (!phys_addr) {
		map_size += pg_size;
		if (addr + pg_size < end)
			continue;
	}

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
