Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A590EC677C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8BvZB90hVySmnnsjprzMk7oDjCE9iFM1r+3FRo9UNY=; b=yXJEwOHU/SLNZ1xjTmG+bLljcf
	DKVv+OJ1qs4qI3thpo4u+mwbmM4OAq1yfoR7sus8zAMTU9ihT485Wkkve5dD47uOmKP1fjZUfAzOn
	WL3pDwYhtKOgsg+wQcZZFTEUx15xmlWvTDyCESUtwfIIbFH4IpaOqjIxKNVe5Y0DDHj+PW79qIZ8R
	qXJLVmHO2yOmwjsfrYtEcaaFhD2ZSfX04Z5u2duw0ruTlSAOSTblkGcziaSf6tSEeYv5ZN6P4Objr
	WqI+wVMc2T1tFjDAeFqT6Q6O3UNJtEzi4cy9BiGlQNPHJTbZdxhV6fZ98RfwfBtGJF1YRF3OUwcTp
	BL/qO46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMl7-0000000A9v2-0wqo;
	Wed, 11 Jun 2025 14:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHwR-00000009VHT-2rHX;
	Wed, 11 Jun 2025 09:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K8BvZB90hVySmnnsjprzMk7oDjCE9iFM1r+3FRo9UNY=; b=bdbT+AMCTZOmPrC5zNJYmeN77W
	jvu4RAPxHw4puuoqtF0HRiQ/yZHe7iiZ28rUH0nd3MmI/hYBU5CQG5ivMb1bhkwx2z+GMD9UcxycN
	YGhHxm61dhWYGgnPNGGRDeVbBOPj1blB+tsWvuU+a8z6xSbMlWEVf2gfhGYs/0rQIv4/do3IK/Tii
	if54ssBM08zZ5w05DakSxcZkDZirQIUR8bjnICfrSOl3taQrBTg1Tqs6pL8GCoc8/XeYxHK0vyrHx
	hxnTc2XoxmGt1LUE0TfSfxtCQ8bk3cR3MYTfqMl64qJNEmhfgtNDYvG+2CHCAElX0tn2P69vSMCmR
	lUgSDF6g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHwP-00000002EzJ-2cpu;
	Wed, 11 Jun 2025 09:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634815;
	bh=EOF0wPKaDO4VgvfGSVrXCHsbhCfTQG4KN/6dg+9yv4s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=G1EFhqLhpfUNHYRce2Shf7OUW7CiLa9zTxIYeMK9msSvQcpGRddVYbboJFxp09cTw
	 pfCXxWcB111nao4H/6Un1OT5MRE1keyyNcCbWArEQxEoS4sKk6cKLDyN5wQmCcFRe0
	 6ULMq4cpFtCfLIVeK1Vn1ahRyCQau3XZn5ofNA0qvwhRWHfYxuoovAr99sRCcgUx2z
	 P6tlwpz/dHR3L5Keiq4qtZ7yTZES8vavuGGH4aTGckSgw/BhIDDk1c1a8p1aR852Yb
	 iTSEbqL8vlmj9ANW56RRvQAKnFqOpvUFvx70VMhHzOFWrfwNI15zoQoSEU0wkePWUt
	 D6rgOCsNCAr2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4FA517E0FAD;
	Wed, 11 Jun 2025 11:40:12 +0200 (CEST)
Message-ID: <d5f0a339-11a4-42d1-82b6-807e6e45953b@collabora.com>
Date: Wed, 11 Jun 2025 11:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
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
References: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_104018_043849_A4591020 
X-CRM114-Status: UNSURE (   7.33  )
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
> These drivers just have a constant value for their page size, move it
> into their domain_alloc_paging function before setting up the geometry.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



