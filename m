Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2777CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jk2OwlDv+o0KQiXd3IVgGcIRyUsJ+BjqdDw3DBHmu5k=; b=MoKyX3QqwANOg/6v8SdlhusN0w
	xZcgVZEclX0zitDP1w3LTyO6XOpHq7tw6gMh1ZBJH1t1jufwzosww+qElTn0YU1Zzo5tq1HwKHCfL
	p1djTk/ywx25/mAHfXB1qqq9wbH4QUWWRkKEU0YARQxnh6Oza0j0Mr2CiXS9ehiEXdIk3ZjSwa7bZ
	x1vLSYfNJh6iDWT/qYAFY5XnOcXFlPLqSPFz3c5/9nhaUxKGd3ibCD+0OWo76fTCINAWDfiSaLHSv
	8BVDAf5ab5Xa66fHVtqnXks78/FOsgMFtjVczzOGfVTNWjY5VLTxRndnjE84yGSKjHN7JseKk/4xc
	NKIXgr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sse33-0000000GcAx-3KCh;
	Mon, 23 Sep 2024 08:03:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sse30-0000000Gc8z-0dRU
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 08:03:55 +0000
X-UUID: 5ce020b0798211efb3adad29d29602c1-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jk2OwlDv+o0KQiXd3IVgGcIRyUsJ+BjqdDw3DBHmu5k=;
	b=VHEcfd9pLIlYUYDTEgKpRB582Qkqsoxs60tyhu2LHhbZzP2xWywDphlPa9bj6R7uztKwX+4ACP+cyZEauhAXjZ9KsRLf1GPGcjE9AZt1Hs6fpWgmt4TcGVt8waPQLIlAs+Z0dalnyx45RDeW9ddaj0JK9K9nAsYZvYqar9riw2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9b8d10d1-7cee-4133-b61e-023d697c4ef2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:046b699e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 5ce020b0798211efb3adad29d29602c1-20240923
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 139313126; Mon, 23 Sep 2024 01:03:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 01:03:45 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 16:03:45 +0800
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
Subject: [PATCH v8 2/3] ufs: core: fix error handler process for MCQ abort
Date: Mon, 23 Sep 2024 16:03:43 +0800
Message-ID: <20240923080344.19084-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240923080344.19084-1-peter.wang@mediatek.com>
References: <20240923080344.19084-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_010354_225229_BA02873A 
X-CRM114-Status: GOOD (  13.84  )
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
index a6f818cdef0e..b5c7bc50a27e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5405,9 +5405,15 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		break;
 	case OCS_ABORTED:
 		result |= DID_ABORT << 16;
+		dev_warn(hba->dev,
+				"OCS aborted from controller = %x for tag %d\n",
+				ocs, lrbp->task_tag);
 		break;
 	case OCS_INVALID_COMMAND_STATUS:
 		result |= DID_REQUEUE << 16;
+		dev_warn(hba->dev,
+				"OCS invaild from controller = %x for tag %d\n",
+				ocs, lrbp->task_tag);
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


