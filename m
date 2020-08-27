Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B669C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 18:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D94662177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 18:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFpFQ/8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D94662177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Zzjv7s4yE6fJgI6WW1CGd/kNu/eHg1eF1bl8QeGJ1M=; b=pFpFQ/8ekVlZfVYQ7VgT2Fnaj
	NmjnGUzRZcZD9DFSFG0WPF5Y2Xy9Jgt0Xk3BrjUYdGPlLqo6gs/c7mh8gi5BfDuo5eSETjSOvWcVn
	Wkgjebu0q9iv/PTELawO8X+oCDnxWQzAri4sZoKm1tYUuaQdAqA5MV1DzvoE1kEtInga5gs/tgLrg
	CeAWhFDKmK/cFEj1XSjVzUELwmTLLe2YfKeUjgPttBZBwfd8JhzAxD7BFAGfgY0MK6scAHkHPatFx
	mf3hTwwhCOWUbwOXYJM4JPj+Gi1c9qZPRpf6CfQ3WvWv0sff16kWVyb+TB2ZvEtOE1vg/BFFwBHBw
	agnnjDXzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBMTh-00063N-Ma; Thu, 27 Aug 2020 18:18:25 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBMTc-00061M-EH; Thu, 27 Aug 2020 18:18:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35068101E;
 Thu, 27 Aug 2020 11:18:17 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62533F68F;
 Thu, 27 Aug 2020 11:18:13 -0700 (PDT)
Subject: Re: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
To: Thierry Reding <thierry.reding@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
 <20200827154502.GA1660457@ulmo>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f6697e60-286c-f7c7-39d1-fe0784cc3e6d@arm.com>
Date: Thu, 27 Aug 2020 19:18:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827154502.GA1660457@ulmo>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_141820_541262_37F24B9A 
X-CRM114-Status: GOOD (  24.20  )
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
 linux-tegra@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 digetx@gmail.com, will@kernel.org, hch@lst.de,
 linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 agross@kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, t-kristo@ti.com,
 kyungmin.park@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-27 16:45, Thierry Reding wrote:
> On Thu, Aug 20, 2020 at 04:08:32PM +0100, Robin Murphy wrote:
>> Now that arch/arm is wired up for default domains and iommu-dma,
>> implement the corresponding driver-side support for DMA domains.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
>>   1 file changed, 21 insertions(+), 16 deletions(-)
> 
> We can't do that yet because it will currently still break for use-cases
> such as display where we don't properly set up identity mappings during
> boot. The result is that the dma-iommu code will enable translations
> before the driver gets a chance to set up any mappings and if the
> display controller was left on by the bootloader, scanning out a splash
> screen, this causes faults between the point where dma-iommu is being
> set up for the display controller and where the display controller
> starts mapping its own buffers (rather than the ones mapped by the
> bootloader).

Rest assured that I understand the situation all too well ;) As with 
tegra-gart, the unspoken point here is that since tegra-smmu implements 
of_xlate(), then arm_setup_iommu_dma_ops() must already be causing the 
exact same problem, no? This patch only seeks to move any existing 
behaviour over to the common backend, regardless of whether it was ever 
really appropriate in the first place.

> That said, I do have a series that I've been carrying around for longer
> than I've wanted that does exactly this for Tegra SMMU and I'd prefer if
> you could drop this particular change from your series so that I can
> keep working on resolving the identity mapping issues first.

That would mean you'd see a functional change from the final patch, 
wherein nothing would ever be able to get translation unless drivers do 
their own explicit IOMMU API management. If you definitely want that 
change then OK, but it would still be nice to do it "properly" with 
IOMMU_DOMAIN_IDENTITY support, rather than just forcibly failing default 
domain allocation. I'm having a go at reworking the tegra-gart patch in 
that direction, so I can certainly try it for tegra-smmu as well.

Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
