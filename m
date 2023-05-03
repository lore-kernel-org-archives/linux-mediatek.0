Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3F1C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHXhoVUMmc39mK93UPhPamPu8LnbufwYMuTrXw4x59s=; b=poCllW+aqL2KAeEQ4j5LCJ1aAH
	jsI5AqFClK2zUuVDz5mZJVqMxtW18XoCv1X0KkEFyo3B+PKEyWZQDm3tv5+wjdRjKi9lH27Jn37pu
	aZIbhJXgBOcb9NazunIsiYz6XARCClvb/FxxRXa46pnLcCpt/uz0yJiU+UyKlOLCgohl7d6LuJA89
	Lnvjg6KM36YqwSO2vXPa6j9YooXzZv/rf0E3sHCBBondJXhF9oweQ2FTS3FFjL8WN6YGd+ZKIAmTS
	7kqXK4qOdcycXOISRx/m4NBf2q06NYgE4yaPn2wgkEKBFQFBmERg0YjRBeF8GNqNY12Q/LkCj3kTT
	S8KrFoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puBBj-004Utt-2q;
	Wed, 03 May 2023 12:02:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puBBf-004UrB-1s;
	Wed, 03 May 2023 12:02:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EA0F2F4;
	Wed,  3 May 2023 05:03:02 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 671F23F5A1;
	Wed,  3 May 2023 05:02:12 -0700 (PDT)
Message-ID: <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
Date: Wed, 3 May 2023 13:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bjorn Andersson <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Orson Zhai <orsonzhai@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Steven Price <steven.price@arm.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com> <ZFI/D6mnLKYpdIqx@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZFI/D6mnLKYpdIqx@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_050223_714699_AFB576AC 
X-CRM114-Status: GOOD (  21.87  )
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

On 2023-05-03 12:01, Jason Gunthorpe wrote:
> On Wed, May 03, 2023 at 10:17:29AM +0100, Robin Murphy wrote:
>> On 2023-05-01 19:02, Jason Gunthorpe wrote:
>>> tegra-gart seems to be kind of wonky since from the start its 'detach_dev'
>>> op doesn't actually touch hardware. It is supposed to empty the GART of
>>> all translations loaded into it.
>>
>> No, detach should never tear down translations - what if other devices are
>> still using the domain?
> 
> ?? All other drivers do this.

The only driver I'm aware of which effectively tore down mappings by 
freeing its pagetable on detach was sprd-iommu, and that was recently 
fixed on account of it being clearly wrong.

Remember that the GART registers here are literally just its pagetable, 
nothing more.

> The core contract is that this sequence:
> 
>     dom = iommu_domain_alloc()
>     iommu_attach_device(dom, dev)
>     iommu_map(dom,...)
>     iommu_detach_device(dom, dev)
> 
> Will not continue to have the IOVA mapped to the device. We rely on
> this for various error paths.

Yes, I'm not disputing that we expect detach to remove that device's 
*access* to the IOVA (which is what GART can't do...), but it should 
absolutely not destroy the IOVA mapping itself. Follow that sequence 
with iommu_attach_device(dom, dev) again and the caller can expect to be 
able to continue using the same translation.

> If the HW is multi-device then it is supposed to have groups.

Groups are in fact the most practical example: set up a VFIO domain, 
attach two groups to it, map some IOVAs, detach one of the groups, keep 
using the other. If the detach carried an implicit iommu_unmap() there 
would be fireworks.

>>> Call this weirdness PLATFORM which keeps the basic original
>>> ops->detach_dev() semantic alive without needing much special core code
>>> support. I'm guessing it really ends up in a BLOCKING configuration, but
>>> without any forced cleanup it is unsafe.
>>
>> The GART translation aperture is in physical address space, so the truth is
>> that all devices have access to it at the same time as having access to the
>> rest of physical address space. Attach/detach here really are only
>> bookkeeping for which domain currently owns the aperture.
> 
> Oh yuk, that is not an UNMANAGED domain either as we now assume empty
> UNMANAGED domains are blocking in the core...

They are, in the sense that accesses within the aperture won't go 
anywhere. It might help if domain->geometry.force_aperture was 
meaningful, because it's never been clear whether it was supposed to 
reflect a hardware capability (in which case it should be false for 
GART) or be an instruction to the user of the domain (wherein it's a bit 
pointless that everyone always sets it).

Thanks,
Robin.

