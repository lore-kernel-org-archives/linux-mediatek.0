Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C00C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcJYhh9DFeI6C7S3GPP+tNsx9P8C3q3LraSYE21Lffg=; b=0zuE4T99ImwgSS
	1Hmg2xciLnyk5vhhtX02HX+Ga9Gpg1xER5T7DW2OG21WnBy8dnszOlacNTUaqYM8HpW9aOfjIzfJu
	h7XKtFnHoZx/uv9mlk3Zg4Hz2N2uwoLLzVeZzDIvuLBXxS28rq8W5o1aHRnSZgxRyqRLySqBs+p6R
	U0LwnT6vGx8Utv600gXcoCIQG/zn3x2PYdsJ9XabakMgLVdaFcJpqYD8N4VuQipwniqUy74Q6+U7K
	kFXBvtTsPFz5LEiqrpXpRjdtc/iFrqAvJYx1TjcHQE9mPzZmApJIrN86pRRbqkV4xduG7Aax8TWy+
	mm8znSMInQk2jYkimx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDo1-001Xsa-KV; Mon, 06 Jun 2022 14:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDno-001XnQ-Lx; Mon, 06 Jun 2022 14:33:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CACF15DB;
	Mon,  6 Jun 2022 07:33:55 -0700 (PDT)
Received: from [10.57.81.38] (unknown [10.57.81.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555903F73B;
	Mon,  6 Jun 2022 07:33:48 -0700 (PDT)
Message-ID: <1e0e5403-1e65-db9a-c8e7-34e316bfda8e@arm.com>
Date: Mon, 6 Jun 2022 15:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] iommu: Ensure device has the same iommu_ops as the
 domain
Content-Language: en-GB
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, marcan@marcan.st, sven@svenpeter.dev, robdclark@gmail.com,
 m.szyprowski@samsung.com, krzysztof.kozlowski@linaro.org,
 baolu.lu@linux.intel.com, agross@kernel.org, bjorn.andersson@linaro.org,
 matthias.bgg@gmail.com, heiko@sntech.de, orsonzhai@gmail.com,
 baolin.wang7@gmail.com, zhang.lyra@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, jean-philippe@linaro.org,
 alex.williamson@redhat.com
Cc: suravee.suthikulpanit@amd.com, alyssa@rosenzweig.io,
 alim.akhtar@samsung.com, dwmw2@infradead.org, yong.wu@mediatek.com,
 mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 cohuck@redhat.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org
References: <20220606061927.26049-1-nicolinc@nvidia.com>
 <20220606061927.26049-3-nicolinc@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220606061927.26049-3-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_073356_870121_1E5B3A26 
X-CRM114-Status: GOOD (  19.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-06-06 07:19, Nicolin Chen wrote:
> The core code should not call an iommu driver op with a struct device
> parameter unless it knows that the dev_iommu_priv_get() for that struct
> device was setup by the same driver. Otherwise in a mixed driver system
> the iommu_priv could be casted to the wrong type.

We don't have mixed-driver systems, and there are plenty more 
significant problems than this one to solve before we can (but thanks 
for pointing it out - I hadn't got as far as auditing the public 
interfaces yet). Once domains are allocated via a particular device's 
IOMMU instance in the first place, there will be ample opportunity for 
the core to stash suitable identifying information in the domain for 
itself. TBH even the current code could do it without needing the 
weirdly invasive changes here.

> Store the iommu_ops pointer in the iommu_domain and use it as a check to
> validate that the struct device is correct before invoking any domain op
> that accepts a struct device.

In fact this even describes exactly that - "Store the iommu_ops pointer 
in the iommu_domain", vs. the "Store the iommu_ops pointer in the 
iommu_domain_ops" which the patch is actually doing :/

[...]
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 19cf28d40ebe..8a1f437a51f2 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1963,6 +1963,10 @@ static int __iommu_attach_device(struct iommu_domain *domain,
>   {
>   	int ret;
>   
> +	/* Ensure the device was probe'd onto the same driver as the domain */
> +	if (dev->bus->iommu_ops != domain->ops->iommu_ops)

Nope, dev_iommu_ops(dev) please. Furthermore I think the logical place 
to put this is in iommu_group_do_attach_device(), since that's the 
gateway for the public interfaces - we shouldn't need to second-guess 
ourselves for internal default-domain-related calls.

Thanks,
Robin.

> +		return -EMEDIUMTYPE;
> +
>   	if (unlikely(domain->ops->attach_dev == NULL))
>   		return -ENODEV;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
