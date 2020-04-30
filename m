Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AFBC83007
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 00:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684FA2082E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 00:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PC+wO/wX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684FA2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=38e+MXYA+ERQSEKaz4TX3B8ruZvFu7ds7kaE6BBqdrY=; b=PC+wO/wXD2qn52+iY/rMlisOd
	zWWUnwLAIkuXZKqqzfp+oEDXvxOJYWhcuSEgmaFLsEVhehu8XV2NaKcsUJmjQQJLj3G7StXsBVyXJ
	GKcCFph+GfviJ+Zkh95LN6xsNSou6H6lVUHmEv8fxm0jaxeAjcUiRqWqC/2sGSJub10IeVvX7Iwr4
	nC7kAZtxBEGRnbT+EYME7ykENJrwaqjCMZZK5GlxG2vljC4vyLKL1XD+TeavtLSj53myN0e9fEaqk
	xzoinP2Zq8Xsj2X0BeXeYPLJbMDDtmNF2tFOXlDrUoWf+ynsY+mxuZEmjdKiIZtw3XUkraGG1xpM0
	5pNr498TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTwkJ-0004mM-Dw; Thu, 30 Apr 2020 00:08:07 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTwkG-0004kr-I3; Thu, 30 Apr 2020 00:08:05 +0000
IronPort-SDR: eQ3iH6yGLJzIQf09CDm1fnd7BXeiYXIEIFhz+8O0d67so05IO3RiZ/RzrvlX3u6/SSQizTqTag
 c5ViY6nsKaew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 17:08:04 -0700
IronPort-SDR: 8lZrsl0wLt7oFUoHi7W//Bntkm29bKrQORzcH1MPPrhb7F9mbLEACH08RrTi8X5hI+ByAQQnM5
 BwXN4hf/V26g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; d="scan'208";a="293378354"
Received: from chenw5-mobl1.ccr.corp.intel.com (HELO [10.254.209.112])
 ([10.254.209.112])
 by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2020 17:07:58 -0700
Subject: Re: [PATCH v3 16/34] iommu/vt-d: Convert to probe/release_device()
 call-backs
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, David Woodhouse
 <dwmw2@infradead.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200429133712.31431-1-joro@8bytes.org>
 <20200429133712.31431-17-joro@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <7ceca31f-cf24-d4f8-04fd-74691dd3c11a@linux.intel.com>
Date: Thu, 30 Apr 2020 08:07:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429133712.31431-17-joro@8bytes.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_170804_621264_A31C1B6F 
X-CRM114-Status: GOOD (  22.19  )
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com,
 baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020/4/29 21:36, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Convert the Intel IOMMU driver to use the probe_device() and
> release_device() call-backs of iommu_ops, so that the iommu core code
> does the group and sysfs setup.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 67 ++++---------------------------------
>   1 file changed, 6 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index b9f905a55dda..b906727f5b85 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5781,78 +5781,27 @@ static bool intel_iommu_capable(enum iommu_cap cap)
>   	return false;
>   }
>   
> -static int intel_iommu_add_device(struct device *dev)
> +static struct iommu_device *intel_iommu_probe_device(struct device *dev)
>   {
> -	struct dmar_domain *dmar_domain;
> -	struct iommu_domain *domain;
>   	struct intel_iommu *iommu;
> -	struct iommu_group *group;
>   	u8 bus, devfn;
> -	int ret;
>   
>   	iommu = device_to_iommu(dev, &bus, &devfn);
>   	if (!iommu)
> -		return -ENODEV;
> -
> -	iommu_device_link(&iommu->iommu, dev);
> +		return ERR_PTR(-ENODEV);
>   
>   	if (translation_pre_enabled(iommu))
>   		dev->archdata.iommu = DEFER_DEVICE_DOMAIN_INFO;
>   
> -	group = iommu_group_get_for_dev(dev);
> -
> -	if (IS_ERR(group)) {
> -		ret = PTR_ERR(group);
> -		goto unlink;
> -	}
> -
> -	iommu_group_put(group);
> -
> -	domain = iommu_get_domain_for_dev(dev);
> -	dmar_domain = to_dmar_domain(domain);
> -	if (domain->type == IOMMU_DOMAIN_DMA) {
> -		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
> -			ret = iommu_request_dm_for_dev(dev);
> -			if (ret) {
> -				dmar_remove_one_dev_info(dev);
> -				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
> -				domain_add_dev_info(si_domain, dev);
> -				dev_info(dev,
> -					 "Device uses a private identity domain.\n");
> -			}
> -		}
> -	} else {
> -		if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
> -			ret = iommu_request_dma_domain_for_dev(dev);
> -			if (ret) {
> -				dmar_remove_one_dev_info(dev);
> -				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
> -				if (!get_private_domain_for_dev(dev)) {
> -					dev_warn(dev,
> -						 "Failed to get a private domain.\n");
> -					ret = -ENOMEM;
> -					goto unlink;
> -				}
> -
> -				dev_info(dev,
> -					 "Device uses a private dma domain.\n");
> -			}
> -		}
> -	}
> -
>   	if (device_needs_bounce(dev)) {
>   		dev_info(dev, "Use Intel IOMMU bounce page dma_ops\n");
>   		set_dma_ops(dev, &bounce_dma_ops);
>   	}
>   
> -	return 0;
> -
> -unlink:
> -	iommu_device_unlink(&iommu->iommu, dev);
> -	return ret;
> +	return &iommu->iommu;
>   }
>   
> -static void intel_iommu_remove_device(struct device *dev)
> +static void intel_iommu_release_device(struct device *dev)
>   {
>   	struct intel_iommu *iommu;
>   	u8 bus, devfn;
> @@ -5863,10 +5812,6 @@ static void intel_iommu_remove_device(struct device *dev)
>   
>   	dmar_remove_one_dev_info(dev);
>   
> -	iommu_group_remove_device(dev);
> -
> -	iommu_device_unlink(&iommu->iommu, dev);
> -
>   	if (device_needs_bounce(dev))
>   		set_dma_ops(dev, NULL);
>   }
> @@ -6198,8 +6143,8 @@ const struct iommu_ops intel_iommu_ops = {
>   	.map			= intel_iommu_map,
>   	.unmap			= intel_iommu_unmap,
>   	.iova_to_phys		= intel_iommu_iova_to_phys,
> -	.add_device		= intel_iommu_add_device,
> -	.remove_device		= intel_iommu_remove_device,
> +	.probe_device		= intel_iommu_probe_device,
> +	.release_device		= intel_iommu_release_device,
>   	.get_resv_regions	= intel_iommu_get_resv_regions,
>   	.put_resv_regions	= generic_iommu_put_resv_regions,
>   	.apply_resv_region	= intel_iommu_apply_resv_region,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
