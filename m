Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E750C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SjAo2LLJivDkap42pf3z56Xmcd0kloZNZC6o1XU7uw=; b=loJI3f5gu+yCD3LmqTZNi9N3J+
	VEfQfyjlwEAJP5jGRBIpepBX2vRJbr0DgASgyw/qqzayzM6wLQ5ctvItpmGphAbxQMuzaibKfUfDZ
	1KYFegu9fBP0tzfSbphevFaqgCGVMeJUQbbNz1xW/4KZF8TPYhV1gBsoT9/qSssbPMmH3mljCO1Z2
	qAUCmxkB/o73gtJg0/i+pL1Kw/rIeLvEWtxLKgTAiTG9BV+NxRGVQD0EC7usX5y3vxg5liEfs1BCB
	OO8+eqaNLHDytOIQYP1/iK1oG/L8C1KXfGPfvPHooGcTawUMt5ecX8bjEbtTjXdOymRQyM+fuut7L
	5Cdx9ZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrQ4-008GOM-GQ; Tue, 31 Jan 2023 14:15:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrPu-008GKL-B9; Tue, 31 Jan 2023 14:15:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21EDA2F4;
	Tue, 31 Jan 2023 06:16:00 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99C563F71E;
	Tue, 31 Jan 2023 06:15:16 -0800 (PST)
Message-ID: <0e9f677b-846d-809d-9bc3-30906f703fda@arm.com>
Date: Tue, 31 Jan 2023 14:15:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] iommu: mediatek: Add support of unmanaged iommu
 domain
Content-Language: en-GB
To: Alexandre Bailon <abailon@baylibre.com>, yong.wu@mediatek.com,
 joro@8bytes.org, will@kernel.org
Cc: matthias.bgg@gmail.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-3-abailon@baylibre.com>
 <741920ba-8637-5e28-695c-699b46351590@arm.com>
 <f126c61f-6373-d6c5-59c8-24dea9d9d168@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <f126c61f-6373-d6c5-59c8-24dea9d9d168@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_061522_451193_4A4931CC 
X-CRM114-Status: GOOD (  15.95  )
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

On 31/01/2023 1:08 pm, Alexandre Bailon wrote:
> Hi Robin
> 
> On 1/30/23 13:04, Robin Murphy wrote:
>> On 2023-01-30 10:27, Alexandre Bailon wrote:
>>> Currently, the driver can allocate an unmanaged iommu domain.
>>> But, this only works for SoC having multiple bank or multiple iova 
>>> region.
>>
>> That is for good reason - there is only a single pagetable per bank, 
>> so if there are multiple devices assigned to a single bank, they 
>> cannot possibly be attached to different domains at the same time. 
>> Hence why the banks are modelled as groups.
> I understand.
> I am trying to upstream a remoteproc driver but the remote processor is
> behind the iommu.
> remoteproc can manage the iommu but it requires an unmanaged domain.
> I tried a couple of things but this cause code duplication,
> implies many hacks and not always reliable.
> Do you have any suggestion ?

If there are other active devices behind the same IOMMU, and the 
remoteproc device cannot be isolated into its own bank using the 
existing IOMMU driver logic, then the remoteproc driver cannot manage 
the IOMMU directly, and must just use the regular DMA API. There's no 
way around it; you can't have two different parts of the kernel both 
thinking they have exclusive control of a single IOMMU address space at 
the same time. Similarly, remoteproc also cannot take explicit control 
of a multi-device group if it's not actually in control of the other 
devices, since their drivers will not be expecting the DMA address space 
to suddenly change underfoot - that's why iommu_attach_device() has the 
check which you presumably ran into.

Thanks,
Robin.

