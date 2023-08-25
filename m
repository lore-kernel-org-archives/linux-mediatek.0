Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DBCC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSLj+Ki6TB5wXp7to6+Q916IbuoRLePE00oJA8RLfOQ=; b=tUtE/cfpU+aa8wF6cUgNSNAdAi
	sgjeOBS6de3r9NgklJE8jnnNAl+2mG58WLwbpaYjfcl+ff+DEL5bSNxetYs1jk0Go8lYEw6+nELRd
	ymf4nNf3iJWx/KJaP5mtXN+/F4BvyVSiPF/nb9K/B6JKntYvovA57cLocgVR4HP77ROMz2L0ViJcu
	TSOdinpgRyasAhXvTMfhHZi1DKvTY9YA8ge1DJrdfmnsiHP13SCJOusEZSP5jasu5u+Bb8iidVVcj
	6DxQZwxutC9WuzaMOCGx5kwPr4xcZgcxMXZ9kUwIBPr3+/nMgsAscxcZblQzXDQFuBNZlLMnZ+akM
	ACkKEFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZToM-004nFa-1I;
	Fri, 25 Aug 2023 10:13:02 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZToD-004nCB-1q;
	Fri, 25 Aug 2023 10:12:55 +0000
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37P9reLw011078;
	Fri, 25 Aug 2023 10:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : date : subject :
 mime-version : content-type : content-transfer-encoding : message-id :
 references : in-reply-to : to : cc; s=pp1;
 bh=SSLj+Ki6TB5wXp7to6+Q916IbuoRLePE00oJA8RLfOQ=;
 b=V9mQ8jZUqs5LT1LV0ooUbpps9S0gywjAanhuSqgIlafNGqZzy8lTcBvUsGMqiRvDDUrW
 WbKb//k1aeszQa7U1NfhszJAym7k1+AAqKfQAKSudcLnIx8oZg9ULJnZ+BYSpoxMt4ZI
 jxapcO0w68gqYFAdY+o92lPkbJ90pDwwemrcfM84bRIvzTsfpL8tZYkPIrStuCgj98Hi
 ccKSlSMIiOx2CfWFyNrj4YkPxhWpADp3lvdC6MJmvoPqLnugaYYxyqlH16K9rCjdCrfz
 DTtIwt6tpcnp61Vgg0oBH807+LDODS8UWu6zSi3LB0T5bZOgvgcu4WQH/0TcROMrVwf/ Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spt2d0g7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 10:12:16 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37PACFMQ015695;
	Fri, 25 Aug 2023 10:12:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spt2d0g6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 10:12:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37P9vlmo026143;
	Fri, 25 Aug 2023 10:12:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3snqgte3hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 10:12:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PACA3p20447758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 10:12:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9352B2005A;
	Fri, 25 Aug 2023 10:12:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F4E52006C;
	Fri, 25 Aug 2023 10:12:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 10:12:09 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Fri, 25 Aug 2023 12:11:19 +0200
Subject: [PATCH v12 4/6] iommu/s390: Disable deferred flush for ISM devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-dma_iommu-v12-4-4134455994a7@linux.ibm.com>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
In-Reply-To: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
To: Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
        Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
        Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gerd Bayer <gbayer@linux.ibm.com>, Julian Ruess <julianr@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
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
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=sZt9Lzfm5qJ8uDwKZETwychABFMsygrpaOEr/Rdj2rc=;
 b=owGbwMvMwCH2Wz534YHOJ2GMp9WSGFJe1CU458l8XmRau+e7jwxnmoT96tfWO3qnxp/SslLvy
 Gd5pvylo5SFQYyDQVZMkWVRl7PfuoIppnuC+jtg5rAygQxh4OIUgImof2JkWHDyUfzG9Af3y/+f
 n6Z6QVblVcgxZs8vv7/c6S4/IP5qZzDD/9Skc0kln36uV9+6W3PiY69FNceLDJ6c/NNz8Im36Wv
 RdD4A
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3pEDTQfUTMM0hDVSNmO03KlcAB47ZIkd
X-Proofpoint-GUID: a6iCCkNgFtr42AReMJZPR3-EGq-EDxhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_08,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308250087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_031253_629214_FC7F906D 
X-CRM114-Status: GOOD (  20.80  )
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

ISM devices are virtual PCI devices used for cross-LPAR communication.
Unlike real PCI devices ISM devices do not use the hardware IOMMU but
inspects IOMMU translation tables directly on IOTLB flush (s390 RPCIT
instruction).

ISM devices keep their DMA allocations static and only very rarely DMA
unmap at all. For each IOTLB flush that occurs after unmap the ISM
devices will however inspect the area of the IOVA space indicated by the
flush. This means that for the global IOTLB flushes used by the flush
queue mechanism the entire IOVA space would be inspected. In principle
this would be fine, albeit potentially unnecessarily slow, it turns out
however that ISM devices are sensitive to seeing IOVA addresses that are
currently in use in the IOVA range being flushed. Seeing such in-use
IOVA addresses will cause the ISM device to enter an error state and
become unusable.

Fix this by claiming IOMMU_CAP_DEFERRED_FLUSH only for non-ISM devices.
This makes sure IOTLB flushes only cover IOVAs that have been unmapped
and also restricts the range of the IOTLB flush potentially reducing
latency spikes.

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/iommu/s390-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f6d6c60e5634..8310180a102c 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -315,11 +315,13 @@ static struct s390_domain *to_s390_domain(struct iommu_domain *dom)
 
 static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 {
+	struct zpci_dev *zdev = to_zpci_dev(dev);
+
 	switch (cap) {
 	case IOMMU_CAP_CACHE_COHERENCY:
 		return true;
 	case IOMMU_CAP_DEFERRED_FLUSH:
-		return true;
+		return zdev->pft != PCI_FUNC_TYPE_ISM;
 	default:
 		return false;
 	}

-- 
2.39.2


