Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4E6C6379F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNt2Vdksx6cXUWKB1SHjS7pGYWw3wgbVfF3i9rgT+Do=; b=LBskpd+z1+zgENuRgR7Y9RorGa
	RZT3YLWOS5DL6PSoY66mmFxAetxVKkffpz1bW7nVGZu/Yn1nfqiyorcN5+dvbssOzSszGwxJVniwe
	PCO3Ib+qs9T7rUiqTxl7KHV6SIUz/mWFf5HjRsPc3XpSNxgtie6qHSDGJ7LEjjH9MVdKy/wPqwYTC
	64caLru3CCLW8hVf0E0tZ8wG8++E+E9JJXCR805SQDQUpMUdTwB+C1t6/jHgOQcNfBX48CFf3Yr7R
	nTfkRsogjE0/J4+kQS6PW5d/DeB6Qfb/4ThtazDjIIXe0TNiAbpQgNbZP1bJmA91PDGg3jrf10RxC
	R81vQYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGR3q-004Odq-25; Fri, 13 Jan 2023 20:54:02 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGR2y-004OAb-GS; Fri, 13 Jan 2023 20:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1673643188; x=1705179188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vNt2Vdksx6cXUWKB1SHjS7pGYWw3wgbVfF3i9rgT+Do=;
  b=wPtqZb5opDSFfYHpW4mPj9YKkjdHaUR61yaA7GGbO9HmYto+c0SQPvUW
   kphkfHP+i0ABAKP6qW6TCnL3v5y57Rfqbdo78HZR8P2iVWpYGO93m5d8f
   /FdtxTjzYDWzMUEE5HTRiGAVA5wPU2Ym5OoSHmCEsx86F+6u5sEb2zbQi
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jan 2023 12:53:08 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2023 12:53:08 -0800
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 13 Jan 2023 12:53:07 -0800
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
	<stanley.chu@mediatek.com>, <adrian.hunter@intel.com>, <bvanassche@acm.org>,
	<avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, <linux-arm-msm@vger.kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Arthur Simchaev
	<Arthur.Simchaev@wdc.com>, Jinyoung Choi <j-young.choi@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 12/15] ufs: core: Prepare for completion in mcq
Date: Fri, 13 Jan 2023 12:48:49 -0800
Message-ID: <c78f3a388aa48be221b14fd9fa48ec8d0151078d.1673557949.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1673557949.git.quic_asutoshd@quicinc.com>
References: <cover.1673557949.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_125308_651649_6B273BCA 
X-CRM114-Status: GOOD (  18.62  )
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

Modify completion path APIs and add completion queue
entry.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufshcd-priv.h |  2 ++
 drivers/ufs/core/ufshcd.c      | 80 ++++++++++++++++++++++++++----------------
 2 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 470f726..e87ce19 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -61,6 +61,8 @@ int ufshcd_query_attr(struct ufs_hba *hba, enum query_opcode opcode,
 int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
 	enum flag_idn idn, u8 index, bool *flag_res);
 void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
+void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
+			  struct cq_entry *cqe);
 int ufshcd_mcq_init(struct ufs_hba *hba);
 int ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
 int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 15188f5..3494737 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -776,12 +776,17 @@ static inline bool ufshcd_is_device_present(struct ufs_hba *hba)
 /**
  * ufshcd_get_tr_ocs - Get the UTRD Overall Command Status
  * @lrbp: pointer to local command reference block
+ * @cqe: pointer to the completion queue entry
  *
  * This function is used to get the OCS field from UTRD
  * Returns the OCS field in the UTRD
  */
-static enum utp_ocs ufshcd_get_tr_ocs(struct ufshcd_lrb *lrbp)
+static enum utp_ocs ufshcd_get_tr_ocs(struct ufshcd_lrb *lrbp,
+				      struct cq_entry *cqe)
 {
+	if (cqe)
+		return le32_to_cpu(cqe->status) & MASK_OCS;
+
 	return le32_to_cpu(lrbp->utr_descriptor_ptr->header.dword_2) & MASK_OCS;
 }
 
@@ -3068,7 +3073,7 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 		 * not trigger any race conditions.
 		 */
 		hba->dev_cmd.complete = NULL;
