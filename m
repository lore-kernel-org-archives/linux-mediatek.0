Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8657C47DA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 02:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnxB/1JpnE07mK7KrT82Rv+Vrde3dBoswy5F4UjH020=; b=guJ0rYONzuy16k1Mc3qGiEEvrn
	lF7OlWlGCp1MBY9j59lcYCO955Oz3gU/0nykVPNYnrJ3SqQsLYPyYC0ol1osu09fwWDjpONWHR6iG
	jBYv9vOFGL94qKPdb5/dMpGZ9s8CBKqw5eVQN6b4pf735jXD3BVeiWPNP6cc//qzKEWmRmtdFEF6x
	+K2GJ/7JvIUrv0XcpMMCr6FoPjphbD2dxhc95yZSLq4D2TyCQPwre6Kxuaz5a9IWa1IMQnbedFTnw
	if9QgTu4AU7Szr6p5mI99A7FUSLml/3xoLMKE2UPlPuotu7p/LrUB8O9r84sirPG4xqYXCS6OMWxK
	dJMvEcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUduA-0000000Eyiy-1yWj;
	Tue, 30 Jan 2024 02:31:18 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdu7-0000000EyhQ-2kzV
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 02:31:17 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40TJidvD030870;
	Tue, 30 Jan 2024 02:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=MnxB/1JpnE07mK7KrT82Rv+Vrde3dBoswy5F4UjH020=;
 b=Ueq5FAC8NKz247obRDuWueKXxPSqiggvk7Uc6owFEvJJ0Q61+NXPeCUiPVFmwGOEWysi
 hVBa2g2apfV2Wh1iIHIURvBP2uIsppgH3ZqOH8Z6yr0I+Tj+v5QpDGkv6IgeYrv1ZxuF
 o3Y+FrNUAZ0MOe9rePAynf1OoeMoHm+R6O02ofdg8OOBXcRfv25teR3UgsvvBqtE20Ik
 4QXbwgOr6vlLtxk+oWtzzzTxtVqEU/u0XFQKmDMAW73L8L8Pp4veKbR1im7nGhQCaQat
 nlGTlgPv/gPXdVe9DsbinrPoHuUuF+J08Rlevpegy8tN/ECpb9HLrM89KSSbqMysO+ET Wg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vvrrcdjrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:40 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40U1XwGg014604;
	Tue, 30 Jan 2024 02:27:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vvr96g530-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:39 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40U2RPxw040916;
	Tue, 30 Jan 2024 02:27:39 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3vvr96g4y7-10;
	Tue, 30 Jan 2024 02:27:39 +0000
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
Subject: Re: [PATCH v1 0/2] scsi: allow host change auto suspend timer
Date: Mon, 29 Jan 2024 21:27:06 -0500
Message-ID: <170657812663.784857.12611066657183542555.b4-ty@oracle.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240109124015.31359-1-peter.wang@mediatek.com>
References: <20240109124015.31359-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=961 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401300015
X-Proofpoint-ORIG-GUID: bdDsH0aN5LS1W9Yg2a8SiJji-r_S0rvv
X-Proofpoint-GUID: bdDsH0aN5LS1W9Yg2a8SiJji-r_S0rvv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_183115_718965_D44501AA 
X-CRM114-Status: GOOD (  14.77  )
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

On Tue, 09 Jan 2024 20:40:13 +0800, peter.wang@mediatek.com wrote:

> This patch allow MediaTek platform driver change auto suspend timer.
> 
> Peter Wang (2):
>   scsi: core: move auto suspend timer to Scsi_Host
>   ufs: host: mediatek: change default auto suspend timer
> 
> drivers/scsi/sd.c               | 2 +-
>  drivers/ufs/core/ufshcd.c       | 9 +++++++--
>  drivers/ufs/host/ufs-mediatek.c | 4 ++++
>  drivers/ufs/host/ufs-mediatek.h | 3 +++
>  include/scsi/scsi_host.h        | 6 +++---
>  5 files changed, 18 insertions(+), 6 deletions(-)
> 
> [...]

Applied to 6.9/scsi-queue, thanks!

[1/2] scsi: core: move auto suspend timer to Scsi_Host
      https://git.kernel.org/mkp/scsi/c/4380e64a94e1
[2/2] ufs: host: mediatek: change default auto suspend timer
      https://git.kernel.org/mkp/scsi/c/332973850054

-- 
Martin K. Petersen	Oracle Linux Engineering

