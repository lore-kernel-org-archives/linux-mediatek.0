Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF7CC32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 02:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxSsgmPuNyn7zXMGDMzjn2nx+SWybK4LeHPm0nCVT24=; b=L7bOkZYH6s6Jt2CujLA4tp/E0Z
	WF6HA0OAZE7+NOk6w9UtUQ3mpkLlJPZ08GH3F5yIKrwsn4EIM2UqoIjDWdbOMSxWJsCTWzYKXCKI4
	YMNTbUTMY+vHqcd0jjRakUniMNIupsZtQBw00E4rKD151yUUCLLdQvCDro8Zr1FRXZmEae9OXtLrh
	roL8R/94xBBEQ4lFQDRsYFg4Mj75AZu2hNk/wqjF9frOoh6mfradq3ip1e7iCo4xzSAUqVLzb7inx
	J3Q2empTiNKrDwCvSJQRSvDZMIcZ+jVjBcFx0rfYYVX0CO9xsEzywiKSWv8NbVmQbKDK9UW5iN4yf
	HT3CETpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBpL-00D8LK-Um; Thu, 22 Sep 2022 02:20:35 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBpA-00D8JX-Rl; Thu, 22 Sep 2022 02:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663813224; x=1695349224;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/ZCkZ9qbjMv6wNMGQi+YkA+SN2H5Rof2Wg8t+DjEiZA=;
  b=lGNq1YvzCKx9MrKzVLK6Kdesfo6V7yhsetYhKzWV7FzIoNZDCV1BU4Dl
   38BmLa2ISv6n4m4VQ2KGnhY4+qQCze0lDjs5bg9STaeJ90vXae5k5PBl7
   KOTJQKmnOeouIuiLb0rvHZIWzCP8Ir3WGRmu9jGEBQgTDxeK1s1QwVC04
   znPA5RuaGkWdxPHDwsupcctv8Ass5K8M5dPjB5i8FfdFuLG9NvBnlQRSK
   L+T+QyjB9wem92MdqJJXcMSOFxDYiJQfVxYOrKspsdgvWmojN2PSzpXdx
   jPPDWA1aKJ0QNiqhxq7nvGIEx+aKwdW4d4bXWI/zvsuAbY0534BboQsD/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="297776240"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="297776240"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 19:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="794910032"
Received: from allen-box.sh.intel.com (HELO [10.239.159.48]) ([10.239.159.48])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2022 19:20:15 -0700
Message-ID: <01645bfa-a897-05cd-9934-a057e1d79fff@linux.intel.com>
Date: Thu, 22 Sep 2022 10:14:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: baolu.lu@linux.intel.com, jgg@nvidia.com, kevin.tian@intel.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/6] iommu: Regulate EINVAL in ->attach_dev callback
 functions
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, dwmw2@infradead.org, yong.wu@mediatek.com,
 matthias.bgg@gmail.com
References: <cover.1663744983.git.nicolinc@nvidia.com>
 <6c48822600154314778157ab7f72a7b55f5e2c65.1663744983.git.nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6c48822600154314778157ab7f72a7b55f5e2c65.1663744983.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_192024_916775_3DCE7605 
X-CRM114-Status: GOOD (  22.97  )
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

