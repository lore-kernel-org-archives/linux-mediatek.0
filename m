Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402FAC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtEd6a4+3KYTSgIBDPwj+osyJ6l7S6jVZGWZ/ou+Wjk=; b=QNq7Mn3E5WIxDa+bgezjNX+S1Y
	hku7CF4Udi3MKC4xb64/CPshxHASBcYmoAQm6WnY1/n0ludhj+l3fzejkLPZ1QNQg7KuKOnch+fVf
	liciEeCq/vSSjB+A0t67oO8Cr9M/zJ5rTxhNb9q+PVZJDzVljokiHZJEJC5oNN3f4aCZswzd03nU1
	M5O3cvETZW5liSshOYcjJIOd1pLU0FMJqGCIkr2sl1HYB/dQVyjRQKLeBSxiJeZxGoDX/tNb0pMXO
	zk1s4dA4x0fIMCCquOB66/dhY2Me+B9dhUPAhuC4x1cWrnFWszGQ0zaZHyP67sOsB05c/zWjtTPli
	upGXqjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HUe-009g56-6n; Mon, 05 Dec 2022 19:51:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HUY-009g3F-Sk; Mon, 05 Dec 2022 19:51:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5IoBkg011149;
	Mon, 5 Dec 2022 19:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=dtEd6a4+3KYTSgIBDPwj+osyJ6l7S6jVZGWZ/ou+Wjk=;
 b=FrFF1/cu7Jx1Tcidx8I663s6i7UvCrrqYWKW5vkGlUQ6lcHewvvwmlgRLEbNzHX79qSK
 ELBZyghvSGILs5shTvwh7+VdgqQ7tU+vnEIqCkVeKr43vvGMdxlVuLq+CDeYsaQ+hW2G
 pWbVWVhGFLetQ4aSWT5alaZwWJbdxm+Qh1jLJ0qg9NTCWYhA+lMn61fJBDdh0u3cVcTp
 J1ofVaGVTfg/JklQjv23/+u1khiJgB4e+EpglPTb1CCX6XN7qmYPJzicYvaXBaT+Orzx
 mYJw0ofrwSD1er4Irxu6W/kKOChQ6ZxxsM2pMrffbrNoj36jY0GUPIVEjLT3DXhtC6Et lw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7x264ts2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 19:50:58 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5JovAr019641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Dec 2022 19:50:57 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 11:50:56 -0800
Date: Mon, 5 Dec 2022 11:50:50 -0800
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: Mason Zhang <mason.zhang@mediatek.com>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E . J . Bottomley"
	<jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>,
        Jinyoung Choi
	<j-young.choi@samsung.com>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Peng Zhou <peng.zhou@mediatek.com>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH v2 1/1] scsi: ufs: core: fix device management cmd
 timeout flow
Message-ID: <20221205195050.GA15334@asutoshd-linux1.qualcomm.com>
References: <20221205014202.2672-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221205014202.2672-1-mason.zhang@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nJRGdf4UKQ5kPTJyyJ06YFgUbQsM4Q4X
X-Proofpoint-ORIG-GUID: nJRGdf4UKQ5kPTJyyJ06YFgUbQsM4Q4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_115107_082321_594D3CB5 
X-CRM114-Status: GOOD (  19.23  )
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

On Mon, Dec 05 2022 at 17:53 -0800, Mason Zhang wrote:
>From: Mason Zhang <Mason.Zhang@mediatek.com>
>
>In ufs error handler flow, host will send device management cmd(NOP OUT)
>to device for recovery link. If cmd response timeout, and clear doorbell
>fail, ufshcd_wait_for_dev_cmd will do nothing and return,
>hba->dev_cmd.complete struct not set to null.
>
>In this time, if cmd has been responsed by device, then it will
>call complete() in __ufshcd_transfer_req_compl, because of complete
>struct is alloced in stack, then the KE will occur.
>
What is KE?

>Fix the following crash:
>  ipanic_die+0x24/0x38 [mrdump]
>  die+0x344/0x748
>  arm64_notify_die+0x44/0x104
>  do_debug_exception+0x104/0x1e0
>  el1_dbg+0x38/0x54
>  el1_sync_handler+0x40/0x88
>  el1_sync+0x8c/0x140
>  queued_spin_lock_slowpath+0x2e4/0x3c0
>  __ufshcd_transfer_req_compl+0x3b0/0x1164
>  ufshcd_trc_handler+0x15c/0x308
>  ufshcd_host_reset_and_restore+0x54/0x260
>  ufshcd_reset_and_restore+0x28c/0x57c
>  ufshcd_err_handler+0xeb8/0x1b6c
>  process_one_work+0x288/0x964
>  worker_thread+0x4bc/0xc7c
>  kthread+0x15c/0x264
>  ret_from_fork+0x10/0x30
>
>Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
>---
> drivers/ufs/core/ufshcd.c | 46 ++++++++++++++++++---------------------
> 1 file changed, 21 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>index b1f59a5fe632..2b4934a562a6 100644
>--- a/drivers/ufs/core/ufshcd.c
>+++ b/drivers/ufs/core/ufshcd.c
>@@ -2979,35 +2979,31 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
> 		err = -ETIMEDOUT;
> 		dev_dbg(hba->dev, "%s: dev_cmd request timedout, tag %d\n",
> 			__func__, lrbp->task_tag);
>-		if (ufshcd_clear_cmds(hba, 1U << lrbp->task_tag) == 0) {
>+		if (ufshcd_clear_cmds(hba, 1U << lrbp->task_tag) == 0)
> 			/* successfully cleared the command, retry if needed */
> 			err = -EAGAIN;
>+		/*
>+		 * Since clearing the command succeeded we also need to
>+		 * clear the task tag bit from the outstanding_reqs
>+		 * variable.
>+		 */
Does this comment still hold true? Perhaps this needs to be updated?
Also, perhaps you missed Bart's comments in v1.
Also, please can you add a section for changes from v1 -> v2?

-asd

>+		spin_lock_irqsave(&hba->outstanding_lock, flags);
>+		pending = test_bit(lrbp->task_tag,
>+				   &hba->outstanding_reqs);
>+		if (pending) {
>+			hba->dev_cmd.complete = NULL;
>+			__clear_bit(lrbp->task_tag,
>+				    &hba->outstanding_reqs);
>+		}
>+		spin_unlock_irqrestore(&hba->outstanding_lock, flags);
>+
>+		if (!pending) {
> 			/*
>-			 * Since clearing the command succeeded we also need to
>-			 * clear the task tag bit from the outstanding_reqs
>-			 * variable.
>+			 * The completion handler ran while we tried to
>+			 * clear the command.
> 			 */
>-			spin_lock_irqsave(&hba->outstanding_lock, flags);
>-			pending = test_bit(lrbp->task_tag,
>-					   &hba->outstanding_reqs);
>-			if (pending) {
>-				hba->dev_cmd.complete = NULL;
>-				__clear_bit(lrbp->task_tag,
>-					    &hba->outstanding_reqs);
>-			}
>-			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
>-
>-			if (!pending) {
>-				/*
>-				 * The completion handler ran while we tried to
>-				 * clear the command.
>-				 */
>-				time_left = 1;
>-				goto retry;
>-			}
>-		} else {
>-			dev_err(hba->dev, "%s: failed to clear tag %d\n",
>-				__func__, lrbp->task_tag);
>+			time_left = 1;
>+			goto retry;
> 		}
> 	}
>
>-- 
>2.18.0
>

