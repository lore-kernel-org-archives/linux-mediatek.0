Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB97CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UkPXgHJnYkQCXxZa4zvinXjy2g3MTsYet7dBuKMxCM=; b=curxPagGvHHjnWEOi5oSh6VGLd
	vHkOmh5/Gebr1mgOe2J3cGDCXrzK9wL4a6WiZDtCcgZBQee7W4/qGJ1plXJscqBHBDbg2UWeSZdIn
	7wFYzbEClFmIyygZlKp3KAzHEcnOyrX3+DCcFSAtk1yzXJe6RTyIn6Mwx0aNBJs7J7/RLji86HwrE
	vqxUUgGQHI2rIYreqIsdQ5NAe6ZDVpBvNLvThFKGYhUyHWjvKX2eR+iAv12oJKW5Kum6at1ICx86X
	kPUUUqFa+sqhLq3lTjSq/uRSd+rKdiq2JxyxgVLBUm0AMIDaauO8wvSFIEELpy4n4uZFmuy5w/s0T
	1AQavrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGHl-00FOg0-1y;
	Tue, 11 Jul 2023 16:32:21 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGHj-00FOeg-0g;
	Tue, 11 Jul 2023 16:32:20 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B9NiAK005730;
	Tue, 11 Jul 2023 16:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=8UkPXgHJnYkQCXxZa4zvinXjy2g3MTsYet7dBuKMxCM=;
 b=0sOX2Zpu3dalQ+9m5wGeFLRVDHfoU6d0Eo8zDaoo5qjGANSikkmTvEj2vxo6ZgOTNsFW
 rEqdmyq+FFVZDuOZCPRPVNBfDJ/+PL1biZ/hfvkv+mCQbYSe/5eXfBZy64olnhNlyrPV
 Y/g1H2SV7YLZ3OaVHlKIY9kWskOwzAEPbVYhd3AFQE32vPqWfvKFWSYEz5/8DqgfgSHI
 Ix4SwgiPA0gqP7MC2P2qBExcgu3OeNOeYvKy7ZrtOvsjQ17T34cGlQBmCBW2K1kD85hX
 a9rm9qwdeOwu4Ak3HAkCjH/JZZCg9MgTxKdUMOBbGYTsuF1RseAj3f2dQ3OA0GVZybKX LQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrjmhau5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 16:32:08 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36BF5B14007175;
	Tue, 11 Jul 2023 16:32:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx854cgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 16:32:07 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36BGQBXV019529;
	Tue, 11 Jul 2023 16:32:07 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3rpx854c4h-7;
	Tue, 11 Jul 2023 16:32:06 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Peter Wang <peter.wang@mediatek.com>, Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        "James E.J. Bottomley" <jejb@linux.ibm.com>
Subject: Re: [PATCH RESEND] scsi: ufs-mediatek: add dependency for RESET_CONTROLLER
Date: Tue, 11 Jul 2023 12:31:48 -0400
Message-Id: <168909306215.1197987.11044186916008223699.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230701052348.28046-1-rdunlap@infradead.org>
References: <20230701052348.28046-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=788
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110148
X-Proofpoint-ORIG-GUID: xVg8CnqmzB0D8QwPe2cW16ZMpPjtyouI
X-Proofpoint-GUID: xVg8CnqmzB0D8QwPe2cW16ZMpPjtyouI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_093219_251998_25386156 
X-CRM114-Status: GOOD (  16.07  )
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

On Fri, 30 Jun 2023 22:23:48 -0700, Randy Dunlap wrote:

> When RESET_CONTROLLER is not set, kconfig complains about missing
> dependencies for RESET_TI_SYSCON, so add the missing dependency
> just as is done above for SCSI_UFS_QCOM.
> 
> Silences this kconfig warning:
> 
> WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
>   Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
>   Selected by [m]:
>   - SCSI_UFS_MEDIATEK [=m] && SCSI_UFSHCD [=y] && SCSI_UFSHCD_PLATFORM [=y] && ARCH_MEDIATEK [=y]
> 
> [...]

Applied to 6.5/scsi-fixes, thanks!

[1/1] scsi: ufs-mediatek: add dependency for RESET_CONTROLLER
      https://git.kernel.org/mkp/scsi/c/89f7ef7f2b23

-- 
Martin K. Petersen	Oracle Linux Engineering

