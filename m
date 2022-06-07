Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97907C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbHZQBrostyEnOaqH6kXIZVQ7zbK/lPnD5TEvu9Zazw=; b=YEljCwmYwFdIsK
	eCr5tDosiWHAf0tc7KzJTcytEVY7HGleuIdMtbr9HgIkFLiksmjltwwYMF4eOMlHB9t43HFokxmeK
	t24oNrO/fmjurqL26Pxm9jvzDohPRJKz/RNa4n6xxTV0n9bVok1AQYzgIG6G5bs1uU3JCKGmOOfOA
	aIEqxnFuz6ln+oIIscFSxpfb1hCUFOWKTUwvrb4p5H5mNAt7JKVcEIg4ldKlui2LpRKzJepJVtnjs
	QjdS5lo4B90w1bzf5GdV23s/RErMj4uXaXkoRGguCRmkvXhPlho6iU77fsNX2j2msRS3QHUEsi/cz
	C8ZV1DziTnCzBKLQUZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYYz-007Qfl-A8; Tue, 07 Jun 2022 12:44:01 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYXn-007Pv2-ME; Tue, 07 Jun 2022 12:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654605767; x=1686141767;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7CnaOaKftZFuU6zS5ejOPSw/a0TRQ7MfLEcH+ST55pI=;
  b=ayyQhT0tkimPnCvy5Xr697gLqjJM/22scaPtoIJ2dICP4s5tstrhtAox
   H/WdeT4t7BDOHBn2AcIqDtpGpPnNBBzCVVhew8mPwO64Az1obJ1aRIlVi
   QZiEtS5edS74vgM08bvEyRaf4EuGmcbWVTF6DzoKhUlfjLBGwtepwawNM
   21KohzEOmODVJXG3t6bsCCT3PWmiwNE9TXvcplZGn67TvOlHTwmoDLEu2
   N+yyceb5FAmf9cHijnF3Y4R8U/yaKkjuAiDeapuxDTlWqH/WMbjL/4uLt
   cD4jmHVaOFuGzq3ZX1nUjoMpd2/3vViI+wdML/Ez/nz4wXTt6VBuxRHJT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="302081687"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="302081687"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 05:42:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="584184405"
Received: from zwang64-mobl1.ccr.corp.intel.com (HELO [10.249.174.202]) ([10.249.174.202])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 05:42:34 -0700
Message-ID: <3d0b2863-bb4f-31e1-d54e-09ddf4762d43@linux.intel.com>
Date: Tue, 7 Jun 2022 20:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, Nicolin Chen <nicolinc@nvidia.com>,
 joro@8bytes.org, will@kernel.org, marcan@marcan.st, sven@svenpeter.dev,
 robin.murphy@arm.com, robdclark@gmail.com, m.szyprowski@samsung.com,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
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
Subject: Re: [PATCH 0/5] Simplify vfio_iommu_type1 attach/detach routine
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220606061927.26049-1-nicolinc@nvidia.com>
 <d357966b-7abd-f8f3-3ca7-3c99f5e075b9@linux.intel.com>
 <20220607115820.GH1343366@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220607115820.GH1343366@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_054247_815045_3096B84B 
X-CRM114-Status: GOOD (  10.89  )
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

On 2022/6/7 19:58, Jason Gunthorpe wrote:
> On Tue, Jun 07, 2022 at 03:44:43PM +0800, Baolu Lu wrote:
>> On 2022/6/6 14:19, Nicolin Chen wrote:
>>> Worths mentioning the exact match for enforce_cache_coherency is removed
>>> with this series, since there's very less value in doing that since KVM
>>> won't be able to take advantage of it -- this just wastes domain memory.
>>> Instead, we rely on Intel IOMMU driver taking care of that internally.
>>
>> After reading this series, I don't see that Intel IOMMU driver needs any
>> further change to support the new scheme. Did I miss anything?
> 
> You already did it :)

Just as I thought. Thank you!

Best regards,
baolu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
