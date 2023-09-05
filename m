Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420CAC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=011YIz/pEd2oeIVWGXWob/jhfHpF/G1Gx3Q+AweGoo8=; b=ZQ6F5vRnUG92Psj7jHUL9aglq0
	/Nw7LrRcthURA3kMd0xKdfrjmDJPjm1KiyD21PL6LA17QcImRZ/C34alMOhzPocyYcJv4WzvMP+Ha
	oEuBLk6aaF4WJzAWt2SRXcvNnTn2nF0VLPq9HeGNprK7Jq6RvvDRuAAhjWCwJg+T8ZhWax/ZAu+nh
	jk5X3YXxAArVmcoHIaynNI4ZRZTOGX3spo+1/fDrPb2HFcmHgHJoanIf6Elz29GWBTz2pNNf271NE
	zkW2sUruA84DAy+PD91aMlljSzE8u5pLtMIohauz8C/KNVqxvDGZwx2jYNwCGRQT1XNyJXuYcekkY
	7Y/tZ24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYcR-006Jyr-2Z;
	Tue, 05 Sep 2023 16:09:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYcN-006JxY-1x;
	Tue, 05 Sep 2023 16:09:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CB8106F;
	Tue,  5 Sep 2023 09:10:04 -0700 (PDT)
Received: from [10.1.36.15] (010265703453.arm.com [10.1.36.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AFCF3F64C;
	Tue,  5 Sep 2023 09:09:19 -0700 (PDT)
Message-ID: <e949a91f-88b3-681e-6e0e-d5d1e8922284@arm.com>
Date: Tue, 5 Sep 2023 17:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v12 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
Content-Language: en-GB
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gerd Bayer <gbayer@linux.ibm.com>, Julian Ruess <julianr@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Alexandra Winter
 <wintera@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
 <240c26d3-b821-8410-3142-62e9a8656146@linux.ibm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <240c26d3-b821-8410-3142-62e9a8656146@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_090931_961788_A02F1E86 
X-CRM114-Status: GOOD (  14.50  )
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

On 2023-08-25 19:26, Matthew Rosato wrote:
> On 8/25/23 6:11 AM, Niklas Schnelle wrote:
>> Hi All,
>>
>> This patch series converts s390's PCI support from its platform specific DMA
>> API implementation in arch/s390/pci/pci_dma.c to the common DMA IOMMU layer.
>> The conversion itself is done in patches 3-4 with patch 2 providing the final
>> necessary IOMMU driver improvement to handle s390's special IOTLB flush
>> out-of-resource indication in virtualized environments. The conversion
>> itself only touches the s390 IOMMU driver and s390 arch code moving over
>> remaining functions from the s390 DMA API implementation. No changes to
>> common code are necessary.
>>
> 
> I also picked up this latest version and ran various tests with ISM, mlx5 and some NVMe drives.  FWIW, I have been including versions of this series in my s390 dev environments for a number of months now and have also been building my s390 pci iommufd nested translation series on top of this, so it's seen quite a bit of testing from me at least.
> 
> So as far as I'm concerned anyway, this series is ready for -next (after the merge window).

Agreed; I'll trust your reviews for the s390-specific parts, so indeed 
it looks like this should have all it needs now and is ready for a nice 
long soak in -next once Joerg opens the tree for 6.7 material.

Cheers,
Robin.

