Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7403BECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 02:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwGyWsIT7VzCyfl0VVjdCkUjE9QvfY/KzzBu+9UouvQ=; b=I6rdlniPavFxHhSfdO3FBGPZX+
	/6ZPX98AO5jymfM5kBmGvP6g7IncWuQbRA5dcsqr0NVxNXiAylcXA8OciRNslSNsEfk8zv28U0CQ0
	u2Idir2qSUEL1fTDSVDRQvcWEaf/Kuv1cvElCKwkuSGP2QcmXd/pY30NshTo8MOkrFJ0xT3a3JuB/
	0hEziWSpGxi7cxpmeidtV4ASis7qja9L9CnUr/JbvFqEnaxNSrt9WudgBqRz362Qj7RnHpOg3LoqE
	zi4RmZCb4SQzZsgLT4L2kUAj7RGqYKyosFwG/3q8XUEeKGrmo8zWwC1UgqDxBx4tKOWTzxr5sIu19
	lRfYHTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBe0-00D7W3-PQ; Thu, 22 Sep 2022 02:08:52 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBdx-00D7VF-AG; Thu, 22 Sep 2022 02:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663812529; x=1695348529;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1fDpa6Vp9wv2YOhKIYkfzYhHIef9thojyzjgWC31CW0=;
  b=jEnVtH4XU8HcSbouXFRlXKuv9lARtY93keITEy8bgAq1qd9Z+G3wqv21
   iHePlj8qL96qLYLW7GII0QFEn1WITs6A2VoMrBS2gs6BqEOOcHEKUEhG1
   A8gpEG1qgLVNOGnBk6D9QGwzaIplKm+vnBUjuM9VYj/bF7K6wPH6jems+
   FaH5+eySASr3SsXPyqsIkb+0izkLxYgxvsV8Aj6jkrEQL3GmTrGTt58io
   mA48gAfmZeVcnjUeWI7l0Sf0W62GEA8jvyZyr47tbdHFgSMnLxA5YokWF
   lBYssE2w0xU/qdSCRc5H2bAzl5klkmmn+TlIvGNa81JP7pY47doPCCsI9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326492014"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="326492014"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 19:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="794907643"
Received: from allen-box.sh.intel.com (HELO [10.239.159.48]) ([10.239.159.48])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2022 19:08:37 -0700
Message-ID: <73008702-87e1-688f-b194-c259c9c03caa@linux.intel.com>
Date: Thu, 22 Sep 2022 10:02:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: baolu.lu@linux.intel.com, jgg@nvidia.com, kevin.tian@intel.com,
 konrad.dybcio@somainline.org, yong.wu@mediatek.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 tglx@linutronix.de, shameerali.kolothum.thodi@huawei.com,
 christophe.jaillet@wanadoo.fr, thunder.leizhen@huawei.com,
 quic_saipraka@quicinc.com, jon@solid-run.com, yangyingliang@huawei.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 3/6] iommu: Add return value rules to attach_dev op and
 APIs
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org,
 suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
 robdclark@gmail.com, dwmw2@infradead.org, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jean-philippe@linaro.org, sricharan@codeaurora.org
References: <cover.1663744983.git.nicolinc@nvidia.com>
 <8c3dbf153b63a3002a46bab6e707c63fd8635bb8.1663744983.git.nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8c3dbf153b63a3002a46bab6e707c63fd8635bb8.1663744983.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_190849_448408_935A52F0 
X-CRM114-Status: GOOD (  21.81  )
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
> Cases like VFIO wish to attach a device to an existing domain that was
> not allocated specifically from the device. This raises a condition
> where the IOMMU driver can fail the domain attach because the domain and
> device are incompatible with each other.
> 
> This is a soft failure that can be resolved by using a different domain.
> 
> Provide a dedicated errno EINVAL from the IOMMU driver during attach that
> the reason why the attach failed is because of domain incompatibility.
> 
> VFIO can use this to know that the attach is a soft failure and it should
> continue searching. Otherwise, the attach will be a hard failure and VFIO
> will return the code to userspace.
> 
> Update kdocs to add rules of return value to the attach_dev op and APIs.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 22 ++++++++++++++++++++++
>   include/linux/iommu.h | 12 ++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 3a808146b50f..1d1e32aeaae6 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1975,6 +1975,17 @@ static int __iommu_attach_device(struct iommu_domain *domain,
>   	return ret;
>   }
>   
> +/**
> + * iommu_attach_device - Attach a device to an IOMMU domain

Normally we say "attach an iommu domain to a device/group ...".

Best regards,
baolu