On 9/21/22 4:23 PM, Nicolin Chen wrote:
> Following the new rules in include/linux/iommu.h kdocs, EINVAL now can be
> used to indicate that domain and device are incompatible by a caller that
> treats it as a soft failure and tries attaching to another domain.
> 
> On the other hand, there are ->attach_dev callback functions returning it
> for obvious device-specific errors. They will result in some inefficiency
> in the caller handling routine.
> 
> Update these places to corresponding errnos following the new rules.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/fsl_pamu.c        | 2 +-
>   drivers/iommu/fsl_pamu_domain.c | 4 ++--
>   drivers/iommu/intel/pasid.c     | 6 ++++--
>   drivers/iommu/mtk_iommu.c       | 2 +-
>   drivers/iommu/omap-iommu.c      | 4 ++--
>   drivers/iommu/virtio-iommu.c    | 2 +-
>   6 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
> index 0d03f837a5d4..2eb3211c8167 100644
> --- a/drivers/iommu/fsl_pamu.c
> +++ b/drivers/iommu/fsl_pamu.c
> @@ -211,7 +211,7 @@ int pamu_config_ppaace(int liodn, u32 omi, u32 stashid, int prot)
>   		ppaace->op_encode.index_ot.omi = omi;
>   	} else if (~omi != 0) {
>   		pr_debug("bad operation mapping index: %d\n", omi);
> -		return -EINVAL;
> +		return -ENODEV;
>   	}
>   
>   	/* configure stash id */
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index 011f9ab7f743..b4a1c0f79c3e 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -258,7 +258,7 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
>   	liodn = of_get_property(dev->of_node, "fsl,liodn", &len);
>   	if (!liodn) {
>   		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
> -		return -EINVAL;
> +		return -ENODEV;
>   	}
>   
>   	spin_lock_irqsave(&dma_domain->domain_lock, flags);
> @@ -267,7 +267,7 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
>   		if (liodn[i] >= PAACE_NUMBER_ENTRIES) {
>   			pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
>   				 liodn[i], dev->of_node);
> -			ret = -EINVAL;
> +			ret = -ENODEV;
>   			break;
>   		}
>   
> diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
> index c5e7e8b020a5..aff1a9caa496 100644
> --- a/drivers/iommu/intel/pasid.c
> +++ b/drivers/iommu/intel/pasid.c
> @@ -101,8 +101,10 @@ int intel_pasid_alloc_table(struct device *dev)
>   
>   	might_sleep();
>   	info = dev_iommu_priv_get(dev);
> -	if (WARN_ON(!info || !dev_is_pci(dev) || info->pasid_table))
> -		return -EINVAL;
> +	if (WARN_ON(!info || !dev_is_pci(dev)))
> +		return -ENODEV;
> +	if (WARN_ON(info->pasid_table))
> +		return -EEXIST;
>   
>   	pasid_table = kzalloc(sizeof(*pasid_table), GFP_KERNEL);
>   	if (!pasid_table)
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 7e363b1f24df..be1a7d1cc630 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -607,7 +607,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
>   	dom->iop = alloc_io_pgtable_ops(ARM_V7S, &dom->cfg, data);
>   	if (!dom->iop) {
>   		dev_err(data->dev, "Failed to alloc io pgtable\n");
> -		return -EINVAL;
> +		return -ENOMEM;
>   	}
>   
>   	/* Update our support page sizes bitmap */
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index d9cf2820c02e..447e40d55918 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1414,7 +1414,7 @@ static int omap_iommu_attach_init(struct device *dev,
>   
>   	odomain->num_iommus = omap_iommu_count(dev);
>   	if (!odomain->num_iommus)
> -		return -EINVAL;
> +		return -ENODEV;
>   
>   	odomain->iommus = kcalloc(odomain->num_iommus, sizeof(*iommu),
>   				  GFP_ATOMIC);
> @@ -1464,7 +1464,7 @@ omap_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   
>   	if (!arch_data || !arch_data->iommu_dev) {
>   		dev_err(dev, "device doesn't have an associated iommu\n");
> -		return -EINVAL;
> +		return -ENODEV;
>   	}
>   
>   	spin_lock(&omap_domain->lock);
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 80151176ba12..4c652773fd6c 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -669,7 +669,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>   		dev_err(vdev->dev,
>   			"granule 0x%lx larger than system page size 0x%lx\n",
>   			viommu_page_size, PAGE_SIZE);
> -		return -EINVAL;
> +		return -ENODEV;
>   	}
>   
>   	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,

For iommu/vt-d changes:

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

