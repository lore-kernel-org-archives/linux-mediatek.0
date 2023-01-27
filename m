Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C4EC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tLoaOE5N9RXnvgAEQIlXh/QNzvZdXi9GLcfWwYXmFo=; b=jj6XPSgvicBk+algiHITgUwFJV
	tks2vS2wqPk0SytEmnC7XQX+xtGZVzrFtjmtT9qsNbwvqt3Cmof+yJwC+9ClK6zQ9KJJqVNNGXeSa
	lrurXt4e/IkFcYIapfrFCkz8Zzm5tCPT1DerByFLkXezaDCUHhVZdReNTMJMSzwq8jN3v0DDavbYa
	MO12BI5PQRDY/C/PdwvQDbxcHcu36ilPh/OynZJQrt8VanMlKyrLKZQMeC3VhGy2t7ue+1pGNdiNf
	XuBiphppgN7Le4L/6E8Tq9HBpiR1G/9I32Bb7ts1iLPfbVahtPbLv4yQOXwvv1X8KthuXtg1ydwRr
	b9e3T2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWkc-00GcFX-SF; Fri, 27 Jan 2023 21:59:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWkQ-00GcCI-MF; Fri, 27 Jan 2023 21:59:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7CD31FB;
	Fri, 27 Jan 2023 13:59:35 -0800 (PST)
Received: from [10.57.88.221] (unknown [10.57.88.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC4143F5A1;
	Fri, 27 Jan 2023 13:58:50 -0800 (PST)
Message-ID: <dfad6d75-6f4d-99ef-1c6a-4bf397dcaa13@arm.com>
Date: Fri, 27 Jan 2023 21:58:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] iommu: Add a broken_unmanaged_domain flag in
 iommu_ops
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
 <0875479d24a53670e17db8a11945664a6bb4a25b.1674849118.git.nicolinc@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <0875479d24a53670e17db8a11945664a6bb4a25b.1674849118.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_135902_861518_351D72D1 
X-CRM114-Status: GOOD (  25.80  )
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
> Both IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA require the support
> of __IOMMU_DOMAIN_PAGING capability, i.e. iommu_map/unmap. However,
> some older iommu drivers do not fully support that, and these drivers
> also do not advertise support for dma-iommu.c via IOMMU_DOMAIN_DMA,
> or use arm_iommu_create_mapping(), so largely their implementations
> of IOMMU_DOMAIN_UNMANAGED are untested. This means that a user like
> vfio/iommufd does not likely work with them.
> 
> Several of them have obvious problems:
>    * fsl_pamu_domain.c
>      Without map/unmap ops in the default_domain_ops, it isn't an
>      unmanaged domain at all.
>    * mtk_iommu_v1.c
>      With a fixed 4M "pagetable", it can only map exactly 4G of
>      memory, but doesn't set the aperture.

The aperture is easily fixed (one could argue that what's broken there 
are the ARM DMA ops for assuming every IOMMU has a 32-bit IOVA space and 
not checking).

>    * tegra-gart.c
>      Its notion of attach/detach and groups has to be a complete lie to
>      get around all the other API expectations.

That's true, and the domain is tiny and not isolated from the rest of 
the address space outside the aperture, but the one thing it does do is 
support iommu_map/unmap just fine, which is what this flag is documented 
as saying it doesn't.

> Some others might work but have never been tested with vfio/iommufd:
>    * msm_iommu.c
>    * omap-iommu.c
>    * tegra-smmu.c

And yet they all have other in-tree users (GPUs on MSM and Tegra, 
remoteproc on OMAP) that allocate unmanaged domains and use 
iommu_map/unmap just fine, so they're clearly not broken either.

On the flipside, you're also missing cases like apple-dart, which can 
have broken unmanaged domains by any definition, but only under certain 
conditions (at least it "fails safe" and they will refuse attempts to 
attach anything). I'd also question sprd-iommu, which hardly has a 
generally-useful domain size, and has only just recently gained the 
ability to unmap anything successfully. TBH none of the SoC IOMMUs are 
likely to ever be of interest to VFIO or IOMMUFD, since the only things 
they could assign to userspace are the individual devices - usually 
graphics and media engines - that they're coupled to, whose useful 
functionality tends to depend on clocks, phys, and random other 
low-level stuff that would be somewhere between impractical and 
downright unsafe to attempt to somehow expose as well.

> Thus, mark all these drivers as having "broken" UNAMANGED domains and
> add a new device_iommu_unmanaged_supported() API for vfio/iommufd and
> dma-iommu to refuse to work with these drivers.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

[...]

> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 46e1347bfa22..919a5dbad75b 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -245,6 +245,10 @@ struct iommu_iotlb_gather {
>    *                    pasid, so that any DMA transactions with this pasid
>    *                    will be blocked by the hardware.
>    * @pgsize_bitmap: bitmap of all possible supported page sizes
> + * @broken_unmanaged_domain: IOMMU_DOMAIN_UNMANAGED is not fully functional; the
> + *                           driver does not really support iommu_map/unmap, but
> + *                           uses UNMANAGED domains for the IOMMU API, called by
> + *                           other SOC drivers.

"uses UNMANAGED domains for the IOMMU API" is literally the definition 
of unmanaged domains :/

Some "other SOC drivers" use more of the IOMMU API than VFIO does :/

Please just add IOMMU_CAP_IOMMUFD to represent whatever the nebulous 
requirements of IOMMUFD actually are (frankly it's no less informative 
than calling domains "broken"), handle that in the drivers you care 
about and have tested, and use device_iommu_capable(). What you're 
describing in this series is a capability, and we have a perfectly good 
API for drivers to express those already. Plus, as demonstrated above, a 
positive capability based on empirical testing will be infinitely more 
robust than a negative one based on guessing.

Thanks,
Robin.

