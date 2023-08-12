Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8984BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTKP72RbxBaLLQDh7lKth1HoAnL8wq4cl8CXVlTOUuE=; b=m3TyvhIGEKpfdFKm4MJTKozaRs
	pa3fwzvcpO74gQTBRVj6311hHHEep13EdgSIJYouTakF9FqdLlUau4XLPM0qzeCns/un1L2YXfngH
	UHi9rVm6VDDgkmTiIWNVY+YLetGZK2FgOdhCvjSpmn/zjNcdq1fvtS6rnJ8inOE0N4PWT878qq5S0
	ySjF4CNRzyX4tql8lMEpRJSrzWbwGyN288aBFPl4adYalLceXSQzHkMnqF/Tx5kFLUWRTeY07R1GD
	mMcAHfJXP+nseTyoiR7xci3GNQ1BXBQuLBb9iCGK+OEhJj55qqUVwvov7bVaf8yksfGHe1NSHI++H
	qyyuHHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUdYw-00CLH5-1Z;
	Sat, 12 Aug 2023 01:37:06 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUdYt-00CLFg-0O;
	Sat, 12 Aug 2023 01:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691804223; x=1723340223;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=InQwijdXw9W+QsSLGg97dJTKcOqeU8+07ewmIVxJV4I=;
  b=QPageSS5VL07idujR4MthMo+R30+lmNoVlWu/O0S7r5sxJyIk63WCoW4
   B+g1EBFpzZAKEKT93J9TbaQidTWxNQqXWYV8YjQfddiAacZZcVR84kuj0
   X+JYNaYMqzhcQdYZChQDxJlmGfJ2JH3l8vCwWsJTVmYJ8dKlQ0sKHi0Sa
   LNNv3Ce9XMDvhZ/4uH6ySFFA3ghPm2Dof4kaX2rvMkbDmGJilbv4oK6Eb
   9wEYYSTKn8chyvCsoNSXiAEWmUHNf2TR6eS6DrHRa3YDS7A1+rZA2ejmF
   u0r44BYw6kqt+R+YjqWfPlFaz7noyXE0Ma0sXliW4qJSZteXEE5lis2Q5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371797634"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="371797634"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063472658"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="1063472658"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.79]) ([10.254.215.79])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:36:35 -0700
Message-ID: <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
Date: Sat, 12 Aug 2023 09:36:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson
 <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_183703_190293_8E797205 
X-CRM114-Status: GOOD (  28.64  )
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

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> This is used when the iommu driver is taking control of the dma_ops,
> currently only on S390 and power spapr. It is designed to preserve the
> original ops->detach_dev() semantic that these S390 was built around.
> 
> Provide an opaque domain type and a 'default_domain' ops value that allows
> the driver to trivially force any single domain as the default domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 14 +++++++++++++-
>   include/linux/iommu.h |  6 ++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 5e3cdc9f3a9e78..c64365169b678d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1705,6 +1705,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>   
>   	lockdep_assert_held(&group->mutex);
>   
> +	/*
> +	 * Allow legacy drivers to specify the domain that will be the default
> +	 * domain. This should always be either an IDENTITY or PLATFORM domain.
> +	 * Do not use in new drivers.
> +	 */
> +	if (bus->iommu_ops->default_domain) {
> +		if (req_type)
> +			return ERR_PTR(-EINVAL);
> +		return bus->iommu_ops->default_domain;
> +	}
> +
>   	if (req_type)
>   		return __iommu_group_alloc_default_domain(bus, group, req_type);
>   
> @@ -1967,7 +1978,8 @@ void iommu_domain_free(struct iommu_domain *domain)
>   	if (domain->type == IOMMU_DOMAIN_SVA)
>   		mmdrop(domain->mm);
>   	iommu_put_dma_cookie(domain);
> -	domain->ops->free(domain);
> +	if (domain->ops->free)
> +		domain->ops->free(domain);
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_free);
>   
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index e05c93b6c37fba..87aebba474e093 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -64,6 +64,7 @@ struct iommu_domain_geometry {
>   #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
>   
>   #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
> +#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
>   
>   #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
>   /*
> @@ -81,6 +82,8 @@ struct iommu_domain_geometry {
>    *				  invalidation.
>    *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
>    *				  represented by mm_struct's.
> + *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
> + *				  dma_api stuff. Do not use in new drivers.
>    */
>   #define IOMMU_DOMAIN_BLOCKED	(0U)
>   #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
> @@ -91,6 +94,7 @@ struct iommu_domain_geometry {
>   				 __IOMMU_DOMAIN_DMA_API |	\
>   				 __IOMMU_DOMAIN_DMA_FQ)
>   #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
> +#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
>   
>   struct iommu_domain {
>   	unsigned type;
> @@ -256,6 +260,7 @@ struct iommu_iotlb_gather {
>    * @owner: Driver module providing these ops
>    * @identity_domain: An always available, always attachable identity
>    *                   translation.
> + * @default_domain: If not NULL this will always be set as the default domain.
>    */
>   struct iommu_ops {
>   	bool (*capable)(struct device *dev, enum iommu_cap);
> @@ -290,6 +295,7 @@ struct iommu_ops {
>   	unsigned long pgsize_bitmap;
>   	struct module *owner;
>   	struct iommu_domain *identity_domain;
> +	struct iommu_domain *default_domain;

I am imaging whether we can merge above two pointers into a single one.
It is either an IDENTITY or PLATFORM domain and the core will choose it
as the default domain of a group if iommu_group_alloc_default_domain()
fails to allocate one through the iommu dev_ops.

Those iommu drivers that could result in a NULL default domain could
provide such domain and guarantee that this domain is always usable for
devices.

Probably we could give it a more meaningful name? For example,
supplemental_domain or rescue_domain?

I am not sure whether this can address the NULL-default-domain issues
of all drivers this series tries to address. So just for discussion
purpose.

Best regards,
baolu

