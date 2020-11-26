Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955B0C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 05:39:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5953206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 05:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IIrQxItX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mvwxV4Po"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5953206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xUAJAWYmREL9wgodpNBuvygIGAoqKQOK+d/i2RE4u8I=; b=IIrQxItXAtbmu0VsaEUPPurtB
	SpfCpnTNpeQL9tae8WWeP4b7ka7CdyLjIi9W/IMtBhc2+Kgqpl06S0blLbbTqRVAAjC9ajFCMYsx/
	VtDLIexzndJRr8aHR4lT10JTi4CYk2sLayfx23aQVsY+xQUtmcqP19P3Sbm53GfnpBrWX4/kdKDz2
	UOCzeXepzGON3O0cBEyfC5ibssL4Mks4bds+mJ/qDBNZTrQgQjmFn12DiDLO5fc5sv0v7UON1odUV
	slr/dEMrOwkMWWxMoKQt8PwFdxyb54tzB+biU11IqQOXyPTKmTMg0ayeuBPlBTFGGDkWccVACvgea
	/S7ZAKCww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki9zw-0005b3-T6; Thu, 26 Nov 2020 05:39:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki9zd-0005X9-IL; Thu, 26 Nov 2020 05:38:59 +0000
X-UUID: 51258188617f42c6899274f0117b0059-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EhKRBnaDZV14I2r6zRGm3x6IgBBMSZ6qMKk/GMKvHSg=; 
 b=mvwxV4PoJJEjy8YLSmqWqacoEXOv8l7cq5Mbg4UhZJWmW1BIauzkIUSCElGxFkIz7qFVQ1/aB3dU74WEkz6w6gD5m2VteDhhLYEm8ls1rCqkAe2awK8E25AND8Yi2flftGSXuKxRldHEYpS12n5YlJ0gOXQbxrmjW9KVbV9+lgc=;
X-UUID: 51258188617f42c6899274f0117b0059-20201125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1698854870; Wed, 25 Nov 2020 21:38:16 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 21:38:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 13:38:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 26 Nov 2020 13:38:40 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/3] scsi: ufs: Refine error history functions
Date: Thu, 26 Nov 2020 13:38:38 +0800
Message-ID: <20201126053839.25889-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201126053839.25889-1-stanley.chu@mediatek.com>
References: <20201126053839.25889-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_003858_458507_070F1544 
X-CRM114-Status: GOOD (  17.31  )
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

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 118 +++++++++++++++++++++-----------------
 drivers/scsi/ufs/ufshcd.h |  71 ++++++++++-------------
 2 files changed, 97 insertions(+), 92 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 28e4def13f21..7194bed1f10b 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -413,20 +413,25 @@ static void ufshcd_print_clk_freqs(struct ufs_hba *hba)
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
 
