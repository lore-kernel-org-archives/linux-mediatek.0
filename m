Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD543D20691
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 02:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XULQhmdRpRfbkgi03ytOXvsx5+NQD19Wv3l4FcfV5ts=; b=JqlRm+Ni491A6HZU9sYdS//b5M
	jvlAWnmCOZp+/DIrniydtuPMKh8VVKnGGC3mk4eT9vIyOeR9HNCzjEZfqw3CFnKqWM0nfomxrLkJu
	F/CUf2e0siPr5TBHDRZxk90zZS4PEDxWxu77wQeaIvGptnk5jdcxsaAFs265yrj1ooIVqY4VxVWI5
	iTsxkVB8DiV6IoTXX4uNn1++zhkbeOfmCDyXjfjwK2HOmeOnHjWePVz2ytiXkz+tMpQ57+ljCXxT/
	wMDe3Gqa1cbyVrxJFpA7ts6+ga0PX6U9bKLpd8zJsFRXEhYf4GZdcHAT4CskOAiLlqblOwzBLEu/R
	Ipa5A7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0txE-0000000AFhV-0k5x;
	Wed, 16 Oct 2024 02:40:04 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0txA-0000000AFbn-2bbN
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 02:40:02 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G2MeU0011167;
	Wed, 16 Oct 2024 02:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=XULQhmdRpRfbkgi03ytOXvsx5+NQD19Wv3l4FcfV5ts=; b=
	oytEP9m6Sn2x7Pq6gdYRkJ6GMp6X10YAoCbwkJCcqo+Ojg/Q82MDpCiFa/W8EV5m
	fJQTN+ZmNs/hq9AMhwVyoyECSxSOmT+wKhDm/u+pUcQg4gUv+VTKJpt52iUuWKqc
	UT/SJ2JZg7Hs04q6XsA1ky6FO0UfLty8TVaajjK36c5jkU3axUoh1gNzqURA2Hw/
	Tj+KnK8RHGbbGRvmwGlZ390UcE2oI5lrEOieTLNVZREtPUxfAyE21/1j0Ih5zCAp
	LXKB9I0PzN/ymVFq9PNj4V1lbyGsOgr2AeeE2eSBlZWHnLYSlAlAe6e99hurjUPC
	m0AEjlF5f0sgUO4sYlMWNQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427hntaqtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 02:39:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49FNhaBh036006;
	Wed, 16 Oct 2024 02:39:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjem1us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 02:39:40 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49G2bkUd023540;
	Wed, 16 Oct 2024 02:39:39 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjem1uj-1;
	Wed, 16 Oct 2024 02:39:39 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com,
        jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, powen.kao@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
        bvanassche@acm.org, quic_nguyenb@quicinc.com
Subject: Re: [PATCH v10 0/2] fix abort defect
Date: Tue, 15 Oct 2024 22:38:59 -0400
Message-ID: <172904632500.1112721.16430938292315698911.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241001091917.6917-1-peter.wang@mediatek.com>
References: <20241001091917.6917-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_21,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410160016
X-Proofpoint-ORIG-GUID: VMj77MgfPM7MSkbzx10OWUVQGGHhqChL
X-Proofpoint-GUID: VMj77MgfPM7MSkbzx10OWUVQGGHhqChL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_194000_690522_57D2CF4E 
X-CRM114-Status: UNSURE (   8.91  )
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

On Tue, 01 Oct 2024 17:19:15 +0800, peter.wang@mediatek.com wrote:

> V10:
>  - Requeue OCS: ABORTED request in MCQ mode.
> 
> V9:
>  - Revise the OCS content printed.
> 
> V8:
>  - Remove the abort variable to simplify the abort process.
>  - Correct error handler successfully aborts release flow.
>  - Ingore MCQ OCS: ABORTED.
> 
> [...]

Applied to 6.12/scsi-fixes, thanks!

[1/2] ufs: core: fix the issue of ICU failure
      https://git.kernel.org/mkp/scsi/c/bf0c6cc73f7f
[2/2] ufs: core: requeue aborted request
      https://git.kernel.org/mkp/scsi/c/8fa075804cb3

-- 
Martin K. Petersen	Oracle Linux Engineering

