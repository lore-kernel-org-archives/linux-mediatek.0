Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D887DCA0EF9
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxSkhFbqT3Lmzn9GYCBNfN/kI1le+L441+1Sv9CAAxQ=; b=wsUGx2G+/Aw8DdRo3VzeApUtzt
	6KNIXXAy+GCv/z7T89O/HhrXQk3GDzjB8GbsaSZt2jKEBzLgp4jozxLf7O1AjTM5rQQIfQ7xKqfbV
	ahNNG2UzsaUfZYfVJaNcGfN5avleTEQrstPGS9wDe6lqksclhaQnYjC10BoWxo8eaAIB/D2ELsXIm
	KwVP/PYQoqMeJhIIFzWU2UV75KWV5pDJCuTXVe2Hs6aW5jDiBzOyX/k0EXk8/mjwS7+Zj8yO8ghGo
	VCFoZN5wG1F7diSdHVLX1JgoKSXcDZQgN9o7edAaWMQU0A8hDTJgU4iFKSpXNy1bdBoy1OVc0ZRCX
	I9MnpuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyCm-00000005coN-1QFs;
	Fri, 30 Aug 2024 09:46:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJT-00000005BEM-12Ag
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 07:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fxSkhFbqT3Lmzn9GYCBNfN/kI1le+L441+1Sv9CAAxQ=; b=kBk4jydIA8ZgJD8Vl0FB749DU3
	wd/PqR7vA2+D+unANU4nUhLcHKLGfniLVjiLO5tr5Is9yPTzoqgHyapmnzM4ysul37NgaWtzwQL3H
	0Yb4fU9fnHEqLDpb4fFC23KQovSg1gdLbvPEv8WNew4fNlRB0MhGuocPKTTPbjccvqMkADX5v0DWq
	UPal+jZNikXrP56xKRpvwT4Pt/fIbO4/p4H9NQB0vUulv0jquzNtxFDuc8ybq5NEc4BGbq9vcoL8K
	IWg87aSwaApub5Ge2ZduLkgH5PvwCNGcDgv4FSz4hvgDBYBnqBixmZteSoe6zThI/Qkm4VqgxdvXP
	1HsTZBMA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJK-0000000Baym-0KHO
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:44:49 +0000
X-UUID: b1a8622066a311efba0aef63c0775dbf-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fxSkhFbqT3Lmzn9GYCBNfN/kI1le+L441+1Sv9CAAxQ=;
	b=RQ3uFd4ZikDWEVLeJOxiiqIMAKOMjND5j7o85ep5ZwsXJGEzgB90HtKSHaiRuDwnpvuWFsEN4hncrA/eMYe9xDdh7akWW9czoggdrn4mmnmQO9SLYVc1Hb41aV4qjgfnJB62lfe2JHRTbbHeY+vYHTdYFl/kNpBSc0JRBZUe138=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3de7a475-b37b-48fa-98a1-04f7bb529916,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:cb8c0a15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b1a8622066a311efba0aef63c0775dbf-20240830
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1124184155; Fri, 30 Aug 2024 00:44:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 15:44:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 15:44:28 +0800
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
	<stable@vger.kernel.org>
Subject: [PATCH v1 2/2] ufs: core: requeue MCQ abort request
Date: Fri, 30 Aug 2024 15:44:26 +0800
Message-ID: <20240830074426.21968-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240830074426.21968-1-peter.wang@mediatek.com>
References: <20240830074426.21968-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_084446_877664_A66EFA8D 
X-CRM114-Status: GOOD (  16.37  )
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

For these two cases, set a flag to notify SCSI to requeue the
command after receiving OCS_ABORTED.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c |  1 +
 drivers/ufs/core/ufshcd.c  | 21 ++++++++-------------
 include/ufs/ufshcd.h       |  2 ++
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index afd9541f4bd8..abdc55a8b960 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -642,6 +642,7 @@ static bool ufshcd_mcq_sqe_search(struct ufs_hba *hba,
 		match = le64_to_cpu(utrd->command_desc_base_addr) & CQE_UCD_BA;
 		if (addr == match) {
 			ufshcd_mcq_nullify_sqe(utrd);
+			lrbp->host_initiate_abort = true;
 			ret = true;
 			goto out;
 		}
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a6f818cdef0e..18418e9d7549 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3006,6 +3006,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	ufshcd_prepare_lrbp_crypto(scsi_cmd_to_rq(cmd), lrbp);
 
 	lrbp->req_abort_skip = false;
+	lrbp->host_initiate_abort = false;
 
 	ufshcd_comp_scsi_upiu(hba, lrbp);
 
@@ -5404,7 +5405,10 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		}
 		break;
 	case OCS_ABORTED:
-		result |= DID_ABORT << 16;
+		if (lrbp->host_initiate_abort)
+			result |= DID_REQUEUE << 16;
+		else
+			result |= DID_ABORT << 16;
 		break;
 	case OCS_INVALID_COMMAND_STATUS:
 		result |= DID_REQUEUE << 16;
@@ -6472,24 +6476,15 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
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
+	/* Host will post to CQ with OCS_ABORTED after SQ clean up */
+	if (is_mcq_enabled(hba) && (*ret == 0))
+		lrbp->host_initiate_abort = true;
 
 	return *ret == 0;
 }
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 0fd2aebac728..49dd5ca8a4e7 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -173,6 +173,7 @@ struct ufs_pm_lvl_states {
  * @crypto_key_slot: the key slot to use for inline crypto (-1 if none)
  * @data_unit_num: the data unit number for the first block for inline crypto
  * @req_abort_skip: skip request abort task flag
+ * @host_initiate_abort: Abort flag initiated by host
  */
 struct ufshcd_lrb {
 	struct utp_transfer_req_desc *utr_descriptor_ptr;
@@ -202,6 +203,7 @@ struct ufshcd_lrb {
 #endif
 
 	bool req_abort_skip;
+	bool host_initiate_abort;
 };
 
 /**
-- 
2.45.2


