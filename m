Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93918C47DA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 02:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBMFsOTdFwH4IbQ/ifau3T507/gj4PdaNNxG6rrK4VA=; b=E2mcYTGOYQv+IbWprGf84+S55s
	RE6eX9JEL/UVn8kaAEzaDIW7V92/oS4sdPV7EfD9SGE/BisycAS9bRR0bydM2wlVln+VfCQNbPL03
	kTF6OIwAvvuAzhidjLdZ2aQ47YvbWmZ95sgLBvL/IC94wWM14b1wL1gKv/9E09jSqsXMtfsnRC/nH
	M9R4Tb1C9Qgsj54RcXIEUQvfGq2fv4Ho6t97YxyM5y8fVIQVhYJy6AfQpKigV47NDBYBDS3uqduNQ
	nj3WHiqrRxKpj84hFH0siZw1C533CAoQ/+4MR5jC2MI+moROJiOBKAxZhy/OV+RSwT0Lmnvz4gxaP
	7GhoaMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdqn-0000000Exgp-0vby;
	Tue, 30 Jan 2024 02:27:49 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdqj-0000000ExeW-200b;
	Tue, 30 Jan 2024 02:27:46 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40TJjFFQ031339;
	Tue, 30 Jan 2024 02:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=WBMFsOTdFwH4IbQ/ifau3T507/gj4PdaNNxG6rrK4VA=;
 b=lHowqzQGYuILeJJghn/9zrHYQeLslsBeuFZUc8x2eNb34XGMhmrPcMDbCgX9tmUpSI7f
 yWLaSlL+oVZy0OK8uONjhjDWTSk42TXn79TR34YpNoOw6qjSR5b0b93X5bmuKzkB4RsG
 WNDtLn9IQU4PO7LwNNnpWoUlsYazVQa4z9APlrbpq77cEmMHJ9+60u8QTFXkRvCMIWfX
 I2OstDmdHnydLIwyUTkb8v/I49VM/SpyFi3t5atRCpc0fhjVg4JUAmSERG+Pwr7KTfIL
 zOl6mB7QtuyYi0xpPGWpRx8FmlJEt9i3TAlPdWd/l9X/iSV+5IO9x4kJ2gt3drhhlMhg nw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vvrrcdjrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:33 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40U0P3QJ014462;
	Tue, 30 Jan 2024 02:27:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vvr96g512-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:32 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40U2RPxm040916;
	Tue, 30 Jan 2024 02:27:31 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3vvr96g4y7-5;
	Tue, 30 Jan 2024 02:27:31 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        jejb@linux.ibm.com, peter.wang@mediatek.com, chu.stanley@gmail.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        stanley.chu@mediatek.com, quic_cang@quicinc.com, mani@kernel.org,
        quic_asutoshd@quicinc.com, powen.kao@mediatek.com,
        quic_nguyenb@quicinc.com, yang.lee@linux.alibaba.com,
        athierry@redhat.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Lee <cw9316.lee@samsung.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, grant.jung@samsung.com,
        jt77.jang@samsung.com, dh0421.hwang@samsung.com, sh043.lee@samsung.com
Subject: Re: [PATCH v3] ufs: mcq: Add definition for REG_UFS_MEM_CFG register
Date: Mon, 29 Jan 2024 21:27:01 -0500
Message-ID: <170657812670.784857.12424520117392551144.b4-ty@oracle.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240102014222.23351-1-cw9316.lee@samsung.com>
References: <CGME20240102014248epcas1p4d49dcf2cd3f020bed88eebaeba648789@epcas1p4.samsung.com> <20240102014222.23351-1-cw9316.lee@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=833 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401300015
X-Proofpoint-ORIG-GUID: KjxR28JYNzC9rJxeETTWUejeOOd3-6XD
X-Proofpoint-GUID: KjxR28JYNzC9rJxeETTWUejeOOd3-6XD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_182745_721894_1F67E718 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, 02 Jan 2024 10:42:22 +0900, Chanwoo Lee wrote:

> Instead of hardcoding the register field, add the proper definition. While
> at it, let's also use ufshcd_rmwl() to simplify updating this register.
> 
> 

Applied to 6.9/scsi-queue, thanks!

[1/1] ufs: mcq: Add definition for REG_UFS_MEM_CFG register
      https://git.kernel.org/mkp/scsi/c/ab3e6c4e0ea1

-- 
Martin K. Petersen	Oracle Linux Engineering

