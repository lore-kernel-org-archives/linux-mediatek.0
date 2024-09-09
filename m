Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335AAECE57E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyFPfJsmHV3lj7+VqG872b3qZeioaozDZ83F204UCjg=; b=e8/UuZJJSzDIu4HHbxNYBGulam
	LUkVf7YpL/37wrtzay5xTyyLEfcnoISkIDaMVOzpkCztQ9Gane6eMHR/12dweYkKZg/2KhbwXj8J/
	wXGFtKJrwWh1jnhT10fFgtwukO0HcGZ1T5GiMzjePW5Zew4j0RBjRkLhBwqpYfgW5qoB9rgPhmOeZ
	ewU+v5Z2yhnATyM10chuJiUWMqqxt5+RQWMT9o/jdqJn7/dNWo3s8+D/SXNCZ7kW6NGpnw9Vx8DoM
	4CpGQhOCsPd5I5oLrrwBTxz5DFGg3Id2JBc77t4LIIpoWzTYkFGtqkUhCXyseQ8PP4ME9MBMxx5Xg
	D1Juek9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZeh-000000013u0-3fkk;
	Mon, 09 Sep 2024 08:21:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZef-000000013sL-0i3z
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 08:21:50 +0000
X-UUID: 8b62b7306e8411efb3adad29d29602c1-20240909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nyFPfJsmHV3lj7+VqG872b3qZeioaozDZ83F204UCjg=;
	b=SiGYtCeN+kelFWJIy7BHLeAJFf0CE64GQKPp/uj9gcqBU1l9wBh0wr6a2KJv7Z6jxs2efdAHYJub51bI8bDzes4qUAj/H94WAqpBeVCDibae9lpuHbOGHIBB0RC5mVvFYH/FXeNgYjhXxASP6QMr6mqLfXF7h7X65nb2hMSzq1k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1b0fab02-47fd-4f3d-94bb-fc973ab4a60d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:2050e9cf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8b62b7306e8411efb3adad29d29602c1-20240909
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1295882826; Mon, 09 Sep 2024 01:21:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Sep 2024 01:21:02 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Sep 2024 16:21:02 +0800
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
	<quic_nguyenb@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 2/2] ufs: core: requeue aborted request
Date: Mon, 9 Sep 2024 16:21:00 +0800
Message-ID: <20240909082100.24019-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240909082100.24019-1-peter.wang@mediatek.com>
References: <20240909082100.24019-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_012149_273317_2BD08D39 
X-CRM114-Status: GOOD (  17.46  )
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

MCQ aborts a command using two methods below:
1. Nullified UTRD, Host controller skips this transfer request,
   reply Completion Queue entry to Host SW with OCS=ABORTED
2. SQ cleanup, The host controller will post to the Completion Queue
   to update the OCS field with ABORTED.

SDB aborts a command using UTRLCLR. Task Management response
which means a Transfer Request was aborted.

For these three cases, set a flag to notify SCSI to requeue the
command after receiving response with OCS_ABORTED.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c |  1 +
 drivers/ufs/core/ufshcd.c  | 29 +++++++++++++++--------------
 include/ufs/ufshcd.h       |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 3903947dbed1..1f57ebf24a39 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -642,6 +642,7 @@ static bool ufshcd_mcq_sqe_search(struct ufs_hba *hba,
 		match = le64_to_cpu(utrd->command_desc_base_addr) & CQE_UCD_BA;
 		if (addr == match) {
 			ufshcd_mcq_nullify_sqe(utrd);
+			lrbp->abort_initiated_by_err = true;
 			ret = true;
 			goto out;
 		}
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a6f818cdef0e..83a06b0730ea 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3006,6 +3006,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	ufshcd_prepare_lrbp_crypto(scsi_cmd_to_rq(cmd), lrbp);
 
 	lrbp->req_abort_skip = false;
+	lrbp->abort_initiated_by_err = false;
 
 	ufshcd_comp_scsi_upiu(hba, lrbp);
 
@@ -5404,7 +5405,10 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		}
 		break;
 	case OCS_ABORTED:
-		result |= DID_ABORT << 16;
+		if (lrbp->abort_initiated_by_err)
+			result |= DID_REQUEUE << 16;
+		else
+			result |= DID_ABORT << 16;
 		break;
 	case OCS_INVALID_COMMAND_STATUS:
 		result |= DID_REQUEUE << 16;
@@ -6472,25 +6476,12 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 	struct Scsi_Host *shost = sdev->host;
 	struct ufs_hba *hba = shost_priv(shost);
 	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
-	struct ufs_hw_queue *hwq;
-	unsigned long flags;
 
 	*ret = ufshcd_try_to_abort_task(hba, tag);
 	dev_err(hba->dev, "Aborting tag %d / CDB %#02x %s\n", tag,
 		hba->lrb[tag].cmd ? hba->lrb[tag].cmd->cmnd[0] : -1,
 		*ret ? "failed" : "succeeded");
 
-	/* Release cmd in MCQ mode if abort succeeds */
-	if (hba->mcq_enabled && (*ret == 0)) {
-		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(lrbp->cmd));
-		if (!hwq)
-			return 0;
-		spin_lock_irqsave(&hwq->cq_lock, flags);
-		if (ufshcd_cmd_inflight(lrbp->cmd))
-			ufshcd_release_scsi_cmd(hba, lrbp);
-		spin_unlock_irqrestore(&hwq->cq_lock, flags);
-	}
-
 	return *ret == 0;
 }
 
@@ -7561,6 +7552,16 @@ int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
 		goto out;
 	}
 
+	/*
+	 * When the host software receives a "FUNCTION COMPLETE", set flag
+	 * to requeue command after receive response with OCS_ABORTED
+	 * SDB mode: UTRLCLR Task Management response which means a Transfer
+	 *           Request was aborted.
+	 * MCQ mode: Host will post to CQ with OCS_ABORTED after SQ cleanup
+	 */
+	if (!err)
+		lrbp->abort_initiated_by_err = true;
+
 	err = ufshcd_clear_cmd(hba, tag);
 	if (err)
 		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 0fd2aebac728..4edeabcd3e88 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -173,6 +173,7 @@ struct ufs_pm_lvl_states {
  * @crypto_key_slot: the key slot to use for inline crypto (-1 if none)
  * @data_unit_num: the data unit number for the first block for inline crypto
  * @req_abort_skip: skip request abort task flag
+ * @abort_initiated_by_err: abort initiated by error
  */
 struct ufshcd_lrb {
 	struct utp_transfer_req_desc *utr_descriptor_ptr;
@@ -202,6 +203,7 @@ struct ufshcd_lrb {
 #endif
 
 	bool req_abort_skip;
+	bool abort_initiated_by_err;
 };
 
 /**
-- 
2.45.2


