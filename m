Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41591C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7PLUL9aPyqBcpN5wRzcbBdsu48ESNM2H6qfRif6CjU=; b=IwtvL0HeDy3A4M1wBB5K/b0x/B
	u80IXcfSQiYPmNzeZ7RYp5avWQCO4CC6n+FXGfZCRBmhMgeX+erXtD5WqWRcydWwYvuDWWXdR+I9Q
	g7I3YKVcZ55PyGQv3Q3ls01H1etYjUkn/PsW/1lLO+2n4MU5mokLitlXybIID6PMnTi6cF09pvtOI
	ZXgLJZf/ib8l6PbcAeE9sfi0ULHHHqlaAPlm576gl9cqymuYQYzu6wwj8CwUa25HWbaA+HwcU8in0
	TVmYCSPfdwnkbmEJhuMjAbGd5dhiX9fP1oi4rgnwaMVsHOScZhw0jAK0EpMsSMW8viDrEYGMvtxBK
	/j30k9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pRE-00G0Oq-JM; Thu, 30 Jun 2022 08:22:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pQz-00G0Iy-1e; Thu, 30 Jun 2022 08:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC83F1BCB;
	Thu, 30 Jun 2022 01:21:52 -0700 (PDT)
Received: from [10.57.85.25] (unknown [10.57.85.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6A263F66F;
	Thu, 30 Jun 2022 01:21:47 -0700 (PDT)
Message-ID: <e5799215-8b55-90a8-7ca4-35f85ffb5969@arm.com>
Date: Thu, 30 Jun 2022 09:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible domain
 and device/group
Content-Language: en-GB
To: Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Baolu Lu <baolu.lu@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-2-nicolinc@nvidia.com>
 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
 <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
 <20220624181943.GV4147@nvidia.com> <YrysUpY4mdzA0h76@Asurada-Nvidia>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YrysUpY4mdzA0h76@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_012157_231214_316F9782 
X-CRM114-Status: GOOD (  13.97  )
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

On 2022-06-29 20:47, Nicolin Chen wrote:
> On Fri, Jun 24, 2022 at 03:19:43PM -0300, Jason Gunthorpe wrote:
>> On Fri, Jun 24, 2022 at 06:35:49PM +0800, Yong Wu wrote:
>>
>>>>> It's not used in VFIO context. "return 0" just satisfy the iommu
>>>>> framework to go ahead. and yes, here we only allow the shared
>>>>> "mapping-domain" (All the devices share a domain created
>>>>> internally).
>>
>> What part of the iommu framework is trying to attach a domain and
>> wants to see success when the domain was not actually attached ?
>>
>>>> What prevent this driver from being used in VFIO context?
>>>
>>> Nothing prevent this. Just I didn't test.
>>
>> This is why it is wrong to return success here.
> 
> Hi Yong, would you or someone you know be able to confirm whether
> this "return 0" is still a must or not?

 From memory, it is unfortunately required, due to this driver being in 
the rare position of having to support multiple devices in a single 
address space on 32-bit ARM. Since the old ARM DMA code doesn't 
understand groups, the driver sets up its own canonical 
dma_iommu_mapping to act like a default domain, but then has to politely 
say "yeah OK" to arm_setup_iommu_dma_ops() for each device so that they 
do all end up with the right DMA ops rather than dying in screaming 
failure (the ARM code's per-device mappings then get leaked, but we 
can't really do any better).

The whole mess disappears in the proper default domain conversion, but 
in the meantime, it's still safe to assume that nobody's doing VFIO with 
embedded display/video codec/etc. blocks that don't even have reset drivers.

Thanks,
Robin.

