Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F60FC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 07:10:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB2923A03
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 07:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB2923A03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4IITsJW93zMUp0xUFVXWZXyX2filFjgeqWIkyRMSAE=; b=h2ADtaa+piQjiXSAllRcfGrKyu
	G0tK9trNc2xtzfRjt9IecUmnNo3JJt6G5Q2gpC13Uv2q4rcmVMHWWrjA+Qzq7G/otFMgGCLCl0Gp1
	23f2bhxy1p0Mp8EREXVcGaRrh7xItiXK0rHyFMGUBsHi7PzDBh4X/UkbbS15FXrFODtXxmEJYok4Z
	mAFtrtX84Wdw3q8+DfU0mgE+llYT5ffAj0QvCEjuxlXn/YlWzQI1xzFhfFO7qli7RUQeGL85hwdA1
	JX3VtSOD/nZQSKJztKCv07iguEZWRyww1YXm7dpgxVeLnW5MSepOz+VfUIvK/CsqKVXnVZJt6tpsg
	1wux/Wag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq9u1-0000ec-8v; Fri, 18 Dec 2020 07:10:13 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq9tt-0000cv-O1; Fri, 18 Dec 2020 07:10:07 +0000
IronPort-SDR: o1dzN/J3CnVslQ+97D1Ar8E9JUDeF8c9OUfc5s90Y+yhkb/c5TtauXY5BxUoaq61PhFJ8uPakU
 Z13wDQ2qi1Q39TFlnwXU1Ud1/qjwGYPvV7mm04q9+LeU3Y/PR4m5Tbs7pGK+3KFXBOnZgL4UQG
 UoldU8ash20av7DsJIgJtVu1q8w8OZtr4aBQkJmBo13v3V9/XmhO2SfW5bBB+0ZSa+xXMPs3nl
 UZvFBoZNDbCu8N+esdJBfbEYE97AMa0aihixWg9xUeX2g76hZJc+E/ZFPONt2G9vm0FILlhyZj
 3T4=
X-IronPort-AV: E=Sophos;i="5.78,429,1599548400"; d="scan'208";a="29385186"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by labrats.qualcomm.com with ESMTP; 17 Dec 2020 23:10:05 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg03-sd.qualcomm.com with ESMTP; 17 Dec 2020 23:10:04 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 32769211C2; Thu, 17 Dec 2020 23:10:04 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH v5 2/3] scsi: ufs: Clean up ufshcd_exit_clk_scaling/gating()
Date: Thu, 17 Dec 2020 23:09:44 -0800
Message-Id: <1608275387-26183-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608275387-26183-1-git-send-email-cang@codeaurora.org>
References: <1608275387-26183-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_021005_981545_202B2F2F 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ufshcd_hba_exit() is always called after ufshcd_exit_clk_scaling() and
ufshcd_exit_clk_gating(), so move ufshcd_exit_clk_scaling/gating() to
ufshcd_hba_exit().

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 32 +++++++++++++++-----------------
 drivers/scsi/ufs/ufshcd.h |  4 ++++
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 4ccdd2b..80f82cb 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1857,11 +1857,14 @@ static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
 	snprintf(wq_name, sizeof(wq_name), "ufs_clkscaling_%d",
 		 hba->host->host_no);
 	hba->clk_scaling.workq = create_singlethread_workqueue(wq_name);
+
+	hba->clk_scaling.is_initialized = true;
 }
 
 static void ufshcd_exit_clk_scaling(struct ufs_hba *hba)
 {
-	if (!ufshcd_is_clkscaling_supported(hba))
+	if (!ufshcd_is_clkscaling_supported(hba) ||
+	    !hba->clk_scaling.is_initialized)
 		return;
 
 	if (hba->devfreq)
@@ -1905,12 +1908,16 @@ static void ufshcd_init_clk_gating(struct ufs_hba *hba)
 	hba->clk_gating.enable_attr.attr.mode = 0644;
 	if (device_create_file(hba->dev, &hba->clk_gating.enable_attr))
 		dev_err(hba->dev, "Failed to create sysfs for clkgate_enable\n");
+
+	hba->clk_gating.is_initialized = true;
 }
 
 static void ufshcd_exit_clk_gating(struct ufs_hba *hba)
 {
-	if (!ufshcd_is_clkgating_allowed(hba))
+	if (!ufshcd_is_clkgating_allowed(hba) ||
+	    !hba->clk_gating.is_initialized)
 		return;
+
 	device_remove_file(hba->dev, &hba->clk_gating.delay_attr);
 	device_remove_file(hba->dev, &hba->clk_gating.enable_attr);
 	cancel_work_sync(&hba->clk_gating.ungate_work);
@@ -7775,7 +7782,6 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 	 */
 	if (ret) {
 		pm_runtime_put_sync(hba->dev);
-		ufshcd_exit_clk_scaling(hba);
 		ufshcd_hba_exit(hba);
 	}
 }
