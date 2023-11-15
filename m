Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0114AC54FB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyDtzjiRA41HQpEbPCZGjyaytaZes/PnKBEdOJnA+6s=; b=SsN99YmDAjbnjaM7WI5TrG+x1q
	Hf8GnBS4OVMHGUXONj5guFkAo4nj6Chm6ndXJwP0uq6fb4xZkjk3qfReP+oRl4wGPCG+8uo2JU6oX
	lperQOw4L8t+hBur2BisgWwnoZYMnkqC8phLXZB9v2o5oJM6JFQBt+lAzo6buvqD93R9G7djbvhls
	MBvH4wnCcgNsLCg6dJfJKVI5pOz+ISrETq100dEZvseyE5HmFB7ILsTkoAAePsHstupRoCnmjMhmy
	qDcJp3+/6DHSsKu/joFUffv4OAYauvcrmA0xoGe22LEmVYEGyyUJnMj2lUFNYT+HLDwCoOu9AO+bm
	Krdat72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HZv-0018zo-1a;
	Wed, 15 Nov 2023 15:13:19 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HZr-0018z2-2z
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 15:13:17 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFE4g2h017281;
	Wed, 15 Nov 2023 15:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=jyDtzjiRA41HQpEbPCZGjyaytaZes/PnKBEdOJnA+6s=;
 b=eCTe7BYQG34Wv3ifVRkRPjyiv7MV8kPIlHsJlhiBG1cWhZSufM4jMAmihcFKbeAGl4jg
 t5RQhqHjNZstLB25ChP9SaByr/I4z7fGmK+I30EwigaJ7yXp+VMrcr+AO/r6F0OLUCGc
 C7EpDn+CUjetsjaZmfTTKC9OhVd3qwIRuImEvbaoB+ZZo96NCvYXDVPFtxbIbF07tzM0
 oDLuN26gCpEdgIuAZZjQAuwHK9yjlKOrST8u4wxwrpBRe3EfJLs7s1/0uVeC4Dz5ykFr
 4GqkkfrT25brQxa0af/hVE8Ic7tdNc0EY6b7cuTBYb7NnqJ1yyrOUYNk11Kb8VqGff7N rQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2strr7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 15:13:13 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFF4iCA003911;
	Wed, 15 Nov 2023 15:13:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uaxj40897-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 15:13:11 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AFFD8SV011253;
	Wed, 15 Nov 2023 15:13:10 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3uaxj4085x-5;
	Wed, 15 Nov 2023 15:13:10 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, avri.altman@wdc.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, powen.kao@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] ufs: core: fix racing issue between ufshcd_mcq_abort and ISR
Date: Wed, 15 Nov 2023 10:13:03 -0500
Message-Id: <170006111392.506874.14169694579430411833.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231106075117.8995-1-peter.wang@mediatek.com>
References: <20231106075117.8995-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_13,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=756 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150115
X-Proofpoint-GUID: l1LmW0E1INyKXeC4nRpQVlhFvJ1l8L1_
X-Proofpoint-ORIG-GUID: l1LmW0E1INyKXeC4nRpQVlhFvJ1l8L1_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_071315_967711_CD3D5F47 
X-CRM114-Status: GOOD (  13.75  )
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

On Mon, 06 Nov 2023 15:51:17 +0800, peter.wang@mediatek.com wrote:

> If command timeout happen and cq complete irq raise at the same time,
> ufshcd_mcq_abort null the lprb->cmd and NULL poiner KE in ISR.
> Below is error log.
> 
> ufshcd_abort: Device abort task at tag 18
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000108
> pc : [0xffffffe27ef867ac] scsi_dma_unmap+0xc/0x44
> lr : [0xffffffe27f1b898c] ufshcd_release_scsi_cmd+0x24/0x114
> 
> [...]

Applied to 6.7/scsi-fixes, thanks!

[1/1] ufs: core: fix racing issue between ufshcd_mcq_abort and ISR
      https://git.kernel.org/mkp/scsi/c/27900d7119c4

-- 
Martin K. Petersen	Oracle Linux Engineering

