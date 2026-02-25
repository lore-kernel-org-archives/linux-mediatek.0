Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F4F5543A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 02:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiBICH0QgqmMAV9uuMkMi3BhSmbfCc+hSodQOal5Ujk=; b=fyK4N9YS0uh2HSfS6+i1T/Rh/V
	zNQR30DbaUtaCySGq5ynkfeWCvboz7Sp+SDpEB50Bn5MZZNPTtKBhYnG6I3INbKFEPUsKcI+x4zbD
	QtNvsiVPqUUYXYTPf9bPpo3Hljq6XUHvXYZS6oyu0q7gFp0M2GQhLBq/7O6ba9RysOb+wdLNfTeJT
	DevyJarnSvN3DdolQ67uuvRzyGtL7ffL9gnSk2z9Ae1HPzefaG2gdUuKBJ8F1f9VmWhX+9PWocSPd
	A8UjUDUHuFfswNZHvNNJnGdNCblKaw33SoGc7UMVvcNvQYi2N5Mgru526x9YItEXNZrmLaBFQWgr5
	ygYGJdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4KS-000000034ae-2Bik;
	Wed, 25 Feb 2026 02:08:44 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4KP-000000034ZV-2lIv
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 02:08:42 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIvVwv3930646;
	Wed, 25 Feb 2026 02:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oiBICH0QgqmMAV9uuMkMi3BhSmbfCc+hSodQOal5Ujk=; b=
	ShVtZ8JM7+9jH3s7wWEOdznGhS0JLzCMh/n0IHTFe4SoDWmaMVJ4ZrP3JWjAy2HU
	ZWh7eNkHzhRd1YDcL/qM1hG1xwQvtc0Gve06znl8DkCckF1+50Kkc6jzRhIoSxxE
	PEwWSNaW/QBmx7qpVMEDY5bINOYluO7QQ2k1EHNms1/JxcnWPuPuAuDThzPH9psU
	jf1zrDr8h84VLg1mYvMnYdSJf/2qKRBkjLT5F7PH2sGeDSJ6MsUlyHZDEettAE3+
	5Rj2vpd/22KxGTZ+WDHRMgeYW3HkEBWrPzDpqEeprOJUpJ7GnPgDVU9wyK5Hpuh5
	u0w2dWb5iZBpBMQW/6Ftlg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf58qdb6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 02:08:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61P127Q8015739;
	Wed, 25 Feb 2026 02:08:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35ar24j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 02:08:36 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61P28YNR029537;
	Wed, 25 Feb 2026 02:08:36 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4cf35ar1yt-2;
	Wed, 25 Feb 2026 02:08:36 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@sandisk.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org,
        sh043.lee@samsung.com
Subject: Re: [PATCH v1] ufs: core: Move link recovery for hibern8 exit failure to wl_resume
Date: Tue, 24 Feb 2026 21:08:04 -0500
Message-ID: <177198526953.1649777.13224863174266234470.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223103906.2533654-1-peter.wang@mediatek.com>
References: <20260223103906.2533654-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602250018
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDAxOCBTYWx0ZWRfX3I5CDdYxB05F
 nWZnCd/Z6wWID/uIpnfk5LDl2+AaFdYZlZrHtIxrn8nZ3Nx85IcNvS0GvNXSTxWb5TiJ9W5cctl
 aJAIm1sRw9Fc2o4dg6XU9FdkOj58Nz8cLnYw8ZBVvXYudxX6HPbUTDCnbXshJzJfUlT0joelHAm
 2kp7Dhiv2Wc/mo29LMzZT/xt/ag8idOzepgxrpPlHIpTQBGLCwT2RZBVi40ckUpoRHsuVuTsR7O
 o9qkSA2SQdU6F6RsDA/fT5Hxzm9IS4Fm1lQb+alVxIausfhY6ecHxdBE1PQhdmSxvX+kzDsB7Wz
 1lngCe8ZUQXrxsobrDe7Kep3yPuuTw1YOoTjmmsfMhcPC27tw2YtlUr/nakslrUargcFncuOQXS
 G1DLt1M25+yucTclzodI3tf5J/u7i2pGaOuDhKVk4L3bUw85T1oS9CJYaIRl8KjLpxhX1rzuoPi
 lA1/qTa4NL9HtNzy1VQ==
X-Authority-Analysis: v=2.4 cv=XNc9iAhE c=1 sm=1 tr=0 ts=699e59a5 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=Xy4G9aJaCs3E2Fc1aycA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0-o0X9ZKoPq7o0RZcYi8XtYgRu5TDthy
X-Proofpoint-GUID: 0-o0X9ZKoPq7o0RZcYi8XtYgRu5TDthy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_180841_719383_06C7F394 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 Feb 2026 18:37:57 +0800, peter.wang@mediatek.com wrote:

> Move the link recovery trigger from ufshcd_uic_pwr_ctrl() to
> __ufshcd_wl_resume(). Ensure link recovery is only attempted
> when hibern8 exit fails during resume, not during hibern8 enter
> in suspend. Improve error handling and prevent unnecessary link
> recovery attempts.
> 
> 
> [...]

Applied to 7.0/scsi-fixes, thanks!

[1/1] ufs: core: Move link recovery for hibern8 exit failure to wl_resume
      https://git.kernel.org/mkp/scsi/c/62c015373e1c

-- 
Martin K. Petersen