@@ -434,26 +439,26 @@ static void ufshcd_print_err_hist(struct ufs_hba *hba,
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
@@ -3856,7 +3861,7 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba, struct uic_command *cmd)
 	if (ret) {
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 	}
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
@@ -4468,14 +4473,19 @@ static inline int ufshcd_disable_device_tx_lcc(struct ufs_hba *hba)
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
@@ -4504,7 +4514,8 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 
 		/* check if device is detected by inter-connect layer */
 		if (!ret && !ufshcd_is_device_present(hba)) {
-			ufshcd_update_reg_hist(&hba->ufs_stats.link_startup_err,
+			ufshcd_update_evt_hist(hba,
+					       UFS_EVT_LINK_STARTUP_FAIL,
 					       0);
 			dev_err(hba->dev, "%s: Device not present\n", __func__);
 			ret = -ENXIO;
@@ -4517,7 +4528,8 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 		 * succeeds. So reset the local Uni-Pro and try again.
 		 */
 		if (ret && ufshcd_hba_enable(hba)) {
-			ufshcd_update_reg_hist(&hba->ufs_stats.link_startup_err,
+			ufshcd_update_evt_hist(hba,
+					       UFS_EVT_LINK_STARTUP_FAIL,
 					       (u32)ret);
 			goto out;
 		}
@@ -4525,7 +4537,8 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 
 	if (ret) {
 		/* failed to get the link up... retire */
-		ufshcd_update_reg_hist(&hba->ufs_stats.link_startup_err,
+		ufshcd_update_evt_hist(hba,
+				       UFS_EVT_LINK_STARTUP_FAIL,
 				       (u32)ret);
 		goto out;
 	}
@@ -4559,7 +4572,7 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 		dev_err(hba->dev, "link startup failed %d\n", ret);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 	}
 	return ret;
 }
@@ -4914,7 +4927,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
 		dev_err(hba->dev,
 				"OCS error from controller = %x for tag %d\n",
 				ocs, lrbp->task_tag);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
 		break;
 	} /* end of switch */
@@ -5796,7 +5809,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_tmrs(hba, hba->outstanding_tasks);
 		ufshcd_print_trs(hba, hba->outstanding_reqs, pr_prdt);
 		spin_lock_irqsave(hba->host->host_lock, flags);
@@ -5941,7 +5954,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_PHY_ADAPTER_LAYER);
 	if ((reg & UIC_PHY_ADAPTER_LAYER_ERROR) &&
 	    (reg & UIC_PHY_ADAPTER_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.pa_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_PA_ERR, reg);
 		/*
 		 * To know whether this error is fatal or not, DB timeout
 		 * must be checked but this error is handled separately.
@@ -5971,7 +5984,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_DATA_LINK_LAYER);
 	if ((reg & UIC_DATA_LINK_LAYER_ERROR) &&
 	    (reg & UIC_DATA_LINK_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.dl_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_DL_ERR, reg);
 
 		if (reg & UIC_DATA_LINK_LAYER_ERROR_PA_INIT)
 			hba->uic_error |= UFSHCD_UIC_DL_PA_INIT_ERROR;
@@ -5990,7 +6003,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_NETWORK_LAYER);
 	if ((reg & UIC_NETWORK_LAYER_ERROR) &&
 	    (reg & UIC_NETWORK_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.nl_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_NL_ERR, reg);
 		hba->uic_error |= UFSHCD_UIC_NL_ERROR;
 		retval |= IRQ_HANDLED;
 	}
@@ -5998,7 +6011,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_TRANSPORT_LAYER);
 	if ((reg & UIC_TRANSPORT_LAYER_ERROR) &&
 	    (reg & UIC_TRANSPORT_LAYER_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.tl_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_TL_ERR, reg);
 		hba->uic_error |= UFSHCD_UIC_TL_ERROR;
 		retval |= IRQ_HANDLED;
 	}
@@ -6006,7 +6019,7 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 	reg = ufshcd_readl(hba, REG_UIC_ERROR_CODE_DME);
 	if ((reg & UIC_DME_ERROR) &&
 	    (reg & UIC_DME_ERROR_CODE_MASK)) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.dme_err, reg);
+		ufshcd_update_evt_hist(hba, UFS_EVT_DME_ERR, reg);
 		hba->uic_error |= UFSHCD_UIC_DME_ERROR;
 		retval |= IRQ_HANDLED;
 	}
@@ -6048,7 +6061,8 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
 	irqreturn_t retval = IRQ_NONE;
 
 	if (hba->errors & INT_FATAL_ERRORS) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.fatal_err, hba->errors);
+		ufshcd_update_evt_hist(hba, UFS_EVT_FATAL_ERR,
+				       hba->errors);
 		queue_eh_work = true;
 	}
 
@@ -6065,7 +6079,7 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
 			__func__, (hba->errors & UIC_HIBERNATE_ENTER) ?
 			"Enter" : "Exit",
 			hba->errors, ufshcd_get_upmcrs(hba));
-		ufshcd_update_reg_hist(&hba->ufs_stats.auto_hibern8_err,
+		ufshcd_update_evt_hist(hba, UFS_EVT_AUTO_HIBERN8_ERR,
 				       hba->errors);
 		ufshcd_set_link_broken(hba);
 		queue_eh_work = true;
@@ -6606,7 +6620,7 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 
 out:
 	hba->req_abort_count = 0;
-	ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, (u32)err);
+	ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, (u32)err);
 	if (!err) {
 		err = SUCCESS;
 	} else {
@@ -6743,7 +6757,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 * handling stage: reset and restore.
 	 */
 	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, lrbp->lun);
+		ufshcd_update_evt_hist(hba, UFS_EVT_ABORT, lrbp->lun);
 		return ufshcd_eh_host_reset_handler(cmd);
 	}
 
@@ -6769,8 +6783,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
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
@@ -6853,7 +6867,7 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 out:
 	if (err)
 		dev_err(hba->dev, "%s: Host init failed %d\n", __func__, err);
-	ufshcd_update_reg_hist(&hba->ufs_stats.host_reset, (u32)err);
+	ufshcd_update_evt_hist(hba, UFS_EVT_HOST_RESET, (u32)err);
 	return err;
 }
 
@@ -8708,7 +8722,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	hba->pm_op_in_progress = 0;
 
 	if (ret)
-		ufshcd_update_reg_hist(&hba->ufs_stats.suspend_err, (u32)ret);
+		ufshcd_update_evt_hist(hba, UFS_EVT_SUSPEND_ERR, (u32)ret);
 	return ret;
 }
 
@@ -8832,7 +8846,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 out:
 	hba->pm_op_in_progress = 0;
 	if (ret)
-		ufshcd_update_reg_hist(&hba->ufs_stats.resume_err, (u32)ret);
+		ufshcd_update_evt_hist(hba, UFS_EVT_RESUME_ERR, (u32)ret);
 	return ret;
 }
 
@@ -9284,7 +9298,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = ufshcd_hba_enable(hba);
 	if (err) {
 		dev_err(hba->dev, "Host controller enable failed\n");
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
 		goto free_tmf_queue;
 	}
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 61344c49c2cc..82c2fc5597bb 100644
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
@@ -406,17 +429,17 @@ struct ufs_clk_scaling {
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
@@ -427,19 +450,6 @@ struct ufs_err_reg_hist {
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
@@ -447,25 +457,7 @@ struct ufs_stats {
 
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
@@ -909,8 +901,7 @@ int ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
 				u32 val, unsigned long interval_us,
 				unsigned long timeout_ms);
 void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
-void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
-			    u32 reg);
+void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val);
 
 static inline void check_upiu_size(void)
 {
@@ -1216,7 +1207,7 @@ static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
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
