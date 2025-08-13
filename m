Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB65CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 02:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBhVYQJ4k4rDFsLNru2SLpL9ASO1ELNiQBKV72UvRao=; b=NCwp18imsQSGh/ivJzvniPbWov
	kTAPhY24Q4vvNd/CS3Bi5B9XA4YZPtgirM+rfbaSMzcJraXIV7bJzEK95yjBHlOECaq/49NwK0xC4
	ColDX7U6JaydzXooGu0unAv1FgKRagZtsAvDOlBMVGbCQ7KuR5sOxImwuRL3INVn6MBSaRiZbEKjQ
	8XqSeMs4hvFOt+C8/GcTA6/IbqDY9lT5jDy6akLOXoKQpAHs6Q0alC9JKGAJHjibBUuwoDqgrF/C4
	ZAkcfB8pXsGzyTx3AGA7V3lgQjzVpxnF6VYn3nwb6IryLP7oTTJ9uwVho+QqGt/dklznKHDzkI9WR
	LwUTqSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1CT-0000000CPPD-2fYp;
	Wed, 13 Aug 2025 02:26:49 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1CQ-0000000CPOf-0g5E
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Aug 2025 02:26:48 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLQqpr025501;
	Wed, 13 Aug 2025 02:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mBhVYQJ4k4rDFsLNru2SLpL9ASO1ELNiQBKV72UvRao=; b=
	lLOwcFn0kLnKje2/khuJvCdEb3eRhwJlq5bZC8H4wHU0r8+VKs2GywgdhwMf+Z2g
	CSj9iNpiB6kAs8CZcFn+dyZ9MUvBnBs09K5IXE7W3gCgP7Q+WJD9id06r4ArykFn
	WkbEU0JDH78dlOwqJyG3DCK0r0p/efHXXx4yofWdxSrx/rckaHg3tcehH+aARKBi
	sLqYQN8XJVPfc9Uv3q7f0E+YJcDDr7F58nQOE/wq5de40aW2w9rX4TQXR474Mcq9
	hGxG2JBuevPY6m+6J3wGY2KQ4nlUUNa9B9KkycNjdzArQmIyfUbYVq9go3eTZdO0
	6bo7jYf1Ji7GD1Y1YOctyQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4e7n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 02:26:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57D2Mvma030396;
	Wed, 13 Aug 2025 02:26:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsarqr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 02:26:39 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D2QaNa004410;
	Wed, 13 Aug 2025 02:26:38 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48dvsarqpw-2;
	Wed, 13 Aug 2025 02:26:38 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, yi-fan.peng@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
        bvanassche@acm.org, dan.carpenter@linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] ufs: host: mediatek: Fix out-of-bounds access in MCQ IRQ mapping
Date: Tue, 12 Aug 2025 22:26:27 -0400
Message-ID: <175504926152.959040.7941884969837574533.b4-ty@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804060249.1387057-1-peter.wang@mediatek.com>
References: <20250804060249.1387057-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=883
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130022
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDAyMiBTYWx0ZWRfX5+waSLaEdOGQ
 oapPXSRCILOfXhQbjvFicC4lXM+3AYCHO2lEXetLLeBupDjyNI9BscZmpgLfKxqcdJNTd46X5j2
 b2n0FJk80bAmf7/usUe39V1HhfrmDuaSpQd3hiGL1y2GxbwOVyIB4HLV/ri9EcG5CDvhnuHUF/9
 asXMkMcj9cEuwZUafest3Um7ScBPuiKoacYLWcJIJP2ZS/NMau7Phex1TwnjCz3rnuG67YUlZ99
 YZdnU+DyWfPCW5HVbuP5E7wL7b5Xgw/dHdarOl3/g5IqDznQSlU58mydOcX7fScOBHZliuDjkbM
 rwBbrwhjHC0vga5lc/cnP1ke64H/t3rNXAOdw7jxAgWrsDrjN8jkKtjcdjFrk8Z7dotDeTo3RQG
 BPmgwbeyezz3/Lrdyl6RLsIkStYiyRx+M7I4r6RBpAfntL7frngyFV6QQ6a56SIWJWsLpVQU
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689bf7df cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8
 a=RfrRo3qXp3HNN7_xwbkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: wy7UUR5grPWlbE3U7V9VSR6-ExGS47Nt
X-Proofpoint-ORIG-GUID: wy7UUR5grPWlbE3U7V9VSR6-ExGS47Nt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_192646_329958_29675F81 
X-CRM114-Status: UNSURE (   8.92  )
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

On Mon, 04 Aug 2025 14:01:54 +0800, peter.wang@mediatek.com wrote:

> This patch addresses a potential out-of-bounds access issue when
> accessing 'host->mcq_intr_info[q_index]'. The value of 'q_index'
> might exceed the valid array bounds if 'q_index == nr'.
> The condition is corrected to 'q_index >= nr' to prevent
> accessing invalid memory.
> 
> 
> [...]

Applied to 6.17/scsi-fixes, thanks!

[1/1] ufs: host: mediatek: Fix out-of-bounds access in MCQ IRQ mapping
      https://git.kernel.org/mkp/scsi/c/7ec2bd6cd2d0

-- 
Martin K. Petersen	Oracle Linux Engineering

