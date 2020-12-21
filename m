Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479D5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 07:42:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC0E22C7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 07:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEC0E22C7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZ4zQhG2s/QDizx+DSTomTP5F4CKuvYbQueD5d56U7k=; b=aJzWYiq9ZNLKCyYiGPACTzFuBC
	qiTyOOkYxrqqz+BB57Z3oqzn6nt6cS0+i0Gg/KAUGD6g5joEeK9oHHR723nPqrSd21UMhVjHjKAkD
	Wh123pi/peXxV1SNleWLOlRRCJsbbKzzEBQSHxfrmfBeCPMSRkEtJBdPDRebcI3zY2Eq7hN3flLbW
	0A6cjgkHZ0ONtKL+zxtkQwc+zSb3mA6c85LeNhFqjLlSZRe1Gju6AqbCXtqHWMEgSCWKwRdt5aRsI
	vtDm2IGadKgwJAutBtBy7IOR58eR7/a6Jm5hcL8OM2woRsb3Urds7aR7IJetwoinaOe+ZJ6koyusG
	BZHT/k4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krFqA-0003Qe-8O; Mon, 21 Dec 2020 07:42:46 +0000
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krFq5-0003Pe-9X; Mon, 21 Dec 2020 07:42:42 +0000
Received: from ironmsg01-tai.qualcomm.com ([10.249.140.6])
 by alexa-out-tai-01.qualcomm.com with ESMTP; 21 Dec 2020 15:42:36 +0800
X-QCInternal: smtphost
Received: from cbsp-sh-gv.ap.qualcomm.com (HELO cbsp-sh-gv.qualcomm.com)
 ([10.231.249.68])
 by ironmsg01-tai.qualcomm.com with ESMTP; 21 Dec 2020 15:42:04 +0800
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 393357)
 id 79AEF2991; Mon, 21 Dec 2020 15:42:03 +0800 (CST)
From: Ziqi Chen <ziqichen@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, cang@codeaurora.org,
 hongwus@codeaurora.org, rnayak@codeaurora.org, vinholikatti@gmail.com,
 jejb@linux.vnet.ibm.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, kernel-team@android.com, saravanak@google.com,
 salyzyn@google.com, ziqichen@codeaurora.org, kwmad.kim@samsung.com,
 stanley.chu@mediatek.com
Subject: [PATCH RFC v2 1/1] scsi: ufs: Fix ufs power down/on specs violation
Date: Mon, 21 Dec 2020 15:41:37 +0800
Message-Id: <1608536504-76507-1-git-send-email-ziqichen@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_024241_770249_7BC63EA1 
X-CRM114-Status: GOOD (  21.49  )
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
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Avri Altman <avri.altman@wdc.com>, Andy Gross <agross@kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Satya Tangirala <satyat@google.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As per specs, e.g, JESD220E chapter 7.2, while powering
off/on the ufs device, RST_N signal and REF_CLK signal
should be between VSS(Ground) and VCCQ/VCCQ2.

To flexibly control device reset line, re-name the function
ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
vops_toggle_device_reset(sturct ufs_hba *hba, bool up). The
new parameter "bool up" is used to separate device reset
line pulling up from pulling down.

Cc: Kiwoong Kim <kwmad.kim@samsung.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
---
 drivers/scsi/ufs/ufs-mediatek.c | 27 +++++++++-----------------
 drivers/scsi/ufs/ufs-qcom.c     | 22 ++++++++++-----------
 drivers/scsi/ufs/ufshcd.c       | 43 ++++++++++++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h       | 10 +++++-----
 4 files changed, 56 insertions(+), 46 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 80618af..bff2c42 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -841,27 +841,18 @@ static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
-static int ufs_mtk_device_reset(struct ufs_hba *hba)
+static int ufs_mtk_toggle_device_reset(struct ufs_hba *hba, bool down)
 {
 	struct arm_smccc_res res;
 
-	ufs_mtk_device_reset_ctrl(0, res);
-
-	/*
-	 * The reset signal is active low. UFS devices shall detect
-	 * more than or equal to 1us of positive or negative RST_n
-	 * pulse width.
-	 *
-	 * To be on safe side, keep the reset low for at least 10us.
-	 */
-	usleep_range(10, 15);
-
-	ufs_mtk_device_reset_ctrl(1, res);
-
-	/* Some devices may need time to respond to rst_n */
-	usleep_range(10000, 15000);
+	if (down) {
+		ufs_mtk_device_reset_ctrl(0, res);
+	} else {
+		ufs_mtk_device_reset_ctrl(1, res);
 
-	dev_info(hba->dev, "device reset done\n");
+		/* Some devices may need time to respond to rst_n */
+		usleep_range(10000, 15000);
+	}
 
 	return 0;
 }
@@ -1052,7 +1043,7 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.suspend             = ufs_mtk_suspend,
 	.resume              = ufs_mtk_resume,
 	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
-	.device_reset        = ufs_mtk_device_reset,
+	.toggle_device_reset        = ufs_mtk_toggle_device_reset,
 	.event_notify        = ufs_mtk_event_notify,
 };
 
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2206b1e..c2ccaa5 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1404,12 +1404,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 }
 
 /**
- * ufs_qcom_device_reset() - toggle the (optional) device reset line
+ * ufs_qcom_toggle_device_reset() - toggle the (optional) device reset line
  * @hba: per-adapter instance
+ * @down: pull down or pull up device reset line
  *
  * Toggles the (optional) reset line to reset the attached device.
  */
-static int ufs_qcom_device_reset(struct ufs_hba *hba)
+static int ufs_qcom_toggle_device_reset(struct ufs_hba *hba, bool down)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
@@ -1417,15 +1418,12 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	if (!host->device_reset)
 		return -EOPNOTSUPP;
 
