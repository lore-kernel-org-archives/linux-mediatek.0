Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A9DE810B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKdR5lWm6yC+VvABiFUgWvfkU4HerYDpIG9foLq1pzc=; b=V7RdMdER72dBsqGQu5SnzroYZ5
	CZSVd0GwOE0c1IL/rxsJ0lAJwHREwHEarxaTJ3YKQ7uOEib1AXPvr7DNTRYCkxhvLPY79/rPBa1tv
	xOQlcv7tJ4LGghSY5B7gCbvkbwa/6aCzwX7RgUjbPGNv2LC5Zd1+4P17lW+4ZTCYcvgbi1ZHhgJy/
	x77c5qVdclMhKfp2aWs02k2Jhps+yHGSVwRV/A3mY4NeRLv3Y/ey1TL0wrPQV7Wfv7y/PdbXV59mx
	FDHksZwrxD4i5ym+8GusaGcUPRqi8VgwTWnFl+lWbV6pMWDG99d/cshTeqhdhFQjqRUrE8LZ8cAdm
	0kb2JfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRGU-000Xaq-2d;
	Wed, 27 Sep 2023 09:55:30 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRGR-000XZY-2B;
	Wed, 27 Sep 2023 09:55:29 +0000
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4F8C51A2317;
	Wed, 27 Sep 2023 11:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1695808524;
	bh=BDI7NuvcdVt/emhHi62PabcawiLywtBEcxLt+G847YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJ/0NZxxI8l619eMViTN7wFColaAK2C1MPyqL9FW/o8oWbcGgurcTymg7qYfnv2Za
	 8eFN6JofYvpBcVna5x6SdpHz5PZL8hmEwxDQgaep3/HiQgeUWy4U5YHirYA1sszR8J
	 e7ewyfn2eCMIYpUr+BrGwz67R3IjLc410DYmaJiPyv+1Fc53ag6teNCgufMzfRTaYd
	 X+RQSNMGK+8w3hxgWaYEpnjqVeyU+g+qhDc5yTY7Quvw9wkOxUIXHcLEN3aJmQIMvW
	 2RoCQvwl2aQDtZF06zge3qV3VdPsrkOYdzHaaS7L2KgRXAKDke4iUYkX7n/e0UMIYo
	 xLYhyuiRZPN8g==
Date: Wed, 27 Sep 2023 11:55:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Rosato <mjrosato@linux.ibm.com>,
	Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	Julian Ruess <julianr@linux.ibm.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
Message-ID: <ZRP8CiBui7suB5D6@8bytes.org>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
 <ZRLy_AaJiXxZ2AfK@8bytes.org>
 <20230926160832.GM13795@ziepe.ca>
 <cfc9e9128ed5571d2e36421e347301057662a09e.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc9e9128ed5571d2e36421e347301057662a09e.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_025527_961370_7E30DA31 
X-CRM114-Status: GOOD (  11.27  )
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

Hi Niklas,

On Wed, Sep 27, 2023 at 10:55:23AM +0200, Niklas Schnelle wrote:
> The problem is that something seems to  be broken in the iommu/core
> branch. Regardless of whether I have my DMA API conversion on top or
> with the base iommu/core branch I can not use ConnectX-4 VFs.

Have you already tried to bisect the issue in the iommu/core branch?
The result might sched some light on the issue.

Regards,

	Joerg

