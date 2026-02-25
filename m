Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A959EF55439
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 02:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRlKLgn0KbJxKCz+WVFjXR2Fmx+IsyATbboYye+8idQ=; b=VCLpRy3fhManpIx9aH/0IWUqNv
	DJaOQKJiGgTwvAtJuC9gKeJXeBfeU1TqxKEJ0l8s56uCdBxT3mDCgY/TfMtrIIQHdv5w+8/udRw/7
	RlKwc17c7y406ph7vmpXzLBuZp2st8MNrd80qdb+XewCootsQnRNwrn7j2Sgl3hjg2Q9N/lqCTVvE
	3NqqtZlJS2t8gSKYfYc65ZtlZ5FJQFYKHqZlDojEyyMRlmPgrJgvOAWMkcmcFvLk4VwT9y9Y3ikle
	y4UIYic69J1tfGK5ZQww3Nhpcziw8NaJdS2MOp5Ph8KzSkPj+G/ZWKEF4fUwoaJkJdxuv/VptqwTB
	QcjfeAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4KQ-000000034Zn-3IMK;
	Wed, 25 Feb 2026 02:08:42 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4KN-000000034Z0-3Ury
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 02:08:41 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIu6Rp369450;
	Wed, 25 Feb 2026 02:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NRlKLgn0KbJxKCz+WVFjXR2Fmx+IsyATbboYye+8idQ=; b=
	JNIP+Nzd93kCZSAt9hhm2z9ABU0Us2Xk1E5qoNOoQC00mZ4PLVLEwSNAeB17UCRf
	DEXV+TQ5F4D4YVrZ1arK1q6z7WAhgN3IvasEag9TjgiAOkDRr0MceVEpJdtS3jtg
	baHgLna4ontfoDZmLPbLcSiCCIJZTziTl0smU0xMwQ4TgtiTajJDVjBPdSrXUMLg
	FF3L41AlFP2/MeSI+LTM2rpMIFyi3RYVd774Ca+YMOq+3LBujV0di9oG5jT2NYk5
	GRlGlPy59ip7mIaxAz4yZd344Wv/gmngtxgmsnKJiohh+qlYwVdvUCQMEKnvbkTv
	LBpKLOa6YyoShSuWxvmCiw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf4k5wasb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 02:08:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61P0JwXv015636;
	Wed, 25 Feb 2026 02:08:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35ar240-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 02:08:35 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61P28YNP029537;
	Wed, 25 Feb 2026 02:08:34 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4cf35ar1yt-1;
	Wed, 25 Feb 2026 02:08:34 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@sandisk.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org
Subject: Re: [PATCH v1] ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
Date: Tue, 24 Feb 2026 21:08:03 -0500
Message-ID: <177198526950.1649777.14781899060414426367.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223065657.2432447-1-peter.wang@mediatek.com>
References: <20260223065657.2432447-1-peter.wang@mediatek.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDAxOCBTYWx0ZWRfX6wXDKnmYWUzM
 VmCVJu4R6Valk68htKBtAD+6LlNij+SjQML0Ef9Nk3a04spZO2Hw7UhdRXp64XfFoRb1yPQuM6p
 2rz2idjzn1H4WkB4eeDELBYoq7xmEXKKs4Zumt20WBWXFTZIIuIEtJNO7vWrH66eF0bj3PmU+1T
 JWpt9SHZEgrJSgogLJSwuKSVPPfJ+cqv7N8y0r/BHfKRXG590bePZEuPtettuMgnoOeir9WLaTR
 C1MB5+JeCzuEND4joa9SPzA0s5AyKa9FuZaXFeHf+4TatPVwBlnM19fVvqLZdY0zKs0Aq2f1Xud
 y9ba+5p6lcZI6Q/z6evJMYKJlGHB+Kbd1L2qE+k5Rdqporf2Xv78/pzAsoCtd31SQX7o3RPheTE
 G5KBf8xrJ20+vRu5xznFRbf+1oGswh/fEDcXPJoVqzZsTPWc96Kfyh6OMNlkXFL4sWHuJbUOlID
 y6v6CFm14A7gZkpvJxg==
X-Proofpoint-GUID: a3ReR6AHAKoaiix3vushhu5sOd8W8jO2
X-Authority-Analysis: v=2.4 cv=b9C/I9Gx c=1 sm=1 tr=0 ts=699e59a3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=stBri3xtFCMNqwqhnAMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: a3ReR6AHAKoaiix3vushhu5sOd8W8jO2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_180840_115420_3C0D49DB 
X-CRM114-Status: GOOD (  10.44  )
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

On Mon, 23 Feb 2026 14:56:09 +0800, peter.wang@mediatek.com wrote:

> The kernel log indicates a crash in ufshcd_add_command_trace,
> due to a NULL pointer dereference when accessing hwq->id.
> This can happen if ufshcd_mcq_req_to_hwq() returns NULL.
> 
> This patch adds a NULL check for hwq before accessing its
> id field to prevent a kernel crash.
> 
> [...]

Applied to 7.0/scsi-fixes, thanks!

[1/1] ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
      https://git.kernel.org/mkp/scsi/c/30df81f2228d

-- 
Martin K. Petersen

