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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D7CC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 16:38:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938592083E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 16:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snXcayl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 938592083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6RvIswWeUAQBuzKZe9lz4Ar4YK5EEPew3r6nmLbQlhs=; b=snXcayl6IhPSpHyYl6fo3t1rA
	LBAEv/JtpbTSR/+BZFkcGfh/S2Jqtox8HLqPetFDfbMDnLinvdghzGDF3WZYkZ9ODZgcTvEFFS8gC
	QaytI/3MikN4Az2z1sQtR5KLGxioTfVMXExWCd3Yxg2QBykkC4QrZiZS25O/vQ2fmIrwY6pX1uUCa
	K4iNgSgEef1k5RkgR6NwjbgdK1Fhfbn1J3aLSntYmldWJkp+Yhfn8vX2IEwLuQq9FP1BHx2YFZVU/
	BXzlqeXrqmPKnDESwm5gsC71Lln2A5GqjQCYd+ZcmkMwGpnKf/9LkPg39wLxkYbqUsGVGLZG97iJH
	EjMXtgc6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxoF-0003ii-0f; Wed, 25 Nov 2020 16:38:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxo5-0003fN-6D; Wed, 25 Nov 2020 16:38:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B928F31B;
 Wed, 25 Nov 2020 08:38:11 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E283F7BB;
 Wed, 25 Nov 2020 08:38:09 -0800 (PST)
Subject: Re: [PATCH v2 2/6] iommu: Add iova and size as parameters in
 iommu_iotlb_map
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
 <20201119061836.15238-3-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a8ae45e0-d384-c87e-946a-1c36bf889f84@arm.com>
Date: Wed, 25 Nov 2020 16:38:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119061836.15238-3-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_113813_974638_283C630A 
X-CRM114-Status: GOOD (  20.94  )
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
> iotlb_sync_map allow IOMMU drivers tlb sync after completing the whole
> mapping. This patch adds iova and size as the parameters in it. then the
> IOMMU driver could flush tlb with the whole range once after iova mapping
> to improve performance.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/iommu.c      | 6 +++---
>   drivers/iommu/tegra-gart.c | 3 ++-
>   include/linux/iommu.h      | 3 ++-
>   3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index decef851fa3a..df87c8e825f7 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2425,7 +2425,7 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   	might_sleep();
>   	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
>   	if (ret == 0 && ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, size);
>   
>   	return ret;
>   }
> @@ -2439,7 +2439,7 @@ int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
>   
>   	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
>   	if (ret == 0 && ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, size);
>   
>   	return ret;
>   }
> @@ -2557,7 +2557,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   	}
>   
>   	if (ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, mapped);
>   	return mapped;
>   
>   out_err:
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index fac720273889..d15d13a98ed1 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -261,7 +261,8 @@ static int gart_iommu_of_xlate(struct device *dev,
>   	return 0;
>   }
>   
> -static void gart_iommu_sync_map(struct iommu_domain *domain)
> +static void gart_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
> +				size_t size)
>   {
>   	FLUSH_GART_REGS(gart_handle);
>   }
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index b95a6f8db6ff..794d4085edd3 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -244,7 +244,8 @@ struct iommu_ops {
>   	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
>   		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
>   	void (*flush_iotlb_all)(struct iommu_domain *domain);
> -	void (*iotlb_sync_map)(struct iommu_domain *domain);
> +	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
> +			       size_t size);
>   	void (*iotlb_sync)(struct iommu_domain *domain,
>   			   struct iommu_iotlb_gather *iotlb_gather);
>   	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