-	/*
-	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
-	 * be on the safe side.
-	 */
-	gpiod_set_value_cansleep(host->device_reset, 1);
-	usleep_range(10, 15);
-
-	gpiod_set_value_cansleep(host->device_reset, 0);
-	usleep_range(10, 15);
+	if (down) {
+		gpiod_set_value_cansleep(host->device_reset, 1);
+	} else {
+		gpiod_set_value_cansleep(host->device_reset, 0);
+		usleep_range(10, 15);
+	}
 
 	return 0;
 }
@@ -1473,7 +1471,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
-	.device_reset		= ufs_qcom_device_reset,
+	.toggle_device_reset		= ufs_qcom_toggle_device_reset,
 	.config_scaling_param = ufs_qcom_config_scaling_param,
 	.program_key		= ufs_qcom_ice_program_key,
 };
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index e221add..2ee905f 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -585,7 +585,20 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
 {
 	int err;
 
-	err = ufshcd_vops_device_reset(hba);
+	err = ufshcd_vops_toggle_device_reset(hba, true);
+	if (err) {
+		dev_err(hba->dev, "device reset pulling down failure: %d\n", err);
+		return;
+	}
+
+	/*
+	 * The reset signal is active low. The UFS device
+	 * shall detect reset pulses of 1us, sleep for at
+	 * least 10us to be on the safe side.
+	 */
+	usleep_range(10, 15);
+
+	err = ufshcd_vops_toggle_device_reset(hba, false);
 
 	if (!err) {
 		ufshcd_set_ufs_dev_active(hba);
@@ -593,7 +606,11 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
 			hba->wb_enabled = false;
 			hba->wb_buf_flush_enabled = false;
 		}
+		dev_info(hba->dev, "device reset done\n");
+	} else {
+		dev_err(hba->dev, "device reset pulling up failure: %d\n", err);
 	}
+
 	if (err != -EOPNOTSUPP)
 		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
 }
@@ -8686,8 +8703,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (ret)
 		goto set_dev_active;
 
-	ufshcd_vreg_set_lpm(hba);
-
 disable_clks:
 	/*
 	 * Call vendor specific suspend callback. As these callbacks may access
@@ -8703,6 +8718,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	ufshcd_disable_irq(hba);
 
+	if (ufshcd_is_link_off(hba))
+		ufshcd_vops_toggle_device_reset(hba, true);
+
 	ufshcd_setup_clocks(hba, false);
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
@@ -8711,6 +8729,8 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 					hba->clk_gating.state);
 	}
 
+	ufshcd_vreg_set_lpm(hba);
+
 	/* Put the host controller in low power mode if possible */
 	ufshcd_hba_vreg_set_lpm(hba);
 	goto out;
@@ -8778,18 +8798,19 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	old_link_state = hba->uic_link_state;
 
 	ufshcd_hba_vreg_set_hpm(hba);
+
+	ret = ufshcd_vreg_set_hpm(hba);
+	if (ret)
+		goto out;
+
 	/* Make sure clocks are enabled before accessing controller */
 	ret = ufshcd_setup_clocks(hba, true);
 	if (ret)
-		goto out;
+		goto disable_vreg;
 
 	/* enable the host irq as host controller would be active soon */
 	ufshcd_enable_irq(hba);
 
-	ret = ufshcd_vreg_set_hpm(hba);
-	if (ret)
-		goto disable_irq_and_vops_clks;
-
 	/*
 	 * Call vendor specific resume callback. As these callbacks may access
 	 * vendor specific host controller register space call them when the
@@ -8797,7 +8818,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	ret = ufshcd_vops_resume(hba, pm_op);
 	if (ret)
-		goto disable_vreg;
+		goto disable_irq_and_vops_clks;
 
 	/* For DeepSleep, the only supported option is to have the link off */
 	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
@@ -8864,8 +8885,6 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	ufshcd_link_state_transition(hba, old_link_state, 0);
 vendor_suspend:
 	ufshcd_vops_suspend(hba, pm_op);
-disable_vreg:
-	ufshcd_vreg_set_lpm(hba);
 disable_irq_and_vops_clks:
 	ufshcd_disable_irq(hba);
 	if (hba->clk_scaling.is_allowed)
@@ -8876,6 +8895,8 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		trace_ufshcd_clk_gating(dev_name(hba->dev),
 					hba->clk_gating.state);
 	}
+disable_vreg:
+	ufshcd_vreg_set_lpm(hba);
 out:
 	hba->pm_op_in_progress = 0;
 	if (ret)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 9bb5f0e..dccc3eb 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
  * @resume: called during host controller PM callback
  * @dbg_register_dump: used to dump controller debug information
  * @phy_initialization: used to initialize phys
- * @device_reset: called to issue a reset pulse on the UFS device
+ * @toggle_device_reset: called to change logic level of reset gpio on the UFS device
  * @program_key: program or evict an inline encryption key
  * @event_notify: called to notify important events
  */
@@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
-	int	(*device_reset)(struct ufs_hba *hba);
+	int	(*toggle_device_reset)(struct ufs_hba *hba, bool down);
 	void	(*config_scaling_param)(struct ufs_hba *hba,
 					struct devfreq_dev_profile *profile,
 					void *data);
@@ -1216,10 +1216,10 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 		hba->vops->dbg_register_dump(hba);
 }
 
-static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
+static inline int ufshcd_vops_toggle_device_reset(struct ufs_hba *hba, bool down)
 {
-	if (hba->vops && hba->vops->device_reset)
-		return hba->vops->device_reset(hba);
+	if (hba->vops && hba->vops->toggle_device_reset)
+		return hba->vops->toggle_device_reset(hba, down);
 
 	return -EOPNOTSUPP;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
