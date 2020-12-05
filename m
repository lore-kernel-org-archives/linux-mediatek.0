Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC41C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 11:59:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B8123102
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 11:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B8123102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FK3Xl6JK3ggP2QETr/ltExOUwkwEHacbTCZNHV/gA0Q=; b=b7jiE0Sy+8EGecwO/CtWUdzs+
	Xu1okDqKJzXBKMLguDorbUs2FIBJnRT1HzWDqJgo98BD/vFw2/9sRDafbaVXU0L87lCFjqqYevdoY
	TdfQdF1XxyHmNFvQ4vpOg7TWnZnnXZx1gNe1ARg8nTqfMyol3u440v9wbHcbkTma/oswVLPUmkaL7
	5Nu6AGHG4tn1c9TAmZEd2qb+iU2Tz8jQn5nGy1pQZsoyzi7KtWC1hLj6+tvbN7NEwK7fUiynar3X7
	H69GV189jU3Ma0QldZhq+19WXwXUmeGh0Jg4Nxll1tqNFggfe2jGFZkoYfc+5zo4tywicmmslfNEQ
	LYxgCc8Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klWDx-00080V-5t; Sat, 05 Dec 2020 11:59:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klWDi-0007vZ-8X; Sat, 05 Dec 2020 11:59:23 +0000
X-UUID: cffea40082f6407496c274a740171bcf-20201205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=THC+y7Bg2AM9AuApdK6HddTcEojqcJNasRtWeef25Qk=; 
 b=bs+I133JQ7lrpBohq8nRtvF8lQOsTFYHhu6GHlB/rxSlYyRwMXEQCTdpDVEawuAZFwjZecIL5Uv9BYmiYvybMVgY85HRh7jAhECvq0sDmx8rbp5MBWJQQ3JXMm+IZRsNZyeMGzcVd30pC0Tn90RIS7sQf2YDGhO3dru2prj5qJ8=;
X-UUID: cffea40082f6407496c274a740171bcf-20201205
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2131648098; Sat, 05 Dec 2020 03:59:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 03:59:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 19:59:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 19:59:03 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v5 2/4] scsi: ufs: Refine error history functions
Date: Sat, 5 Dec 2020 19:58:59 +0800
Message-ID: <20201205115901.26815-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201205115901.26815-1-stanley.chu@mediatek.com>
References: <20201205115901.26815-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_065922_544840_1381239D 
X-CRM114-Status: GOOD (  16.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Nowadays UFS error history does not only have "history of errors"
but also have history of some other events which are not defined
as errors.

This patch fixes the confused naming of related functions,
and change the way for updating and printing history as preparation
of next patch.

This patch shall not change any functionality.

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 118 +++++++++++++++++++++-----------------
 drivers/scsi/ufs/ufshcd.h |  71 ++++++++++-------------
 2 files changed, 97 insertions(+), 92 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 922d68bca345..1a7d31849511 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -411,20 +411,25 @@ static void ufshcd_print_clk_freqs(struct ufs_hba *hba)
 	}
 }
 
