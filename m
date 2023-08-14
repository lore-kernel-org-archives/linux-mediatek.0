Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F026C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJgztVC97+fEJbmoSmMqrOjQFcqb74KPMoauT473nhI=; b=gZNm7gMyuoOEFUzdr+pSwXqP9/
	eEK71J2eYWOHSZWgPXXAksBANiL5oxYTepY1O8ZR2bQVAs630509AU6N6nXb+82T3Hfiz6snDnpVf
	B3Epx5w11lqJEWO+byGYw1Pzl0O5I1BnI4cLgpd2yVqpAzb8rhy3O49oCpV9f1YG0+0/V3bReza3h
	aapHXrIAhRs7X8YJaxjlbWIrN3UEtrCsuUPx9TYzVkm45AEAzXCwbzobJ1QOSNgI07JhMowYEBOGg
	ZBpWaveKA6R11rvmp77aweXlBYJOyIOsg3uDWc58vH8dnoMtiOAJVUwSif8mn3g/+mslmOjovzEJW
	PKRSeklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTAr-00GYJA-39;
	Mon, 14 Aug 2023 08:43:41 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTAp-00GYIH-0t;
	Mon, 14 Aug 2023 08:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692002619; x=1723538619;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BL9tXjKde0HCCblpk5lukrRNwiYGBWwkK40HXgINphM=;
  b=Fmwbnehf7ODNxX1JbwDHXd1ptg4E6Rz+5aUGfFZJltO7oPtlvrGTRSWh
   WUIK9Ql/eJFp8/fREgWn8tX0bG6xeBzqoNS0uSQf3eeWCsz2H26wucv/N
   OdHQA3JkjDwLpllx9KCawqROxBNi42XnAOdZBOwXdSNV82/yo4+4Ok6CF
   dfnZjY+9zeHwAopQOgaExfithragLFnKJKkRn1ZmgiDDZQMb9lXyhRzMG
   oLHWjs0OqFEK6ULpS0w0GfeKTERJobpheZs1Myi4yrR2zSU+VRoqiP+eh
   53NCNIwctKK0VgESV/VCxSrNb6F4XPT84l/MO+Hd/TYrBMiRJnecZ4Tge
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="362144638"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="362144638"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 01:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="823380596"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="823380596"
Received: from haozhou-mobl.ccr.corp.intel.com (HELO [10.254.211.245]) ([10.254.211.245])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 01:43:26 -0700
Message-ID: <50feed07-f89a-dfc2-d8a8-16f9bf0fe937@linux.intel.com>
Date: Mon, 14 Aug 2023 16:43:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 00/25] iommu: Make default_domain's mandatory
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
References: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_014339_379554_FEE7D465 
X-CRM114-Status: GOOD (  45.06  )
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

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> [ It would be good to get this in linux-next, we have some good test
> coverage on the ARM side already, thanks! ]
> 
> It has been a long time coming, this series completes the default_domain
> transition and makes it so that the core IOMMU code will always have a
> non-NULL default_domain for every driver on every
> platform. set_platform_dma_ops() turned out to be a bad idea, and so
> completely remove it.
> 
> This is achieved by changing each driver to either:
> 
> 1 - Convert the existing (or deleted) ops->detach_dev() into an
>      op->attach_dev() of an IDENTITY domain.
> 
>      This is based on the theory that the ARM32 HW is able to function when
>      the iommu is turned off and so the turned off state is an IDENTITY
>      translation.
> 
> 2 - Use a new PLATFORM domain type. This is a hack to accommodate drivers
>      that we don't really know WTF they do. S390 is legitimately using this
>      to switch to it's platform dma_ops implementation, which is where the
>      name comes from.
> 
> 3 - Do #1 and force the default domain to be IDENTITY, this corrects
>      the tegra-smmu case where even an ARM64 system would have a NULL
>      default_domain.
> 
> Using this we can apply the rules:
> 
> a) ARM_DMA_USE_IOMMU mode always uses either the driver's
>     ops->default_domain, ops->def_domain_type(), or an IDENTITY domain.
>     All ARM32 drivers provide one of these three options.
> 
> b) dma-iommu.c mode uses either the driver's ops->default_domain,
>     ops->def_domain_type or the usual DMA API policy logic based on the
>     command line/etc to pick IDENTITY/DMA domain types
> 
> c) All other arch's (PPC/S390) use ops->default_domain always.
> 
> See the patch "Require a default_domain for all iommu drivers" for a
> per-driver breakdown.
> 
> The conversion broadly teaches a bunch of ARM32 drivers that they can do
> IDENTITY domains. There is some educated guessing involved that these are
> actual IDENTITY domains. If this turns out to be wrong the driver can be
> trivially changed to use a BLOCKING domain type instead. Further, the
> domain type only matters for drivers using ARM64's dma-iommu.c mode as it
> will select IDENTITY based on the command line and expect IDENTITY to
> work. For ARM32 and other arch cases it is purely documentation.
> 
> Finally, based on all the analysis in this series, we can purge
> IOMMU_DOMAIN_UNMANAGED/DMA constants from most of the drivers. This
> greatly simplifies understanding the driver contract to the core
> code. IOMMU drivers should not be involved in policy for how the DMA API
> works, that should be a core core decision.
> 
> The main gain from this work is to remove alot of ARM_DMA_USE_IOMMU
> specific code and behaviors from drivers. All that remains in iommu
> drivers after this series is the calls to arm_iommu_create_mapping().
> 
> This is a step toward removing ARM_DMA_USE_IOMMU.
> 
> The IDENTITY domains added to the ARM64 supporting drivers can be tested
> by booting in ARM64 mode and enabling CONFIG_IOMMU_DEFAULT_PASSTHROUGH. If
> the system still boots then most likely the implementation is an IDENTITY
> domain. If not we can trivially change it to BLOCKING or at worst PLATFORM
> if there is no detail what is going on in the HW.
> 
> I think this is pretty safe for the ARM32 drivers as they don't really
> change, the code that was in detach_dev continues to be called in the same
> places it was called before.
> 
> This is on github:https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

It seems that after this series, all ARM iommu drivers are able to
support the IDENTITY default domain, hence perhaps we can remove below
code?

If I remember it correctly, the background of this part of code is
that some arm drivers didn't support IDENTITY domain, so fall back to
DMA domain if IDENTITY domain allocation fails.

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ddbba3ffbfbd..ee1fa63f0612 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1798,7 +1798,6 @@ iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  		list_first_entry(&group->devices, struct group_device, list)
  			->dev;
  	const struct iommu_ops *ops = dev_iommu_ops(dev);
-	struct iommu_domain *dom;

  	lockdep_assert_held(&group->mutex);

@@ -1817,20 +1816,7 @@ iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  		return __iommu_group_alloc_default_domain(group, req_type);

  	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
-	if (dom)
-		return dom;
-
-	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
-	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
-		return NULL;
-	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
-	if (!dom)
-		return NULL;
-
-	pr_warn("Failed to allocate default IOMMU domain of type %u for group 
%s - Falling back to IOMMU_DOMAIN_DMA",
-		iommu_def_domain_type, group->name);
-	return dom;
+	return __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
  }

  struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)

Best regards,
baolu

