Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19553C56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:56:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD822173E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sxd+j1dm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD822173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QVOMSmIZSJjXz0lHnBrXHXsdK1NvUGgxWSlY9+BmnPk=; b=Sxd+j1dmIsGZ51WE9ore2F2MW
	6ZSBRG9mwQyBD04IrkR1ElWhDuarfm1XUlgNWBOm95aGeROZrqRatPOpRHCsV8Dpd/BRzJtMlsLwh
	lgmIoeYv3figs9+jpR5/mBEZ+tdK4zZQO4iyHaUInC2/NHXc2Jx3himGZmTTs+b7dn/QP+my5pYgB
	l7/QySGuSBm8r227v+DyuMVdS2LcaQYm1O7zIakzOqLdrm329BS3kA6s36TvxwSeD9iGXh0QZ+7Th
	4IZGbKKTLEByBWAvF8yGjvpFWiYFpmvXWB3nrk87e87gSCAv6NHl/cv8juw839c8l1wFNiyino9Kl
	hAkl4UIJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVHPO-0000Cs-7b; Wed, 21 Oct 2020 16:56:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHPG-0000B1-O6; Wed, 21 Oct 2020 16:56:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 764FF31B;
 Wed, 21 Oct 2020 09:56:08 -0700 (PDT)
Received: from [10.57.50.191] (unknown [10.57.50.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B24073F719;
 Wed, 21 Oct 2020 09:56:03 -0700 (PDT)
Subject: Re: [PATCH 2/4] iommu/mediatek: Add iotlb_sync_range() support
To: Chao Hao <chao.hao@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
 <20201019113100.23661-3-chao.hao@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7fbe0305-91e4-949e-7d84-bf91e81d6b27@arm.com>
Date: Wed, 21 Oct 2020 17:55:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201019113100.23661-3-chao.hao@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_125610_870812_EECBCE2E 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-10-19 12:30, Chao Hao wrote:
> MTK_IOMMU driver writes one page entry and does tlb flush at a time
> currently. More optimal would be to aggregate the writes and flush
> BUS buffer in the end.

That's exactly what iommu_iotlb_gather_add_page() is meant to achieve. 
Rather than jumping straight into hacking up a new API to go round the 
back of the existing API design, it would be far better to ask the 
question of why that's not behaving as expected.

> For 50MB buffer mapping, if mtk_iommu driver use iotlb_sync_range()
> instead of tlb_add_range() and tlb_flush_walk/leaf(), it can increase
> 50% performance or more(depending on size of every page size) in
> comparison to flushing after each page entry update. So we prefer to
> use iotlb_sync_range() to replace iotlb_sync(), tlb_add_range() and
> tlb_flush_walk/leaf() for MTK platforms.

In the case of mapping, it sounds like what you actually want to do is 
hook up .iotlb_sync_map and generally make IO_PGTABLE_QUIRK_TLBI_ON_MAP 
cleverer, because the current implementation is as dumb as it could 
possibly be. In fact if we simply passed an address range to 
.iotlb_sync_map, io-pgtable probably wouldn't need to be involved at all 
any more.

Robin.

> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 785b228d39a6..d3400c15ff7b 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -224,6 +224,11 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   	}
>   }
>   
> +static void __mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
> +{
> +	mtk_iommu_tlb_flush_range_sync(iova, size, 0, NULL)
> +}
> +
>   static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
>   					    unsigned long iova, size_t granule,
>   					    void *cookie)
> @@ -536,6 +541,7 @@ static const struct iommu_ops mtk_iommu_ops = {
>   	.map		= mtk_iommu_map,
>   	.unmap		= mtk_iommu_unmap,
>   	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
> +	.iotlb_sync_range = __mtk_iommu_tlb_flush_range_sync,
>   	.iotlb_sync	= mtk_iommu_iotlb_sync,
>   	.iova_to_phys	= mtk_iommu_iova_to_phys,
>   	.probe_device	= mtk_iommu_probe_device,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