-static void ufshcd_print_err_hist(struct ufs_hba *hba,
-				  struct ufs_err_reg_hist *err_hist,
-				  char *err_name)
+static void ufshcd_print_evt(struct ufs_hba *hba, u32 id,
+			     char *err_name)
 {
 	int i;
 	bool found = false;
+	struct ufs_event_hist *e;
 
-	for (i = 0; i < UFS_ERR_REG_HIST_LENGTH; i++) {
-		int p = (i + err_hist->pos) % UFS_ERR_REG_HIST_LENGTH;
+	if (id >= UFS_EVT_CNT)
+		return;
+
+	e = &hba->ufs_stats.event[id];
 
-		if (err_hist->tstamp[p] == 0)
+	for (i = 0; i < UFS_EVENT_HIST_LENGTH; i++) {
+		int p = (i + e->pos) % UFS_EVENT_HIST_LENGTH;
+
+		if (e->tstamp[p] == 0)
 			continue;
 		dev_err(hba->dev, "%s[%d] = 0x%x at %lld us\n", err_name, p,
-			err_hist->reg[p], ktime_to_us(err_hist->tstamp[p]));
+			e->val[p], ktime_to_us(e->tstamp[p]));
 		found = true;
 	}
 
@@ -432,26 +437,26 @@ static void ufshcd_print_err_hist(struct ufs_hba *hba,
 		dev_err(hba->dev, "No record of %s\n", err_name);
 }
 
-static void ufshcd_print_host_regs(struct ufs_hba *hba)
+static void ufshcd_print_evt_hist(struct ufs_hba *hba)
 {
 	ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
 
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.pa_err, "pa_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.dl_err, "dl_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.nl_err, "nl_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.tl_err, "tl_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.dme_err, "dme_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.auto_hibern8_err,
-			      "auto_hibern8_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.fatal_err, "fatal_err");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.link_startup_err,
-			      "link_startup_fail");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.resume_err, "resume_fail");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.suspend_err,
-			      "suspend_fail");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.dev_reset, "dev_reset");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.host_reset, "host_reset");
-	ufshcd_print_err_hist(hba, &hba->ufs_stats.task_abort, "task_abort");
+	ufshcd_print_evt(hba, UFS_EVT_PA_ERR, "pa_err");
+	ufshcd_print_evt(hba, UFS_EVT_DL_ERR, "dl_err");
+	ufshcd_print_evt(hba, UFS_EVT_NL_ERR, "nl_err");
+	ufshcd_print_evt(hba, UFS_EVT_TL_ERR, "tl_err");
+	ufshcd_print_evt(hba, UFS_EVT_DME_ERR, "dme_err");
+	ufshcd_print_evt(hba, UFS_EVT_AUTO_HIBERN8_ERR,
+			 "auto_hibern8_err");
+	ufshcd_print_evt(hba, UFS_EVT_FATAL_ERR, "fatal_err");
+	ufshcd_print_evt(hba, UFS_EVT_LINK_STARTUP_FAIL,
+			 "link_startup_fail");
+	ufshcd_print_evt(hba, UFS_EVT_RESUME_ERR, "resume_fail");
+	ufshcd_print_evt(hba, UFS_EVT_SUSPEND_ERR,
+			 "suspend_fail");
+	ufshcd_print_evt(hba, UFS_EVT_DEV_RESET, "dev_reset");
+	ufshcd_print_evt(hba, UFS_EVT_HOST_RESET, "host_reset");
+	ufshcd_print_evt(hba, UFS_EVT_ABORT, "task_abort");
 
 	ufshcd_vops_dbg_register_dump(hba);
 }
@@ -3852,7 +3857,7 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba, struct uic_command *cmd)
 	if (ret) {
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 	}
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
@@ -4464,14 +4469,19 @@ static inline int ufshcd_disable_device_tx_lcc(struct ufs_hba *hba)
 	return ufshcd_disable_tx_lcc(hba, true);
 }
 
-void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
-			    u32 reg)
+void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 {
-	reg_hist->reg[reg_hist->pos] = reg;
-	reg_hist->tstamp[reg_hist->pos] = ktime_get();
-	reg_hist->pos = (reg_hist->pos + 1) % UFS_ERR_REG_HIST_LENGTH;
+	struct ufs_event_hist *e;
+
+	if (id >= UFS_EVT_CNT)
+		return;
+
+	e = &hba->ufs_stats.event[id];
+	e->val[e->pos] = val;
+	e->tstamp[e->pos] = ktime_get();
+	e->pos = (e->pos + 1) % UFS_EVENT_HIST_LENGTH;
 }
