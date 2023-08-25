Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB57FC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHQOxiPuUa0ebvOp4zeF41oQRZYAzTOs8FVVwIp9Ljk=; b=h13MKkz+ZrC5ZystmhiT9LbYGt
	K747/uQCiJneH/n9qk0U17eFwO0oW/nj7UaCGpT2E7z8yMPVjos8QxzlYJZ/undKK7dSqLK11UN0c
	D0jrfezkjdM2FUMr0v3q1FrYKvq1LU261OYmPCXEYuVL4SZntNdFZWO7yBOpoDyPGnMXGZvt0g6yy
	xyomnrhJGScBv+32NgWgaz/5lcekskwvEmWysOWHbv/pRs1Q34EcMLmlsWex2rxlz6zOFdizDYOrg
	/DW1CH23w6NXJWsUsx1sp3Wvqw0UjHf0E6mKZiiCqhnRWGfFmedJCBXbgBlAruDEhWsWqaXD+92+r
	QePbYZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbWm-005s6y-2h;
	Fri, 25 Aug 2023 18:27:24 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbWj-005s63-1m;
	Fri, 25 Aug 2023 18:27:22 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PHuYWF017369;
	Fri, 25 Aug 2023 18:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QHQOxiPuUa0ebvOp4zeF41oQRZYAzTOs8FVVwIp9Ljk=;
 b=fxnjY7pa/kjrEjYsAn3f830wFpCa/pqiFmmssVqUCVajBH7x0d3Z7b+szRJJK2n7EvvZ
 m/0mxjm3m4ZSW2RFapYNT9kcRBym4ds2RoJ38RygPWd8SF/MZxnDjRmJCKmN9kzRSzEw
 8I0uPAFHRTbugceMPcELPp3L1tcI+r0cXo3Tm5EXkPkEsPkMeoHQFPXgaMMjkN5rg3K9
 gk4W5GX/UGrgdsRsyFDViK6VOwAZzWQ1OQw0woGDuZZbm0id+qS0iYZLkDKatSGOwRIA
 YkJ0RIkIGgKDYHEqIuUrsswDvpF84AMTKNM7lLuqDHUrKUlTiMHkSsY/doHiy1nCX/Ca qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq1528vru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 18:26:59 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37PIHT0S004200;
	Fri, 25 Aug 2023 18:26:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq1528vr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 18:26:58 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PI48X6016687;
	Fri, 25 Aug 2023 18:26:57 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn2289ner-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 18:26:57 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PIQuda1770098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 18:26:56 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B91258055;
	Fri, 25 Aug 2023 18:26:56 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EBBD5804B;
	Fri, 25 Aug 2023 18:26:51 +0000 (GMT)
Received: from [9.61.160.138] (unknown [9.61.160.138])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 18:26:51 +0000 (GMT)
Message-ID: <240c26d3-b821-8410-3142-62e9a8656146@linux.ibm.com>
Date: Fri, 25 Aug 2023 14:26:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
Content-Language: en-US
To: Niklas Schnelle <schnelle@linux.ibm.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
        Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gerd Bayer <gbayer@linux.ibm.com>, Julian Ruess <julianr@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Alexandra Winter
 <wintera@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
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
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy
 <vdumpa@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gJVEk2wQaewkyrtQ9b__FpQB1m2yDbYi
X-Proofpoint-ORIG-GUID: plJWB3elhf65jTBHYa7I2-RRr5Ln9Ish
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_16,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=758 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_112721_595265_7E31C01F 
X-CRM114-Status: GOOD (  20.17  )
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

On 8/25/23 6:11 AM, Niklas Schnelle wrote:
> Hi All,
> 
> This patch series converts s390's PCI support from its platform specific DMA
> API implementation in arch/s390/pci/pci_dma.c to the common DMA IOMMU layer.
> The conversion itself is done in patches 3-4 with patch 2 providing the final
> necessary IOMMU driver improvement to handle s390's special IOTLB flush
> out-of-resource indication in virtualized environments. The conversion
> itself only touches the s390 IOMMU driver and s390 arch code moving over
> remaining functions from the s390 DMA API implementation. No changes to
> common code are necessary.
> 

I also picked up this latest version and ran various tests with ISM, mlx5 and some NVMe drives.  FWIW, I have been including versions of this series in my s390 dev environments for a number of months now and have also been building my s390 pci iommufd nested translation series on top of this, so it's seen quite a bit of testing from me at least.

So as far as I'm concerned anyway, this series is ready for -next (after the merge window). 

Thanks,
Matt


