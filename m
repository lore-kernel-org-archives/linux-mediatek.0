Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8733CA9EB6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 16:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC38821906
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 16:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ks1OeBFY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6EnkV+N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC38821906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMH18q5p9zWlAitpwb9CaOIm9B3kBWZfsCARVeABUgQ=; b=Ks1OeBFYRuqpZW
	anR93T+CFtzF/1F1jUh9FAwC2xbPNW9HGl14KXoM8nxLS8TQY33LubfImpCpkYWczX+BgipOBCixu
	drG2SVYxLLmHZd+uES+r36LTkmKrt4V1pk/aUZSSxtx8kqPxaJl1FpB8n9+7++vgXcTn/t/ktbt1u
	SUBHVvt9OOvtwa7/8eCJg/dHK7CHZCeEdZIdiAY8XQ5SgDAvJlrpyQUeJt0pohB/T5JOXtUEf8DRa
	NTBmReI88+TR/ojvf7LI01/3/KPE+zffH2gdusZGreibHJ2oSPHtA/kyNOmQUFQgJ7egB3lXaFuZh
	pPlNnBUSvsHJulXnsMXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNJvZ-0002I4-86; Wed, 23 Oct 2019 16:56:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNJvK-000241-D1; Wed, 23 Oct 2019 16:55:51 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 255AC21906;
 Wed, 23 Oct 2019 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571849750;
 bh=VPyPC4LePKk7uWBltRmK/Fded+OjFkz/1MBUzjK69yE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F6EnkV+NncnzhwMOW6V6hkw45lZgsqg3/2TZtCGHZozEzQIq3KdMfSDzhP1HG7DEk
 M7mlDDT1+IBGeBeN7wjqNdxT1gyRg8gcrMld2vzIAOeKMgU6M5qaR4w4RXQRM3f8MR
 nDVUOk8sxVo9dbcnWMOHzMooezkVxez8zgQU2eWs=
Date: Wed, 23 Oct 2019 17:55:44 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 3/7] iommu/mediatek: Use gather to achieve the tlb
 range flush
Message-ID: <20191023165543.GB27471@willie-the-truck>
References: <1571196792-12382-1-git-send-email-yong.wu@mediatek.com>
 <1571196792-12382-4-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571196792-12382-4-git-send-email-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_095550_463317_5B80A7B8 
X-CRM114-Status: GOOD (  14.53  )
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
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, edison.hsieh@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 11:33:08AM +0800, Yong Wu wrote:
> Use the iommu_gather mechanism to achieve the tlb range flush.
> Gather the iova range in the "tlb_add_page", then flush the merged iova
> range in iotlb_sync.
> 
> Suggested-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index c2f6c78..81ac95f 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -245,11 +245,9 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
>  					    void *cookie)
>  {
>  	struct mtk_iommu_data *data = cookie;
> -	unsigned long flags;
> +	struct iommu_domain *domain = &data->m4u_dom->domain;
>  
> -	spin_lock_irqsave(&data->tlb_lock, flags);
> -	mtk_iommu_tlb_add_flush_nosync(iova, granule, granule, true, cookie);
> -	spin_unlock_irqrestore(&data->tlb_lock, flags);
> +	iommu_iotlb_gather_add_page(domain, gather, iova, granule);

You need to be careful here, because iommu_iotlb_gather_add_page() can
call iommu_tlb_sync() in some situations and you don't hold the lock.

>  static const struct iommu_flush_ops mtk_iommu_flush_ops = {
> @@ -469,9 +467,15 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
>  				 struct iommu_iotlb_gather *gather)
>  {
>  	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
> +	size_t length = gather->end - gather->start;
>  	unsigned long flags;
>  
> +	if (gather->start == ULONG_MAX)
> +		return;
> +
>  	spin_lock_irqsave(&data->tlb_lock, flags);
> +	mtk_iommu_tlb_add_flush_nosync(gather->start, length, gather->pgsize,
> +				       false, data);
>  	mtk_iommu_tlb_sync(data);
>  	spin_unlock_irqrestore(&data->tlb_lock, flags);

Modulo my comment above, this fixes my previous comment. Given that mainline
is already broken, I guess the runtime bisectability isn't a problem.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
