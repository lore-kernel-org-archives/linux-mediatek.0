Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990FCC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 01:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LAwEMcZJkSTIaC24bJC8J76h4QJhnUANf3s/HLb6zo=; b=Pwh91mObNYj3wxrivhAiAJFaIB
	SkDsmwnH6CT5SAWHINmonIh4wcdSiLEOaFsZAltYdAvc/6Se+zpXa+ExFLOIiufEw2Yd6IJ+oy115
	C0TrSPTuOkZwzzhopm5Jr1MOxYLUs37ph6rf581ZiEmueP3i3/6zdbphDaEIzIbEjmSjmWvEjfG+2
	+AXsaFBEPy8Ux0oezsBgL9/oHLVVdi1n0m4NEb5hcpqoWDnFKBU7mtYej0TCvzuRJ+dJtJ3DYn3tq
	DBhCiXa+Aj97te7396CqtxV5VTvK/GgX4u+Bd9XE8M++5GKu4szOUwzEbZPLbuuoOFZwKALkTdvFC
	oxt9wrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW4GI-0000000B2C6-2YE5;
	Tue, 23 Jul 2024 01:24:18 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW4GE-0000000B2B2-1pJc
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jul 2024 01:24:16 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MKtWTP018334;
	Tue, 23 Jul 2024 01:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=3LAwEMcZJkSTIaC24bJC8J76h4QJhnUANf3s/HLb6zo=; b=
	H+icMT1NsPA/DcWx3mBB6b4accEvzxWv6TP4gaHKjEow9bZ9eK54ZD5I8hQMc1G3
	UYNKWzvvYfDr0JcWHafg1d7e6kCvGE5a9ckoMgSjqXc54Ab6E2zydB7biP8hTWOj
	DGE9fgH/O1LwgP5nLBPU36sjFjwRANHxDp/+8B9q1yAPAf0mweHzakXd9xwPgnpR
	mUnAtKrZQ8Tg0HPVBPwWtL1C7Ao8IoyWGIcHyopWqz2NQ72CEey3mHDcqIKaphVh
	iUSDLjx3zMu5Ko7zKFkYAB3CIkR4FpaOUb+t3Cvh0efh/IsryxkrTKSNbbt+aqur
	xL3w6Nfe9fJM5u40vKGVbw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hft0ccm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 01:24:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46MMvS3F018835;
	Tue, 23 Jul 2024 01:24:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h27xysqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 01:24:09 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46N1O683005270;
	Tue, 23 Jul 2024 01:24:08 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 40h27xysph-2;
	Tue, 23 Jul 2024 01:24:08 +0000
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
Subject: Re: [PATCH v1] ufs: core: bypass quick recovery if need force reset
Date: Mon, 22 Jul 2024 21:23:21 -0400
Message-ID: <172168235253.1161648.8454083361308890112.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094506.11284-1-peter.wang@mediatek.com>
References: <20240712094506.11284-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407230008
X-Proofpoint-GUID: A3DPHEDrOlJye2nXTwnDGsw_dPbV0wfl
X-Proofpoint-ORIG-GUID: A3DPHEDrOlJye2nXTwnDGsw_dPbV0wfl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_182414_814358_F453345A 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, 12 Jul 2024 17:45:06 +0800, peter.wang@mediatek.com wrote:

> If force_reset is true, bypass quick recovery.
> This will shorten error recovery time.
> 
> 

Applied to 6.11/scsi-queue, thanks!

[1/1] ufs: core: bypass quick recovery if need force reset
      https://git.kernel.org/mkp/scsi/c/022587d8aec3

-- 
Martin K. Petersen	Oracle Linux Engineering

