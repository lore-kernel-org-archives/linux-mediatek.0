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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5489C56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 16:38:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 782332083E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 16:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pNK3nG6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 782332083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYiFi7tXPpAk97opLoVJDNjU/PxdduKGY6geDU867I4=; b=pNK3nG6ZtuB6VSqop1vhuo7E8
	FlaAGYXoKkl9QdLeMPTQ1wKSvUvzhlA3RnSWOV2oD2l7opLXm47Vn6eVW6ccxhomPj0+D2HhdVDdk
	cxqfucXJ7jwxa8jvxtdtP+xMu3mZveWTfc13D/8O9G+H0uFJMbQLoT5dSguPkDG+oICvRJwzhYf9a
	zuzkigwBnwe/X8WW4X9LtPW1OcrxmxJSjQzNdbNrCd0THG7PclP6ppO//333rH4MvkgWj3D9S9Hnf
	aiMtdpDYjxTDwANlYPOdOFLViKnmrDGKFp41J2S1NUDuPRghSE5Tz3MYYqOH9bFFU5jdQFV3TMvOh
	6XGP8cOCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxoT-0003ok-DN; Wed, 25 Nov 2020 16:38:37 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxoK-0003kf-Lr; Wed, 25 Nov 2020 16:38:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47A0631B;
 Wed, 25 Nov 2020 08:38:25 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEBEA3F7BB;
 Wed, 25 Nov 2020 08:38:22 -0800 (PST)
Subject: Re: [PATCH v2 3/6] iommu/mediatek: Add iotlb_sync_map to sync whole
 the iova range
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
 <20201119061836.15238-4-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <751e08a1-d3c3-29f9-5c62-560370ac0703@arm.com>
Date: Wed, 25 Nov 2020 16:38:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119061836.15238-4-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_113828_845484_2D571E73 
X-CRM114-Status: GOOD (  20.73  )
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
> Remove IO_PGTABLE_QUIRK_TLBI_ON_MAP to avoid tlb sync for each a small
> chunk memory, Use the new iotlb_sync_map to tlb_sync once for whole the
> iova range of iommu_map.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> After reading msm_iommu.c, It looks IO_PGTABLE_QUIRK_TLBI_ON_MAP can be
> removed.
> ---
>   drivers/iommu/mtk_iommu.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index c072cee532c2..8c2d4a225666 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -323,7 +323,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
>   	dom->cfg = (struct io_pgtable_cfg) {
>   		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
>   			IO_PGTABLE_QUIRK_NO_PERMS |
> -			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
>   			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
>   		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
>   		.ias = 32,
> @@ -454,6 +453,14 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
>   				       data);
>   }
>   
> +static void mtk_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
> +			       size_t size)
> +{
> +	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +
> +	mtk_iommu_tlb_flush_range_sync(iova, size, size, dom->data);

So we have a conflict/dependency against the MT8192 series here - I 
guess we need to make a decision up-front about which series should go 
first. Other than that, though:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> +}
> +
>   static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
>   					  dma_addr_t iova)
>   {
> @@ -540,6 +547,7 @@ static const struct iommu_ops mtk_iommu_ops = {
>   	.unmap		= mtk_iommu_unmap,
>   	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
>   	.iotlb_sync	= mtk_iommu_iotlb_sync,
> +	.iotlb_sync_map	= mtk_iommu_sync_map,
>   	.iova_to_phys	= mtk_iommu_iova_to_phys,
>   	.probe_device	= mtk_iommu_probe_device,
>   	.release_device	= mtk_iommu_release_device,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
