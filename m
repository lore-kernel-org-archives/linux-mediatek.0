Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C94C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7leOUVwN4d3/Owd0ZW38/mWcStfFg7nu+IJapc5tSk=; b=swBHg90f4gh5Ix
	YlC/ph6nQhDtnCklX0n5niXxnbSJ6jre55tDyXPYUW3KPD95Iz4B1Cj4CI8CNp7YR/yfCVwYvocG5
	7aZKcuEby9MiZDAsgNHQJ+oqjtkvd2nuwiOUaEcPPvwYpXIX2q0Xg5M8KMAvIREkmi0EIU4qZmwU0
	WoBccM3aWEhmtWPmKO96DDo5nLmG+tWsMv1166spNtQ8COisGu2ILgLkLWzGYtLvkmtlcnTz66C5c
	B8TZt5TNUtne7untvy2rdCGjXQ5b5suJvNrJJOqFnk3uYKMXcMWgE9SVnUXfG8qoPeyA6BzmbtkM/
	E2nELiRQc8RCAJZnLEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyGsa-002FYZ-W2; Mon, 06 Jun 2022 17:51:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyGsP-002FVg-AZ; Mon, 06 Jun 2022 17:50:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FE65165C;
	Mon,  6 Jun 2022 10:50:45 -0700 (PDT)
Received: from [10.57.81.38] (unknown [10.57.81.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 344483F66F;
	Mon,  6 Jun 2022 10:50:38 -0700 (PDT)
Message-ID: <6575de6d-94ba-c427-5b1e-967750ddff23@arm.com>
Date: Mon, 6 Jun 2022 18:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] iommu: Ensure device has the same iommu_ops as the
 domain
Content-Language: en-GB
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, joro@8bytes.org, will@kernel.org, marcan@marcan.st,
 sven@svenpeter.dev, robdclark@gmail.com, m.szyprowski@samsung.com,
 krzysztof.kozlowski@linaro.org, baolu.lu@linux.intel.com, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, heiko@sntech.de,
 orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 suravee.suthikulpanit@amd.com, alyssa@rosenzweig.io,
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
 <1e0e5403-1e65-db9a-c8e7-34e316bfda8e@arm.com>
 <Yp4wiJZWxoCLY8tm@Asurada-Nvidia>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Yp4wiJZWxoCLY8tm@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_105053_531324_B68C165D 
X-CRM114-Status: GOOD (  24.35  )
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

On 2022-06-06 17:51, Nicolin Chen wrote:
> Hi Robin,
> 
> On Mon, Jun 06, 2022 at 03:33:42PM +0100, Robin Murphy wrote:
>> On 2022-06-06 07:19, Nicolin Chen wrote:
>>> The core code should not call an iommu driver op with a struct device
>>> parameter unless it knows that the dev_iommu_priv_get() for that struct
>>> device was setup by the same driver. Otherwise in a mixed driver system
>>> the iommu_priv could be casted to the wrong type.
>>
>> We don't have mixed-driver systems, and there are plenty more
>> significant problems than this one to solve before we can (but thanks
>> for pointing it out - I hadn't got as far as auditing the public
>> interfaces yet). Once domains are allocated via a particular device's
>> IOMMU instance in the first place, there will be ample opportunity for
>> the core to stash suitable identifying information in the domain for
>> itself. TBH even the current code could do it without needing the
>> weirdly invasive changes here.
> 
> Do you have an alternative and less invasive solution in mind?
> 
>>> Store the iommu_ops pointer in the iommu_domain and use it as a check to
>>> validate that the struct device is correct before invoking any domain op
>>> that accepts a struct device.
>>
>> In fact this even describes exactly that - "Store the iommu_ops pointer
>> in the iommu_domain", vs. the "Store the iommu_ops pointer in the
>> iommu_domain_ops" which the patch is actually doing :/
> 
> Will fix that.

Well, as before I'd prefer to make the code match the commit message - 
if I really need to spell it out, see below - since I can't imagine that 
we should ever have need to identify a set of iommu_domain_ops in 
isolation, therefore I think it's considerably clearer to use the 
iommu_domain itself. However, either way we really don't need this yet, 
so we may as well just go ahead and remove the redundant test from VFIO 
anyway, and I can add some form of this patch to my dev branch for now.

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cde2e1d6ab9b..72990edc9314 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1902,6 +1902,7 @@ static struct iommu_domain 
*__iommu_domain_alloc(struct device *dev,
  	domain->type = type;
  	/* Assume all sizes by default; the driver may override this later */
  	domain->pgsize_bitmap = ops->pgsize_bitmap;
+	domain->owner = ops;
  	if (!domain->ops)
  		domain->ops = ops->default_domain_ops;

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 6f64cbbc6721..79e557207f53 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -89,6 +89,7 @@ struct iommu_domain_geometry {

  struct iommu_domain {
  	unsigned type;
+	const struct iommu_ops *owner; /* Who allocated this domain */
  	const struct iommu_domain_ops *ops;
  	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
  	iommu_fault_handler_t handler;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