-EXPORT_SYMBOL_GPL(ufshcd_update_reg_hist);
+EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
 /**
  * ufshcd_link_startup - Initialize unipro link startup
@@ -4500,7 +4510,8 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 
 		/* check if device is detected by inter-connect layer */
 		if (!ret && !ufshcd_is_device_present(hba)) {
-			ufshcd_update_reg_hist(&hba->ufs_stats.link_startup_err,
+			ufshcd_update_evt_hist(hba,
+					       UFS_EVT_LINK_STARTUP_FAIL,
 					       0);
 			dev_err(hba->dev, "%s: Device not present\n", __func__);
 			ret = -ENXIO;
@@ -4513,7 +4524,8 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 		 * succeeds. So reset the local Uni-Pro and try again.
 		 */
 		if (ret && ufshcd_hba_enable(hba)) {
-			ufshcd_update_reg_hist(&hba->ufs_stats.link_startup_err,
+			ufshcd_update_evt_hist(hba,
+					       UFS_EVT_LINK_STARTUP_FAIL,
 					       (u32)ret);
 			goto out;
 		}
@@ -4521,7 +4533,8 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 
 	if (ret) {
 		/* failed to get the link up... retire */
-		ufshcd_update_reg_hist(&hba->ufs_stats.link_startup_err,
+		ufshcd_update_evt_hist(hba,
+				       UFS_EVT_LINK_STARTUP_FAIL,
 				       (u32)ret);
 		goto out;
 	}
@@ -4555,7 +4568,7 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 		dev_err(hba->dev, "link startup failed %d\n", ret);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 	}
 	return ret;
 }
@@ -4910,7 +4923,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
 		dev_err(hba->dev,
 				"OCS error from controller = %x for tag %d\n",
 				ocs, lrbp->task_tag);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
 		break;
 	} /* end of switch */
@@ -5792,7 +5805,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_tmrs(hba, hba->outstanding_tasks);
 		ufshcd_print_trs(hba, hba->outstanding_reqs, pr_prdt);
 		spin_lock_irqsave(hba->host->host_lock, flags);
@@ -5937,7 +5950,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_PHY_ADAPTER_LAYER);
 	if ((reg & UIC_PHY_ADAPTER_LAYER_ERROR) &&
 	    (reg & UIC_PHY_ADAPTER_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.pa_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_PA_ERR, reg);
 		/*
 		 * To know whether this error is fatal or not, DB timeout
 		 * must be checked but this error is handled separately.
@@ -5967,7 +5980,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_DATA_LINK_LAYER);
 	if ((reg & UIC_DATA_LINK_LAYER_ERROR) &&
 	    (reg & UIC_DATA_LINK_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.dl_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_DL_ERR, reg);
 
 		if (reg & UIC_DATA_LINK_LAYER_ERROR_PA_INIT)
 			hba->uic_error |= UFSHCD_UIC_DL_PA_INIT_ERROR;
@@ -5986,7 +5999,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_NETWORK_LAYER);
 	if ((reg & UIC_NETWORK_LAYER_ERROR) &&
 	    (reg & UIC_NETWORK_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.nl_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_NL_ERR, reg);
 		hba->uic_error |= UFSHCD_UIC_NL_ERROR;
 		retval |= IRQ_HANDLED;
 	}
@@ -5994,7 +6007,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_TRANSPORT_LAYER);
 	if ((reg & UIC_TRANSPORT_LAYER_ERROR) &&
 	    (reg & UIC_TRANSPORT_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.tl_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_TL_ERR, reg);
 		hba->uic_error |= UFSHCD_UIC_TL_ERROR;
 		retval |= IRQ_HANDLED;
 	}
@@ -6002,7 +6015,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_DME);
 	if ((reg & UIC_DME_ERROR) &&
 	    (reg & UIC_DME_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.dme_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_DME_ERR, reg);
 		hba->uic_error |= UFSHCD_UIC_DME_ERROR;
 		retval |= IRQ_HANDLED;
 	}
@@ -6044,7 +6057,8 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
 	irqreturn_t retval = IRQ_NONE;
 
 	if (hba->errors & INT_FATAL_ERRORS) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.fatal_err, hba->errors);
+		ufshcd_update_evt_hist(hba, UFS_EVT_FATAL_ERR,
+				       hba->errors);
 		queue_eh_work = true;
 	}
 
@@ -6061,7 +6075,7 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
 			__func__, (hba->errors & UIC_HIBERNATE_ENTER) ?
 			"Enter" : "Exit",
 			hba->errors, ufshcd_get_upmcrs(hba));
-		ufshcd_update_reg_hist(&hba->ufs_stats.auto_hibern8_err,
+		ufshcd_update_evt_hist(hba, UFS_EVT_AUTO_HIBERN8_ERR,
 				       hba->errors);
 		ufshcd_set_link_broken(hba);
 		queue_eh_work = true;
@@ -6602,7 +6616,7 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 
 out:
 	hba->req_abort_count = 0;
-	ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, (u32)err);
+	ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, (u32)err);
 	if (!err) {
 		err = SUCCESS;
 	} else {
@@ -6739,7 +6753,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 * handling stage: reset and restore.
 	 */
 	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, lrbp->lun);
+		ufshcd_update_evt_hist(hba, UFS_EVT_ABORT, lrbp->lun);
 		return ufshcd_eh_host_reset_handler(cmd);
 	}
 
@@ -6765,8 +6779,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 */
 	scsi_print_command(hba->lrb[tag].cmd);
 	if (!hba->req_abort_count) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, tag);
-		ufshcd_print_host_regs(hba);
+		ufshcd_update_evt_hist(hba, UFS_EVT_ABORT, tag);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
 		ufshcd_print_trs(hba, 1 << tag, true);
@@ -6849,7 +6863,7 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 out:
 	if (err)
 		dev_err(hba->dev, "%s: Host init failed %d\n", __func__, err);
-	ufshcd_update_reg_hist(&hba->ufs_stats.host_reset, (u32)err);
+	ufshcd_update_evt_hist(hba, UFS_EVT_HOST_RESET, (u32)err);
 	return err;
 }
 
@@ -8689,7 +8703,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	hba->pm_op_in_progress = 0;
 
 	if (ret)
-		ufshcd_update_reg_hist(&hba->ufs_stats.suspend_err, (u32)ret);
+		ufshcd_update_evt_hist(hba, UFS_EVT_SUSPEND_ERR, (u32)ret);
 	return ret;
 }
 
@@ -8813,7 +8827,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 out:
 	hba->pm_op_in_progress = 0;
 	if (ret)
-		ufshcd_update_reg_hist(&hba->ufs_stats.resume_err, (u32)ret);
+		ufshcd_update_evt_hist(hba, UFS_EVT_RESUME_ERR, (u32)ret);
 	return ret;
 }
 
