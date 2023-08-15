Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8666C001DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 01:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cow+D/OuNibG87CSVlC4c0DvS3TBXj6y37gwgDKrJ4=; b=BjuikO2Rh9gYhWVHgxtQ3uz4zf
	JZQZEG52VxdgubQE9wr7ixRgzAsNtBFg32LgCTXdEs/35HqfliHuRM1hxOf6Z0YBPpRF+EcO8iBLC
	ZUhCWZG67q1gVusbq60SErxcTPh4FefQAZQo1eYKW7lDLSTisdx3hahxrPYE/paFcBhUAWSScXzfl
	Guwuo3kcV3t7HdcVrfTNWTGi6WQL6EFYqrWkSke1iIkjYBRJmnzO+M1JbcFYVXFlYvXA5xt/Du4Dz
	bWAlKHowGHsSzGAxIaYoLrOweUQ+33WXDxBpYdeYiLboNlVArQPVTnJ/BYGY2j4QyQMSXSOfHO5U4
	9hjgfdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVixM-000fyH-1n;
	Tue, 15 Aug 2023 01:34:48 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVixJ-000fxY-2O;
	Tue, 15 Aug 2023 01:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692063285; x=1723599285;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jkr/6uy80FBJ1zVM9rO0oVAo4kuNs+82saVQaD5txn0=;
  b=idt4CGF2kLf+rGN3fWSU+WKTCnYsSf+q5ZRypDbiVROKVGYcKlSE/hVY
   2ZZMyWVvxD4/W2cCIS119kv/eZe0zWZx+koHMytgd1mnbMzSL69fdguj1
   nb6Qw0MAng+3AeBw+ArrokS+6TfCHtgOYBP605q+g+lq0fi2NM6pm+FzM
   qSqYSHKeao37wbbeqEI/4NoHG6N8xUCcnu1lUBMswqigSjnnwxjFNj+Vp
   3xFVLi1MR9PbsyokoxMSdO32zjnRY8aFIezWL/+Vv5YywegPEZqTSmV27
   CYNBB5hul+5urEDK0pVDrcu0EZvMJuN7rd6AFeZTiO1XUrBVSaDiXskmF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436073292"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="436073292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768654964"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="768654964"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.149]) ([10.254.215.149])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:34:30 -0700
Message-ID: <7fdbf6a5-87a2-65c1-7c1e-d7b936dd3a67@linux.intel.com>
Date: Tue, 15 Aug 2023 09:34:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson
 <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 00/25] iommu: Make default_domain's mandatory
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <50feed07-f89a-dfc2-d8a8-16f9bf0fe937@linux.intel.com>
 <ZNpksUtIY+3N1Hn3@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNpksUtIY+3N1Hn3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_183445_862954_2CD40CE0 
X-CRM114-Status: GOOD (  21.09  )
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

On 2023/8/15 1:30, Jason Gunthorpe wrote:
> On Mon, Aug 14, 2023 at 04:43:23PM +0800, Baolu Lu wrote:
> 
>>> This is on github:https://github.com/jgunthorpe/linux/commits/iommu_all_defdom
>> It seems that after this series, all ARM iommu drivers are able to
>> support the IDENTITY default domain, hence perhaps we can remove below
>> code?
> Yes, but this code is still used
> 
>> If I remember it correctly, the background of this part of code is
>> that some arm drivers didn't support IDENTITY domain, so fall back to
>> DMA domain if IDENTITY domain allocation fails.
> Not quite..
> 
> 	if (req_type)
> 		return __iommu_group_alloc_default_domain(group, req_type);
> 
> req_type == 0 can still happen because it depends on what
> def_domain_type returns, which is still 0 in alot of cases
> 
> 	/* The driver gave no guidance on what type to use, try the default */
> 	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
> 	if (dom)
> 		return dom;
> 
> So we try the default which might be IDENTITY/DMA/DMA_FQ - still have
> to do this.
> 
> 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
> 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
> 		return NULL;
> 	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
> 	if (!dom)
> 		return NULL;
> 
> 	pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
> 		iommu_def_domain_type, group->name);
> 
> And this hunk is primarily a fallback in case the DMA_FQ didn't
> work. Then we try normal DMA.
> 
> That it also protected against not implementing IDENTITY is a side
> effect, so I think we have to keep all of this still.

Okay, fair enough. Thanks for the explanation.

Best regards,
baolu

