Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB9AC47089
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 03:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VmA7JcE+JUSMnpzz2QA88Al4oFq7HqLz4eKcNxN/qE=; b=YG/63fJH70ITkURtZ9SGMgSwn1
	Wf8f/zy75+JHPg23jJvTuolvHGswTss+MvXWhdRBVvpfAcqAign8vWpC9HMx3JNHiiTMht8RcDz7o
	B7M2eLDwciwgS6fX48rbctcUoL8b7gnHge8rF+wLDJ9Kf7eMO6DDAhjmXAShFUMEEPRaFWtjzSGdt
	OU3vfKZU4pRc3qMGQ5MsgmVNtIL7KeILUT6LWKrx3S8BUDdy4H7W3ke52chnKgYtBpe3lzORA0aNo
	jfa4ksI8Js5GaYiM/8tUFPIQv8xt++H53EciMpAppRc/2B7PSN509xpIdj+y2gNlLcPALltaO37wE
	guWBry7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0aWX-004M0S-Gp; Thu, 01 Dec 2022 03:46:09 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0aWE-004LmS-S9
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 03:45:52 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B11PAin017406;
	Thu, 1 Dec 2022 03:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=2VmA7JcE+JUSMnpzz2QA88Al4oFq7HqLz4eKcNxN/qE=;
 b=MmU0lmJ1TH3hHzlSx+jVOuHzwb56Wxp9w70FRTXVCkayLNT4kA39NaQbVmybVRsa6n4g
 9x+86sXYfZn1b7ik6LOFzP0kRYCRTnNu+hIQCFk3NvdwOartxBrwG8RLbrUnM20k5MTi
 sJJSWhfqxA+oAnTaIm/axLCTeeCuQBssgk1uYBQQfKUI+gIBlTLYUrSE84tWv4YFal2I
 5eboLYRnTSqWwVHfdgF6tlkuYSAq7kMXe0HhUsJ9IWzbodqilXSu/vT5FaDjDc1nxWiE
 b4TMFOK3x/sbNIl5QpfHE0Re0KmNNDnJSelBwlDUX5dRu4HHkPI5HmE5p06dWFzb54YZ sw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m40y43ep5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Dec 2022 03:45:47 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2B12Vj5U007630;
	Thu, 1 Dec 2022 03:45:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3m398a2cq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Dec 2022 03:45:46 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B13jbpc033801;
	Thu, 1 Dec 2022 03:45:46 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3m398a2cjs-9;
	Thu, 01 Dec 2022 03:45:45 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-mediatek@lists.infradead.org, jejb@linux.ibm.com,
        matthias.bgg@gmail.com, Chanwoo Lee <cw9316.lee@samsung.com>,
        linux-scsi@vger.kernel.org, stanley.chu@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Modify the return value
Date: Thu,  1 Dec 2022 03:45:10 +0000
Message-Id: <166986602291.2101055.3298098946554497102.b4-ty@oracle.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118045242.2770-1-cw9316.lee@samsung.com>
References: <CGME20221118045326epcas1p408c9e16a58201043c9eb3c99110fab0c@epcas1p4.samsung.com> <20221118045242.2770-1-cw9316.lee@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_02,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=868 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010022
X-Proofpoint-GUID: HaiHWOJjYb8spMMI-tQx4n5rQ-QRdfSO
X-Proofpoint-ORIG-GUID: HaiHWOJjYb8spMMI-tQx4n5rQ-QRdfSO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_194550_969905_E4E394EC 
X-CRM114-Status: GOOD (  12.58  )
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

On Fri, 18 Nov 2022 13:52:42 +0900, Chanwoo Lee wrote:

> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> Change the same as the other code to return bool type.
>   91: 	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
>   98: 	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
>   105:	return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
> 
> [...]

Applied to 6.2/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-mediatek: Modify the return value
      https://git.kernel.org/mkp/scsi/c/96a2dfa1df4b

-- 
Martin K. Petersen	Oracle Linux Engineering

