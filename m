Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00B0C00528
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gxio5fbySE3NeRafEdxet2QY0oC7INev9SZcFAW0eTU=; b=hxufhs5JEog4jYtT9BbPXl9Kk4
	v/0Sfn3EeAF6Lf5pYygC4zMla2nfDM6qkhMdNbiOaA3rNA0YHDbAjPL56Td/Ty7FwVqALWzyykw8Q
	hK+yNZsohBwNjSnpS8XeMDb4dw/aiV48fT9DqfcvvZrLPC04/UFln3/QpVA2qq6sQGAOYKH46AqJM
	Ru3KuDrgVJvWsl3Ja92hLtCBzJM7xshV8gkFTBOtVJNo++xRxDAMbxny6uaC+V2Yxc2gQFPRxqjbo
	NaSlCY2wNg/ZRDUs8NUtFpAy8cfSfKnVX4LEYnLTlFIx1I05yKVuvbfTIFH6VdXbuOS/XrMWPqu/X
	/8DLy8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObAH-009nxm-01;
	Wed, 26 Jul 2023 09:50:41 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qObAD-009nwS-2x;
	Wed, 26 Jul 2023 09:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690365037; x=1721901037;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R4Zidp2fJsuWVie8ZjWjKRcfxPMAX8NCKddofG0H9Oc=;
  b=gw408jtrLKHw+jsyoZQnDXz3MEwFNenIaEKE/5IOa9r80Zr695C021SG
   Ihj1pxNZ9KWSHf6/6Lq7iI88uwAi2qKokLlIouUCG/MOiQ+I9r50L0mN4
   7k4+9lQJ1BQj82A7+v78PZaK2V12JcZo/8t5c0AeAyEQaE0FjCbeqFjlj
   eSSjXUw5aNf9f9DYde21cj/rBSqrbbKMgtoDdFE3fscuy8Dhw21tuxzRD
   O2o3phXmzbttnP7R6E6BP71T6oB7NQdViScXW67VNRLQGiPO4zAJ+DlQw
   XStnvHUepziRyoG17LhLmbF0/mIZ0qQjQTRg2JAvnhquMf84hBmcZ/8A+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370645325"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370645325"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869813981"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.208.129]) ([10.254.208.129])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:50:25 -0700
Message-ID: <219fb054-c5a7-92e5-dfa4-af6a5a404c3e@linux.intel.com>
Date: Wed, 26 Jul 2023 17:50:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 21/25] iommu: Require a default_domain for all iommu
 drivers
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
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
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <21-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <21-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_025038_032215_A518087A 
X-CRM114-Status: GOOD (  22.79  )
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

On 2023/7/25 1:22, Jason Gunthorpe wrote:
> At this point every iommu driver will cause a default_domain to be
> selected, so we can finally remove this gap from the core code.
> 
> The following table explains what each driver supports and what the
> resulting default_domain will be:
> 
>                                          ops->defaut_domain
>                      IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> amd/iommu.c             Y       Y                       N/A             either
> apple-dart.c            Y       Y                       N/A             either
> arm-smmu.c              Y       Y                       IDENTITY        either
> qcom_iommu.c            G       Y                       IDENTITY        either
> arm-smmu-v3.c           Y       Y                       N/A             either
> exynos-iommu.c          G       Y                       IDENTITY        either
> fsl_pamu_domain.c       Y                               N/A             N/A     PLATFORM
> intel/iommu.c           Y       Y                       N/A             either
> ipmmu-vmsa.c            G       Y                       IDENTITY        either
> msm_iommu.c             G                               IDENTITY        N/A
> mtk_iommu.c             G       Y                       IDENTITY        either
> mtk_iommu_v1.c          G                               IDENTITY        N/A
> omap-iommu.c            G                               IDENTITY        N/A
> rockchip-iommu.c        G       Y                       IDENTITY        either
> s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
> sprd-iommu.c                    Y                       N/A             DMA
> sun50i-iommu.c          G       Y                       IDENTITY        either
> tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
> virtio-iommu.c          Y       Y                       N/A             either
> spapr                                   Y       Y       N/A             N/A     PLATFORM
>   * G means ops->identity_domain is used
>   * N/A means the driver will not compile in this configuration
> 
> ARM32 drivers select an IDENTITY default domain through either the
> ops->identity_domain or directly requesting an IDENTIY domain through
> alloc_domain().
> 
> In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
> forces an IDENTITY domain.
> 
> S390 uses a PLATFORM domain to represent when the dma_ops are set to the
> s390 iommu code.
> 
> fsl_pamu uses an IDENTITY domain.
> 
> POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.
> 
> The x86 drivers continue unchanged.
> 
> After this patch group->default_domain is only NULL for a short period
> during bus iommu probing while all the groups are constituted. Otherwise
> it is always !NULL.
> 
> This completes changing the iommu subsystem driver contract to a system
> where the current iommu_domain always represents some form of translation
> and the driver is continuously asserting a definable translation mode.
> 
> It resolves the confusion that the original ops->detach_dev() caused
> around what translation, exactly, is the IOMMU performing after
> detach. There were at least three different answers to that question in
> the tree, they are all now clearly named with domain types.
> 
> Tested-by: Heiko Stuebner<heiko@sntech.de>
> Tested-by: Niklas Schnelle<schnelle@linux.ibm.com>
> Tested-by: Steven Price<steven.price@arm.com>
> Tested-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen<nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

