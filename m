Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUXDVPgO9ryfMeHmYe6I7BW7Did8T/4d5YvyHueStJ8=; b=lIyWGd9hEqYRkn0W64kdOWwYaf
	125rUpYQdXUXRlkDB/n0/VGeefBnCH1ig22EV/2uG2hbgBHSB7h0WdLGpEcQT5Fceb+TXRJCQxfFl
	ITr3O986JxZw6gh64JWXvdZ6H5cYrCgY1zuryhweamSsF1sry/uS9d4eJnw4aKjT0f2dR6gvQN7gK
	r4igNezHqg24NFGoPWVK00dUX/nBwMGP/z1F+QmF5suhhuIvMn+8XPNjAN/7BgeId/MAL4lDE1m4g
	xdYhzW3lDGL6LdiGMMQ2WIi+153X72fw1caynh/v23+JWm49WVmG9+0+gXy4RYcFoZJ3XUgAVkqrT
	bIx/kYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ENX-00HPP5-VE; Mon, 20 Jun 2022 10:11:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ENK-00HPLG-S7; Mon, 20 Jun 2022 10:11:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C40DE113E;
	Mon, 20 Jun 2022 03:11:10 -0700 (PDT)
Received: from [10.57.84.159] (unknown [10.57.84.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 162D83F7D7;
	Mon, 20 Jun 2022 03:11:05 -0700 (PDT)
Message-ID: <55e352d5-3fea-7e46-0530-b41d323b6fcf@arm.com>
Date: Mon, 20 Jun 2022 11:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/5] vfio/iommu_type1: Simplify group attachment
Content-Language: en-GB
To: "Tian, Kevin" <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "saiprakash.ranjan@codeaurora.org" <saiprakash.ranjan@codeaurora.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "isaacm@codeaurora.org" <isaacm@codeaurora.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-6-nicolinc@nvidia.com>
 <BL1PR11MB52710E360B50DDA99C9A65D18CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
 <YquxcH2S1fM+llOf@Asurada-Nvidia>
 <BN9PR11MB5276C7BFA77C2C176491B56A8CAF9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <BN9PR11MB5276C7BFA77C2C176491B56A8CAF9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_031119_050284_E04E0647 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On 2022-06-17 03:53, Tian, Kevin wrote:
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: Friday, June 17, 2022 6:41 AM
>>
>>> ...
>>>> -     if (resv_msi) {
>>>> +     if (resv_msi && !domain->msi_cookie) {
>>>>                ret = iommu_get_msi_cookie(domain->domain,
>>>> resv_msi_base);
>>>>                if (ret && ret != -ENODEV)
>>>>                        goto out_detach;
>>>> +             domain->msi_cookie = true;
>>>>        }
>>>
>>> why not moving to alloc_attach_domain() then no need for the new
>>> domain field? It's required only when a new domain is allocated.
>>
>> When reusing an existing domain that doesn't have an msi_cookie,
>> we can do iommu_get_msi_cookie() if resv_msi is found. So it is
>> not limited to a new domain.
> 
> Looks msi_cookie requirement is per platform (currently only
> for smmu. see arm_smmu_get_resv_regions()). If there is
> no mixed case then above check is not required.
> 
> But let's hear whether Robin has a different thought here.

Yes, the cookie should logically be tied to the lifetime of the domain 
itself. In the relevant context, "an existing domain that doesn't have 
an msi_cookie" should never exist.

Thanks,
Robin.

