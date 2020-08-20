Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D406CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:02:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35C22075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YCwM6Xui"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A35C22075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p2KftGjfEA0R2rcQxp6DNe8v/pP4iDnPVvBr/AbZscU=; b=YCwM6XuifkLNtUqAi0BkCxhSC
	CZp5hG2gREkRliOnHLuWJDEnBYeVEuOV/kooN2oMpF+8GWrTAPcE552Fpm4dDs0soLRCT2wBJOrl7
	PpMjvYRRgnv+bphZZcbhe/6Dk2OGop94YwsMm5WWpzVs4JXakjoPj/vNHpLp5IJDJUjmlsTmfYUFt
	yzRnOmr80H2ZGkqTmYuOdsOqi0y01cg8fkJbBfBzads9hBAc45Ix34Y4CGDHxaDZVt5tp1+FTf9Tp
	WGtBZxSylWF7o19FLoocNFbIfE6IxNRsLF4VjX/jTS03zvRcaYkLasbZIq35XzvUfc2oyiQ6SiK+l
	zwyt1Qkww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8tZE-0007Q9-FP; Thu, 20 Aug 2020 23:01:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8tZ9-0007O4-5g; Thu, 20 Aug 2020 23:01:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6C6331B;
 Thu, 20 Aug 2020 16:01:44 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98AAB3F71F;
 Thu, 20 Aug 2020 16:01:39 -0700 (PDT)
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
To: Sakari Ailus <sakari.ailus@iki.fi>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
 <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
Date: Fri, 21 Aug 2020 00:01:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_190151_391153_FCBAD133 
X-CRM114-Status: GOOD (  19.41  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 s-anna@ti.com, will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 t-kristo@ti.com, kyungmin.park@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-20 20:55, Sakari Ailus wrote:
> On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
>> On 2020-08-20 17:53, Sakari Ailus wrote:
>>> Hi Robin,
>>>
>>> On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
>>>> Now that arch/arm is wired up for default domains and iommu-dma, devices
>>>> behind IOMMUs will get mappings set up automatically as appropriate, so
>>>> there is no need for drivers to do so manually.
>>>>
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>
>>> Thanks for the patch.
>>
>> Many thanks for testing so quickly!
>>
>>> I haven't looked at the details but it seems that this causes the buffer
>>> memory allocation to be physically contiguous, which causes a failure to
>>> allocate video buffers of entirely normal size. I guess that was not
>>> intentional?
>>
>> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
>> something didn't go as expected with the earlier IOMMU setup and default
>> domain creation. Chances are that either I missed some subtlety in the
>> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
>> and it never actually goes down the of_iommu_configure() path in the first
>> place. Do you get any messages from the IOMMU layer earlier on during boot?
> 
> I do get these:
> 
> [    2.934936] iommu: Default domain type: Translated
> [    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> [    2.946899] platform 480bc000.isp: Adding to iommu group 0
> 

So that much looks OK, if there are no obvious errors. Unfortunately 
there's no easy way to tell exactly what of_iommu_configure() is doing 
(beyond enabling a couple of vague debug messages). The first thing I'll 
do tomorrow is double-check whether it's really working on my boards 
here, or whether I was just getting lucky with CMA... (I assume you 
don't have CMA enabled if you're ending up in remap_allocator_alloc())

Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
