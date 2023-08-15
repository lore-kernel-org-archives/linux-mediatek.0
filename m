Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A3C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFYsIgymBpCqjqDV5TDnVIIqD4oYSzgKsai0Qj/Hi1M=; b=4z2oBtSTOXmP9eIWCOiOkRqeLK
	/FQMQ5d0dA9p72nZjXfUI6pypf2Lix2xux5Me53fgHDVMKAs41ophP3PJ49wd7fXviKHQ5EzDIFXW
	4iJ7fOjEYngqY7QPNI0MIobU7WigRSkbZ1yObgs+n48JXD49nnz2wNvX6G9vq46h3+ujBBN5A1vPV
	sgtsm979OnN+p6ALi92IH1G1xRpv06B/ao5lQ2GCAzPccdqlevAMq4IuIBoABK/035xLj5M8DgyV4
	d6v87PaJgMxYHxdMW+fyxHK69gyqdwEn2eM4uUKSsElWQRm+AsfiTGwwmJ7SRsApfEKig68bJqxxm
	6QfLMAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViN5-000dRi-05;
	Tue, 15 Aug 2023 00:57:19 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViN1-000dQc-2v;
	Tue, 15 Aug 2023 00:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692061035; x=1723597035;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EMtekiFoo0Tblby6wZQ8ziVNSJFBHzBXovBoPNar8KU=;
  b=VNtIcUoNjYgw4f2olRobdmc8apqvusrnyYEREd/7+SmMHBlNi4oDRtk8
   vbVdjI2NFIOMs6a7Wwz2ZErfBfGHedqbc+3xw8He5vFo4pgPn0HZBEJEC
   wWDoP9CafkTMfFrXLl7vLj94ctpUzgngCrVGBqUR3hPF04xriIZ2qQOrp
   JH8eB04uiY0CWrIK0ZEsI0P/k82m3CzAZ5Jw+q0zkcFsl2nXufsZepuMT
   iB1v/9vetBtIZljVOt6SzQtVRGnplD9mmUgGjagqlQx5A41cQ+H/zMNfW
   F5Qa6x2BgcsKZkgRPPQuJ+H7TvzHUbLp/dpFgUpsKrv4qVyJHCYRBh7YG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="362322787"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="362322787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 17:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857243905"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="857243905"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.149]) ([10.254.215.149])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 17:56:42 -0700
Message-ID: <d645ddff-f274-7a01-6b06-3f5a7afef8fe@linux.intel.com>
Date: Tue, 15 Aug 2023 08:56:40 +0800
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
Subject: Re: [PATCH v6 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <17-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <8cef9a0d-15ba-f8af-7e22-d4d3063c97bf@linux.intel.com>
 <ZNpJ5irR4XeLw6qG@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNpJ5irR4XeLw6qG@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_175716_013466_C795C2B6 
X-CRM114-Status: GOOD (  11.50  )
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

On 2023/8/14 23:36, Jason Gunthorpe wrote:
> On Mon, Aug 14, 2023 at 02:32:33PM +0800, Baolu Lu wrote:
> 
>>> +	pm_runtime_get_sync(qcom_iommu->dev);
>>> +	for (i = 0; i < fwspec->num_ids; i++) {
>>> +		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>>> +
>>> +		/* Disable the context bank: */
>>> +		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
>>> +
>>> +		ctx->domain = NULL;
>> Does setting ctx->domain to NULL still match this semantics?
> Yes, I did not try to fix this driver. NULL means identity in the
> ctx->domain.

Okay.

Best regards,
baolu