@@ -9265,7 +9279,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = ufshcd_hba_enable(hba);
 	if (err) {
 		dev_err(hba->dev, "Host controller enable failed\n");
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
 		goto free_tmf_queue;
 	}
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 384a042ccb46..b55a71c10fa6 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -58,6 +58,29 @@ enum dev_cmd_type {
 	DEV_CMD_TYPE_QUERY		= 0x1,
 };
 
+enum ufs_event_type {
+	/* uic specific errors */
+	UFS_EVT_PA_ERR = 0,
+	UFS_EVT_DL_ERR,
+	UFS_EVT_NL_ERR,
+	UFS_EVT_TL_ERR,
+	UFS_EVT_DME_ERR,
+
+	/* fatal errors */
+	UFS_EVT_AUTO_HIBERN8_ERR,
+	UFS_EVT_FATAL_ERR,
+	UFS_EVT_LINK_STARTUP_FAIL,
+	UFS_EVT_RESUME_ERR,
+	UFS_EVT_SUSPEND_ERR,
+
+	/* abnormal events */
+	UFS_EVT_DEV_RESET,
+	UFS_EVT_HOST_RESET,
+	UFS_EVT_ABORT,
+
+	UFS_EVT_CNT,
+};
+
 /**
  * struct uic_command - UIC command structure
  * @command: UIC command
@@ -409,17 +432,17 @@ struct ufs_clk_scaling {
 	bool is_suspended;
 };
 
-#define UFS_ERR_REG_HIST_LENGTH 8
+#define UFS_EVENT_HIST_LENGTH 8
 /**
- * struct ufs_err_reg_hist - keeps history of errors
+ * struct ufs_event_hist - keeps history of errors
  * @pos: index to indicate cyclic buffer position
  * @reg: cyclic buffer for registers value
  * @tstamp: cyclic buffer for time stamp
  */
-struct ufs_err_reg_hist {
+struct ufs_event_hist {
 	int pos;
-	u32 reg[UFS_ERR_REG_HIST_LENGTH];
-	ktime_t tstamp[UFS_ERR_REG_HIST_LENGTH];
+	u32 val[UFS_EVENT_HIST_LENGTH];
+	ktime_t tstamp[UFS_EVENT_HIST_LENGTH];
 };
 
 /**
@@ -430,19 +453,6 @@ struct ufs_err_reg_hist {
  *		reset this after link-startup.
  * @last_hibern8_exit_tstamp: Set time after the hibern8 exit.
  *		Clear after the first successful command completion.
- * @pa_err: tracks pa-uic errors
- * @dl_err: tracks dl-uic errors
- * @nl_err: tracks nl-uic errors
- * @tl_err: tracks tl-uic errors
- * @dme_err: tracks dme errors
- * @auto_hibern8_err: tracks auto-hibernate errors
- * @fatal_err: tracks fatal errors
- * @linkup_err: tracks link-startup errors
- * @resume_err: tracks resume errors
- * @suspend_err: tracks suspend errors
- * @dev_reset: tracks device reset events
- * @host_reset: tracks host reset events
- * @tsk_abort: tracks task abort events
  */
 struct ufs_stats {
 	u32 last_intr_status;
@@ -450,25 +460,7 @@ struct ufs_stats {
 
 	u32 hibern8_exit_cnt;
 	ktime_t last_hibern8_exit_tstamp;
-
-	/* uic specific errors */
-	struct ufs_err_reg_hist pa_err;
-	struct ufs_err_reg_hist dl_err;
-	struct ufs_err_reg_hist nl_err;
-	struct ufs_err_reg_hist tl_err;
-	struct ufs_err_reg_hist dme_err;
-
-	/* fatal errors */
-	struct ufs_err_reg_hist auto_hibern8_err;
-	struct ufs_err_reg_hist fatal_err;
-	struct ufs_err_reg_hist link_startup_err;
-	struct ufs_err_reg_hist resume_err;
-	struct ufs_err_reg_hist suspend_err;
-
-	/* abnormal events */
-	struct ufs_err_reg_hist dev_reset;
-	struct ufs_err_reg_hist host_reset;
-	struct ufs_err_reg_hist task_abort;
+	struct ufs_event_hist event[UFS_EVT_CNT];
 };
 
 enum ufshcd_quirks {
@@ -912,8 +904,7 @@ int ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
 				u32 val, unsigned long interval_us,
 				unsigned long timeout_ms);
 void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
-void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
-			    u32 reg);
+void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val);
 
 static inline void check_upiu_size(void)
 {
@@ -1219,7 +1210,7 @@ static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 		if (!err)
 			ufshcd_set_ufs_dev_active(hba);
 		if (err != -EOPNOTSUPP)
-			ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, err);
+			ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
 	}
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
