Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D88C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84TfUXr3ucqyO/rsPMNO3LPeX2CO0MRTjdgkbIQZAV0=; b=pFC2GIw2e4EGJ1xdXBkrW08uRq
	FoVXaRDWESDUSCrBj+Su/IKgRy7tWIea59G7XPY9XTrbo8hfjbt4U/Kp3OCauLUJzMXEQv8UmB8ca
	YBsN2/+CSn9zg0TrrM5lbePNbFl9HB6n3qcLiy2UUXIZ0/IboA89yGE/T3f+PJbohoG243ABxQM1w
	3t94vVvLW6EFS2ZiW1fMBegMXJr/dQQ8pSBUL4EQ/24JE3nKeCkYnVsK3AgV3KCq/1p6IWV6gpYz7
	9OQYi3zwHUsxBP22wSeFcFiJleVgv5PcN3mB6cjpGEQ98nu0FpJ2Xp14i4cOFXxHFW0WIdcZHCC1i
	S2wLzpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRXA-00GJPS-0i;
	Mon, 14 Aug 2023 06:58:36 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRX6-00GJOD-27;
	Mon, 14 Aug 2023 06:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691996312; x=1723532312;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pa/NYcFW5ouBdif+FG84sip7NAyNlNfKz3i1h077D5I=;
  b=VFToX3XyYoQTBiYs52XShsuo6Tl1axoH/9MN8Ea3FO1I+jKy0syUyI41
   OTnve/xri0+XUDDp9u+H4N2Mp08x4BAv4aIXJlX0e/xMwPDFDpi7jmFst
   PXdhy0rVWpHI1p2UfXm/C1iKRlHd2SCluIE1HaQeXzgqqtXYYK2zSDaAB
   z7jCt/H73ZxeAcw9wVkZjZijuzcPCc5IJ1BfPe7CjuOKgnlx9I0N9eP5J
   s5FiiwmnGnUBS4HUcy3COKWIS7U7TeZ1shpJwDTkYe5n40KdHtMVL8bRD
   bachWOUHIhIWnNXEUzNWt8lY5OfEhYRt7XtTO4CvuXezEqBMi3OC1gT96
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="375682861"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="375682861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="798721368"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="798721368"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.205]) ([10.254.215.205])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:58:17 -0700
Message-ID: <90d3070b-a3ff-7007-9b55-aef1e9b472aa@linux.intel.com>
Date: Mon, 14 Aug 2023 14:58:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 24/25] iommu: Convert simple drivers with DOMAIN_DMA to
 domain_alloc_paging()
Content-Language: en-US
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
References: <24-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <24-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_235832_764322_4A1BED23 
X-CRM114-Status: GOOD (  16.43  )
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

On 2023/8/3 8:08, Jason Gunthorpe wrote:
> These drivers are all trivially converted since the function is only
> called if the domain type is going to be
> IOMMU_DOMAIN_UNMANAGED/DMA.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
>   drivers/iommu/exynos-iommu.c            | 7 ++-----
>   drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
>   drivers/iommu/mtk_iommu.c               | 7 ++-----
>   drivers/iommu/rockchip-iommu.c          | 7 ++-----
>   drivers/iommu/sprd-iommu.c              | 7 ++-----
>   drivers/iommu/sun50i-iommu.c            | 9 +++------
>   drivers/iommu/tegra-smmu.c              | 7 ++-----
>   8 files changed, 17 insertions(+), 40 deletions(-)

[...]

> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 0bf08b120cf105..056832a367c2af 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
>   		sun50i_iova_get_page_offset(iova);
>   }
>   
> -static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
> +static struct iommu_domain *
> +sun50i_iommu_domain_alloc_paging(struct device *paging)

Why not "struct device *dev"?

Typo? Or anything I missed?

>   {
>   	struct sun50i_iommu_domain *sun50i_domain;
>   
> -	if (type != IOMMU_DOMAIN_DMA &&
> -	    type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	sun50i_domain = kzalloc(sizeof(*sun50i_domain), GFP_KERNEL);
>   	if (!sun50i_domain)
>   		return NULL;
> @@ -840,7 +837,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
>   	.identity_domain = &sun50i_iommu_identity_domain,
>   	.pgsize_bitmap	= SZ_4K,
>   	.device_group	= sun50i_iommu_device_group,
> -	.domain_alloc	= sun50i_iommu_domain_alloc,
> +	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
>   	.of_xlate	= sun50i_iommu_of_xlate,
>   	.probe_device	= sun50i_iommu_probe_device,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 6cba034905edbf..69c40c191ce4f0 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -272,13 +272,10 @@ static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
>   	clear_bit(id, smmu->asids);
>   }
>   
> -static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
> +static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
>   {
>   	struct tegra_smmu_as *as;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> -		return NULL;
> -
>   	as = kzalloc(sizeof(*as), GFP_KERNEL);
>   	if (!as)
>   		return NULL;
> @@ -997,7 +994,7 @@ static const struct iommu_ops tegra_smmu_ops = {
>   	.default_domain = &tegra_smmu_identity_domain,
>   	.identity_domain = &tegra_smmu_identity_domain,
>   	.def_domain_type = &tegra_smmu_def_domain_type,
> -	.domain_alloc = tegra_smmu_domain_alloc,
> +	.domain_alloc_paging = tegra_smmu_domain_alloc_paging,
>   	.probe_device = tegra_smmu_probe_device,
>   	.device_group = tegra_smmu_device_group,
>   	.of_xlate = tegra_smmu_of_xlate,

Anyway,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

