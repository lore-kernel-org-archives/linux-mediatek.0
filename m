Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B7C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ob7D3AwGGCF55mEXY7/POUgQ4jhEhnAUoDuRCPRu3k=; b=NuD5zHVbVFuyIJJxyy4v1C20q0
	dykZp+cjiUyxDFTaJALV2tj1+6LzVtVa/gFZDDP1koI4AA2Z+vxiSArg8cedgeDKM6DD+1BUHDl5p
	lk8gVrvrGX6UcN4JWb3/mN9omff7ckemb2eMe9mKm4ekOabhTnMpX9hTZvyDxVjOK4bmZZMOWXSRe
	9ySoiXUg/ec1yX2lTUFi87cskMR7qbdFx0RwBf8VLEa0bn8P6ndbxCl90D324cd2uTZSj312+MwaM
	iXEXpLLqc4LjADAS2wJV5df3owfFzcbjFbx4NyCt0Es/kpaRlfde2jRUB4sAr8u9OIKFf9xlWrioP
	N9TteUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q186y-0079iy-0x;
	Mon, 22 May 2023 16:10:16 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q186u-0079h0-26;
	Mon, 22 May 2023 16:10:14 +0000
Received: from 8bytes.org (p200300c2773e310086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:773e:3100:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0771D2434D7;
	Mon, 22 May 2023 18:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1684771803;
	bh=IEYacWChjS8pqW2eXYZUvSMLj48VE4JauxQLZBxYtqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsW1m+Y4pRxReMA3YAV1dR7xSpCrEFNRWPSoWZvvgL9y9t+B8nkXGdS5pIZgE/Mxc
	 jDkmtQgdl3dVqv6n3e4yCwCoQwKfP4wgVU7uooQ8pyt47lwv0bvnKcPDbqciBPuGzz
	 QflQuvzLHWoxNs4RdcEri8p72xuZLmU5YY/fJNWHmC0sEkQSGm+KOysLl+ctiUYkJ4
	 7Qlh+elGqPq5y9QZv4ABmp2fOJsDSjiUh+6IV6ASZ54RN9zWxU/tU36JULF7zRzETM
	 EVBM6Dq0OgEW2aYEblrwJsY5LuCTfZP55UCddCCkbSfFJKvpE/vQhuL22KcZwPL64w
	 mMOPCB+3NQIhg==
Date: Mon, 22 May 2023 18:10:01 +0200
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
Subject: Re: [PATCH v9 6/6] iommu/dma: Make flush queue sizes and timeout
 driver configurable
Message-ID: <ZGuT2R42SWFHmklu@8bytes.org>
References: <20230310-dma_iommu-v9-0-65bb8edd2beb@linux.ibm.com>
 <20230310-dma_iommu-v9-6-65bb8edd2beb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310-dma_iommu-v9-6-65bb8edd2beb@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_091012_832721_F2B24483 
X-CRM114-Status: UNSURE (   9.87  )
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

On Mon, May 15, 2023 at 11:15:56AM +0200, Niklas Schnelle wrote:
> In the s390 IOMMU driver a large fixed queue size and timeout is then
> set together with single queue mode bringing its performance on s390
> paged memory guests on par with the previous s390 specific DMA API
> implementation.

Hmm, the right flush-queue size and timeout settings are more a function
of the endpoint device and device driver than of the iommu driver, no? I
think something like this could also help solving the recently reported
scalability problems in the fq-code, if done right.

Regards,

	Joerg


