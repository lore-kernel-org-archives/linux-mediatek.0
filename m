Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB1C0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 04:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8osSrJBtq2ibU2C3jiGYWQdXAMy7ETsNsPK5266LIR4=; b=YqxR5crnF09RagdR7g/ZFdqm0z
	o09XgvsZE9YTidoyhGv2lLkGhQsexyKygR/c/2XVNIeLFKgkZrmWPOGwlbpvBL7/t925VnFdQtqMJ
	w91nu908kQ/LHdPZWsqkdZt1HGg/3Mj2Xseb8TdPwYTc7eFdEfnShXbo2qMgMnplxV0mP2dVBlhvG
	idvIWr1uKHqmGnzABYpL4wgOlYwEJamNqE4Wdwrq9YLzCeXPR4ctPTPSMMIinInJZxAup+82cD4/b
	6UDMYLc9C6ZwlWwvWy+RKrEMXcn9opQaLg+y/OJsjJXmZUle/2MPu2ASX6W3ZrqkUCedCAj2VtBWL
	p2APRHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUghC-00CelQ-2j;
	Sat, 12 Aug 2023 04:57:50 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUghA-00Cekm-0V;
	Sat, 12 Aug 2023 04:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691816268; x=1723352268;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+iNjZB2u/KnDtQIHQv6xVfauWGpLAEIKP+FIowSusMs=;
  b=Zs/Zo21JJMG4y2eWxDCYN8YQwMhzLKLz+ryHEIZXuM6EUJ+PH5s6hn5X
   wzl9yt1KNIfHqCJi7AgVzBkfpO+nO585hN2qJq6vnqcalfptNwstHAN0I
   3G7h4e4C06GQdHUucyhsdwh8E+hsmEn7BGt98b0I1vV8tJHABDEbUHnu8
   tz9NH3wGnvNU1/MedtbSfe8WKLrQjgbCM7eiPbMJu1YUpXy4ViCSa9y1e
   527Iip5YPKqUrgzW38po/zAIibEB/5KtvjbclMUfrhQP/hspR68O12xkf
   cV1NZGOu4FIHFVVPmJfnsvPOxntvDlT2/WhCE1ShW8HomxvSkyK54W2fE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374569542"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="374569542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="856493438"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="856493438"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.214.60]) ([10.254.214.60])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:57:18 -0700
Message-ID: <0e47dc9e-1cee-c1c5-5d1a-5f861095b5a0@linux.intel.com>
Date: Sat, 12 Aug 2023 12:57:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 15/25] iommufd/selftest: Make the mock iommu driver
 into a real driver
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
References: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_215748_237754_53E98AEC 
X-CRM114-Status: GOOD (  31.72  )
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

On 2023/8/3 8:08, Jason Gunthorpe wrote:
> I've avoided doing this because there is no way to make this happen
> without an intrusion into the core code. Up till now this has avoided
> needing the core code's probe path with some hackery - but now that
> default domains are becoming mandatory it is unavoidable. The core probe
> path must be run to set the default_domain, only it can do it. Without
> a default domain iommufd can't use the group.
> 
> Make it so that iommufd selftest can create a real iommu driver and bind
> it only to is own private bus. Add iommu_device_register_bus() as a core
> code helper to make this possible. It simply sets the right pointers and
> registers the notifier block. The mock driver then works like any normal
> driver should, with probe triggered by the bus ops
> 
> When the bus->iommu_ops stuff is fully unwound we can probably do better
> here and remove this special case.
> 
> Remove set_platform_dma_ops from selftest and make it use a BLOCKED
> default domain.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/iommu-priv.h              |  16 +++
>   drivers/iommu/iommu.c                   |  43 +++++++
>   drivers/iommu/iommufd/iommufd_private.h |   5 +-
>   drivers/iommu/iommufd/main.c            |   8 +-
>   drivers/iommu/iommufd/selftest.c        | 149 +++++++++++++-----------
>   5 files changed, 152 insertions(+), 69 deletions(-)
>   create mode 100644 drivers/iommu/iommu-priv.h
> 
> diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
> new file mode 100644
> index 00000000000000..1cbc04b9cf7297
> --- /dev/null
> +++ b/drivers/iommu/iommu-priv.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#ifndef __IOMMU_PRIV_H
> +#define __IOMMU_PRIV_H
> +
> +#include <linux/iommu.h>
> +
> +int iommu_device_register_bus(struct iommu_device *iommu,
> +			      const struct iommu_ops *ops, struct bus_type *bus,
> +			      struct notifier_block *nb);
> +void iommu_device_unregister_bus(struct iommu_device *iommu,
> +				 struct bus_type *bus,
> +				 struct notifier_block *nb);
> +
> +#endif
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index a1a93990b3a211..7fae866af0db7a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -36,6 +36,7 @@
>   #include "dma-iommu.h"
>   
>   #include "iommu-sva.h"
> +#include "iommu-priv.h"
>   
>   static struct kset *iommu_group_kset;
>   static DEFINE_IDA(iommu_group_ida);
> @@ -290,6 +291,48 @@ void iommu_device_unregister(struct iommu_device *iommu)
>   }
>   EXPORT_SYMBOL_GPL(iommu_device_unregister);
>   
> +#if IS_ENABLED(CONFIG_IOMMUFD_TEST)
> +void iommu_device_unregister_bus(struct iommu_device *iommu,
> +				 struct bus_type *bus,
> +				 struct notifier_block *nb)
> +{
> +	bus_unregister_notifier(bus, nb);
> +	iommu_device_unregister(iommu);
> +}
> +EXPORT_SYMBOL_GPL(iommu_device_unregister_bus);
> +
> +/*
> + * Register an iommu driver against a single bus. This is only used by iommufd
> + * selftest to create a mock iommu driver. The caller must provide
> + * some memory to hold a notifier_block.
> + */
> +int iommu_device_register_bus(struct iommu_device *iommu,
> +			      const struct iommu_ops *ops, struct bus_type *bus,
> +			      struct notifier_block *nb)
> +{
> +	int err;
> +
> +	iommu->ops = ops;
> +	nb->notifier_call = iommu_bus_notifier;
> +	err = bus_register_notifier(bus, nb);
> +	if (err)
> +		return err;
> +
> +	spin_lock(&iommu_device_lock);
> +	list_add_tail(&iommu->list, &iommu_device_list);
> +	spin_unlock(&iommu_device_lock);
> +
> +	bus->iommu_ops = ops;
> +	err = bus_iommu_probe(bus);
> +	if (err) {
> +		iommu_device_unregister_bus(iommu, bus, nb);
> +		return err;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(iommu_device_register_bus);
> +#endif

Although

#if IS_ENABLED(CONFIG_IOMMUFD_TEST)
... ...
#endif

doesn't look so comfortable, this is also the most concise method that I
can think of.

So,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

