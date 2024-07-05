Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6261EC30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 03:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUkrBQmRDOAxIe2yUgO4lwZfbGY34jJ7VWOeUTA54mQ=; b=FyQgBdM39kAXvlk/2TU6JFVvui
	ZAK056b3a0IcvlXWwMXmJx6zMCTb5iX7mn8tXuZ1kQ/tLAIWQazDtB8hhuX4ZUKvSNTcIk33pMYim
	weA40EnaK0MbixwYJmnbfHZ18/TFueEcxgQNMQ0SN7o6RYFH6Z4Z1BHk5wG3dCrutJ3fxA5JQbBN9
	eFNRfROHiWuYXnRi8opJeGgRN4RjO+JR+Ao4CXZoDUb9r6yoycUwe8tvx1P+3GSj7TMygRF9zKOMA
	ryKD1FnKKIWYtDk3HVEPIej8mBwFdQLGus4xUqA+22lPuIw8ORJGq39WScKXx0L43R8u02p6mNGTy
	Wvk30igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPa3x-0000000ErHD-1yGb;
	Fri, 05 Jul 2024 03:56:45 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPa3s-0000000ErGj-3yIY
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 03:56:43 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464NHPuP010202;
	Fri, 5 Jul 2024 03:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=fUkrBQmRDOAxIe2yUgO4lwZfbGY34jJ7VWOeUTA54mQ=; b=
	WC4qxfY2Cee6pkjlZyzRAX2Ljv9q7/s0zIlpfXrG3BWU0OCrpybbuN7NCtqVX2q4
	4kVAW81Nih0e09vhzO7/ELMeA9v5aFMAvoLDLH6R0sw58/XGJvQuVEK9Zod48PwQ
	ftCbbOToc3ciJz+364FFFjPNen2hzWhJqvwme+BaFsZCb4OIYefgr8ElGALKL1k+
	CH3v6haMhYo0PbjOvRBfhUHLE/+ZTj988y70KzQRdrZXyHhQINTqGtALiXsNx5tJ
	vKYgVQtCTxaZKHZjp6490D5KN2PU++ikejnG+xeIFzkJvIHznne7s03CMNHNoN3T
	vmDzfXPRDTG9qiQ4sSzWdQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4029vstxrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2024 03:56:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4650564x021700;
	Fri, 5 Jul 2024 03:56:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qh0kr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2024 03:56:36 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4653uZPS027535;
	Fri, 5 Jul 2024 03:56:35 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4028qh0kqx-1;
	Fri, 05 Jul 2024 03:56:35 +0000
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
Subject: Re: [PATCH v3 0/2] ufs: core: fix ufshcd_abort_all racing issue
Date: Thu,  4 Jul 2024 23:56:01 -0400
Message-ID: <172015149442.1643711.2561274429120142425.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628070030.30929-1-peter.wang@mediatek.com>
References: <20240628070030.30929-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_21,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407050027
X-Proofpoint-GUID: vaoepKtEW_cWsHiA58dNHEx3LaZ-ZDIm
X-Proofpoint-ORIG-GUID: vaoepKtEW_cWsHiA58dNHEx3LaZ-ZDIm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_205641_377305_45A613A2 
X-CRM114-Status: UNSURE (   9.39  )
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

On Fri, 28 Jun 2024 15:00:28 +0800, peter.wang@mediatek.com wrote:

> This series fixes race condition KE in ufshcd_err_handler, which call
> ufshcd_abort_all abort an already completed request by ISR in MCQ mode.
> 
> V3:
>  - Modify ufshcd_mcq_req_to_hwq to distinguish cmd is completed or not
>  - Split two patches and add more race description.
> 
> [...]

Applied to 6.10/scsi-fixes, thanks!

[1/2] ufs: core: fix ufshcd_clear_cmd racing issue
      https://git.kernel.org/mkp/scsi/c/9307a998cb98
[2/2] ufs: core: fix ufshcd_abort_one racing issue
      https://git.kernel.org/mkp/scsi/c/74736103fb41

-- 
Martin K. Petersen	Oracle Linux Engineering

