Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5250E810D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 11:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukKTZnSC4IUGOzm2dwsJIW4yCSu7IaynshNH9BezX44=; b=LLbohQajjfdXPkPf+WkqgR8OKv
	2IK+RU20Hy+XShXuSnzzmJQberyYkFnhMRdtAUWOlkfD4cbMDfzPjRGYjzMWBZaHVNt10RmNSQnrR
	NPgxvcQiWemlCohCTlD0Io6KaJpiKuWMqadvC7K2OR3bauA7v0GmVrcEH53eSRS///kP3/SSkSOIA
	QeLQ1c92qTgOYsyuIDDUHQ6QhFQh3RzXdlWQpcbzpiVZtysTpFr0EGc9IqmCHOOyude6AUC8EZbYW
	hxA8yhc13XOEhs38j7vLfTmHtKoYRYq1EsNxHh+7lzusl3puEwDlJD/9qaRO5Fn059Hkdw864sIFv
	vVWA0qTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSeh-000nh6-0X;
	Wed, 27 Sep 2023 11:24:35 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSee-000ng6-2q;
	Wed, 27 Sep 2023 11:24:34 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RB8ZfJ023157;
	Wed, 27 Sep 2023 11:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ukKTZnSC4IUGOzm2dwsJIW4yCSu7IaynshNH9BezX44=;
 b=NffwGDkpt3O3XCbGuzhkAED5ru3+k0e8hiNyyXgfRIwZ3lTxVWxb8rXYkULNOlXcLckN
 peMowhk4Biy57/wr4fgENcltJ6YfxhmWUPHYEBBypsLxcO64CCco1zwdg40ouswcqudn
 H7TL36M9culsMFTc+GIRcQfvACTH7MuP52ejM4VBMtc24d5jan3WJcaTZ+H4yS5z2ES+
 m7Wopyv89/pCV35iFmG0JtXwTt7S8o22ipoCs0bFZlLTYCy5qFW/itPEr3+/CRt5wRWS
 kLDCNC5kx9KtA/1JrLGwY/4MsdZ7yGcVMMbUL9iPiiRR1nL55X1Gsw251vHHIWSZtRLj ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tchpmtjde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 11:24:09 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38RBG0oQ030327;
	Wed, 27 Sep 2023 11:24:09 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tchpmtjcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 11:24:08 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38R9vgip030392;
	Wed, 27 Sep 2023 11:24:07 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad21tgsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 11:24:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38RBO48i46203340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 11:24:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 080D320043;
	Wed, 27 Sep 2023 11:24:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A7BC2004B;
	Wed, 27 Sep 2023 11:24:03 +0000 (GMT)
Received: from [9.152.212.236] (unknown [9.152.212.236])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Sep 2023 11:24:03 +0000 (GMT)
Message-ID: <b06a14de270a63050b0d027c24b333dba25001a4.camel@linux.ibm.com>
Subject: Re: [PATCH v12 0/6] iommu/dma: s390 DMA API conversion and
 optimized IOTLB flushing
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Rosato <mjrosato@linux.ibm.com>,
        Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
        Robin
 Murphy <robin.murphy@arm.com>,
        Gerd Bayer <gbayer@linux.ibm.com>,
        Julian
 Ruess <julianr@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig
 <alyssa@rosenzweig.io>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu
 <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Yong Wu
 <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Orson Zhai
 <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
 <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry
 Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Date: Wed, 27 Sep 2023 13:24:03 +0200
In-Reply-To: <ZRP8CiBui7suB5D6@8bytes.org>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
	 <ZRLy_AaJiXxZ2AfK@8bytes.org> <20230926160832.GM13795@ziepe.ca>
	 <cfc9e9128ed5571d2e36421e347301057662a09e.camel@linux.ibm.com>
	 <ZRP8CiBui7suB5D6@8bytes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bLtkRXrEY3SfXBdyvYi4Yk-ISraKqz9W
X-Proofpoint-ORIG-GUID: 0_s5ZArBvU0BtJm2m4rsOO0oeH2MXCgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_06,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=646 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_042433_038683_D8DC5BEB 
X-CRM114-Status: GOOD (  22.68  )
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

On Wed, 2023-09-27 at 11:55 +0200, Joerg Roedel wrote:
> Hi Niklas,
>=20
> On Wed, Sep 27, 2023 at 10:55:23AM +0200, Niklas Schnelle wrote:
> > The problem is that something seems to  be broken in the iommu/core
> > branch. Regardless of whether I have my DMA API conversion on top or
> > with the base iommu/core branch I can not use ConnectX-4 VFs.
>=20
> Have you already tried to bisect the issue in the iommu/core branch?
> The result might sched some light on the issue.
>=20
> Regards,
>=20
> 	Joerg

Hi Joerg,

Working on it, somehow I must have messed up earlier. It now looks like
it might in fact be caused by my DMA API conversion rebase and the
"s390/pci: Use dma-iommu layer" commit. Maybe there is some interaction
with Jason's patches that I haven't thought about. So sorry for any
wrong blame.

Thanks,
Niklas

