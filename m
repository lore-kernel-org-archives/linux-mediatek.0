Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2D3C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+6p9A0Z3J0W+etyHLC80jSwt45BmCoDevasn4LiVns=; b=MYLAw6SwYpwMtnIS+nLs00bKjQ
	8J4DSweLo3Qv6cKUXMzhpsVN4pCRgpm8k1waV5Q1viWSaBSwbX2C1fWImWmtStPwDsTP2ttqDLblS
	SCKPjVTgSHLTs3EvbQjStw3cR40bRWX75Y+vxNqMgklE6hdVPyAKzjedixTxJQpv5rybi/TsMQwtQ
	CMCdJQ1Hv0Op0rjlCbZAWHy1ZXgr2JcNRjZtz2Fq/sibu2jnhYsWbqHzhOJgecUjYcojnNbZokJJM
	hsg+zEZ3SZcvLUlWDF/jjefyca8aoTOwgnfrPO2UuY1CoS8pPsOGudcDF8VSJ2TILZHz4Fv1qVeJF
	/paEnZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbJb-00CgYR-00;
	Thu, 18 May 2023 10:56:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbJX-00CgUg-3C;
	Thu, 18 May 2023 10:56:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ED4D1FB;
	Thu, 18 May 2023 03:57:35 -0700 (PDT)
Received: from [10.1.39.62] (e122027.cambridge.arm.com [10.1.39.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1B433F793;
	Thu, 18 May 2023 03:56:43 -0700 (PDT)
Message-ID: <527c0d87-d727-8b59-e980-0a4a94aa639d@arm.com>
Date: Thu, 18 May 2023 11:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 00/25] iommu: Make default_domain's mandatory
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
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thierry Reding <treding@nvidia.com>
References: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_035656_094448_E0108963 
X-CRM114-Status: UNSURE (   6.58  )
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

On 16/05/2023 01:00, Jason Gunthorpe wrote:
> This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

Tested-by: Steven Price <steven.price@arm.com>

Works fine on my Firefly-RK3288.

Thanks,

Steve


