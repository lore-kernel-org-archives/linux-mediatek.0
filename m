Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9343CC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 16:38:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31E22083E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 16:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i1VtlJ3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31E22083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XIytmM/zmjvXMME3LbEQysFWi42Je3qS7Hm2BPrO09w=; b=i1VtlJ3QppApYb2ainGlMF8g4
	ybhyVI37223BWmQrVp9aagl814r7ZDR+/qp2DezKLw+S8BT0wxSkmjQ1Xsc4m2i1PqWvLfYe0YqPA
	BG5EGbDq83F5l/OjObE+Mywe8YPRogXliRXVBllCNIvGq2mo+VHNMpp8keFJswzccKTOtFFTH+rP6
	zexcE7/vclF7+ijRwbla6R10cU8JsFJy+nUr5a83nKy2MNTmdWguvFeuGBmXrjaIYKJascJne+JH1
	/O80aGipL04mYQCw3IYNYaYCepN0Cn1IxgrWPXeps0TKbhq/Tb5o1c0oTT1vIEK9SkpI9aOnIP6FT
	hOO89NIsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxnw-0003cj-Er; Wed, 25 Nov 2020 16:38:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxno-0003ZR-DE; Wed, 25 Nov 2020 16:37:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 514B331B;
 Wed, 25 Nov 2020 08:37:53 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FFA53F7BB;
 Wed, 25 Nov 2020 08:37:50 -0800 (PST)
Subject: Re: [PATCH v2 1/6] iommu: Move iotlb_sync_map out from __iommu_map
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
 <20201119061836.15238-2-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cf0f81dd-e240-965b-5c75-914d3d48eb27@arm.com>
Date: Wed, 25 Nov 2020 16:37:48 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119061836.15238-2-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_113756_580027_B3DBD6F8 
X-CRM114-Status: GOOD (  22.66  )
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
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, jun.wen@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-19 06:18, Yong Wu wrote:
> In the end of __iommu_map, It alway call iotlb_sync_map.
> This patch moves iotlb_sync_map out from __iommu_map since it is
> unnecessary to call this for each sg segment especially iotlb_sync_map
> is flush tlb all currently.

I don't see a way to avoid the boilerplate that wouldn't end up making 
things even more ugly and complicated, so:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/iommu.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 8c470f451a32..decef851fa3a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2407,9 +2407,6 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
>   		size -= pgsize;
>   	}
>   
> -	if (ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> -
>   	/* unroll mapping in case something went wrong */
>   	if (ret)
>   		iommu_unmap(domain, orig_iova, orig_size - size);
> @@ -2422,15 +2419,29 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
>   int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   	      phys_addr_t paddr, size_t size, int prot)
>   {
> +	const struct iommu_ops *ops = domain->ops;
> +	int ret;
> +
>   	might_sleep();
> -	return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> +	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> +	if (ret == 0 && ops->iotlb_sync_map)
> +		ops->iotlb_sync_map(domain);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(iommu_map);
>   
>   int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
>   	      phys_addr_t paddr, size_t size, int prot)
>   {
> -	return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
> +	const struct iommu_ops *ops = domain->ops;
> +	int ret;
> +
> +	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
> +	if (ret == 0 && ops->iotlb_sync_map)
> +		ops->iotlb_sync_map(domain);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(iommu_map_atomic);
>   
> @@ -2514,6 +2525,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   			     struct scatterlist *sg, unsigned int nents, int prot,
>   			     gfp_t gfp)
>   {
> +	const struct iommu_ops *ops = domain->ops;
>   	size_t len = 0, mapped = 0;
>   	phys_addr_t start;
>   	unsigned int i = 0;
> @@ -2544,6 +2556,8 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   			sg = sg_next(sg);
>   	}
>   
> +	if (ops->iotlb_sync_map)
> +		ops->iotlb_sync_map(domain);
>   	return mapped;
>   
>   out_err:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
