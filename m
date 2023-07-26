Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481E1EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vja+h4kgYnLXSV5n1ENT5Phr4WPGiPXDy45bvkSMVDE=; b=y56InKGPNYX/PprG0iFSDAwpR5
	k2+jIxF1r7dpIpj7kHdoDva/9C5fkRDOetwPmDyZvZkruzq/iiolMBapDedzWVEAqWadTspqlMkbW
	mZuQOp+jqnQJG72lJe6tqTikALIKR5ZLEOwQdMW6fswQzX9SOsIOG2MjLbf0NrXYet6kVDYRQVcAB
	IJnMyKSnpyw5wPIYHPha+zWw9xjAuuvZeCMGuXBDIF5Gxutp5r1Ms4OvRqorLu9acoAAzbgH3ptab
	1zqdd7OGFeQq2g8+wAL9a99x/QIlZ+Pn03AKL+CYRPI5SlkT6jTk0678GFpHwFMU5mwFsRukpRMpy
	Xnq2bHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTuq-008tpU-0P;
	Wed, 26 Jul 2023 02:06:16 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTum-008toE-32;
	Wed, 26 Jul 2023 02:06:14 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PJIsws025954;
	Wed, 26 Jul 2023 02:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=vja+h4kgYnLXSV5n1ENT5Phr4WPGiPXDy45bvkSMVDE=;
 b=kljZzj0XeNgEuDIPJpp7EsNcJOf2i5XfNHuNzwLIO0/13lNd7kPJy0P7fGHumwQStq4D
 CPRJ4RLb1WtqsRmK3qSiFmh4iePLo+6qrg5go/I7rKFonnvrKGPFvnPHfbWd8BX4vuo3
 KxZ7kzHf39wqo1eM6llezZ+FSz2ujNUcdZFUxT9hyFe22dXNWMNdLAJW/UJJ9EWbSYOl
 tiie0e09xprojzvtrl+xQMhQvDIFLUFHXqTZZ6tFp4rtWbQmZAb4/LS7fsqb/xy8F4zN
 SbGkMRYW40WwJA50NoK6fcZJbP7ambdDL7uqat+ahfxPQZIKFooZLK9Igg8pdtr2Wgo7 LA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3s075d6fvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 02:05:20 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q0G7pp023017;
	Wed, 26 Jul 2023 02:05:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3s05j5jd61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 02:05:19 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36Q253Nl038905;
	Wed, 26 Jul 2023 02:05:19 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3s05j5jcwf-11;
	Wed, 26 Jul 2023 02:05:19 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Stanley Chu <stanley.chu@mediatek.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ufs: Explicitly include correct DT includes
Date: Tue, 25 Jul 2023 22:04:56 -0400
Message-Id: <169033702311.2256288.15687854020810021082.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714175018.4064957-1-robh@kernel.org>
References: <20230714175018.4064957-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=773
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260016
X-Proofpoint-ORIG-GUID: 7TAvwxd8Z-sacMXHooFB4wftkVDRj9xp
X-Proofpoint-GUID: 7TAvwxd8Z-sacMXHooFB4wftkVDRj9xp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_190613_111240_1DD95718 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, 14 Jul 2023 11:50:18 -0600, Rob Herring wrote:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied to 6.6/scsi-queue, thanks!

[1/1] ufs: Explicitly include correct DT includes
      https://git.kernel.org/mkp/scsi/c/c2ab666072bc

-- 
Martin K. Petersen	Oracle Linux Engineering

