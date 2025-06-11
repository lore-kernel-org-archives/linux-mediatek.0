Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E03C71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKnPb2QxK5hD//Kl6ExYAUYqNeOoWj0TaL2ql8N34F4=; b=XHBgC8wzMRWxrg1ryHlk9dkB/R
	9J6+7ckN8/V88N7jDhzayzmfw9q7L9rh/gsWETqeqzRqNOkkslKWCGUDO3IA/JAR0EhL9WKAFnLlF
	ULvT7ruoFFZHLCDSJur1pC3ETBFAjT8c+mzwqKfEq1fMiz1yde7/2CurqcVE1Q5S7ZlaqjT92SItT
	HHT4NTDDdqDV5Taeu65CsU2GU4fxVgyWSKtmi2jtVGjuGyu2u4aUoer/Am1FusGF+NL53T1AP1N2T
	ADhoLcqm4Gp+VSNCAHuzs7MPtSOlRob6StEoPSQefo8k3jY8lV3yolL+/naDheejnK4ztgP2ExysA
	4p8qpHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMl9-0000000AA0P-3hXR;
	Wed, 11 Jun 2025 14:48:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHwV-00000009VIB-1aSr;
	Wed, 11 Jun 2025 09:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634821;
	bh=oW4XgX/lmD63EJZeg/21ZPWf1q1qDffFRs1xh6RK0tk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AIOCDZdJNc4cvOI+9dR4QtiyWejVsnTsx76OJcpPK2K47PYK1K25nHnx7NC15UZWg
	 U9iGg3zXSwKKrJstGNXHeDB23pm48ImbKGlYG1lleu82ZHF8IMyGMJg8CoSFiMOB09
	 llPZk4oMAaRxc2xD98eB9goX51LHvtnwlnwATWVveVXNtXOc7Cfm9S6nwsYZXbfqDG
	 HA4RJSB5h6KeYuPVxfELN8+upjB6gR127HILGMeipNd1WbkfAHOPr61vUR+JENTSmt
	 JzjqERVGHb5WeTn4mDzbcXqS2kGco68WwNBPjsFQYfXHpcbeJnE9wkx4DkdjOxORI8
	 55Km+HNivIKsw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D1AB17E36B3;
	Wed, 11 Jun 2025 11:40:19 +0200 (CEST)
Message-ID: <3827d632-6407-40bf-9b7a-148b0c46bea8@collabora.com>
Date: Wed, 11 Jun 2025 11:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 5/7] iommu/mtk: Remove iommu_ops pgsize_bitmap
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Sven Peter <sven@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 patches@lists.linux.dev, Niklas Schnelle <schnelle@linux.ibm.com>,
 Sven Peter <sven@svenpeter.dev>, Tomasz Jeznach <tjeznach@rivosinc.com>
References: <5-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
In-Reply-To: <5-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_024023_591960_E85EA756 
X-CRM114-Status: UNSURE (   7.02  )
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

Il 09/06/25 22:41, Jason Gunthorpe ha scritto:
> This driver just uses a constant, put it in domain_alloc_paging
> and use the domain's value instead of ops during finalise.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



