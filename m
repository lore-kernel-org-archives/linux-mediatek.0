Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11904C369C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm8E4wlpRggBTCT5LOsARIN/XWw2DmG3o9deh+e7oDQ=; b=as/2NTUpvLNhwH4qp2yUncklzc
	bOX8pjRcoLTZWS/hJXBOkSUPnZ7h/GhqwGzUDwk1mcbAKb0VX3H6AuEsp1veWNZOsD0R9/I2nvCzT
	l4/ze1FofOCXrcPPE65npHa6Yej/VyyGbw0GxhScKvHrjk62ySvrQ1SIo8pY2E8HTmnTE27v4qKIZ
	cODBiB2w+6cVJCF/wQxuZnJgr/si615VAK/3rV3DcWVld64MReM8xhT/aQvygnyyXV+iHCK+ItXIu
	EMr+Cl6xn9/Y+byK3k+flbFagdA8QLalOZJvY8wM15R2O7JtCz/X9JbJNlTLRewPweFwAWRqcO80F
	57XzDRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP03-00000004iXa-42GB;
	Wed, 25 Sep 2024 10:11:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP00-00000004iVG-2CUJ
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 10:11:57 +0000
X-UUID: 94d954327b2611efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Fm8E4wlpRggBTCT5LOsARIN/XWw2DmG3o9deh+e7oDQ=;
	b=f7iP6xL+USbYojvJpF69kre6j8VsVQVHVK8DQ0jJWpf1hJ1g6BOdG1I6tVPXOtjZu7NtbKDCNlOt2FL8ihuAc/qfa1D9LF9NCWgnQQctaWmyQ4eK1otlCr7ZQP6jSUiUYL5wWSwJsPJSz3bURTqUnVXtIhAixqVekXHrTj28YxM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c64bed58-1295-43d8-a6b6-53d0aabca909,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a9913b18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 94d954327b2611efba0aef63c0775dbf-20240925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1516889502; Wed, 25 Sep 2024 03:11:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 03:11:47 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 18:11:47 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<quic_nguyenb@quicinc.com>
Subject: [PATCH v9 2/3] ufs: core: fix error handler process for MCQ abort
Date: Wed, 25 Sep 2024 17:55:45 +0800
Message-ID: <20240925095546.19492-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240925095546.19492-1-peter.wang@mediatek.com>
References: <20240925095546.19492-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031156_596766_561E48DC 
X-CRM114-Status: GOOD (  14.93  )
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

From: Peter Wang <peter.wang@mediatek.com>

When the error handler successfully aborts a MCQ request,
it only releases the command and does not notify the SCSI layer.
This may cause another abort after 30 seconds timeout.
This patch notifies the SCSI layer to requeue the request.

Additionally, ignore the OCS: ABORTED CQ slot after MCQ mode
SQ cleanup. This makes the behavior of MCQ mode consistent with
that of legacy SDB mode.

Also, print logs for OCS: ABORTED and OCS_INVALID_COMMAND_STATUS
for debugging purposes.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a6f818cdef0e..4fff929b70d6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5405,9 +5405,15 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		break;
 	case OCS_ABORTED:
 		result |= DID_ABORT << 16;
+		dev_warn(hba->dev,
+				"OCS aborted from controller for tag %d\n",
+				lrbp->task_tag);
 		break;
 	case OCS_INVALID_COMMAND_STATUS:
 		result |= DID_REQUEUE << 16;
+		dev_warn(hba->dev,
+				"OCS invaild from controller for tag %d\n",
+				lrbp->task_tag);
 		break;
 	case OCS_INVALID_CMD_TABLE_ATTR:
 	case OCS_INVALID_PRDT_ATTR:
@@ -5526,6 +5532,18 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 			ufshcd_update_monitor(hba, lrbp);
 		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
 		cmd->result = ufshcd_transfer_rsp_status(hba, lrbp, cqe);
+
+		/*
+		 * Ignore MCQ OCS: ABORTED posted by the host controller.
+		 * This makes the behavior of MCQ mode consistent with that
+		 * of legacy SDB mode.
+		 */
+		if (hba->mcq_enabled) {
+			ocs = ufshcd_get_tr_ocs(lrbp, cqe);
+			if (ocs == OCS_ABORTED)
+				return;
+		}
+
 		ufshcd_release_scsi_cmd(hba, lrbp);
 		/* Do not touch lrbp after scsi done */
 		scsi_done(cmd);
@@ -6486,8 +6504,11 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 		if (!hwq)
 			return 0;
 		spin_lock_irqsave(&hwq->cq_lock, flags);
-		if (ufshcd_cmd_inflight(lrbp->cmd))
+		if (ufshcd_cmd_inflight(lrbp->cmd)) {
+			set_host_byte(lrbp->cmd, DID_REQUEUE);
 			ufshcd_release_scsi_cmd(hba, lrbp);
+			scsi_done(lrbp->cmd);
+		}
 		spin_unlock_irqrestore(&hwq->cq_lock, flags);
 	}
 
-- 
2.45.2


