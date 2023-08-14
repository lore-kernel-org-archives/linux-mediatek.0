Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23457C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 02:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcudAxoczdPFo746vXIihBLhQf/vuRS5tNOYMNeKfC4=; b=2uUhF07kKJfqBJc8MT1rOZBk3Y
	Y8wD30d3y4s2KtO0PK/HWNFSEGinbXVIdV47l+A0vs+tnoLgX0pmLtstymaNgUabBxl6T7FNlhKOe
	fvaLRw5Rpv79A8IyqAre6GStpdOvYMMFt/RUC4q6birTr7MK+d874lKOAwpDGHRklQuDK/B1HMBsv
	SyI/lkEW/OmY4FVlwrNsIlUhffYI3TWuaMK+3lJ/NTZjqbV5TqpSpkf3Y16xRQFDFaX2UV9sft++b
	lc8h6c0lsD7SWO27ue9e4GSKX6D5bmvT9CTKgqcKt8SuYCj+Andj1d6oa/y2N6rUM63q0hlb0bw1u
	BBfyG7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVNR4-00G1I2-1k;
	Mon, 14 Aug 2023 02:36:02 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVNR1-00G1HF-1D;
	Mon, 14 Aug 2023 02:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691980559; x=1723516559;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YYBhIRGoXj26+p4KmllL+U9dko7uaqAtFc2nK/rDhX4=;
  b=DEWfz24lu968EE0hy1vV3IqSn8oqhQKudwW9Lg8l/kiT/8oG/i+a8AZ5
   ESIdmJtm651uUCWWHP3i3D8umSLqvpL4ti0jdUBukfW/s9Fo8WiDYjPKl
   aRhMkd0tecDNqA+BXmSegdp/43WPw5MvmUjVzaY6tNUNHndPWQMV/fLIy
   JpCF4hDIaYRYym1jEFKI2pWj5HAhIw7BQQgMKnUDLOsh5WC0WTpzH3F31
   D90DXcdXCo730U1hMPx3BnoFTAQjcqYHudAW7asHHuuSxGzRFQAb8PnQa
   nHH91oOdqpRlaWEJRn4XIoQVThi2Ocnix1PLqms770VDnwK+kYt050Ime
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="402932193"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="402932193"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 19:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="823280871"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="823280871"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 19:35:46 -0700
Message-ID: <00f84867-c66d-508c-00ac-7fe062905663@linux.intel.com>
Date: Mon, 14 Aug 2023 10:35:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 05/25] iommu/fsl_pamu: Implement a PLATFORM domain
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
References: <5-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_193559_463509_03A15C04 
X-CRM114-Status: GOOD (  11.23  )
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
> This driver is nonsensical. To not block migrating the core API away from
> NULL default_domains give it a hacky of a PLATFORM domain that keeps it
> working exactly as it always did.
> 
> Leave some comments around to warn away any future people looking at this.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/fsl_pamu_domain.c | 41 ++++++++++++++++++++++++++++++---
>   1 file changed, 38 insertions(+), 3 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