-		err = ufshcd_get_tr_ocs(lrbp);
+		err = ufshcd_get_tr_ocs(lrbp, hba->dev_cmd.cqe);
 		if (!err)
 			err = ufshcd_dev_cmd_completion(hba, lrbp);
 	} else {
@@ -5202,18 +5207,20 @@ ufshcd_scsi_cmd_status(struct ufshcd_lrb *lrbp, int scsi_status)
  * ufshcd_transfer_rsp_status - Get overall status of the response
  * @hba: per adapter instance
  * @lrbp: pointer to local reference block of completed command
+ * @cqe: pointer to the completion queue entry
  *
  * Returns result of the command to notify SCSI midlayer
  */
 static inline int
-ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
+ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
+			   struct cq_entry *cqe)
 {
 	int result = 0;
 	int scsi_status;
 	enum utp_ocs ocs;
 
 	/* overall command status of utrd */
-	ocs = ufshcd_get_tr_ocs(lrbp);
+	ocs = ufshcd_get_tr_ocs(lrbp, cqe);
 
 	if (hba->quirks & UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR) {
 		if (be32_to_cpu(lrbp->ucd_rsp_ptr->header.dword_1) &
@@ -5378,42 +5385,53 @@ static void ufshcd_release_scsi_cmd(struct ufs_hba *hba,
 }
 
 /**
- * __ufshcd_transfer_req_compl - handle SCSI and query command completion
+ * ufshcd_compl_one_cqe - handle a completion queue entry
  * @hba: per adapter instance
- * @completed_reqs: bitmask that indicates which requests to complete
+ * @task_tag: the task tag of the request to be completed
+ * @cqe: pointer to the completion queue entry
  */
-static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
-					unsigned long completed_reqs)
+void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
+			  struct cq_entry *cqe)
 {
 	struct ufshcd_lrb *lrbp;
 	struct scsi_cmnd *cmd;
-	int index;
-
-	for_each_set_bit(index, &completed_reqs, hba->nutrs) {
-		lrbp = &hba->lrb[index];
-		lrbp->compl_time_stamp = ktime_get();
-		lrbp->compl_time_stamp_local_clock = local_clock();
-		cmd = lrbp->cmd;
-		if (cmd) {
-			if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
-				ufshcd_update_monitor(hba, lrbp);
-			ufshcd_add_command_trace(hba, index, UFS_CMD_COMP);
-			cmd->result = ufshcd_transfer_rsp_status(hba, lrbp);
-			ufshcd_release_scsi_cmd(hba, lrbp);
-			/* Do not touch lrbp after scsi done */
-			scsi_done(cmd);
-		} else if (lrbp->command_type == UTP_CMD_TYPE_DEV_MANAGE ||
-			lrbp->command_type == UTP_CMD_TYPE_UFS_STORAGE) {
-			if (hba->dev_cmd.complete) {
-				ufshcd_add_command_trace(hba, index,
-							 UFS_DEV_COMP);
-				complete(hba->dev_cmd.complete);
-				ufshcd_clk_scaling_update_busy(hba);
-			}
+
+	lrbp = &hba->lrb[task_tag];
+	lrbp->compl_time_stamp = ktime_get();
+	cmd = lrbp->cmd;
+	if (cmd) {
+		if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
+			ufshcd_update_monitor(hba, lrbp);
+		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
+		cmd->result = ufshcd_transfer_rsp_status(hba, lrbp, cqe);
+		ufshcd_release_scsi_cmd(hba, lrbp);
+		/* Do not touch lrbp after scsi done */
+		scsi_done(cmd);
+	} else if (lrbp->command_type == UTP_CMD_TYPE_DEV_MANAGE ||
+		   lrbp->command_type == UTP_CMD_TYPE_UFS_STORAGE) {
+		if (hba->dev_cmd.complete) {
+			hba->dev_cmd.cqe = cqe;
+			ufshcd_add_command_trace(hba, task_tag, UFS_DEV_COMP);
+			complete(hba->dev_cmd.complete);
+			ufshcd_clk_scaling_update_busy(hba);
 		}
 	}
 }
 
+/**
+ * __ufshcd_transfer_req_compl - handle SCSI and query command completion
+ * @hba: per adapter instance
+ * @completed_reqs: bitmask that indicates which requests to complete
+ */
+static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
+					unsigned long completed_reqs)
+{
+	int tag;
+
+	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
+		ufshcd_compl_one_cqe(hba, tag, NULL);
+}
+
 /* Any value that is not an existing queue number is fine for this constant. */
 enum {
 	UFSHCD_POLL_FROM_INTERRUPT_CONTEXT = -1
-- 
2.7.4


