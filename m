Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4976CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCkUBqzaLG8mJplZ6tTrdmO93bZE8z+DqB0PXzOLD4g=; b=ysptJ0KtpixOwHgUQRzi9Z6ZAH
	kVbl1f0lWrI34ZE1vbF8tvolvj+vtT9BqP3YEYwNM1BGBm8U4rq/Scwrytu/quUQYviLgCXjeIxqJ
	IdH4cjicXlenBc4SfZlzeixEu7kvKKRT1ZRD1ZpCH4rDoSJhvigUGYAjCZRDpthTwQ5/6yPAEPDDs
	vcj1D+rBm3RygCahgr3pfrJbQg3ZqD7v5A2RMFIv/XzgxSprqs9EqizEBDg3LQDLf49HFqA+sm1sf
	DTP/QUJrvXMfV1BmSA0vxJcChmxTZNV5qk0f4821AWONqNURcTnwccEfJeCKqCechNM8kWDnHSTeQ
	ZliM56yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YTA-00HMmn-Aa; Fri, 24 Jun 2022 01:50:48 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YSy-00HMiR-SI; Fri, 24 Jun 2022 01:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656035436; x=1687571436;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IsvI1dwjNH7FPAzCwj0jEY++TlXnX8nTqkYbG4bsQ18=;
  b=QeTnzUa1zYykEzt9V8UBfL6uDVCFxLGHGL1PwCp+xs45pJh312AsbVEW
   kzycRrr8TPxX9bXOTdSSG23qylf/fidYXg9ZACzcRxhiM9Am7HkeNuDah
   U6zXm0LcTUGOhDb2QVKaLmSGcPIsKiEKm1t3zFejqTfm3TnmKfRi5wR8G
   k0CFmx9KkFPQk64onMWwFeRF6rkSjniFMFD6GW+BXlLJDTdWJ3bEMnTaQ
   MT9vkM29GzIMJ218mRs7LdNBSq8EKXl2Aw3Xj4IxjXz1DgHdREaJbK8vo
   Lq4V0RI6oYghPIdoMPLUDu3HhX8/FOLZq398TeyqiFWAJGZUqufiguNT3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="342581427"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="342581427"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 18:50:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="645044417"
Received: from wenli3x-mobl.ccr.corp.intel.com (HELO [10.249.168.117]) ([10.249.168.117])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 18:50:27 -0700
Message-ID: <450ce024-10c5-6626-c3dc-c2fd962fda61@linux.intel.com>
Date: Fri, 24 Jun 2022 09:50:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 alyssa@rosenzweig.io, dwmw2@infradead.org, yong.wu@mediatek.com,
 mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 cohuck@redhat.com, thunder.leizhen@huawei.com, tglx@linutronix.de,
 chenxiang66@hisilicon.com, christophe.jaillet@wanadoo.fr,
 john.garry@huawei.com, yangyingliang@huawei.com, jordan@cosmicpenguin.net,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] vfio/iommu_type1: Prefer to reuse domains vs match
 enforced cache coherency
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, will@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, robin.murphy@arm.com,
 robdclark@gmail.com, matthias.bgg@gmail.com, orsonzhai@gmail.com,
 baolin.wang7@gmail.com, zhang.lyra@gmail.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, jgg@nvidia.com, kevin.tian@intel.com
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-3-nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220623200029.26007-3-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_185037_080709_29F75EB8 
X-CRM114-Status: GOOD (  23.67  )
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

On 2022/6/24 04:00, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> The KVM mechanism for controlling wbinvd is based on OR of the coherency
> property of all devices attached to a guest, no matter whether those
> devices are attached to a single domain or multiple domains.
> 
> On the other hand, the benefit to using separate domains was that those
> devices attached to domains supporting enforced cache coherency always
> mapped with the attributes necessary to provide that feature, therefore
> if a non-enforced domain was dropped, the associated group removal would
> re-trigger an evaluation by KVM.
> 
> In practice however, the only known cases of such mixed domains included
> an Intel IGD device behind an IOMMU lacking snoop control, where such
> devices do not support hotplug, therefore this scenario lacks testing and
> is not considered sufficiently relevant to support.
> 
> After all, KVM won't take advantage of trying to push a device that could
> do enforced cache coherency to a dedicated domain vs re-using an existing
> domain, which is non-coherent.
> 
> Simplify this code and eliminate the test. This removes the only logic
> that needed to have a dummy domain attached prior to searching for a
> matching domain and simplifies the next patches.
> 
> It's unclear whether we want to further optimize the Intel driver to
> update the domain coherency after a device is detached from it, at
> least not before KVM can be verified to handle such dynamics in related
> emulation paths (wbinvd, vcpu load, write_cr0, ept, etc.). In reality
> we don't see an usage requiring such optimization as the only device
> which imposes such non-coherency is Intel GPU which even doesn't
> support hotplug/hot remove.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/vfio/vfio_iommu_type1.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c13b9290e357..f4e3b423a453 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2285,9 +2285,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   	 * testing if they're on the same bus_type.
>   	 */
>   	list_for_each_entry(d, &iommu->domain_list, next) {
> -		if (d->domain->ops == domain->domain->ops &&
> -		    d->enforce_cache_coherency ==
> -			    domain->enforce_cache_coherency) {
> +		if (d->domain->ops == domain->domain->ops) {
>   			iommu_detach_group(domain->domain, group->iommu_group);
>   			if (!iommu_attach_group(d->domain,
>   						group->iommu_group)) {

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

