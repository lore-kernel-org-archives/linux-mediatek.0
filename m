Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38003C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3esF2aOLBq2htXZcTUP0V/4H9dct4mXjRkT9JcNQEI=; b=J6aFwfzFiTaczVN6ofVj1m/D+J
	s1D17vYLe69c5GF3AxSM/3Izd7poj3vCTbQuZuxoaUSl7YA3b+aKRYIuFnRQOXmlMFUjiGOBncNXP
	Q0AwSI10zN3VUtaEjNYspMhwQaM8LcIWLgC17t+Ds5n+4g4DWDIokOZg4gKrv4vzLdvcXDFoOcT/G
	s8vqVjCHaf1Hd6cu/ktz4ERqWqxS7O5mayVxcStnYxY64XWcBENzRp4nbR9F8tbT1PoemqKPLpOnz
	4rznxqEZ9RAoLVFAq2E1PxZTZyU3CXzkDnW51pupqQhQI82q2m48TOqYayxkiU55rTkaUF5nm+GFf
	UuMJPS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptf0N-00HOLI-2o;
	Tue, 02 May 2023 01:40:35 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptf0L-00HOKU-2Z;
	Tue, 02 May 2023 01:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g3esF2aOLBq2htXZcTUP0V/4H9dct4mXjRkT9JcNQEI=; b=XGNIw81+ht6dcS7BqWHzGTh4ha
	QY42VF48iXFoE+EYXbfuMFmGq0h/5bsbQnVYqUhnc8V/Ll6ztxkgscR9iv9Z4asimSBMs5GfiIls8
	9/JDVXhday0mK3uM14PhRDo5WBnsyK7ce91sJcvmzM6Bi4GoJGp5XR6KtWrOE4CTTeHT2o70nF6D9
	RpMpdoHU4cYr72kFVrGPSw7DJ5lbkwNoS0CE0DJw8ZUs32kfOfkRZ+ZJlYDJ8qOQ1xQCOLoIZxUes
	Gu4fcgEZJi7eNapQHrfQ/7A1OXrh2Ejiwk1Cd0Qhflx+9+xiXjZ7Dgguo2jFgLXFxB5ulP5dxUzVQ
	ZDCpGxPw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptbj1-00F1dU-2g;
	Mon, 01 May 2023 22:10:30 +0000
Received: from [77.22.52.211] (helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ptbid-0003BI-1U; Tue, 02 May 2023 00:10:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bjorn Andersson <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, iommu@lists.linux.dev,
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
 Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 00/20] iommu: Make default_domain's mandatory
Date: Tue, 02 May 2023 00:10:01 +0200
Message-ID: <7763083.0VBMTVartN@diego>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_231028_191878_F7CE030A 
X-CRM114-Status: UNSURE (   9.36  )
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

Am Montag, 1. Mai 2023, 20:02:44 CEST schrieb Jason Gunthorpe:
> Jason Gunthorpe (20):
>   iommu: Add IOMMU_DOMAIN_PLATFORM
>   iommu/terga-gart: Replace set_platform_dma_ops() with
>     IOMMU_DOMAIN_PLATFORM
>   iommu/s390: Replace set_platform_dma_ops() with IOMMU_DOMAIN_PLATFORM
>   iommu/fsl_pamu: Replace set_platform_dma_ops() with
>     IOMMU_DOMAIN_PLATFORM
>   iommu: Allow an IDENTITY domain as the default_domain in ARM32
>   iommu/exynos: Implement an IDENTITY domain
>   iommu/tegra-smmu: Implement an IDENTITY domain
>   iommu/tegra-smmu: Support DMA domains in tegra
>   iommu/omap: Implement an IDENTITY domain
>   iommu/msm: Implement an IDENTITY domain
>   iommu/mtk_iommu_v1: Implement an IDENTITY domain
>   iommu: Remove ops->set_platform_dma_ops()
>   iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu: Require a default_domain for all iommu drivers
>   iommu: Add ops->domain_alloc_paging()
>   iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
>   iommu: Convert remaining simple drivers to domain_alloc_paging()

Also needs an update for Greg's
b18d0a0f92a8 ("iommu: make the pointer to struct bus_type constant")

With that fixed, both my rk3288-pinky (arm32) and px30-minievb (arm64)
Rockchip boards keep their display working before and after applying this
series (on top of the previous), so


Tested-by: Heiko Stuebner <heiko@sntech.de>



