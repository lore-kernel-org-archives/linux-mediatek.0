Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168AC0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 05:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hM3IyTv4+tPo8J4LWUOKfACC+Vi0roQMQ8w/Zu4bys=; b=a4XGwpepGiE3NmoKcMBuig1Zve
	EmA2gfUV7EDEsvR6zdpkobaiRJZEL1bVVa321bOYJX0MEi+F0vpedAY0cS2qhxdyTF+8bFRphxoaU
	ITVT8NNhOlN3SNDbP4ecSy/WiZOa9hRSUlR+LDATCpWdOYFUnyAUs1POU89eRE5UbY0MVRhnbb30W
	9W4a+wGbp1zZsB9FyC7B06MqyXM1XKreNjZS5lSq0YKxw1hVZxU2UDP0GSa8YymnXjCaH8zMSWDra
	KaKyMHYM+82uozNQ7dskFQ0sM/CCcmwlm0tFb4LvjzvomDAb+2kzn2V8+rB0sPQvaF6HEw4U/bVwn
	vpJIb+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUgl5-00CfA9-0M;
	Sat, 12 Aug 2023 05:01:51 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUgl2-00Cf9P-0s;
	Sat, 12 Aug 2023 05:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691816508; x=1723352508;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8ESbiLHr+YCgav0uKLzgJWB6fuptDUr8xuFAEutcc9g=;
  b=bwTkAfs2FJF8B3ePDJCygJXxMX+4+TT0iAlMPiylO6bNeycqRt46sY4S
   t4GGxSZHMdomNE9pWzTDd5wz+EwmePsShmvf739hvHlQZUgQWieS7wQ5i
   QwhgzEas/uPYHohfcrYElULKg7zrnZ3vrBFz2D04ncPTZaShrvXmKuboE
   K6+BXj3gC42aaZ9RFDmbmKeIuHBbfOBSzDERfGamplpifR7eidoNX49T5
   G9Dkt4Rjg0LgxDvbUE0QzL4A8zly8vD5xD97o/84zH0Gn6Nlvcx03EPSz
   AhmtCTDNPNjK7b+93o+JZXX8HcimOEhKJBB6tCIF6e8n+bs88hgv0x7ev
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375513670"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375513670"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767872740"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767872740"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.214.60]) ([10.254.214.60])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:01:26 -0700
Message-ID: <d4451419-627b-36de-0b0f-3a7e8bc59a35@linux.intel.com>
Date: Sat, 12 Aug 2023 13:01:24 +0800
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
References: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_220148_357768_0810172C 
X-CRM114-Status: GOOD (  13.39  )
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

By the way, bus_iommu_probe() has been changed in iommu-next, so it
needs to be rebased here.

Best regards,
baolu

