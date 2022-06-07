Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 07:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=517ZQLvlvcrLxu5ep/yBR0ARj3lcinKOQg4GaP3SDaA=; b=ntmgqDfowVMvRv
	I7yomK84ZMndYCSc8INrc0yQJoVOgxqLoFPUSVP8k25k1qiByqvulaYCDDD2agIuN8crOA0mUq3Hq
	0NDQX/uaWjsX6jrdCwnfzy4henApnoPO0HglqqC0AqQN8f4s0eDKcd3swucq7mP3X+3FWqRWwjoki
	6mmG1SDZPOpqDSMQPpXPneyPLRhO0LDvGWJ6I6jvQagmuWvkckVo34ZWU/yT6SLuSMLkJLymKYdjo
	dcpjFul+UTgo38H2GcVm3mNwOjKGXwMvmjAqVDWFZXew33qbsNs/xy4rnGS4BieN98XfRZpuR78Gz
	b7Y+sKXEKudIIS/nr5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTtp-005Yk6-NE; Tue, 07 Jun 2022 07:45:13 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTta-005Ydx-3D; Tue, 07 Jun 2022 07:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654587898; x=1686123898;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OSBO16dRCwR6Wb79tDIGbzqHZ301kVBrdpEBr6LRMRc=;
  b=SIW+piUkCIkSZoy+PR5SKFsYfsxPDz0ycH709H55IhU0LwJpnrWF9DGJ
   YNWY3Vrkro1UO3/1pnTb7WJHJzLntddZ5l/WCtUcrJJLcoNAxJ4rmKkm7
   U9YVeVg2T+XLK3KqaxBXPepdb/FgKo3bD002cSb+wDgnJ5MnpCYh2GwNJ
   p9f+Z6Z9vTiA3CGXm2NGrLf8agC0/HkwZMNMb7b3o3kh/j5Q+D3ex4g/S
   f2JtRSBH6pOdnvB+Hv7ovE8jHae6xLOUQTvh8uLvaD0JBq4qbQorNQ2Ic
   W9z69th+4zhGhofNRQgjGxTcJNbgd7s843m0h2uPyQEZLKsecwokszlMj
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277063806"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="277063806"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 00:44:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="584086830"
Received: from zwang64-mobl1.ccr.corp.intel.com (HELO [10.249.174.202]) ([10.249.174.202])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 00:44:45 -0700
Message-ID: <d357966b-7abd-f8f3-3ca7-3c99f5e075b9@linux.intel.com>
Date: Tue, 7 Jun 2022 15:44:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 alyssa@rosenzweig.io, alim.akhtar@samsung.com, dwmw2@infradead.org,
 yong.wu@mediatek.com, mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
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
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, marcan@marcan.st, sven@svenpeter.dev, robin.murphy@arm.com,
 robdclark@gmail.com, m.szyprowski@samsung.com,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, heiko@sntech.de,
 orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com
References: <20220606061927.26049-1-nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220606061927.26049-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_004458_232450_9A8D57DE 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022/6/6 14:19, Nicolin Chen wrote:
> Worths mentioning the exact match for enforce_cache_coherency is removed
> with this series, since there's very less value in doing that since KVM
> won't be able to take advantage of it -- this just wastes domain memory.
> Instead, we rely on Intel IOMMU driver taking care of that internally.

After reading this series, I don't see that Intel IOMMU driver needs any
further change to support the new scheme. Did I miss anything?

Best regards,
baolu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
