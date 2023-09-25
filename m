Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B580FCE7A89
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h//YUPs2GfdTMNpZ+3E2FPiSdoP9e39uFwHKH+TeR3Q=; b=b6poPWxa6cMmNdjpZAOSZZd9Pc
	AZRMIK2Z4M7T2d/Wxb8BEh2b6oK6UQCNWXEul6kldC8T5ndwr/uCXWN14A7k+8L2z5vD/I3guJ5+c
	yTHQgYsKEU4buHuKWHHLQF5EN3A65ECyIC0AOEs1diSV871QxeU668ysFOWBsvDJg67op3NvtFwry
	QZglv1p5KScNPV8C4UEvl9AJV8t0lPnxYoUB7bCx7dMXbMpzpDNGfvkODpRQboCgr0iI8H0A48wrq
	wrzB7KNyUvHwuM0K3GM6JgmZDwZ1akYNM+OMxs/JJNjNmA4vLU7lPNA5JdOJ7aGE+HcBLSvEAwfyZ
	6nPn1ZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiKV-00DuVD-0L;
	Mon, 25 Sep 2023 09:56:39 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiK0-00DtyH-1v;
	Mon, 25 Sep 2023 09:56:10 +0000
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 27E6E1A1EA9;
	Mon, 25 Sep 2023 11:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1695635766;
	bh=9PqcnP0fBBXYm0nOdc0nJm0+qTAxRYNwHHGdJDVyqnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=do7SoP/ej6m+DzfP4zanqVSPHmELmY4rQuPveywCzYUG9GioGs2VSc4FX38kVa6kt
	 wij9Buf7fttF4+WTjZNXOCViquEeFNwnQGeE+JJxIwZrJ6koxAZdyvOCsEQaGP2ztI
	 9hsYO5tXUSh/zasJgIHtxaYPZ4vmZS6RUmmVLuQSWX+5zZ1jz6PZlvBaTuMJkKm8sq
	 LZhnJzcpHy3eIAxEwxoAQU20Ap/BrMLgkVdi131b2HnLrigEVAYynHMUY3q/gfljoY
	 vhMDTuZpUhXdn6DgG3Bx19EPCc3Hf3w4DD7BlRsnrSUlwyA51GhnKacwD6kVdB4a9+
	 Y/BgwZcbGa0gA==
Date: Mon, 25 Sep 2023 11:56:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <ZRFZNbR_3p9nhQEU@8bytes.org>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_025608_865470_932A1E1E 
X-CRM114-Status: UNSURE (   7.95  )
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

On Fri, Aug 25, 2023 at 12:11:15PM +0200, Niklas Schnelle wrote:
> Niklas Schnelle (6):
>       iommu: Allow .iotlb_sync_map to fail and handle s390's -ENOMEM return
>       s390/pci: prepare is_passed_through() for dma-iommu
>       s390/pci: Use dma-iommu layer
>       iommu/s390: Disable deferred flush for ISM devices
>       iommu/dma: Allow a single FQ in addition to per-CPU FQs
>       iommu/dma: Use a large flush queue and timeout for shadow_on_flush

Applied, thanks.

