Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23265CF58F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbwcydwDUBTubr2Um38bHOO3yWTV5YSyXpU3VXJrRXY=; b=ihMO9KBLS3sbb+D7yzjKd6APsa
	SDKnuaVQRoGolHS//qmgw+SgwHuvRWrFtALpM64lTFO/LyQIZjKGrb/4cpDaN8BZ4Pl4aQxtV9sSJ
	0kr6VGkj/txuVW+3HaFDV5mBkAeJ22D3x1Tj5Ayr+xjolmyy9HJBg/uj0McEtb2dV7E0AwIrRbLgy
	gwl+oVeAaEEw+ui1r1QfoeVfc7sKuc2zlqrvJXPuNbqVi2x99+VCVnnaMLmKgMFAnYUi9K+2I7aWx
	PHrOUxABoFnzwFLQQnrXAhDIExTeWMHmezgoMENqqBBWgPMDrSpaE/ocSAYgrSaxSOMVv2xZbmtOl
	H8pGq/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbM-0000000Bsyu-3Tyq;
	Fri, 20 Sep 2024 09:06:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbJ-0000000BswB-2xSN
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 09:06:55 +0000
X-UUID: ab087044772f11efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tbwcydwDUBTubr2Um38bHOO3yWTV5YSyXpU3VXJrRXY=;
	b=jV4AP/TMEdlv4hIdqQcfA/p68j+MyJerK6n6klUXhvSR8AgI6Of/aN1Lp1Vzg1IxO0Y02FzvM1EITaEumx6p6wZNntTKg1vwQ8uxHvHiSmrp/QdwwufNXfaputJqlany/vvQ8robDQtU1nKwH0Bx0nNiP/Zk7vaOTdJewHnViyw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7da4e720-1dae-4cab-9c23-b7e06fff7a8d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cae84b9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ab087044772f11efba0aef63c0775dbf-20240920
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 92727965; Fri, 20 Sep 2024 02:06:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 02:06:45 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 17:06:45 +0800
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
Subject: [PATCH v7 4/4] ufs: core: skip ISR notifying scsi when ufshcd_abort
Date: Fri, 20 Sep 2024 17:06:43 +0800
Message-ID: <20240920090643.3566-5-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920090643.3566-1-peter.wang@mediatek.com>
References: <20240920090643.3566-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_020653_965645_D6EF1AE9 
X-CRM114-Status: GOOD (  16.66  )
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

When a SCSI abort occurs, ufshcd_try_to_abort_task may trigger
the ISR, and the ISR may release the command and notify SCSI
via scsi_done. This patch prevents the ISR from notifying
SCSI to requeue, allowing SCSI to decide whether to requeue.

Below is ufshcd_abort legacy SDB flow:

ufshcd_abort()
  ufshcd_try_to_abort_task() // will trigger ISR
  get outstanding_lock
  clear outstanding_reqs tag
  ufshcd_release_scsi_cmd()
  release outstanding_lock

ufshcd_intr()
  ufshcd_sl_intr()
    ufshcd_transfer_req_compl()
      ufshcd_poll()
        get outstanding_lock
        clear outstanding_reqs tag
        release outstanding_lock
        __ufshcd_transfer_req_compl()
          ufshcd_compl_one_cqe()
          cmd->result = DID_REQUEUE
          ufshcd_release_scsi_cmd()
          scsi_done();

In most cases, ufshcd_intr will not reach scsi_done because the
outstanding_reqs tag is cleared by the original thread.
Therefore, whether there is an interrupt or not doesn't affect
the result because the ISR will do nothing in most cases.

In a very low chance, the ISR will reach scsi_done and notify
SCSI to requeue, and the original thread will not
call ufshcd_release_scsi_cmd. So should release because
outstanding_reqs is clear by ISR.

Below is ufshcd_abort MCQ flow:

ufshcd_abort()
  ufshcd_mcq_abort()
    ufshcd_try_to_abort_task()	// will trigger ISR
    ufshcd_release_scsi_cmd()

ufs_mtk_mcq_intr()
  ufshcd_mcq_poll_cqe_lock()
    ufshcd_mcq_process_cqe()
      ufshcd_compl_one_cqe()
        cmd->result = DID_ABORT
        ufshcd_release_scsi_cmd() // will release twice
        scsi_done()

In the case of MCQ ufshcd_abort, there is an issue where
ufshcd_release_scsi_cmd might be called twice. We could simply
skip the ISR release and scsi_done.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c |  6 ++++++
 drivers/ufs/core/ufshcd.c  | 27 +++++++++++++++++++++++++++
 include/ufs/ufshcd.h       |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 3903947dbed1..73d7cf337e2f 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -699,6 +699,12 @@ int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 		return FAILED;
 	}
 
+	/*
+	 * In MCQ mode, set this variable so that the ISR posted by
+	 * the host controller can be skipped.
+	 */
+	lrbp->abort_initiated_by = UFS_SCSI_ABORT;
+
 	/*
 	 * The command is not in the submission queue, and it is not
 	 * in the completion queue either. Query the device to see if
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index b34125238a70..21091b11b4ba 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5537,6 +5537,27 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 			ufshcd_update_monitor(hba, lrbp);
 		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
 		cmd->result = ufshcd_transfer_rsp_status(hba, lrbp, cqe);
+
+		/*
+		 * Let the SCSI layer decide how to handle the ufshcd_abort
+		 * situation, neither releasing nor notifying scsi_done in MCQ
+		 * mode. SDB mode should release because outstanding_reqs is
+		 * clear by ISR.
+		 */
+		if (lrbp->abort_initiated_by == UFS_SCSI_ABORT) {
+			ocs = ufshcd_get_tr_ocs(lrbp, cqe);
+			if ((hba->mcq_enabled) && (ocs == OCS_ABORTED))
+				 return;
+
+			if ((!hba->mcq_enabled) &&
+			    ((ocs == OCS_INVALID_COMMAND_STATUS) ||
+			     ((hba->quirks & UFSHCD_QUIRK_OCS_ABORTED) &&
+			      (ocs == OCS_ABORTED)))) {
+				ufshcd_release_scsi_cmd(hba, lrbp);
+				return;
+			}
+		}
+
 		ufshcd_release_scsi_cmd(hba, lrbp);
 		/* Do not touch lrbp after scsi done */
 		scsi_done(cmd);
@@ -7673,6 +7694,12 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 		goto release;
 	}
 
+	/*
+	 * In SDB mode, set this variable so that the ISR posted by
+	 * the host controller clear UTRLCLR can be skipped.
+	 */
+	lrbp->abort_initiated_by = UFS_SCSI_ABORT;
+
 	err = ufshcd_try_to_abort_task(hba, tag);
 	if (err) {
 		dev_err(hba->dev, "%s: failed with err %d\n", __func__, err);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 4d17a13ac558..4785a45040eb 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -148,6 +148,7 @@ enum ufs_pm_level {
 enum ufs_abort_by {
 	UFS_NO_ABORT,
 	UFS_ERR_HANDLER,
+	UFS_SCSI_ABORT
 };
 
 struct ufs_pm_lvl_states {
-- 
2.45.2


