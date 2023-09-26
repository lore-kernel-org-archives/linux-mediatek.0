Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59312E7E649
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEIGdAXRmsVj+14uFmNlm3Naze+UluxpULCH/+QcmgA=; b=b1vjWn8upNB6gLc3xfkx86wQpO
	AOI6M5X5g8t7CGq6ek2dWOgNthWdzRlcRVfb63C6Fgi46dfg5yTDtmVsr7wXLsLozT9GP5cIjUsmX
	cXvISR9+zV/XE9JSWzhCewbE8U7MSuWd+84S06y7RgDfzdxnpIWLAwlkMylYlYeIU22FGu1vzSiKZ
	6Z/5K9Ps2YBiu+XAPqrnaa5y7aaLYAxxV7W7Ndp6JXS/Uxwb9VyPncjw1fdpWl8nggLPbK1JanxXN
	YcHErA9ZxdgWPnDTPD6uBVDw3P3AwKuzis5kz1Kt2UXI8XwGfe5gpWopEhlgqfTKVVqqHppdv8Qlx
	So61XTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9c4-00GbgX-0r;
	Tue, 26 Sep 2023 15:04:36 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9c0-00Gbe0-2g;
	Tue, 26 Sep 2023 15:04:34 +0000
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CA82A1A21CC;
	Tue, 26 Sep 2023 17:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1695740670;
	bh=o8oWUCyKGLr6aRpJEcyERxcIW3a0GD0rf9gmZgpvK2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=6TpFhndRPNvIgt7yzA2/aJMoYkdnS16cebzf4UtP23CQlpQ+Gak1eYrm6l6OjKYEx
	 6ov9MN4xTFyWr54bLnOpm430Hupplf8W0SxvaQlB6FgmJn2Bupf3Brid8BS/nZqAQO
	 hvu4Svos9D+f462V9LsyrLj63TJ5HQrEH7+hL9EoBYr83zCI6QFPn3sNZtjggMsFkX
	 51VP71UAzDGONwXr20Y36QdQJVa+iP+T27lz3G41fM7pXzHksLzD0rpLSvyCctLemD
	 t/LuaiNXAWO/0BIuVB8b3mYUK3IzpvwsvgMpvM9qZ4RAN8ZffK3kqVvFnLVTK8C6cL
	 klQPepXng8EOg==
Date: Tue, 26 Sep 2023 17:04:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
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
Message-ID: <ZRLy_AaJiXxZ2AfK@8bytes.org>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080433_101907_D5EE5518 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri, Aug 25, 2023 at 12:11:15PM +0200, Niklas Schnelle wrote:
> Niklas Schnelle (6):
>       iommu: Allow .iotlb_sync_map to fail and handle s390's -ENOMEM return
>       s390/pci: prepare is_passed_through() for dma-iommu
>       s390/pci: Use dma-iommu layer
>       iommu/s390: Disable deferred flush for ISM devices
>       iommu/dma: Allow a single FQ in addition to per-CPU FQs
>       iommu/dma: Use a large flush queue and timeout for shadow_on_flush

Turned out this series has non-trivial conflicts with Jasons
default-domain work so I had to remove it from the IOMMU tree for now.
Can you please rebase it to the latest iommu/core branch and re-send? I
will take it into the tree again then.

Thanks,

	Joerg