@@ -8212,12 +8218,12 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
 static void ufshcd_hba_exit(struct ufs_hba *hba)
 {
 	if (hba->is_powered) {
+		ufshcd_exit_clk_scaling(hba);
+		ufshcd_exit_clk_gating(hba);
+		if (hba->eh_wq)
+			destroy_workqueue(hba->eh_wq);
 		ufshcd_variant_hba_exit(hba);
 		ufshcd_setup_vreg(hba, false);
-		ufshcd_suspend_clkscaling(hba);
-		if (ufshcd_is_clkscaling_supported(hba))
-			if (hba->devfreq)
-				ufshcd_suspend_clkscaling(hba);
 		ufshcd_setup_clocks(hba, false);
 		ufshcd_setup_hba_vreg(hba, false);
 		hba->is_powered = false;
@@ -8966,13 +8972,9 @@ void ufshcd_remove(struct ufs_hba *hba)
 	blk_mq_free_tag_set(&hba->tmf_tag_set);
 	blk_cleanup_queue(hba->cmd_queue);
 	scsi_remove_host(hba->host);
-	destroy_workqueue(hba->eh_wq);
 	/* disable interrupts */
 	ufshcd_disable_intr(hba, hba->intr_mask);
 	ufshcd_hba_stop(hba);
-
-	ufshcd_exit_clk_scaling(hba);
-	ufshcd_exit_clk_gating(hba);
 	ufshcd_hba_exit(hba);
 }
 EXPORT_SYMBOL_GPL(ufshcd_remove);
@@ -9171,7 +9173,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
 	if (err) {
 		dev_err(hba->dev, "request irq failed\n");
-		goto exit_gating;
+		goto out_disable;
 	} else {
 		hba->is_irq_enabled = true;
 	}
@@ -9179,7 +9181,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = scsi_add_host(host, hba->dev);
 	if (err) {
 		dev_err(hba->dev, "scsi_add_host failed\n");
-		goto exit_gating;
+		goto out_disable;
 	}
 
 	hba->cmd_queue = blk_mq_init_queue(&hba->host->tag_set);
@@ -9262,10 +9264,6 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	blk_cleanup_queue(hba->cmd_queue);
 out_remove_scsi_host:
 	scsi_remove_host(hba->host);
-exit_gating:
-	ufshcd_exit_clk_scaling(hba);
-	ufshcd_exit_clk_gating(hba);
-	destroy_workqueue(hba->eh_wq);
 out_disable:
 	hba->is_irq_enabled = false;
 	ufshcd_hba_exit(hba);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 5737679..cb9075d 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -347,6 +347,7 @@ enum clk_gating_state {
  * @delay_attr: sysfs attribute to control delay_attr
  * @enable_attr: sysfs attribute to enable/disable clock gating
  * @is_enabled: Indicates the current status of clock gating
+ * @is_initialized: Indicates whether clock gating is initialized or not
  * @active_reqs: number of requests that are pending and should be waited for
  * completion before gating clocks.
  */
@@ -359,6 +360,7 @@ struct ufs_clk_gating {
 	struct device_attribute delay_attr;
 	struct device_attribute enable_attr;
 	bool is_enabled;
+	bool is_initialized;
 	int active_reqs;
 	struct workqueue_struct *clk_gating_workq;
 };
@@ -386,6 +388,7 @@ struct ufs_saved_pwr_info {
 		clkscale_enable sysfs node
  * @is_allowed: tracks if scaling is currently allowed or not, used to block
 		clock scaling which is not invoked from devfreq governor
+ * @is_initialized: Indicates whether clock scaling is initialized or not
  * @is_busy_started: tracks if busy period has started or not
  * @is_suspended: tracks if devfreq is suspended or not
  */
@@ -401,6 +404,7 @@ struct ufs_clk_scaling {
 	struct work_struct resume_work;
 	bool is_enabled;
 	bool is_allowed;
+	bool is_initialized;
 	bool is_busy_started;
 	bool is_suspended;
 };
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
