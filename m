Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50EDC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 10:05:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740C22332B
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 10:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 740C22332B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WkPe0lbJTb6OiAJSLLRrVsG79/vnh1sJHB9d476ICQ=; b=vGBzjaUL0Z0vT+ewhFb8/1Y7hB
	531Iu+traFBaLwMYBF2KnfcpBPHO0JnOjA3FBk3PbqfXeVcE24Z+8lkTnK3367dB1YdKCNDxaUrQn
	IYfhhe7lJ17WJ37RiVT1x0h4j8l92f4fmpsRG+MpveV+DmCchhcd0NI9tp9t8XW2JjMOIoYtH/TL9
	WqAIQT3MFVRIXCGpZNvJeoxTWXS0wH+9rOb4o4Z0W7R+24P0Z7rPMCQ2PgC21SYovXl1YMnSpmJ+h
	KAzXYZ5WtWNDpmQx1W0f0GTxhUpgVzyNB0oGcfCiDSRNMNmE/C3WTv7SY2TlI5nuFqbfKpHxY1bNN
	iqjLLNRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2AMT-0006FQ-Qj; Wed, 20 Jan 2021 10:05:13 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2AMN-0006EH-SG; Wed, 20 Jan 2021 10:05:09 +0000
IronPort-SDR: 7z8TTWr1gkm4l9p/9z/7xM4BMhwIyTlxSkFj2I/pal1+mIOAVbTq1IUqMIUVMvCoGcVPlsy8Fg
 7vglPaPhk7xRolWdFfgmWCIknC69LwIyTs2iyjvMKcMwuUTN90U3HqiYZYpeF7GLchSRmyYO0X
 fJtk+GswM2NE6SWCRP5euplBNVkDf/LwZyZB8bzgRyxXk2Pmm0SbhrBiCbY6avU0/gvzatmNSD
 p+3vk9zPJfujz4TJvLl3+O+6bKxH2AkoxLWlljiJ8P+CymEKCgFZMbSCTq81PHqSvrxM9ynqD+
 CpY=
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; d="scan'208";a="47682879"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by labrats.qualcomm.com with ESMTP; 20 Jan 2021 02:05:06 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg01-sd.qualcomm.com with ESMTP; 20 Jan 2021 02:05:04 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 5D6EE21941; Wed, 20 Jan 2021 02:05:04 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, cang@codeaurora.org
Subject: [PATCH v11 2/3] scsi: ufs: Refactor
 ufshcd_init/exit_clk_scaling/gating()
Date: Wed, 20 Jan 2021 02:04:22 -0800
Message-Id: <1611137065-14266-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611137065-14266-1-git-send-email-cang@codeaurora.org>
References: <1611137065-14266-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_050508_104668_CFAD91DF 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Satya Tangirala <satyat@google.com>,
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
ufshcd_hba_exit(). Meanwhile, add dedicated funcs to init and remove
sysfs nodes of clock scaling/gating to make the code more readable.
Overall functionality remains same.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 130 +++++++++++++++++++++++++---------------------
 drivers/scsi/ufs/ufshcd.h |   4 ++
 2 files changed, 74 insertions(+), 60 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8dc4a3a..750cf0d 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1569,7 +1569,7 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 	return count;
 }
 
-static void ufshcd_clkscaling_init_sysfs(struct ufs_hba *hba)
+static void ufshcd_init_clk_scaling_sysfs(struct ufs_hba *hba)
 {
 	hba->clk_scaling.enable_attr.show = ufshcd_clkscale_enable_show;
 	hba->clk_scaling.enable_attr.store = ufshcd_clkscale_enable_store;
@@ -1580,6 +1580,42 @@ static void ufshcd_clkscaling_init_sysfs(struct ufs_hba *hba)
 		dev_err(hba->dev, "Failed to create sysfs for clkscale_enable\n");
 }
 
