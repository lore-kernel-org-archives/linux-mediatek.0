Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DD4C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 16:39:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00F0920715
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 16:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00F0920715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F5yurd37b+jIgEfmgaDHrwr+qDOVf7stXXqiFuJCcwo=; b=OdNQS1Y+IjIV6D57q26ahl2G5
	uCGJksFErJ9OxNI4YdBx6TUg+7bHWNFVHBVMdoXDlM3OwzC3MtdGe38MpgjvyRK9NGRhD1xjG/v91
	Y9IMhjcnsKjx+OOvKWzHtBE2cOMKl2ZiGH7a6rAJtptb6kFz8Vs0s9/cmrGtsJbbdGJiZxU6zx2k8
	pugtTu+VzKTIOTN43Y6zDpL0kisLYuv8XChgjAtGw+voQFFVgKEkTBkI8L/1GNl8j+dlvq/2dMBZ8
	foja06KUv8bHCCNA3HwNROD7xfIhoisp2TlPrkxSXlDbOhK2Ra8WCPy6jzLdTDiRxVEW+WrWoRc+Q
	XflHIGQHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1XZB-0006I0-Fx; Mon, 18 Jan 2021 16:39:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1XZ7-0006Ge-AG; Mon, 18 Jan 2021 16:39:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84EFA31B;
 Mon, 18 Jan 2021 08:39:39 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CA823F68F;
 Mon, 18 Jan 2021 08:39:36 -0800 (PST)
Subject: Re: [PATCH v3 7/7] iommu/mediatek: Remove the tlb-ops for v7s
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-8-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fb2d59a3-2187-5ae6-e88e-43c1c43e61b0@arm.com>
Date: Mon, 18 Jan 2021 16:39:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201216103607.23050-8-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_113941_479644_DEECEB39 
X-CRM114-Status: GOOD (  20.22  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-16 10:36, Yong Wu wrote:
> Until now, we have already used the tlb operations from iommu framework,
> then the tlb operations for v7s can be removed.
> 
> Correspondingly, Switch the paramenter "cookie" to internal structure.

FWIW,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 27 ++++-----------------------
>   1 file changed, 4 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 89cec51405cd..5656819cd4a1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -206,10 +206,8 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
>   	return container_of(dom, struct mtk_iommu_domain, domain);
>   }
>   
> -static void mtk_iommu_tlb_flush_all(void *cookie)
> +static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
>   {
> -	struct mtk_iommu_data *data = cookie;
> -
>   	for_each_m4u(data) {
>   		if (!pm_runtime_active(data->dev))
>   			continue;
> @@ -221,9 +219,9 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
>   }
>   
>   static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> -					   size_t granule, void *cookie)
> +					   size_t granule,
> +					   struct mtk_iommu_data *data)
>   {
> -	struct mtk_iommu_data *data = cookie;
>   	unsigned long flags;
>   	int ret;
>   	u32 tmp;
> @@ -250,7 +248,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   		if (ret) {
>   			dev_warn(data->dev,
>   				 "Partial TLB flush timed out, falling back to full flush\n");
> -			mtk_iommu_tlb_flush_all(cookie);
> +			mtk_iommu_tlb_flush_all(data);
>   		}
>   		/* Clear the CPE status */
>   		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
> @@ -258,22 +256,6 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   	}
>   }
>   
> -static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> -					    unsigned long iova, size_t granule,
> -					    void *cookie)
> -{
> -	struct mtk_iommu_data *data = cookie;
> -	struct iommu_domain *domain = &data->m4u_dom->domain;
> -
> -	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
> -}
> -
> -static const struct iommu_flush_ops mtk_iommu_flush_ops = {
> -	.tlb_flush_all = mtk_iommu_tlb_flush_all,
> -	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
> -	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
> -};
> -
>   static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
>   {
>   	struct mtk_iommu_data *data = dev_id;
> @@ -380,7 +362,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
>   		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
>   		.ias = MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN) ? 34 : 32,
>   		.oas = 35,
> -		.tlb = &mtk_iommu_flush_ops,
>   		.iommu_dev = data->dev,
>   	};
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
