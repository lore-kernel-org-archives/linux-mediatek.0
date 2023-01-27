Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE43BC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqLCc5IPTSltWSm/SKiSRp8yeQJfAbTs7woZ5s5N8gA=; b=VH50znRo5EOizyanqXpO3PMyTw
	UAI660QA7m83szdibZJX/Y7msYW1Ag6HTGoxTUwfPEO7N4AceRDZcHaFnB+phdLvkDW/+2nJ+QfBv
	0+dU07I897Fhtb2wvZDxFlGBZjYiV22QoGdncK9iot9AJ8TzK9V3sD09xvxjHbFxlXzlEKBBJVuNf
	vl/LH/nrzK4kXTuxj0qB5KTlfSgV9bISxjcZnqhxpbkOyKkAB85pAOyX8UTN/ZUAAr9b55ql4O5LA
	0kzOb2xK5lpqoLXjy9ZQPvTISS3MwtTdKMqPbkUeANXgLtnMT0vKH8TG583GqY++EojatIspuhy0J
	VyxL/lwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWls-00Gci1-Cx; Fri, 27 Jan 2023 22:00:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWlT-00GcXh-6g; Fri, 27 Jan 2023 22:00:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78E222F4;
	Fri, 27 Jan 2023 14:00:47 -0800 (PST)
Received: from [10.57.88.221] (unknown [10.57.88.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1C5A3F5A1;
	Fri, 27 Jan 2023 14:00:01 -0800 (PST)
Message-ID: <89da64c8-fef4-2cea-f15c-86264073500c@arm.com>
Date: Fri, 27 Jan 2023 21:59:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] iommu/dma: Do not init domain if
 broken_unmanaged_domain
Content-Language: en-GB
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 joro@8bytes.org, will@kernel.org, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, yong.wu@mediatek.com, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, alex.williamson@redhat.com, cohuck@redhat.com
Cc: vdumpa@nvidia.com, jonathanh@nvidia.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, kvm@vger.kernel.org
References: <cover.1674849118.git.nicolinc@nvidia.com>
 <451e7beb57ec6de66ee0da5b38886105436f53d7.1674849118.git.nicolinc@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <451e7beb57ec6de66ee0da5b38886105436f53d7.1674849118.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_140007_525275_48A930ED 
X-CRM114-Status: GOOD (  14.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2023-01-27 20:04, Nicolin Chen wrote:
> Add a sanity of the broken_unmanaged_domain flag to reject the use of
> dma-iommu in the early stage, if the flag is set by the iommu driver.

Realistically, iommu-dma will never be enabled on PPC32, let alone used. 
It will not be enabled on ARM until I've fixed any drivers which need 
fixing to work with it. We don't need to add dead code here.

Thanks,
Robin.

> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index f798c44e0903..f1e8d952b17d 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -545,6 +545,9 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>   	if (!cookie || cookie->type != IOMMU_DMA_IOVA_COOKIE)
>   		return -EINVAL;
>   
> +	if (WARN_ON(!device_iommu_unmanaged_supported(dev)))
> +		return -EINVAL;
> +
>   	iovad = &cookie->iovad;
>   
>   	/* Use the smallest supported page size for IOVA granularity */