+static void ufshcd_remove_clk_scaling_sysfs(struct ufs_hba *hba)
+{
+	if (hba->clk_scaling.enable_attr.attr.name)
+		device_remove_file(hba->dev, &hba->clk_scaling.enable_attr);
+}
+
+static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
+{
+	char wq_name[sizeof("ufs_clkscaling_00")];
+
+	if (!ufshcd_is_clkscaling_supported(hba))
+		return;
+
+	INIT_WORK(&hba->clk_scaling.suspend_work,
+		  ufshcd_clk_scaling_suspend_work);
+	INIT_WORK(&hba->clk_scaling.resume_work,
+		  ufshcd_clk_scaling_resume_work);
+
+	snprintf(wq_name, sizeof(wq_name), "ufs_clkscaling_%d",
+		 hba->host->host_no);
+	hba->clk_scaling.workq = create_singlethread_workqueue(wq_name);
+
+	hba->clk_scaling.is_initialized = true;
+}
+
+static void ufshcd_exit_clk_scaling(struct ufs_hba *hba)
+{
+	if (!hba->clk_scaling.is_initialized)
+		return;
+
+	ufshcd_remove_clk_scaling_sysfs(hba);
+	destroy_workqueue(hba->clk_scaling.workq);
+	ufshcd_devfreq_remove(hba);
+	hba->clk_scaling.is_initialized = false;
+}
+
 static void ufshcd_ungate_work(struct work_struct *work)
 {
 	int ret;
@@ -1871,35 +1907,31 @@ static ssize_t ufshcd_clkgate_enable_store(struct device *dev,
 	return count;
 }
 
-static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
+static void ufshcd_init_clk_gating_sysfs(struct ufs_hba *hba)
 {
-	char wq_name[sizeof("ufs_clkscaling_00")];
-
-	if (!ufshcd_is_clkscaling_supported(hba))
-		return;
-
-	if (!hba->clk_scaling.min_gear)
-		hba->clk_scaling.min_gear = UFS_HS_G1;
-
-	INIT_WORK(&hba->clk_scaling.suspend_work,
-		  ufshcd_clk_scaling_suspend_work);
-	INIT_WORK(&hba->clk_scaling.resume_work,
-		  ufshcd_clk_scaling_resume_work);
+	hba->clk_gating.delay_attr.show = ufshcd_clkgate_delay_show;
+	hba->clk_gating.delay_attr.store = ufshcd_clkgate_delay_store;
+	sysfs_attr_init(&hba->clk_gating.delay_attr.attr);
+	hba->clk_gating.delay_attr.attr.name = "clkgate_delay_ms";
+	hba->clk_gating.delay_attr.attr.mode = 0644;
+	if (device_create_file(hba->dev, &hba->clk_gating.delay_attr))
+		dev_err(hba->dev, "Failed to create sysfs for clkgate_delay\n");
 
-	snprintf(wq_name, sizeof(wq_name), "ufs_clkscaling_%d",
-		 hba->host->host_no);
-	hba->clk_scaling.workq = create_singlethread_workqueue(wq_name);
+	hba->clk_gating.enable_attr.show = ufshcd_clkgate_enable_show;
+	hba->clk_gating.enable_attr.store = ufshcd_clkgate_enable_store;
+	sysfs_attr_init(&hba->clk_gating.enable_attr.attr);
+	hba->clk_gating.enable_attr.attr.name = "clkgate_enable";
+	hba->clk_gating.enable_attr.attr.mode = 0644;
+	if (device_create_file(hba->dev, &hba->clk_gating.enable_attr))
+		dev_err(hba->dev, "Failed to create sysfs for clkgate_enable\n");
 }
 
-static void ufshcd_exit_clk_scaling(struct ufs_hba *hba)
+static void ufshcd_remove_clk_gating_sysfs(struct ufs_hba *hba)
 {
-	if (!ufshcd_is_clkscaling_supported(hba))
-		return;
-
-	if (hba->clk_scaling.enable_attr.attr.name)
-		device_remove_file(hba->dev, &hba->clk_scaling.enable_attr);
-	destroy_workqueue(hba->clk_scaling.workq);
-	ufshcd_devfreq_remove(hba);
+	if (hba->clk_gating.delay_attr.attr.name)
+		device_remove_file(hba->dev, &hba->clk_gating.delay_attr);
+	if (hba->clk_gating.enable_attr.attr.name)
+		device_remove_file(hba->dev, &hba->clk_gating.enable_attr);
 }
 
 static void ufshcd_init_clk_gating(struct ufs_hba *hba)
@@ -1920,34 +1952,21 @@ static void ufshcd_init_clk_gating(struct ufs_hba *hba)
 	hba->clk_gating.clk_gating_workq = alloc_ordered_workqueue(wq_name,
 					WQ_MEM_RECLAIM | WQ_HIGHPRI);
 
-	hba->clk_gating.is_enabled = true;
+	ufshcd_init_clk_gating_sysfs(hba);
 
-	hba->clk_gating.delay_attr.show = ufshcd_clkgate_delay_show;
-	hba->clk_gating.delay_attr.store = ufshcd_clkgate_delay_store;
-	sysfs_attr_init(&hba->clk_gating.delay_attr.attr);
-	hba->clk_gating.delay_attr.attr.name = "clkgate_delay_ms";
-	hba->clk_gating.delay_attr.attr.mode = 0644;
-	if (device_create_file(hba->dev, &hba->clk_gating.delay_attr))
-		dev_err(hba->dev, "Failed to create sysfs for clkgate_delay\n");
-
-	hba->clk_gating.enable_attr.show = ufshcd_clkgate_enable_show;
-	hba->clk_gating.enable_attr.store = ufshcd_clkgate_enable_store;
-	sysfs_attr_init(&hba->clk_gating.enable_attr.attr);
-	hba->clk_gating.enable_attr.attr.name = "clkgate_enable";
-	hba->clk_gating.enable_attr.attr.mode = 0644;
-	if (device_create_file(hba->dev, &hba->clk_gating.enable_attr))
-		dev_err(hba->dev, "Failed to create sysfs for clkgate_enable\n");
+	hba->clk_gating.is_enabled = true;
+	hba->clk_gating.is_initialized = true;
 }
 
 static void ufshcd_exit_clk_gating(struct ufs_hba *hba)
 {
-	if (!ufshcd_is_clkgating_allowed(hba))
+	if (!hba->clk_gating.is_initialized)
 		return;
-	device_remove_file(hba->dev, &hba->clk_gating.delay_attr);
-	device_remove_file(hba->dev, &hba->clk_gating.enable_attr);
+	ufshcd_remove_clk_gating_sysfs(hba);
 	cancel_work_sync(&hba->clk_gating.ungate_work);
 	cancel_delayed_work_sync(&hba->clk_gating.gate_work);
 	destroy_workqueue(hba->clk_gating.clk_gating_workq);
+	hba->clk_gating.is_initialized = false;
 }
 
 /* Must be called with host lock acquired */
