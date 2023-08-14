Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1154C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 04:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pojyY06bDNtVv0n+oCVFgeV9ZrC6BR79EAdY5psSMIY=; b=1s4wd+AOdJN1yDhp3l0jTeDJdU
	BsxV7zr3OiaH3yCm/tI+0nakeqMek1vjpimfwnRP0PCKLNRaJTS6zxuO7lHojYaUZiZi4eaymU1hz
	9FYJLOtLyDMDAWBNhx4GXLH/7LT0Q4baaY/V1rDAlUtBSGl4LzReQqkEPeIIv3rCeYKAClZXRdxqk
	FUT9xJ+vIeR1g0ZkhG3a+evmrRimfW/dHmiLjgspFFibq7L4iUPh07TdUx+nSBLpvuTpRqKGWZTUM
	6q1P8SeK4eOtFhbZvcCU9414wkL+UJY+trV+eelyTDZIH9OxzczkZAZ3SgKLNvK9Cv4gT0M0JRvXK
	B3Tk41Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPZU-00G9T6-1m;
	Mon, 14 Aug 2023 04:52:52 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPZS-00G9SA-1O;
	Mon, 14 Aug 2023 04:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691988770; x=1723524770;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qg68hDQyVU5rdKRTZEFIz/aR7ze3OEvBkBX64vYD6UM=;
  b=cw/2FXNFpAuLJbDqonehrR9olyKM+w6ngfRG3HLUudzgkzg73c9pfGBB
   yN+tD68O094jZviCDLSP7z7o/Gm+aVW+TZ2qSSvDfk7wseTBTGUTSS8QR
   Bz6f1iZAYZa65T/McRfcGJU6AdWfLGLDfSUzUV5+/QubtyLLNLltMnNoF
   FfpIv4Ik3A9rgFvWgvuxLZCCYgBTfJ0kGYsNbf8cu0eJb1yxdM91nh1HE
   cX0PETGA/atI1ZjDw6oXvDn0ynEBrqUXL02hlppDtIsx4lODrK3uz25Bb
   TbAknxNSbREcocHf4qaI+4U3xGm6u+7FilucowpXx48t/DqBCU6BxNYX7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="356924289"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="356924289"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 21:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="907098556"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="907098556"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 21:52:37 -0700
Message-ID: <0104371e-a824-8ace-eae3-da90df285c41@linux.intel.com>
Date: Mon, 14 Aug 2023 12:52:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 10/25] iommu/exynos: Implement an IDENTITY domain
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
References: <10-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <10-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_215250_511657_D6E11338 
X-CRM114-Status: GOOD (  14.62  )
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
> What exynos calls exynos_iommu_detach_device is actually putting the iommu
> into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Tested-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Acked-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/exynos-iommu.c | 66 +++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index c275fe71c4db32..5e12b85dfe8705 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -24,6 +24,7 @@
>   
>   typedef u32 sysmmu_iova_t;
>   typedef u32 sysmmu_pte_t;
> +static struct iommu_domain exynos_identity_domain;

Is there a conflict between above and below?

[...]

> 
> +static struct iommu_domain_ops exynos_identity_ops = {
> +	.attach_dev = exynos_iommu_identity_attach,
> +};
> +
> +static struct iommu_domain exynos_identity_domain = {

here.

Both define the same.

> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &exynos_identity_ops,
> +};

Best regards,
baolu

