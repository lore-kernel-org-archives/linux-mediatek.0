Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4303FCD1288
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwQf13VznOtUZDDdpgXqplM6Pdd9fkkzGt1QIYsw/2k=; b=sJRYBzq8HFzR3/6l78pV5asnSm
	xEol7gG8BlBrAZUvXvMHX1CofOjCVyRHusDSfNWiH9glsyjd+tf9a8oD1Tw0VbX8MPBx4oNc1oxyo
	nwSymAvX6RK1ACT6J6T0GfIuDjxBbc29kPsEpr39pwWQHd7gX8kBNVm7Zlb9rAltSysnTshHcKW5x
	/PlRZrgwRTSA4FDkluM8wzSDvZ0DEvWffWxZW1ZFvAi1+8yMLdrNXZCYUDFqOq6Qwb79YiczXP/Nh
	GpiOjKgJ2j2kee7rPU6IsAh6tS+7irWhkPeNE7FKSllKIVrCGpMB24MRwkGleMZ3wYL/luoCwpiqf
	zFXJRzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTH9-00000009NpD-3hD6;
	Tue, 02 Apr 2024 01:49:23 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTH6-00000009Nnl-0kZC
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 01:49:22 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 431I6Avi009651;
	Tue, 2 Apr 2024 01:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=BwQf13VznOtUZDDdpgXqplM6Pdd9fkkzGt1QIYsw/2k=;
 b=F13hnhma8Zd/d4zH4unenl7QG0yGEmFowFbhXlLTU72ygbwgEOFcw1EmTJplxWGuIIcK
 HS84b5ORapdtiR+XBvivpaMaE4uY3dYypKO9RzKZ3V+NO6PV8ULCDcRmSROAHvl8egDe
 0OvQRZI1nyFYSdCsYdQ5kB7t6iJN914sghkLdUk9XE8eUJSNQw/VKI+hlTxYTqArxFEV
 BIXOMGYY33zSueyB/PtTVYqvo57H7EZ0dhRXdpI3ww27mCE7XRNYac45C56Syitz+Q8Y
 Cf9dHf9j6jN3Scz0EX7eAaogK8RbZXg/CCsQOsabEod4873LiKt93aBOwFEIw3iFh8f7 YA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x7tb9sjpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Apr 2024 01:48:48 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 431N0NkJ018902;
	Tue, 2 Apr 2024 01:48:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3x696cd6cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Apr 2024 01:48:48 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4321mkNF030130;
	Tue, 2 Apr 2024 01:48:47 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3x696cd6bp-4;
	Tue, 02 Apr 2024 01:48:47 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com,
        jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, powen.kao@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com,
        chu.stanley@gmail.com
Subject: Re: [PATCH v1] ufs: core: fix mcq mode dev commad timeout
Date: Mon,  1 Apr 2024 21:48:38 -0400
Message-ID: <171202249162.2135322.4791660173252394411.b4-ty@oracle.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240328111244.3599-1-peter.wang@mediatek.com>
References: <20240328111244.3599-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020012
X-Proofpoint-GUID: cZ7ELhtQH-MbWLHkAuEr3s0QC2GiuVvn
X-Proofpoint-ORIG-GUID: cZ7ELhtQH-MbWLHkAuEr3s0QC2GiuVvn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_184920_357648_76E78B3C 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, 28 Mar 2024 19:12:44 +0800, peter.wang@mediatek.com wrote:

> When dev command timeout in mcq mode, clear success should return
> retry, because return 0, caller consider success and have error log.
> "Invalid offset 0x0 in descriptor IDN 0x9, length 0x0"
> 
> 

Applied to 6.9/scsi-fixes, thanks!

[1/1] ufs: core: fix mcq mode dev commad timeout
      https://git.kernel.org/mkp/scsi/c/2a26a11e9c25

-- 
Martin K. Petersen	Oracle Linux Engineering