@@ -7747,7 +7766,7 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 				goto out;
 
 			hba->clk_scaling.is_enabled = true;
-			ufshcd_clkscaling_init_sysfs(hba);
+			ufshcd_init_clk_scaling_sysfs(hba);
 		}
 	}
 
@@ -7935,7 +7954,6 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 	 */
 	if (ret) {
 		pm_runtime_put_sync(hba->dev);
-		ufshcd_exit_clk_scaling(hba);
 		ufshcd_hba_exit(hba);
 	} else {
 		ufshcd_clear_ua_wluns(hba);
@@ -8365,12 +8383,12 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
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
@@ -9144,13 +9162,9 @@ void ufshcd_remove(struct ufs_hba *hba)
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
@@ -9351,7 +9365,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
 	if (err) {
 		dev_err(hba->dev, "request irq failed\n");
-		goto exit_gating;
+		goto out_disable;
 	} else {
 		hba->is_irq_enabled = true;
 	}
@@ -9359,7 +9373,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = scsi_add_host(host, hba->dev);
 	if (err) {
 		dev_err(hba->dev, "scsi_add_host failed\n");
-		goto exit_gating;
+		goto out_disable;
 	}
 
 	hba->cmd_queue = blk_mq_init_queue(&hba->host->tag_set);
@@ -9442,10 +9456,6 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
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
index 2863af1..9cd76f7 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -383,6 +383,7 @@ enum clk_gating_state {
  * @delay_attr: sysfs attribute to control delay_attr
  * @enable_attr: sysfs attribute to enable/disable clock gating
  * @is_enabled: Indicates the current status of clock gating
+ * @is_initialized: Indicates whether clock gating is initialized or not
  * @active_reqs: number of requests that are pending and should be waited for
  * completion before gating clocks.
  */
@@ -395,6 +396,7 @@ struct ufs_clk_gating {
 	struct device_attribute delay_attr;
 	struct device_attribute enable_attr;
 	bool is_enabled;
+	bool is_initialized;
 	int active_reqs;
 	struct workqueue_struct *clk_gating_workq;
 };
@@ -423,6 +425,7 @@ struct ufs_saved_pwr_info {
 		clkscale_enable sysfs node
  * @is_allowed: tracks if scaling is currently allowed or not, used to block
 		clock scaling which is not invoked from devfreq governor
+ * @is_initialized: Indicates whether clock scaling is initialized or not
  * @is_busy_started: tracks if busy period has started or not
  * @is_suspended: tracks if devfreq is suspended or not
  */
@@ -439,6 +442,7 @@ struct ufs_clk_scaling {
 	u32 min_gear;
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
