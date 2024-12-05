Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F0E7716F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFDJEh2h+7hEQ8DkKn8zRrqmm5esLpVKlkKmELOfHPY=; b=K0NXAaHMeeNwU7s97O7DMcG20K
	RC2BiU64hkG6cFChDOr6nH67Uno3Cr1rtpRefsvM3lEluKuDLT2ZwOzIr6NpJ2MUDb2Jdd2fM/kiQ
	0vcrLjE9vbYGTALT0PNpaKnD5wfgOhV/FOXOjSDGnCv/7aQvddZChaUFA8UW6KI1TofdNGACTx+YU
	vCvgYBO69NsErE2nIbPa065BzPNZ1trbvfQ4/iM3Ni/hI79SfGeHFPpJq+ow0xaBt7M4hnMijaAkK
	73O/bkrnBBRJorCXiMU6GfNE6xcdtgezJw/H7bh3lUxkUQdA8llrAdg/btxbuQSAul/T2NFP9wJ8l
	5+ODa2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1Ri-0000000EXU6-252z;
	Thu, 05 Dec 2024 02:18:26 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1Rf-0000000EXRb-2VjC
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 02:18:25 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B51BpT5026351;
	Thu, 5 Dec 2024 02:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=GFDJEh2h+7hEQ8DkKn8zRrqmm5esLpVKlkKmELOfHPY=; b=
	SrqcCpu+VvENf8ii4rvMCDdqEjO1N3h24quEG4A67Mt9ytpSYn/dFmJWh/07axUy
	XwfR9XBzHosH78TSfqi9U2+14ZoKGZ70qN6SNQFh2YpmV8b0xK8SstjEOozJJc50
	xHfVNjOHCKkWEJoRLElAKduySATwaadMfo62LF0OR46EgEzStVXrvb1q8jQUs4TP
	WjUm+F7FcrOugCd0bMwjTLWlwxph+LEp3IdgMavYY0QEdXxXRMFzybLVteVR8zPm
	45VgxutmBvrD5uqnbgFpJvqmKZFxdIiBGsJUN2IUAEGQSk5CRny/MaRunD02YwAp
	Ro7oMG/PS3kmM2QE62F9Vg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbsxwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Dec 2024 02:17:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B50Bk4X001376;
	Thu, 5 Dec 2024 02:17:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5a8u6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Dec 2024 02:17:42 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B52HbvO018742;
	Thu, 5 Dec 2024 02:17:41 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 437s5a8u3n-3;
	Thu, 05 Dec 2024 02:17:41 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com,
        jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, yi-fan.peng@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
        bvanassche@acm.org, draviv@codeaurora.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] ufs: core: add missing post notify for power mode change
Date: Wed,  4 Dec 2024 21:17:02 -0500
Message-ID: <173336487644.2765947.4960635225695603166.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241122024943.30589-1-peter.wang@mediatek.com>
References: <20241122024943.30589-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_21,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050017
X-Proofpoint-GUID: m1SM2rf2XV08WfvKY5okJaOm3yBzardu
X-Proofpoint-ORIG-GUID: m1SM2rf2XV08WfvKY5okJaOm3yBzardu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_181823_749570_0DFD3EB5 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, 22 Nov 2024 10:49:43 +0800, peter.wang@mediatek.com wrote:

> When the power mode change is successful but the power mode
> hasn't actually changed, the post notification was missed.
> Similar to the approach with hibernate/clock scale/hce enable,
> having pre/post notifications in the same function will
> make it easier to maintain.
> 
> Additionally, supplement the description of power parameters
> for the pwr_change_notify callback.
> 
> [...]

Applied to 6.13/scsi-fixes, thanks!

[1/1] ufs: core: add missing post notify for power mode change
      https://git.kernel.org/mkp/scsi/c/7f45ed5f0cd5

-- 
Martin K. Petersen	Oracle Linux Engineering

