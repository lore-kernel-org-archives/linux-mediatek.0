Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02243EE4987
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUmaVNM1YQIFyvYzAgNVxdg5wnm8OSBcsLnkQn2Ri5w=; b=hqgbmtmqBoaGC9DhoYjYypsuV6
	bFt9CuLEgZ8x0JIh9Fhlfphr6ooLcaMVFgGsyQUZmnJ6kXOkaUQW89n7NLC2JO3rnb8dI6C1mAiE2
	3OvBF//fBhrftYSLy8V9xpKbp8tBGdpRsGNFiGBX66Tyxej89pwpbP8i0U6Ordf/g2pm87oG9oqaa
	qWeJKcb5Q90FC8URsnfOjek20s3V0+G5JCNyww2p0V70cKuG6Czz5AW08LKdYCX8MEsw1a4nUEYTw
	ov0AbuOPcbS3fVBlgAWMNXkFHi0APVfM/vuJyxuVZESvqY0qsEVrtJOCRffk2CC915RlA6dRzrPww
	ZoqJkHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soK5z-000000090Jk-2ySz;
	Wed, 11 Sep 2024 09:57:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soK5w-000000090J9-3Jyy
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 09:57:06 +0000
X-UUID: 2f80eba2702411efb3adad29d29602c1-20240911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nUmaVNM1YQIFyvYzAgNVxdg5wnm8OSBcsLnkQn2Ri5w=;
	b=A7tDLrGmfG5nhtG/247Q/RxtE/8PZRtd+2mQOTsVABpulrYPPXCQMPGw4TE6A5yDJ6NSHYCxVteYB6wjr0XLJ103Ab5hWwR2SduqNEFcVHRP9xiB23si7He9BViiXmvbYkzoQe5gta6Xkzxfk28Wr7SGArltzW5LdI8tMVC9asU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5dba863e-c4fb-4887-b279-65277aee95f0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:93bccbbf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2f80eba2702411efb3adad29d29602c1-20240911
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 390291619; Wed, 11 Sep 2024 02:56:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Sep 2024 17:56:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Sep 2024 17:56:24 +0800
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
Subject: [PATCH v6 2/2] ufs: core: requeue aborted request
Date: Wed, 11 Sep 2024 17:56:22 +0800
Message-ID: <20240911095622.19225-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240911095622.19225-1-peter.wang@mediatek.com>
References: <20240911095622.19225-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_025704_841296_50974004 
X-CRM114-Status: GOOD (  18.45  )
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

ufshcd_abort_all forcibly aborts all on-going commands and the host
controller will automatically fill in the OCS field of the corresponding
response with OCS_ABORTED based on different working modes.

MCQ mode: aborts a command using SQ cleanup, The host controller
will post a Completion Queue entry with OCS = ABORTED.

SDB mode: aborts a command using UTRLCLR. Task Management response
which means a Transfer Request was aborted.

For these two cases, set a flag to notify SCSI to requeue the
command after receiving response with OCS_ABORTED.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 35 ++++++++++++++++++++---------------
 include/ufs/ufshcd.h      |  3 +++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a6f818cdef0e..a0548a495f30 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3006,6 +3006,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	ufshcd_prepare_lrbp_crypto(scsi_cmd_to_rq(cmd), lrbp);
 
 	lrbp->req_abort_skip = false;
+	lrbp->abort_initiated_by_eh = false;
 
 	ufshcd_comp_scsi_upiu(hba, lrbp);
 
@@ -5404,7 +5405,10 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		}
 		break;
 	case OCS_ABORTED:
-		result |= DID_ABORT << 16;
+		if (lrbp->abort_initiated_by_eh)
+			result |= DID_REQUEUE << 16;
+		else
+			result |= DID_ABORT << 16;
 		break;
 	case OCS_INVALID_COMMAND_STATUS:
 		result |= DID_REQUEUE << 16;
@@ -6471,26 +6475,12 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 	struct scsi_device *sdev = cmd->device;
 	struct Scsi_Host *shost = sdev->host;
 	struct ufs_hba *hba = shost_priv(shost);
-	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
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
 
@@ -7561,6 +7551,21 @@ int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
 		goto out;
 	}
 
+	/*
+	 * When the host software receives a "FUNCTION COMPLETE", set flag
+	 * to requeue command after receive response with OCS_ABORTED
+	 * SDB mode: UTRLCLR Task Management response which means a Transfer
+	 *           Request was aborted.
+	 * MCQ mode: Host will post to CQ with OCS_ABORTED after SQ cleanup
+	 *
+	 * This flag is set because error handler ufshcd_abort_all forcibly
+	 * aborts all commands, and the host controller will automatically
+	 * fill in the OCS field of the corresponding response with OCS_ABORTED.
+	 * Therefore, upon receiving this response, it needs to be requeued.
+	 */
+	if (!err && ufshcd_eh_in_progress(hba))
+		lrbp->abort_initiated_by_eh = true;
+
 	err = ufshcd_clear_cmd(hba, tag);
 	if (err)
 		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 0fd2aebac728..07b5e60e6c44 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -173,6 +173,8 @@ struct ufs_pm_lvl_states {
  * @crypto_key_slot: the key slot to use for inline crypto (-1 if none)
  * @data_unit_num: the data unit number for the first block for inline crypto
  * @req_abort_skip: skip request abort task flag
+ * @abort_initiated_by_eh: The flag is specifically used to handle
+ *                         ufshcd_err_handler forcibly aborts.
  */
 struct ufshcd_lrb {
 	struct utp_transfer_req_desc *utr_descriptor_ptr;
@@ -202,6 +204,7 @@ struct ufshcd_lrb {
 #endif
 
 	bool req_abort_skip;
+	bool abort_initiated_by_eh;
 };
 
 /**
-- 
2.45.2


