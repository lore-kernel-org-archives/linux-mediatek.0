Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBDEC3DA7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 01:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNAjVtIqDfrC56Q8qhfNYmn0NMygk+muEkuMqdsJ15w=; b=ByqJxr9+JWQGogAOjJXrYgcaE8
	QQSuJRQc/ZltzYQYPrT5CzbWJPLJyoBM+mdHswx+1vUO9k01/ebL1N36Haa8eO09f+FAxHg2om03y
	48wRlGeeaeioExQcgt8u4MShGDOGT8YimSn7lM7ar8Bs3Qn692SFPfjT/y0BytXQm06IXmeJsXp/7
	a0vf6b7vSksE46ZMB0fCLdGt8llzuctTYpXKSuuPWW8w3LQgg4y9WfD5+4RvobBD5lYqb22c3csuH
	PCfSnCAlyUPAzVwl+DbWLfpnPuGMTOdxwAQTH94Mz8ySD8ivD/1xOxx+kNSRvp94h4GOAVDmUV3ri
	vSwsWn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW4GI-0000000B2By-1EzJ;
	Tue, 23 Jul 2024 01:24:18 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW4GE-0000000B2B7-2luk
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jul 2024 01:24:16 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MKtVic023808;
	Tue, 23 Jul 2024 01:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=KNAjVtIqDfrC56Q8qhfNYmn0NMygk+muEkuMqdsJ15w=; b=
	fV/J4p9bzSozIafa9O9NcfhWAxAdUDqiXwNd2WYX1/E1NSEZ54CjAl7asGR7eKQg
	ERHUIBptpLkuNZMCUNld525YzFeo54N1fYHHIOhLaWZ/XbRN24iNoN5N6D/kigBe
	zWASGoj6dVdni+eudb65IW9rsz4fbKmElc8/hWAQzh5IXRyP/Y5c3wYqx+vt3JaY
	77wPvu4WjFKG1OofeJ8VUz9/qHHIjllsfdnASqINDTsRV+wDnBVA99pzMIL+DyuB
	IA7c4OL6godPX3fClnC74vPGvyDRoFl4WraDVPIsI0jo/kRjTS+sT5DO4vhYtSeq
	tyZIB8U24j057kMNPgWdNQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxpcg2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 01:24:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46N0nRcP018975;
	Tue, 23 Jul 2024 01:24:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h27xysrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 01:24:11 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46N1O685005270;
	Tue, 23 Jul 2024 01:24:11 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 40h27xysph-3;
	Tue, 23 Jul 2024 01:24:11 +0000
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
        chu.stanley@gmail.com, huobean@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] ufs: core: fix deadlock when rtc update
Date: Mon, 22 Jul 2024 21:23:22 -0400
Message-ID: <172168235254.1161648.725788349992465796.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715063831.29792-1-peter.wang@mediatek.com>
References: <20240715063831.29792-1-peter.wang@mediatek.com>
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
X-Proofpoint-GUID: kglc_b6RXsbeUm-z8cUI3UkV97Fpgso1
X-Proofpoint-ORIG-GUID: kglc_b6RXsbeUm-z8cUI3UkV97Fpgso1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_182414_814435_88C4832A 
X-CRM114-Status: UNSURE (   9.27  )
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

On Mon, 15 Jul 2024 14:38:31 +0800, peter.wang@mediatek.com wrote:

> There is a deadlock when runtime suspend waits for the flush of RTC work,
> and the RTC work calls ufshcd_rpm_get_sync to wait for runtime resume.
> 
> Here is deadlock backtrace
> kworker/0:1     D 4892.876354 10 10971 4859 0x4208060 0x8 10 0 120 670730152367
> ptr            f0ffff80c2e40000 0 1 0x00000001 0x000000ff 0x000000ff 0x000000ff
> <ffffffee5e71ddb0> __switch_to+0x1a8/0x2d4
> <ffffffee5e71e604> __schedule+0x684/0xa98
> <ffffffee5e71ea60> schedule+0x48/0xc8
> <ffffffee5e725f78> schedule_timeout+0x48/0x170
> <ffffffee5e71fb74> do_wait_for_common+0x108/0x1b0
> <ffffffee5e71efe0> wait_for_completion+0x44/0x60
> <ffffffee5d6de968> __flush_work+0x39c/0x424
> <ffffffee5d6decc0> __cancel_work_sync+0xd8/0x208
> <ffffffee5d6dee2c> cancel_delayed_work_sync+0x14/0x28
> <ffffffee5e2551b8> __ufshcd_wl_suspend+0x19c/0x480
> <ffffffee5e255fb8> ufshcd_wl_runtime_suspend+0x3c/0x1d4
> <ffffffee5dffd80c> scsi_runtime_suspend+0x78/0xc8
> <ffffffee5df93580> __rpm_callback+0x94/0x3e0
> <ffffffee5df90b0c> rpm_suspend+0x2d4/0x65c
> <ffffffee5df91448> __pm_runtime_suspend+0x80/0x114
> <ffffffee5dffd95c> scsi_runtime_idle+0x38/0x6c
> <ffffffee5df912f4> rpm_idle+0x264/0x338
> <ffffffee5df90f14> __pm_runtime_idle+0x80/0x110
> <ffffffee5e24ce44> ufshcd_rtc_work+0x128/0x1e4
> <ffffffee5d6e3a40> process_one_work+0x26c/0x650
> <ffffffee5d6e65c8> worker_thread+0x260/0x3d8
> <ffffffee5d6edec8> kthread+0x110/0x134
> <ffffffee5d616b18> ret_from_fork+0x10/0x20
> 
> [...]

Applied to 6.11/scsi-queue, thanks!

[1/1] ufs: core: fix deadlock when rtc update
      https://git.kernel.org/mkp/scsi/c/3911af778f20

-- 
Martin K. Petersen	Oracle Linux Engineering

