Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95808C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 03:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KvbCT76+ubrD2FnhisPNCpyRURj4ZNhpb/01VhMe5c=; b=sn8BpPYNe2VBOhFExBpgPL5poj
	4/yuRRhmxfxXhje5RjhXY0vyntqIB6efMD31lb2bec6iqDzuoUmbj1wEaoMBkoWU2/B1Zk6tRXm+Z
	PTTVZp8tU+u2AdqXEtFrntWs70JjWc0IFQ9eiA2IklsTxopi11NjantW08f4eE5RmctvgLOAvmVwo
	2BgNm0HEF0WmnWcaMmZmFoUA4xqFIEG09S2RltPh5PpLAoXrE49Euc4JSR2rx/Zav97YyHRtrEOyU
	nNOi4DPQ68rliczq4kNWjmGJMCOpj4iA2uwxVnnn276Qmrm7PKrjshDcjnW51LCHaSK+W6x0F+pne
	dGr5HUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0aWQ-004Lvc-Bg; Thu, 01 Dec 2022 03:46:02 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0aWG-004Loh-CX
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 03:45:53 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1297Hd022941;
	Thu, 1 Dec 2022 03:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=2KvbCT76+ubrD2FnhisPNCpyRURj4ZNhpb/01VhMe5c=;
 b=pBdPk7zGPSVx+BsLMoJtUiFw8i2VvFpQZ9ifn2mHn+DkMOHX7ciJTB0sJ6jmpMpO52ch
 Jy6xAhajjOKszvHgTzMvVMdERRA7wniK0o3iIU+IFPWnlfvV6jnYPbS7yepnO05v/KXE
 4afgHczOR8pnT4y6+vLb0hnZnahbZFFVjCk+p0vkAi8odQXax3EewffKC4oD5BXmYKU3
 5FTLGJc1hChDoRC85i/WeVOQBIsqJczXOPUM/OOnRXAc8aJ9lIufgMaLkIuEKg2jPPYt
 gkI+CBVjALhCVqHLJsvRAhitoVg/VfDmhpM+6eqezinLlJkpN2ujUyMEx1mu0KC+0WxF mw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m3xhtbnq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Dec 2022 03:45:49 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2B13SJcD007614;
	Thu, 1 Dec 2022 03:45:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3m398a2cr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Dec 2022 03:45:48 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B13jbpg033801;
	Thu, 1 Dec 2022 03:45:48 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3m398a2cjs-11;
	Thu, 01 Dec 2022 03:45:48 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        jejb@linux.ibm.com, Chanwoo Lee <cw9316.lee@samsung.com>,
        linux-scsi@vger.kernel.org, stanley.chu@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Remove unneeded code
Date: Thu,  1 Dec 2022 03:45:12 +0000
Message-Id: <166986602291.2101055.14442594435632458523.b4-ty@oracle.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118044136.921-1-cw9316.lee@samsung.com>
References: <CGME20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07@epcas1p1.samsung.com> <20221118044136.921-1-cw9316.lee@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_02,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=965 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010022
X-Proofpoint-GUID: KjamRSUjRJEBdDZzhHY93ieElsqY7AdK
X-Proofpoint-ORIG-GUID: KjamRSUjRJEBdDZzhHY93ieElsqY7AdK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_194552_486409_8369D79F 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, 18 Nov 2022 13:41:36 +0900, Chanwoo Lee wrote:

> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> Remove unnecessary if/goto code.
> 
> 

Applied to 6.2/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-mediatek: Remove unneeded code
      https://git.kernel.org/mkp/scsi/c/541555285339

-- 
Martin K. Petersen	Oracle Linux Engineering

